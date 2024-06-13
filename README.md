# Data Warehousing Project
 An end to end data warehousing pipeline from database spaghetti to star schema

The Project involved 3 steps

**Creating a Database Spaghetti**
  1. In this task we aimed to create a database spaghetti involving multiple tables. The ERD can be found here: https://dbdesigner.page.link/GzMnYbadz7sUSvxV9
  2. The database was then populated using fake data using the python faker library. The python script exists in the _**populate.ipynb**_ file.
  3. This database was then imported to an SQL server for querying later on.

**Creating a Star Schema**
  1. In this task we aimed to create a small data mart on the star schema from the pre-existing database that we build in task 1. This can be found here: https://dbdesigner.page.link/vmSeWz97D4ZKYxid6

**Automation and Monitoring**
  1. create an automated pipeline that consistently checks the database for updates at set intervals and runs an ETL pipeline that transforms the data, cleans it and then create the Star Schema snapshot. The python script can be found in         the MasterFunction.py file. 
