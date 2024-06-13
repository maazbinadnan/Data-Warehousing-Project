import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine,text
import numpy as np
import logging
import time

logging.basicConfig(filename='db_update_check_log.txt', level=logging.INFO,
                    format='%(asctime)s - %(message)s')

def get_tablerowcounts(conn,table_names):
    row_counts = {}
    for table in table_names:
        query = text(f"SELECT COUNT(*) as countname FROM {table}")
        result = conn.execute(query)
        row_counts[table] = result.scalar()
    return row_counts

def check_db_updated(engine, previous_counts):
    current_counts = get_tablerowcounts(engine, previous_counts.keys())
    updated_tables = [table for table in current_counts if current_counts[table] != previous_counts[table]]
    return updated_tables, current_counts

def getconntoDWH():


    server = "HP-PAVILION-15"
    database = "DWH"

    # Create the connection string
    conn_str = f'mssql+pyodbc://{server}/{database}?driver=SQL+Server+Native+Client+11.0&trusted_connection=yes'

    try:
        # Create the engine and connect to your database
        engine = create_engine(conn_str)
        conn = engine.connect()
        print("Connection successful!")

        # If you need a cursor, use the connection's raw connection method
        raw_conn = conn.connection
        cur = raw_conn.cursor()

    except sqlalchemy.exc.SQLAlchemyError as e:
        print("Connection unsuccessful!")
        print("Error: ", e)

    return conn, cur

def getconntoStarSchema():
    server = "HP-PAVILION-15"
    database = "DWH_Star_Schema"
    # Create the connection string
    conn_str = f'mssql+pyodbc://{server}/{database}?driver=SQL+Server+Native+Client+11.0&trusted_connection=yes'
    try:
        # Create the engine and connect to your database
        engine = create_engine(conn_str)
        conn = engine.connect()
        print("Connection to star schema successful!")

        # If you need a cursor, use the connection's raw connection method
        raw_conn = conn.connection
        cur = raw_conn.cursor()
    except sqlalchemy.exc.SQLAlchemyError as e:
        print("Connection to star schema unsuccessful!")
        print("Error: ", e)
    return conn, cur

def cleanteacher(teacher_df,conn_to_star_schema):

    age_bins = [29,35,40,45,50,55,60]
    teacher_df['age_bin'] = pd.cut(teacher_df['age'], bins=age_bins)

    mode_qualifications = teacher_df.groupby('age_bin')['highest_qualification'].agg(lambda x: x.mode().iloc[0] if not x.mode().empty else np.nan)
    mode_qualifications

    teacher_df['highest_qualification'] = teacher_df['highest_qualification'].fillna(teacher_df['age_bin'].map(mode_qualifications))
    teacher_df.drop('age_bin', axis=1, inplace=True)

    #fill facultype with mode
    teacher_df['facultytype'].fillna(teacher_df['facultytype'].mode()[0], inplace=True)
    teacher_df.to_sql('teachers', conn_to_star_schema, if_exists='replace', index=False)
    conn_to_star_schema.commit()
     
def getteacher(conn,conn_to_star_schema):
    teacher_query = text('''
    select teachers.teacherID, teachers.name,
    teachers.years_of_experience,
    teachers.facultytype,
    teachers.age,
    teachers.highest_qualification,
    departments.department_name, 
    YEAR(GETDATE()) - teachers.year_joined AS years_at_IBA,
    research_area.research_area_name 
    from teachers join departments on teachers.departmentID = departments.department_id 
    join teacher_rsrch on teacher_rsrch.teacherID = teachers.teacherID 
    join research_area on teacher_rsrch.research_area_id = research_area.research_area_id 

    ''')
    teacher_df = pd.read_sql(teacher_query, conn)
    cleanteacher(teacher_df,conn_to_star_schema)
    teacher_df.to_csv('teacher.csv', index=False)

def cleanstudent(student_df,conn,conn_to_star_schema):
    erps = student_df[student_df['graduating_year'].isnull()]['studentERP']
    for i in erps:
        query = text(f'''
        select date_joined from student where studentERP = {i}
        ''')
        temp_df = pd.read_sql(query, conn)
    
        student_df.loc[student_df['studentERP'] == i, 'graduating_year'] = pd.to_datetime(temp_df['date_joined'].values[0]).year + 4

    student_df[student_df['studentERP'] ==  22011]
    student_df.to_sql('students', conn_to_star_schema, if_exists='replace', index=False)
    conn_to_star_schema.commit() 

def getstudent(conn,conn_to_star_schema):
    student_query = text('''
    SELECT student.name,
           student.studentERP,
           student.graduating_year,
           student.gender,
           departments.department_name,
           degrees.degree_name,
           degrees.degree_level
    FROM student 
    JOIN departments ON student.departmentID = departments.department_id 
    JOIN degrees ON student.degree_ID = degrees.degree_id
    ''')
   # Fetch the data into a DataFrame
    student_df = pd.read_sql(student_query, conn)
    #convert graduating to year
    student_df['graduating_year'] = pd.to_datetime(student_df['graduating_year'], format='%Y').dt.year
    cleanstudent(student_df,conn,conn_to_star_schema)

