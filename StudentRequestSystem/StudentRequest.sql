USE [StudentRequest]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_user]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_student]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_department]
GO
/****** Object:  Table [dbo].[user]    Script Date: 11/06/2021 11:06:46 AM ******/
DROP TABLE [dbo].[user]
GO
/****** Object:  Table [dbo].[student]    Script Date: 11/06/2021 11:06:46 AM ******/
DROP TABLE [dbo].[student]
GO
/****** Object:  Table [dbo].[request]    Script Date: 11/06/2021 11:06:46 AM ******/
DROP TABLE [dbo].[request]
GO
/****** Object:  Table [dbo].[department]    Script Date: 11/06/2021 11:06:46 AM ******/
DROP TABLE [dbo].[department]
GO
/****** Object:  Table [dbo].[department]    Script Date: 11/06/2021 11:06:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[request]    Script Date: 11/06/2021 11:06:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[date] [datetime] NOT NULL,
	[closedate] [datetime] NULL,
	[content] [nvarchar](500) NOT NULL,
	[status] [int] NULL,
	[departid] [int] NOT NULL,
	[studentid] [int] NOT NULL,
	[teacherid] [int] NULL,
	[solution] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student]    Script Date: 11/06/2021 11:06:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 11/06/2021 11:06:46 AM ******/
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
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([id], [name]) VALUES (1, N'Academic Department')
INSERT [dbo].[department] ([id], [name]) VALUES (2, N'Clerical Department')
INSERT [dbo].[department] ([id], [name]) VALUES (3, N'X Department')
INSERT [dbo].[department] ([id], [name]) VALUES (4, N'Y Department')
INSERT [dbo].[department] ([id], [name]) VALUES (5, N'Z Department')
SET IDENTITY_INSERT [dbo].[department] OFF
SET IDENTITY_INSERT [dbo].[request] ON 

INSERT [dbo].[request] ([id], [title], [date], [closedate], [content], [status], [departid], [studentid], [teacherid], [solution]) VALUES (2, N'inquery for PE result', CAST(N'2021-06-09 11:16:10.497' AS DateTime), CAST(N'2021-06-12 00:00:00.000' AS DateTime), N'In query for the result of PRJ321-PE (1st time). I wanna check my solution again', 1, 1, 1, 1, N'ok')
INSERT [dbo].[request] ([id], [title], [date], [closedate], [content], [status], [departid], [studentid], [teacherid], [solution]) VALUES (5, N'đơn xin nghỉ học', CAST(N'2021-06-06 06:26:10.193' AS DateTime), CAST(N'2021-06-10 00:00:00.000' AS DateTime), N'E xin nghỉ học vào slot 3 hôm nay môn LAB', 1, 2, 1, 1, N'ok')
INSERT [dbo].[request] ([id], [title], [date], [closedate], [content], [status], [departid], [studentid], [teacherid], [solution]) VALUES (8, N'đơn xin giảm học phí', CAST(N'2021-06-08 01:00:00.000' AS DateTime), CAST(N'2021-06-10 00:00:00.000' AS DateTime), N'xin giảm học phí kì fall 2021 do covid ', -1, 3, 2, 2, N'ko dong y')
INSERT [dbo].[request] ([id], [title], [date], [closedate], [content], [status], [departid], [studentid], [teacherid], [solution]) VALUES (10, N'Đơn xin miễn điểm danh', CAST(N'2021-06-09 13:30:00.000' AS DateTime), NULL, N'e xin miễn điểm danh môn abc do đi cách ly', 0, 4, 3, NULL, NULL)
INSERT [dbo].[request] ([id], [title], [date], [closedate], [content], [status], [departid], [studentid], [teacherid], [solution]) VALUES (12, N'inquery for FE result', CAST(N'2021-06-09 07:30:00.000' AS DateTime), NULL, N'i want to check my fe result for pfn292', 0, 1, 2, NULL, NULL)
INSERT [dbo].[request] ([id], [title], [date], [closedate], [content], [status], [departid], [studentid], [teacherid], [solution]) VALUES (13, N'Đơn xin pass môn', CAST(N'2021-06-08 00:00:00.000' AS DateTime), NULL, N'Em xin pass môn ', 0, 1, 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[request] OFF
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([id], [name]) VALUES (1, N'Nguyen Van A')
INSERT [dbo].[student] ([id], [name]) VALUES (2, N'Nguyen Van B')
INSERT [dbo].[student] ([id], [name]) VALUES (3, N'Nguyen Van C')
INSERT [dbo].[student] ([id], [name]) VALUES (4, N'Nguyen Thi D')
SET IDENTITY_INSERT [dbo].[student] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password]) VALUES (1, N'admin', N'1')
INSERT [dbo].[user] ([id], [username], [password]) VALUES (2, N'TrungNT', N'1')
INSERT [dbo].[user] ([id], [username], [password]) VALUES (3, N'TriTD', N'1')
INSERT [dbo].[user] ([id], [username], [password]) VALUES (4, N'TienTD', N'1')
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_department] FOREIGN KEY([departid])
REFERENCES [dbo].[department] ([id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_department]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_student] FOREIGN KEY([studentid])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_student]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_user] FOREIGN KEY([teacherid])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_user]
GO
