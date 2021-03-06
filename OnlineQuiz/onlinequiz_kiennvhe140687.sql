USE [Online_Quiz]
GO
ALTER TABLE [dbo].[quiz] DROP CONSTRAINT [FK_quiz_user]
GO
/****** Object:  Table [dbo].[user]    Script Date: 02/06/2021 11:59:16 AM ******/
DROP TABLE [dbo].[user]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 02/06/2021 11:59:16 AM ******/
DROP TABLE [dbo].[quiz]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 02/06/2021 11:59:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[quiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[author] [int] NOT NULL,
	[question] [nvarchar](500) NOT NULL,
	[option1] [nvarchar](200) NOT NULL,
	[option2] [nvarchar](200) NOT NULL,
	[option3] [nvarchar](200) NOT NULL,
	[option4] [nvarchar](200) NOT NULL,
	[answer] [varchar](10) NOT NULL,
 CONSTRAINT [PK_quiz] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 02/06/2021 11:59:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[type] [bit] NOT NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[quiz] ON 

INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (8, CAST(N'2021-05-25' AS Date), 8, N'The name of capital of Vietnam after the year of 1975?', N'Sai Gon ', N'Ho Chi Minh', N'Ha Noi', N'Ha Tay', N'3')
INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (9, CAST(N'2021-05-25' AS Date), 8, N'1+1=?', N'2', N'3', N'1', N'4', N'1')
INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (10, CAST(N'2021-05-25' AS Date), 8, N'Which is not a Program Language', N'C', N'C++', N'C#', N'C--', N'4')
INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (11, CAST(N'2021-05-25' AS Date), 1, N'3*4=?', N'1', N'24', N'12', N'34', N'3')
INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (13, CAST(N'2021-05-25' AS Date), 1, N'2x2=', N'1', N'2', N'3', N'4', N'4')
INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (14, CAST(N'2021-05-30' AS Date), 1, N'1+2=?', N'1', N'2', N'3', N'4', N'3')
INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (15, CAST(N'2021-05-30' AS Date), 8, N'2+2=?', N'1', N'2', N'4,0', N'4', N'34')
INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (21, CAST(N'2021-05-31' AS Date), 8, N'Con chó trong tiếng anh là gì', N'Dog', N'Cat', N'Bird', N'Flower', N'1')
INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (22, CAST(N'2021-06-01' AS Date), 12, N'Số nào là số nguyên tố?', N'1', N'2', N'6', N'4', N'2')
INSERT [dbo].[quiz] ([id], [date], [author], [question], [option1], [option2], [option3], [option4], [answer]) VALUES (23, CAST(N'2021-06-02' AS Date), 8, N'So nao la so nguyen to', N'2', N'3', N'4', N'6', N'12')
SET IDENTITY_INSERT [dbo].[quiz] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (1, N'KienNV', N'1', 1, N'kiennvhe140687@fpt.edu.vn')
INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (2, N'NamLV', N'1', 1, N'namlv@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (3, N'user', N'1', 0, N'user111@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (8, N'admin', N'1', 1, N'admin123@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (9, N'huyld', N'2', 1, N'huyld@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (10, N'khanhlq', N'123', 0, N'khanhlq1234@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (11, N'student1', N'1', 0, N'abc@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (12, N'teacher1', N'1', 1, N'abc@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (13, N'teacher2', N'1', 1, N'admin1@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [type], [email]) VALUES (14, N'teacher3', N'1', 1, N'admin@gmail.com')
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD  CONSTRAINT [FK_quiz_user] FOREIGN KEY([author])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[quiz] CHECK CONSTRAINT [FK_quiz_user]
GO