def cleancourses(course_df,conn_to_star_schema):
    course_df['credits'] = np.where(course_df['lab'] == 1, 4, 3)
    course_df.to_sql('courses', conn_to_star_schema, if_exists='replace', index=False)
    conn_to_star_schema.commit()

def getcourses(conn,conn_to_star_schema):
    course_query =text('''
        select courses.course_id, courses.course_name,courses.lab, courses.credits,degree_courses.timings,degrees.degree_name,degrees.degree_level 
        from courses join degree_courses on courses.course_id = degree_courses.course_id 
        join degrees on degrees.degree_id = degree_courses.degree_id

        ''')
    course_df = pd.read_sql(course_query, conn)
    cleancourses(course_df,conn_to_star_schema)

def cleanfacttable(eval_df,conn_to_star_schema):
    eval_df['gradingRating'] = eval_df['gradingRating'].fillna(eval_df.groupby('teacherID')['gradingRating'].transform('mean'))
    eval_df['learningRating'] = eval_df['learningRating'].fillna(eval_df.groupby('teacherID')['learningRating'].transform('mean'))
    eval_df['workloadRating'] = eval_df['workloadRating'].fillna(eval_df.groupby('teacherID')['workloadRating'].transform('mean'))


    eval_df['gradingRating'] = eval_df['gradingRating'].fillna(eval_df['gradingRating'].mean())
    eval_df['learningRating'] = eval_df['learningRating'].fillna(eval_df['learningRating'].mean())
    eval_df['workloadRating'] = eval_df['workloadRating'].fillna(eval_df['workloadRating'].mean())
    eval_df['average_rating'] = (eval_df['gradingRating'] + eval_df['workloadRating'] + eval_df['learningRating'])/3
    eval_df.to_sql('facttable', conn_to_star_schema, if_exists='replace', index=False)
    conn_to_star_schema.commit()
    

def getFacttable(conn,conn_to_star_schema):
    eval = text(''' 
        select evaluation.evaluationID, evaluation.courseID, evaluation.studentERP, evaluation.date, teachers.teacherID, evaluation.gradingRating,
        evaluation.learningRating,
        evaluation.workloadRating,
        student_grade.percentage
        from 
        evaluation join courses on 
        evaluation.courseID = courses.course_id 
        join 
        teachers on courses.teacher_ID = teachers.teacherID  
        join student_grade on 
        evaluation.studentERP = student_grade.studentERP
                ''')

    eval_df = pd.read_sql(eval, conn)
    eval_df['date'] = pd.to_datetime(eval_df['date'],format='%d-%m-%Y')

    #sort by date
    eval_df.sort_values(by='date', inplace=True)

    eval_df['year'] = pd.to_datetime(eval_df['date'],format='%d-%m-%Y').dt.year


    eval_df['semester'] = np.where(pd.to_datetime(eval_df['date'],format='%d-%m-%Y').dt.month.between(1,7),'Spring','Fall')

    #generate unique dateids
    eval_df['year_semester'] = eval_df['year'].astype(str) + '_' + eval_df['semester']

    # Generate unique ID for each 'year_semester'
    eval_df['dateid'] = pd.factorize(eval_df['year_semester'])[0] + 1

    # Drop the intermediate 'year_semester' column (optional)
    eval_df.drop(columns=['year_semester'], inplace=True)

    #separate the date column into year and semester columns, if month between 1 and 7 then semester is spring, else fall
    datedf = pd.DataFrame(columns=['dateid','year','semester'])

    datedf = eval_df[['dateid', 'year', 'semester']].drop_duplicates().reset_index(drop=True) 
    datedf.to_sql('date', conn_to_star_schema, if_exists='replace', index=False)
    conn_to_star_schema.commit()

    eval_df['average_rating'] = (eval_df['gradingRating'] + eval_df['workloadRating'] + eval_df['learningRating'])/3
    eval_df = eval_df.drop(columns=['date','year','semester'])
    eval_df = cleanfacttable(eval_df,conn_to_star_schema)    

def main():
    conn, cur = getconntoDWH()
    conn_to_star_schema, cur = getconntoStarSchema()
    
    

    table_names = ["teachers","student","departments","evaluation","teacher_rsrch","research_area","degrees","degree_courses","courses","student_grade"]

    initial_counts = get_tablerowcounts(conn,table_names)
    logging.info(f"Initial table counts: {initial_counts} at {time.strftime('%Y-%m-%d %H:%M:%S')}")

    while True:
            # Check if the database has been updated
            updated_tables, current_counts = check_db_updated(conn, initial_counts)

            if updated_tables:
                message = f"The following tables have been updated: {updated_tables} at {time.strftime('%Y-%m-%d %H:%M:%S')}"
                print(message)
                getteacher(conn,conn_to_star_schema)
                getstudent(conn,conn_to_star_schema)
                getcourses(conn,conn_to_star_schema)
                getFacttable(conn,conn_to_star_schema)
                logging.info(message)
            else:
                message = f"No updates were detected in the tables at {time.strftime('%Y-%m-%d %H:%M:%S')}"
                print(message)
                logging.info(message)

            # Update the initial counts for the next iteration
            initial_counts = current_counts

            # Wait for a specified amount of time before checking again (e.g., 60 seconds)
            time.sleep(30)
    
    conn.close()

if __name__ == "__main__":
    main()



    
