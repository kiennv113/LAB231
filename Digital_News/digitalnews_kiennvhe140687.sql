USE [Digital_News]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 02/06/2021 11:54:17 AM ******/
DROP TABLE [dbo].[Article]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 02/06/2021 11:54:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NOT NULL,
	[content] [varchar](max) NOT NULL,
	[date] [datetime] NOT NULL,
	[author] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (3, N'Making security feeds smarter via machine learning', N'i1.jpg', N'In today’s age of surveillance, with cameras even in our homes, security professionals need to monitor an ever-increasing number of screens. In 2014 alone, 245 million video surveillance cameras were installed globally, according to an IHS report.
 
It is increasingly clear that the ‘watchmen’ are having trouble watching. This is where Singapore-based Vi Dimensions hopes to help, by identifying anomalies to alert human operators that a second look is needed.
 
While the security industry is already familiar with rule-based analytics, there is still a gap, according to its cofounder and chief executive officer Raymond Looi.
 
“Video analytics has been in the market for the last 10 years, but the way they have been doing it is not very efficient, using rule-based analytics.
 
“This requires you to know what you are looking for and then specify a rule, when most do not know what to look out for,” he says, in a conversation with Digital News Asia (DNA) in Singapore recently.
 
“We felt that there was a gap in the industry in how they applied automation to cameras – and with the proliferation of surveillance cameras and vast amounts of data being generated, we felt that this was an area in which we could differentiate ourselves,” he adds.', CAST(N'2021-04-12 02:29:00.000' AS DateTime), N'Benjamin Cher')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (6, N'Elevennia tawarkan layanna Mokado', N'i1.jpg', N'SERIUS menjajaki bisnis e-commerce perusahaan joint venture PT XL Planet dengan produk elevenia kembali mengumumkan strategi bisnis perusahaan pada 2016 dengan menyediakan layanan mobile gifting Mokado (mobile kado).
 
Dengan mengusung konsep online-to-offline (O2O), Mokado menawarkan produk dengan cara yang berbeda dengan platform induk elevenia. Jika elevenia menyediakan berbagai barang, maka Mokado lebih menyasar pada penyediaan voucher yang bisa dipakai sendiri atau dijadikan hadiah.
 
Ide kemunculan Mokado disebut GM hobby & service elevenia Pamkin Pandawa diawali sejak adanya e-kupon pada 2014.
 ', CAST(N'2018-03-12 03:21:00.000' AS DateTime), N'Artikel Terkait')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (7, N'What is next for the wireless industry?', N'i1.jpg', N'IN today’s age of surveillance, with cameras even in our homes, security professionals need to monitor an ever-increasing number of screens. In 2014 alone, 245 million video surveillance cameras were installed globally, according to an IHS report.
 
It is increasingly clear that the ‘watchmen’ are having trouble watching. This is where Singapore-based Vi Dimensions hopes to help, by identifying anomalies to alert human operators that a second look is needed.
 
While the security industry is already familiar with rule-based analytics, there is still a gap, according to its cofounder and chief executive officer Raymond Looi.
 
“Video analytics has been in the market for the last 10 years, but the way they have been doing it is not very efficient, using rule-based analytics.
 
“This requires you to know what you are looking for and then specify a rule, when most do not know what to look out for,” he says, in a conversation with Digital News Asia (DNA) in Singapore recently.
 
“We felt that there was a gap in the industry in how they applied automation to cameras – and with the proliferation of surveillance cameras and vast amounts of data being generated, we felt that this was an area in which we could differentiate ourselves,” he adds.', CAST(N'2019-05-14 16:30:00.000' AS DateTime), N'Jeffrey Gudewicz')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (9, N'Pick yourselft up, learn, sharpen skills', N'i1.jpg', N'The business world waits for no one, especially in an age of rapid technological changes and advancements. No matter where you work or what your title is, you want to make sure you’re constantly learning and progressing.

While some businesses provide formal training for employees to enhance their professional development, others leave that initiative to their workers. If your company falls into the latter group, you might want to take your professional training into your own hands. Below, Forbes Coaches Council members share ways to sharpen your skills outside of work.', CAST(N'2017-04-13 22:20:00.000' AS DateTime), N'Ronaldo')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (11, N'Tony''s Top 10 Tips for Entrepreneurs', N'i1.jpg', N'LOVE him or hate him, you can’t just ignore AirAsia cofounder Tony Fernandes, who rocked the house earlier this week as the closing speaker for Digital News Asia’s (DNA) inaugural What’s Next business technology conference in Cyberjaya.
 
With his trademark biting wit and expected insights into the business world, he had the floor in stitches at times, or furiously taking down notes at others.
 
The What’s Next: The Business Impact of Disruptive Technology conference (#WhatsNextDNA) was organised by Digital News Asia (DNA).
 
', CAST(N'2017-04-12 09:20:00.000' AS DateTime), N'Goh Thean Eu')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (12, N'RentSmart - the fully insured online marketplace to lend and borrow items', N'i1.jpg', N'The thought of earning income from renting out expensive, underutilised items in your possession is appealing. But the risk factor of items being damaged can certainly be off-putting. It is a pain point that Rentsmart Asia recognises and that is why the platform, which offers both business to consumer (B2C) and peer to peer (P2P) item rental, is fully-insured.', CAST(N'2017-04-11 10:19:00.000' AS DateTime), N'Kiran Kaur Sidhu')
INSERT [dbo].[Article] ([id], [title], [image], [content], [date], [author]) VALUES (14, N'Full lockdown would guarantee safety', N'i1.jpg', N'KUALA LUMPUR:  A full COVID-19 lockdown with all sectors shut like what was imposed last year would guarantee people’s safety, but there is a risk that the economy could collapse, said Malaysian Prime Minister Muhyiddin Yassin.

Speaking in an interview aired by RTM and Bernama TV on Sunday (May 23), he noted that there have been calls for stricter curbs during the current Movement Control Order (MCO) to match what was first imposed between March and May last year.

“We (could) close everything and sit quietly, factories close and everyone stays at home and that guarantees safety. It is easy for the government and Ministry of Health to manage our lives," he said.', CAST(N'2019-08-10 14:20:00.000' AS DateTime), N'ann ka')
SET IDENTITY_INSERT [dbo].[Article] OFF
