USE [DWH]
GO
/****** Object:  Table [dbo].[blocks]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blocks](
	[block_id] [float] NOT NULL,
	[block_number] [nvarchar](255) NULL,
 CONSTRAINT [PK_blocks] PRIMARY KEY CLUSTERED 
(
	[block_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[course_id] [float] NOT NULL,
	[course_name] [nvarchar](255) NULL,
	[department_id] [float] NOT NULL,
	[teacher_ID] [float] NOT NULL,
	[credits] [float] NULL,
	[semester] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[degree_courses]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[degree_courses](
	[degree_id] [float] NULL,
	[course_id] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[degrees]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[degrees](
	[degree_id] [float] NOT NULL,
	[degree_name] [nvarchar](255) NULL,
	[department_id] [float] NOT NULL,
	[duration] [float] NULL,
	[total_credits] [float] NULL,
	[degree_level] [nvarchar](255) NULL,
	[accreditation] [nvarchar](255) NULL,
 CONSTRAINT [PK_degrees] PRIMARY KEY CLUSTERED 
(
	[degree_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[department_id] [float] NOT NULL,
	[department_name] [nvarchar](255) NULL,
	[department_head] [nvarchar](255) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[electricity_bill]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[electricity_bill](
	[bill_id] [float] NOT NULL,
	[billing_month] [nvarchar](255) NULL,
	[units] [float] NULL,
	[bill_amount] [float] NULL,
	[due_date] [nvarchar](255) NULL,
 CONSTRAINT [PK_electricity_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluation]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluation](
	[evaluationID] [float] NOT NULL,
	[courseID] [float] NULL,
	[studentERP] [float] NULL,
	[learningRating] [float] NULL,
	[gradingRating] [float] NULL,
	[workloadRating] [float] NULL,
	[comment] [nvarchar](255) NULL,
	[date] [nvarchar](255) NULL,
	[upvotes] [float] NULL,
 CONSTRAINT [PK_evaluation] PRIMARY KEY CLUSTERED 
(
	[evaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluation_upvotes]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluation_upvotes](
	[ID] [float] NOT NULL,
	[evaluationID] [float] NULL,
	[student_ERP] [float] NULL,
 CONSTRAINT [PK_evaluation_upvotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade_dist]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade_dist](
	[dist_id] [float] NOT NULL,
	[course_id] [float] NULL,
	[grade] [nvarchar](255) NULL,
	[studentCount] [float] NULL,
 CONSTRAINT [PK_grade_dist] PRIMARY KEY CLUSTERED 
(
	[dist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[guardian]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guardian](
	[cnic] [nvarchar](255) NOT NULL,
	[student_ERP] [float] NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[date_of_birth] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[marital_status] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_guardian] PRIMARY KEY CLUSTERED 
(
	[cnic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hostel]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hostel](
	[Hostel_id] [float] NOT NULL,
	[building_name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Hostel] PRIMARY KEY CLUSTERED 
(
	[Hostel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hostel_blocks]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hostel_blocks](
	[hostel_id] [float] NULL,
	[block_id] [float] NULL,
	[number_floors] [float] NULL,
	[population] [float] NULL,
	[block_area] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[research_area]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[research_area](
	[research_area_id] [float] NOT NULL,
	[research_area_name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_research_area] PRIMARY KEY CLUSTERED 
(
	[research_area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[research_proj]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[research_proj](
	[project_id] [float] NOT NULL,
	[project_name] [nvarchar](255) NULL,
	[research_area_id] [float] NULL,
	[budget] [float] NULL,
	[project_company] [nvarchar](255) NULL,
 CONSTRAINT [PK_research_proj] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[room_number] [float] NOT NULL,
	[Hostel_ID] [float] NULL,
	[no_of_beds] [float] NULL,
	[attached_bathroom] [nvarchar](255) NULL,
	[attached_kitchen] [nvarchar](255) NULL,
 CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED 
(
	[room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[studentERP] [float] NOT NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[departmentID] [float] NULL,
	[marital_status] [nvarchar](255) NULL,
	[phone_number] [nvarchar](255) NULL,
	[age] [float] NULL,
	[address] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[date_joined] [datetime] NULL,
	[graduating_year] [datetime] NULL,
	[degree_ID] [float] NULL,
	[degree_status] [nvarchar](255) NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[studentERP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_courses]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_courses](
	[studentERP] [float] NULL,
	[course_id] [float] NULL,
	[semester_enrolled] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[grade] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_grade]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_grade](
	[Student_Grade_ID] [int] NOT NULL,
	[studentERP] [float] NULL,
	[course_id] [float] NULL,
	[grade] [varchar](50) NULL,
	[percentage] [float] NULL,
 CONSTRAINT [PK_student_grade] PRIMARY KEY CLUSTERED 
(
	[Student_Grade_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_room]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_room](
	[room_number] [float] NULL,
	[student_ERP] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_projects]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_projects](
	[teacherID] [float] NULL,
	[project_id] [float] NULL,
	[date_started] [nvarchar](255) NULL,
	[date_ended] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_rsrch]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_rsrch](
	[teacherID] [float] NULL,
	[research_area_id] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers](
	[teacherID] [float] NOT NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[departmentID] [float] NULL,
	[phone_number] [nvarchar](255) NULL,
	[age] [float] NULL,
	[year_joined] [float] NULL,
	[marital_status] [nvarchar](255) NULL,
	[religion] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_teachers] PRIMARY KEY CLUSTERED 
(
	[teacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warden]    Script Date: 3/12/2024 1:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warden](
	[warden_ID] [float] NOT NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[hostel_id] [float] NULL,
	[number] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[marital_status] [nvarchar](255) NULL,
	[date_of_birth] [nvarchar](255) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_departmentID] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_departmentID]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_teacherID] FOREIGN KEY([teacher_ID])
REFERENCES [dbo].[teachers] ([teacherID])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_teacherID]
GO
ALTER TABLE [dbo].[degree_courses]  WITH CHECK ADD  CONSTRAINT [FK_degree_courses_course_id] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[degree_courses] CHECK CONSTRAINT [FK_degree_courses_course_id]
GO
ALTER TABLE [dbo].[degree_courses]  WITH CHECK ADD  CONSTRAINT [FK_degree_courses_degree_id] FOREIGN KEY([degree_id])
REFERENCES [dbo].[degrees] ([degree_id])
GO
ALTER TABLE [dbo].[degree_courses] CHECK CONSTRAINT [FK_degree_courses_degree_id]
GO
ALTER TABLE [dbo].[degrees]  WITH CHECK ADD  CONSTRAINT [FK_degrees_departmentID] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
GO
ALTER TABLE [dbo].[degrees] CHECK CONSTRAINT [FK_degrees_departmentID]
GO
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK_evaluation_courseID] FOREIGN KEY([courseID])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK_evaluation_courseID]
GO
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK_evaluation_studentERP] FOREIGN KEY([studentERP])
REFERENCES [dbo].[student] ([studentERP])
GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK_evaluation_studentERP]
GO
ALTER TABLE [dbo].[evaluation_upvotes]  WITH CHECK ADD  CONSTRAINT [FK_evaluation_upvotes_evaluationID] FOREIGN KEY([evaluationID])
REFERENCES [dbo].[evaluation] ([evaluationID])
GO
ALTER TABLE [dbo].[evaluation_upvotes] CHECK CONSTRAINT [FK_evaluation_upvotes_evaluationID]
GO
ALTER TABLE [dbo].[evaluation_upvotes]  WITH CHECK ADD  CONSTRAINT [FK_evaluation_upvotes_student_ERP] FOREIGN KEY([student_ERP])
REFERENCES [dbo].[student] ([studentERP])
GO
ALTER TABLE [dbo].[evaluation_upvotes] CHECK CONSTRAINT [FK_evaluation_upvotes_student_ERP]
GO
ALTER TABLE [dbo].[grade_dist]  WITH CHECK ADD  CONSTRAINT [FK_grade_dist_course_id] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[grade_dist] CHECK CONSTRAINT [FK_grade_dist_course_id]
GO
ALTER TABLE [dbo].[guardian]  WITH CHECK ADD  CONSTRAINT [FK_guardian_student_ERP] FOREIGN KEY([student_ERP])
REFERENCES [dbo].[student] ([studentERP])
GO
ALTER TABLE [dbo].[guardian] CHECK CONSTRAINT [FK_guardian_student_ERP]
GO
ALTER TABLE [dbo].[hostel_blocks]  WITH CHECK ADD  CONSTRAINT [FK_hostel_blocks_block_id] FOREIGN KEY([block_id])
REFERENCES [dbo].[blocks] ([block_id])
GO
ALTER TABLE [dbo].[hostel_blocks] CHECK CONSTRAINT [FK_hostel_blocks_block_id]
GO
ALTER TABLE [dbo].[hostel_blocks]  WITH CHECK ADD  CONSTRAINT [FK_hostel_blocks_hostel_id] FOREIGN KEY([hostel_id])
REFERENCES [dbo].[hostel] ([Hostel_id])
GO
ALTER TABLE [dbo].[hostel_blocks] CHECK CONSTRAINT [FK_hostel_blocks_hostel_id]
GO
ALTER TABLE [dbo].[research_proj]  WITH CHECK ADD  CONSTRAINT [FK_research_proj_research_area_id] FOREIGN KEY([research_area_id])
REFERENCES [dbo].[research_area] ([research_area_id])
GO
ALTER TABLE [dbo].[research_proj] CHECK CONSTRAINT [FK_research_proj_research_area_id]
GO
ALTER TABLE [dbo].[rooms]  WITH CHECK ADD  CONSTRAINT [FK_room_hostel_Hostel_id] FOREIGN KEY([Hostel_ID])
REFERENCES [dbo].[hostel] ([Hostel_id])
GO
ALTER TABLE [dbo].[rooms] CHECK CONSTRAINT [FK_room_hostel_Hostel_id]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_degree_ID] FOREIGN KEY([degree_ID])
REFERENCES [dbo].[degrees] ([degree_id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_degree_ID]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_departmentID] FOREIGN KEY([departmentID])
REFERENCES [dbo].[departments] ([department_id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_departmentID]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [FK_student_courses_course_id] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [FK_student_courses_course_id]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [FK_student_courses_studentERP] FOREIGN KEY([studentERP])
REFERENCES [dbo].[student] ([studentERP])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [FK_student_courses_studentERP]
GO
ALTER TABLE [dbo].[student_grade]  WITH CHECK ADD  CONSTRAINT [FK_student_grade_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[student_grade] CHECK CONSTRAINT [FK_student_grade_courses]
GO
ALTER TABLE [dbo].[student_grade]  WITH CHECK ADD  CONSTRAINT [FK_student_grade_student_grade] FOREIGN KEY([studentERP])
REFERENCES [dbo].[student] ([studentERP])
GO
ALTER TABLE [dbo].[student_grade] CHECK CONSTRAINT [FK_student_grade_student_grade]
GO
ALTER TABLE [dbo].[student_room]  WITH CHECK ADD  CONSTRAINT [FK_student_room_room_number] FOREIGN KEY([room_number])
REFERENCES [dbo].[rooms] ([room_number])
GO
ALTER TABLE [dbo].[student_room] CHECK CONSTRAINT [FK_student_room_room_number]
GO
ALTER TABLE [dbo].[student_room]  WITH CHECK ADD  CONSTRAINT [FK_student_room_student_ERP] FOREIGN KEY([student_ERP])
REFERENCES [dbo].[student] ([studentERP])
GO
ALTER TABLE [dbo].[student_room] CHECK CONSTRAINT [FK_student_room_student_ERP]
GO
ALTER TABLE [dbo].[teacher_projects]  WITH CHECK ADD  CONSTRAINT [FK_teacher_projects_project_id] FOREIGN KEY([project_id])
REFERENCES [dbo].[research_proj] ([project_id])
GO
ALTER TABLE [dbo].[teacher_projects] CHECK CONSTRAINT [FK_teacher_projects_project_id]
GO
ALTER TABLE [dbo].[teacher_projects]  WITH CHECK ADD  CONSTRAINT [FK_teacher_projects_teacherID] FOREIGN KEY([teacherID])
REFERENCES [dbo].[teachers] ([teacherID])
GO
ALTER TABLE [dbo].[teacher_projects] CHECK CONSTRAINT [FK_teacher_projects_teacherID]
GO
ALTER TABLE [dbo].[teacher_rsrch]  WITH CHECK ADD  CONSTRAINT [FK_teacher_rsrch_research_area_id] FOREIGN KEY([research_area_id])
REFERENCES [dbo].[research_area] ([research_area_id])
GO
ALTER TABLE [dbo].[teacher_rsrch] CHECK CONSTRAINT [FK_teacher_rsrch_research_area_id]
GO
ALTER TABLE [dbo].[teachers]  WITH CHECK ADD  CONSTRAINT [FK_teachers_departmentID] FOREIGN KEY([departmentID])
REFERENCES [dbo].[departments] ([department_id])
GO
ALTER TABLE [dbo].[teachers] CHECK CONSTRAINT [FK_teachers_departmentID]
GO
ALTER TABLE [dbo].[warden]  WITH CHECK ADD  CONSTRAINT [FK_warden_Hostel_ID] FOREIGN KEY([hostel_id])
REFERENCES [dbo].[hostel] ([Hostel_id])
GO
ALTER TABLE [dbo].[warden] CHECK CONSTRAINT [FK_warden_Hostel_ID]
GO
