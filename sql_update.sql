USE [FreeCyDB]
GO
/****** Object:  User [aabb]    Script Date: 5/21/2021 10:14:49 AM ******/
CREATE USER [aabb] FOR LOGIN [aabb] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [abc]    Script Date: 5/21/2021 10:14:49 AM ******/
CREATE USER [abc] FOR LOGIN [abc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [freecy]    Script Date: 5/21/2021 10:14:49 AM ******/
CREATE USER [freecy] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
/****** Object:  User [FreeCyDB]    Script Date: 5/21/2021 10:14:49 AM ******/
CREATE USER [FreeCyDB] FOR LOGIN [FreeCyDB] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [aabb]
GO
ALTER ROLE [db_owner] ADD MEMBER [abc]
GO
ALTER ROLE [db_owner] ADD MEMBER [FreeCyDB]
GO
/****** Object:  Table [dbo].[Bids]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bids](
	[ID_Bid] [int] IDENTITY(1,1) NOT NULL,
	[ID_Product] [int] NOT NULL,
	[ID_User] [int] NOT NULL,
	[Price] [float] NULL,
	[Description] [ntext] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Bids] PRIMARY KEY CLUSTERED 
(
	[ID_Bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID_Category] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Constructions]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Constructions](
	[ID_Construction] [int] IDENTITY(1,1) NOT NULL,
	[ID_Bid] [int] NOT NULL,
	[Price] [float] NULL,
	[isFinish] [int] NULL,
	[Description] [ntext] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Constructions] PRIMARY KEY CLUSTERED 
(
	[ID_Construction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversations]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversations](
	[ID_User] [int] NOT NULL,
	[ID_MessRoom] [int] NOT NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Conversations] PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[ID_Mess] [int] IDENTITY(1,1) NOT NULL,
	[ID_MessRoom] [int] NOT NULL,
	[ID_User] [int] NOT NULL,
	[ID_MessType] [int] NOT NULL,
	[Contents] [ntext] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[ID_Mess] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageType]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageType](
	[ID_MessType] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_MessageType] PRIMARY KEY CLUSTERED 
(
	[ID_MessType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessRoom]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessRoom](
	[ID_MessRoom] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[Status] [int] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_MessRoom] PRIMARY KEY CLUSTERED 
(
	[ID_MessRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[ID_Payment] [int] IDENTITY(1,1) NOT NULL,
	[ID_Construction] [int] NOT NULL,
	[Price] [float] NULL,
	[Description] [ntext] NULL,
	[Status] [int] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[ID_Payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessLogs]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessLogs](
	[ID_ProcessLog] [int] IDENTITY(1,1) NOT NULL,
	[ID_Construction] [int] NOT NULL,
	[Description] [ntext] NULL,
	[Status] [int] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_ProcessLogs] PRIMARY KEY CLUSTERED 
(
	[ID_ProcessLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID_Product] [int] IDENTITY(1,1) NOT NULL,
	[ID_Category] [int] NOT NULL,
	[ID_User] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[Price] [decimal](18, 0) NULL,
	[Status] [int] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [smalldatetime] NULL,
	[Image] [nvarchar](300) NULL,
	[MetaTitle] [nvarchar](100) NULL,
	[Respons] [ntext] NULL,
	[Experience] [ntext] NULL,
	[Benifit] [ntext] NULL,
	[Education] [ntext] NULL,
	[Salary] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](3000) NOT NULL,
	[GroupID] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [int] NULL,
	[Birthday] [datetime] NULL,
	[Status] [bit] NULL,
	[isFreeLancer] [bit] NULL,
	[isEmployer] [bit] NULL,
	[ResetPasswordCode] [nvarchar](500) NULL,
	[isEmailVerify] [bit] NULL,
	[Address] [text] NULL,
	[WorkTime] [text] NULL,
	[CreateAt] [datetime] NULL,
	[ActivationCode] [uniqueidentifier] NULL,
	[ConfirmPassword] [nvarchar](3000) NULL,
	[Name] [nvarchar](3000) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (1, N'Full Stack BackEnd', N'abc', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (2, N'Product UI', N'bcd', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (3, N'Product Design', N'abcd', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (4, N'Designer', N'Designer expert', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (5, N'Photoshop', N'photoshop', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (6, N'Social Media', N'social-media', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (7, N'WorldPress', N'wordpress', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (8, N'Video Explainer', N'video-explainer', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (9, N'Data Entry', N'data-entry', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (10, N'Book Cover', N'book-cover', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (11, N'Video Editing', N'video-editing', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (12, N'Logo-Animation', N'logo-animation', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (13, N'Video Marketing', N'video-makerting', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (14, N'Mobile App', N'mobile-app', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (15, N'Web Traffic', N'web-traffic', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (16, N'Music-Promotion', N'music-promotion', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (17, N'Chatbots', N'chatbots', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (18, N'Brochure Design', N'brochure-design', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (19, N'Flyer Design', N'flayer-design', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (20, N'Poster Design', N'poster-design', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (21, N'Web Banners', N'web-banner', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (22, N'Resume Design', N'resume-design', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (23, N'Game Art', N'game-art', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (24, N'User Testing', N'user-testing', NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt], [Status]) VALUES (25, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (1, 1, 16, N'Full Stack BackEnd', N'a day roi!!!!', CAST(1200 AS Decimal(18, 0)), 1, CAST(N'2021-04-29' AS Date), NULL, N'company-1.png', N'full-stack-backend', N'<p>abc<br/>def</p>', NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (2, 2, 17, N'Product UI', N'a day roi ne!!!!', CAST(1300 AS Decimal(18, 0)), 1, CAST(N'2021-04-29' AS Date), NULL, N'company-2.png', N'product-ui', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (3, 3, 16, N'Product Design', N'a day roi!!!!', CAST(1300 AS Decimal(18, 0)), 1, CAST(N'2021-04-29' AS Date), NULL, N'company-3.png', N'product-design', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (4, 4, 17, N'Designer', N'a day roi!!!!', CAST(1200 AS Decimal(18, 0)), 1, CAST(N'2021-04-29' AS Date), NULL, N'company-4.png', N'designer', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (5, 5, 16, N'Photoshop', N'a day roi!!!!', CAST(1300 AS Decimal(18, 0)), 1, CAST(N'2021-04-29' AS Date), NULL, N'company-5.png', N'photoshop', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (19, 6, 16, N'Social Media', N'a day roi!!!!', CAST(1500 AS Decimal(18, 0)), 1, CAST(N'2021-07-11' AS Date), NULL, N'company-6.png', N'social-media', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (20, 7, 17, N'WorldPress', N'a day roi!!!!', CAST(2500 AS Decimal(18, 0)), 1, CAST(N'2020-02-15' AS Date), NULL, N'company-7.png', N'wordpress', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (26, 8, 16, N'Video Explainer', N'a day roi!!!!', CAST(2200 AS Decimal(18, 0)), 1, CAST(N'2021-04-22' AS Date), NULL, N'company-8.png', N'video-explainer', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (27, 9, 17, N'Data Entry', N'a day roi!!!!', CAST(1280 AS Decimal(18, 0)), 1, CAST(N'2021-12-11' AS Date), NULL, N'company-9.png', N'data-entry', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (28, 10, 16, N'Book Cover', N'a day roi!!!!', CAST(1500 AS Decimal(18, 0)), 1, CAST(N'2021-11-19' AS Date), NULL, N'company-10.png', N'book-cover', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt], [Image], [MetaTitle], [Respons], [Experience], [Benifit], [Education], [Salary]) VALUES (29, 11, 17, N'Video Editing', N'a day roi!!!!', CAST(1500 AS Decimal(18, 0)), 1, CAST(N'2021-11-12' AS Date), NULL, N'company-1.png', N'video-editing', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xóa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách user')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (16, N'triandutt', N'1211', N'MEMBER', N'haha@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, N'Dien Bien Phu', N'FullTime', CAST(N'2021-04-29T12:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (17, N'nguyen', N'123', N'MEMBER', N'trian7391@gmail.comm', NULL, NULL, 1, NULL, NULL, NULL, NULL, N'Hoang Thi Loan', N'PartTime', CAST(N'2021-04-29T12:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (18, N'nobian', N'1234', N'MEMBER', N'triandn49@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (19, N'dovuong', N'1234', N'MEMBER', N'dovuong2001@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (20, N'phuninh01', N'1111', N'MEMBER', N'phuninh2001@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (21, N'quangdinh', N'quandinh', N'MEMBER', N'quangdinh1911@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (22, N'denvau', N'denden', N'MEMBER', N'denvaucontact@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (29, N'annt', N'1111', N'MEMBER', N'annguyen@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (30, N'nguyenkimanh', N'234a0435191610c6db02dbd06d68fb1d', N'MEMBER', N'', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'4ef34287-91de-4763-a76f-ffd084c8f703', NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (31, N'thienthanbongdem', N'cb9c0e2036c6a35f21a60df8d1cbbc93', N'MEMBER', N'trian7391@gmail.comm', NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, N'309a9c2c-c708-4073-b4bb-75d3407a52f1', NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (32, N'kenoidoi', N'd7e6cd487ac507d37c6b38862d83956b', N'MEMBER', N'trian7391@gmail.com', NULL, NULL, 1, NULL, NULL, N'f43c396c-4296-4021-88b5-dcefe3a1ead9', 1, NULL, NULL, NULL, N'12f9a73f-41aa-475e-ba30-0e06eac42247', NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (33, N'thienthananhsang', N'10c5da53d9e47c9fe112b3f7406fd60d', N'MEMBER', N'nguyenthikimanh42k@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'c95f287c-eba0-48d6-9041-552bc07e7344', NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (34, N'ngocnghech', N'5187ab499322642437abce3ca0d8bc7f', N'MEMBER', N'trian7392@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'8518e6c2-c209-40d7-8a65-c60cef295fa7', NULL, NULL)
INSERT [dbo].[User] ([ID_User], [UserName], [Password], [GroupID], [Email], [Phone], [Birthday], [Status], [isFreeLancer], [isEmployer], [ResetPasswordCode], [isEmailVerify], [Address], [WorkTime], [CreateAt], [ActivationCode], [ConfirmPassword], [Name]) VALUES (35, N'vuongque', N'bfc0a1dafbd6512056361066ad065faa', N'ADMIN', N'vuongnguyendo2709@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'88fcba2d-5d47-467f-b69e-345e3c85a45d', NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị ')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Moderatior')
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bids_Products] FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Products] ([ID_Product])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bids_Products]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bids_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[User] ([ID_User])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bids_Users]
GO
ALTER TABLE [dbo].[Constructions]  WITH CHECK ADD  CONSTRAINT [FK_Constructions_Bids] FOREIGN KEY([ID_Bid])
REFERENCES [dbo].[Bids] ([ID_Bid])
GO
ALTER TABLE [dbo].[Constructions] CHECK CONSTRAINT [FK_Constructions_Bids]
GO
ALTER TABLE [dbo].[Conversations]  WITH CHECK ADD  CONSTRAINT [FK_Conversations_MessRoom] FOREIGN KEY([ID_MessRoom])
REFERENCES [dbo].[MessRoom] ([ID_MessRoom])
GO
ALTER TABLE [dbo].[Conversations] CHECK CONSTRAINT [FK_Conversations_MessRoom]
GO
ALTER TABLE [dbo].[Conversations]  WITH CHECK ADD  CONSTRAINT [FK_Conversations_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[User] ([ID_User])
GO
ALTER TABLE [dbo].[Conversations] CHECK CONSTRAINT [FK_Conversations_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_MessageType] FOREIGN KEY([ID_MessType])
REFERENCES [dbo].[MessageType] ([ID_MessType])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_MessageType]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_MessRoom] FOREIGN KEY([ID_MessRoom])
REFERENCES [dbo].[MessRoom] ([ID_MessRoom])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_MessRoom]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[User] ([ID_User])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Constructions] FOREIGN KEY([ID_Construction])
REFERENCES [dbo].[Constructions] ([ID_Construction])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Constructions]
GO
ALTER TABLE [dbo].[ProcessLogs]  WITH CHECK ADD  CONSTRAINT [FK_ProcessLogs_Constructions] FOREIGN KEY([ID_Construction])
REFERENCES [dbo].[Constructions] ([ID_Construction])
GO
ALTER TABLE [dbo].[ProcessLogs] CHECK CONSTRAINT [FK_ProcessLogs_Constructions]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([ID_Category])
REFERENCES [dbo].[Categories] ([ID_Category])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[User] ([ID_User])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
/****** Object:  StoredProcedure [dbo].[Account_login]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Account_login]
	@username varchar(20),
	@password varchar(20)
as
begin
	declare @count int
	declare @res bit
	select @count = count(*) from [dbo].[User] where UserName = @username and [Password] = @password
	if @count > 0
		set @res = 1
	else 
		set @res = 0

	select @res
end

GO
/****** Object:  StoredProcedure [dbo].[Account_register]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Account_register]
@username nvarchar(20) = NULL ,
@password nvarchar(20) = NULL ,
@email nvarchar(50) = NULL
as 
begin
declare @count int
declare @res bit
	select @count = count(*) from [dbo].[User] where username = @username
	if @count = 0
	begin
		insert into [dbo].[User] (Username,[Password],Email)
		values 
		(
			@username,
			@password,
			@email
		)
		set @res = 1
	end
	else
		set @res = 0

	select @res
end
GO
/****** Object:  StoredProcedure [dbo].[usp_BidsDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_BidsDelete] 
    @ID_Bid nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Bids]
	WHERE  [ID_Bid] = @ID_Bid

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_BidsInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_BidsInsert] 
    @ID_Bid nchar(10),
    @ID_Product nchar(10),
    @ID_User nchar(10),
    @Price float = NULL,
    @Description ntext = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Bids] ([ID_Bid], [ID_Product], [ID_User], [Price], [Description], [CreatedAt], [UpdatedAt])
	SELECT @ID_Bid, @ID_Product, @ID_User, @Price, @Description, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Bid], [ID_Product], [ID_User], [Price], [Description], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Bids]
	WHERE  [ID_Bid] = @ID_Bid
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_BidsSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_BidsSelect] 
    @ID_Bid nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_Bid], [ID_Product], [ID_User], [Price], [Description], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[Bids] 
	WHERE  ([ID_Bid] = @ID_Bid OR @ID_Bid IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_BidsUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_BidsUpdate] 
    @ID_Bid nchar(10),
    @ID_Product nchar(10),
    @ID_User nchar(10),
    @Price float = NULL,
    @Description ntext = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Bids]
	SET    [ID_Product] = @ID_Product, [ID_User] = @ID_User, [Price] = @Price, [Description] = @Description, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_Bid] = @ID_Bid
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Bid], [ID_Product], [ID_User], [Price], [Description], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Bids]
	WHERE  [ID_Bid] = @ID_Bid	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_CategoriesDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CategoriesDelete] 
    @ID_Category nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Categories]
	WHERE  [ID_Category] = @ID_Category

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_CategoriesInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CategoriesInsert] 
    @ID_Category nchar(10),
    @Name nvarchar(50) = NULL,
    @Description ntext = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Categories] ([ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt])
	SELECT @ID_Category, @Name, @Description, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Categories]
	WHERE  [ID_Category] = @ID_Category
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_CategoriesSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CategoriesSelect] 
    @ID_Category nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[Categories] 
	WHERE  ([ID_Category] = @ID_Category OR @ID_Category IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_CategoriesUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CategoriesUpdate] 
    @ID_Category nchar(10),
    @Name nvarchar(50) = NULL,
    @Description ntext = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Categories]
	SET    [Name] = @Name, [Description] = @Description, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_Category] = @ID_Category
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Category], [Name], [Description], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Categories]
	WHERE  [ID_Category] = @ID_Category	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ConstructionsDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ConstructionsDelete] 
    @ID_Construction nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Constructions]
	WHERE  [ID_Construction] = @ID_Construction

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ConstructionsInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ConstructionsInsert] 
    @ID_Construction nchar(10),
    @ID_Bid nchar(10),
    @Price float = NULL,
    @isFinish int = NULL,
    @Description ntext,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Constructions] ([ID_Construction], [ID_Bid], [Price], [isFinish], [Description], [CreatedAt], [UpdatedAt])
	SELECT @ID_Construction, @ID_Bid, @Price, @isFinish, @Description, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Construction], [ID_Bid], [Price], [isFinish], [Description], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Constructions]
	WHERE  [ID_Construction] = @ID_Construction
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ConstructionsSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ConstructionsSelect] 
    @ID_Construction nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_Construction], [ID_Bid], [Price], [isFinish], [Description], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[Constructions] 
	WHERE  ([ID_Construction] = @ID_Construction OR @ID_Construction IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ConstructionsUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ConstructionsUpdate] 
    @ID_Construction nchar(10),
    @ID_Bid nchar(10),
    @Price float = NULL,
    @isFinish int = NULL,
    @Description ntext,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Constructions]
	SET    [ID_Bid] = @ID_Bid, [Price] = @Price, [isFinish] = @isFinish, [Description] = @Description, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_Construction] = @ID_Construction
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Construction], [ID_Bid], [Price], [isFinish], [Description], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Constructions]
	WHERE  [ID_Construction] = @ID_Construction	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ConversationsDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ConversationsDelete] 
    @ID_User nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Conversations]
	WHERE  [ID_User] = @ID_User

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ConversationsInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ConversationsInsert] 
    @ID_User nchar(10),
    @ID_MessRoom nchar(10),
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Conversations] ([ID_User], [ID_MessRoom], [CreatedAt], [UpdatedAt])
	SELECT @ID_User, @ID_MessRoom, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_User], [ID_MessRoom], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Conversations]
	WHERE  [ID_User] = @ID_User
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ConversationsSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ConversationsSelect] 
    @ID_User nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_User], [ID_MessRoom], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[Conversations] 
	WHERE  ([ID_User] = @ID_User OR @ID_User IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ConversationsUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ConversationsUpdate] 
    @ID_User nchar(10),
    @ID_MessRoom nchar(10),
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Conversations]
	SET    [ID_MessRoom] = @ID_MessRoom, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_User] = @ID_User
	
	-- Begin Return Select <- do not remove
	SELECT [ID_User], [ID_MessRoom], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Conversations]
	WHERE  [ID_User] = @ID_User	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessagesDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessagesDelete] 
    @ID_Mess nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Messages]
	WHERE  [ID_Mess] = @ID_Mess

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessagesInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessagesInsert] 
    @ID_Mess nchar(10),
    @ID_MessRoom nchar(10),
    @ID_User nchar(10),
    @ID_MessType nchar(10),
    @Contents ntext = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Messages] ([ID_Mess], [ID_MessRoom], [ID_User], [ID_MessType], [Contents], [CreatedAt], [UpdatedAt])
	SELECT @ID_Mess, @ID_MessRoom, @ID_User, @ID_MessType, @Contents, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Mess], [ID_MessRoom], [ID_User], [ID_MessType], [Contents], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Messages]
	WHERE  [ID_Mess] = @ID_Mess
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessagesSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessagesSelect] 
    @ID_Mess nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_Mess], [ID_MessRoom], [ID_User], [ID_MessType], [Contents], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[Messages] 
	WHERE  ([ID_Mess] = @ID_Mess OR @ID_Mess IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessagesUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessagesUpdate] 
    @ID_Mess nchar(10),
    @ID_MessRoom nchar(10),
    @ID_User nchar(10),
    @ID_MessType nchar(10),
    @Contents ntext = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Messages]
	SET    [ID_MessRoom] = @ID_MessRoom, [ID_User] = @ID_User, [ID_MessType] = @ID_MessType, [Contents] = @Contents, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_Mess] = @ID_Mess
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Mess], [ID_MessRoom], [ID_User], [ID_MessType], [Contents], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Messages]
	WHERE  [ID_Mess] = @ID_Mess	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessageTypeDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessageTypeDelete] 
    @ID_MessType nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[MessageType]
	WHERE  [ID_MessType] = @ID_MessType

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessageTypeInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessageTypeInsert] 
    @ID_MessType nchar(10),
    @Name nvarchar(50) = NULL,
    @Description ntext = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[MessageType] ([ID_MessType], [Name], [Description], [CreatedAt], [UpdatedAt])
	SELECT @ID_MessType, @Name, @Description, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_MessType], [Name], [Description], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[MessageType]
	WHERE  [ID_MessType] = @ID_MessType
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessageTypeSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessageTypeSelect] 
    @ID_MessType nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_MessType], [Name], [Description], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[MessageType] 
	WHERE  ([ID_MessType] = @ID_MessType OR @ID_MessType IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessageTypeUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessageTypeUpdate] 
    @ID_MessType nchar(10),
    @Name nvarchar(50) = NULL,
    @Description ntext = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[MessageType]
	SET    [Name] = @Name, [Description] = @Description, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_MessType] = @ID_MessType
	
	-- Begin Return Select <- do not remove
	SELECT [ID_MessType], [Name], [Description], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[MessageType]
	WHERE  [ID_MessType] = @ID_MessType	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessRoomDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessRoomDelete] 
    @ID_MessRoom nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[MessRoom]
	WHERE  [ID_MessRoom] = @ID_MessRoom

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessRoomInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessRoomInsert] 
    @ID_MessRoom nchar(10),
    @Name nvarchar(50) = NULL,
    @Description ntext = NULL,
    @Status int = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[MessRoom] ([ID_MessRoom], [Name], [Description], [Status], [CreatedAt], [UpdatedAt])
	SELECT @ID_MessRoom, @Name, @Description, @Status, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_MessRoom], [Name], [Description], [Status], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[MessRoom]
	WHERE  [ID_MessRoom] = @ID_MessRoom
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessRoomSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessRoomSelect] 
    @ID_MessRoom nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_MessRoom], [Name], [Description], [Status], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[MessRoom] 
	WHERE  ([ID_MessRoom] = @ID_MessRoom OR @ID_MessRoom IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_MessRoomUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MessRoomUpdate] 
    @ID_MessRoom nchar(10),
    @Name nvarchar(50) = NULL,
    @Description ntext = NULL,
    @Status int = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[MessRoom]
	SET    [Name] = @Name, [Description] = @Description, [Status] = @Status, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_MessRoom] = @ID_MessRoom
	
	-- Begin Return Select <- do not remove
	SELECT [ID_MessRoom], [Name], [Description], [Status], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[MessRoom]
	WHERE  [ID_MessRoom] = @ID_MessRoom	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_PaymentsDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_PaymentsDelete] 
    @ID_Payment nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Payments]
	WHERE  [ID_Payment] = @ID_Payment

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_PaymentsInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_PaymentsInsert] 
    @ID_Payment nchar(10),
    @ID_Construction nchar(10),
    @Price float = NULL,
    @Description ntext = NULL,
    @Status int = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Payments] ([ID_Payment], [ID_Construction], [Price], [Description], [Status], [CreatedAt], [UpdatedAt])
	SELECT @ID_Payment, @ID_Construction, @Price, @Description, @Status, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Payment], [ID_Construction], [Price], [Description], [Status], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Payments]
	WHERE  [ID_Payment] = @ID_Payment
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_PaymentsSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_PaymentsSelect] 
    @ID_Payment nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_Payment], [ID_Construction], [Price], [Description], [Status], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[Payments] 
	WHERE  ([ID_Payment] = @ID_Payment OR @ID_Payment IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_PaymentsUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_PaymentsUpdate] 
    @ID_Payment nchar(10),
    @ID_Construction nchar(10),
    @Price float = NULL,
    @Description ntext = NULL,
    @Status int = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Payments]
	SET    [ID_Construction] = @ID_Construction, [Price] = @Price, [Description] = @Description, [Status] = @Status, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_Payment] = @ID_Payment
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Payment], [ID_Construction], [Price], [Description], [Status], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Payments]
	WHERE  [ID_Payment] = @ID_Payment	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ProcessLogsDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProcessLogsDelete] 
    @ID_ProcessLog nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[ProcessLogs]
	WHERE  [ID_ProcessLog] = @ID_ProcessLog

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ProcessLogsInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProcessLogsInsert] 
    @ID_ProcessLog nchar(10),
    @ID_Construction nchar(10),
    @Description ntext = NULL,
    @Status int = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[ProcessLogs] ([ID_ProcessLog], [ID_Construction], [Description], [Status], [CreatedAt], [UpdatedAt])
	SELECT @ID_ProcessLog, @ID_Construction, @Description, @Status, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_ProcessLog], [ID_Construction], [Description], [Status], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[ProcessLogs]
	WHERE  [ID_ProcessLog] = @ID_ProcessLog
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ProcessLogsSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProcessLogsSelect] 
    @ID_ProcessLog nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_ProcessLog], [ID_Construction], [Description], [Status], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[ProcessLogs] 
	WHERE  ([ID_ProcessLog] = @ID_ProcessLog OR @ID_ProcessLog IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ProcessLogsUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProcessLogsUpdate] 
    @ID_ProcessLog nchar(10),
    @ID_Construction nchar(10),
    @Description ntext = NULL,
    @Status int = NULL,
    @CreatedAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[ProcessLogs]
	SET    [ID_Construction] = @ID_Construction, [Description] = @Description, [Status] = @Status, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_ProcessLog] = @ID_ProcessLog
	
	-- Begin Return Select <- do not remove
	SELECT [ID_ProcessLog], [ID_Construction], [Description], [Status], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[ProcessLogs]
	WHERE  [ID_ProcessLog] = @ID_ProcessLog	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductsDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProductsDelete] 
    @ID_Product nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Products]
	WHERE  [ID_Product] = @ID_Product

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductsInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProductsInsert] 
    @ID_Product nchar(10),
    @ID_Category nchar(10),
    @ID_User nchar(10),
    @Name nvarchar(50) = NULL,
    @Description ntext = NULL,
    @Price float = NULL,
    @Status int = NULL,
    @CreatedAt smalldatetime,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Products] ([ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt])
	SELECT @ID_Product, @ID_Category, @ID_User, @Name, @Description, @Price, @Status, @CreatedAt, @UpdatedAt
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Products]
	WHERE  [ID_Product] = @ID_Product
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductsSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProductsSelect] 
    @ID_Product nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt] 
	FROM   [dbo].[Products] 
	WHERE  ([ID_Product] = @ID_Product OR @ID_Product IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductsUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProductsUpdate] 
    @ID_Product nchar(10),
    @ID_Category nchar(10),
    @ID_User nchar(10),
    @Name nvarchar(50) = NULL,
    @Description ntext = NULL,
    @Price float = NULL,
    @Status int = NULL,
    @CreatedAt smalldatetime,
    @UpdatedAt smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Products]
	SET    [ID_Category] = @ID_Category, [ID_User] = @ID_User, [Name] = @Name, [Description] = @Description, [Price] = @Price, [Status] = @Status, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt
	WHERE  [ID_Product] = @ID_Product
	
	-- Begin Return Select <- do not remove
	SELECT [ID_Product], [ID_Category], [ID_User], [Name], [Description], [Price], [Status], [CreatedAt], [UpdatedAt]
	FROM   [dbo].[Products]
	WHERE  [ID_Product] = @ID_Product	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UsersDelete]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UsersDelete] 
    @ID_User nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Users]
	WHERE  [ID_User] = @ID_User

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UsersInsert]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UsersInsert] 
    @ID_User nchar(10),
    @UserName nvarchar(20),
    @Password nvarchar(20),
    @Email nvarchar(50),
    @Phone int,
    @Birthday smalldatetime,
    @Status int = NULL,
    @CreateAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL,
    @isFreeLancer bit = NULL,
    @isEmployer bit = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Users] ([ID_User], [UserName], [Password], [Email], [Phone], [Birthday], [Status], [CreateAt], [UpdatedAt], [isFreeLancer], [isEmployer])
	SELECT @ID_User, @UserName, @Password, @Email, @Phone, @Birthday, @Status, @CreateAt, @UpdatedAt, @isFreeLancer, @isEmployer
	
	-- Begin Return Select <- do not remove
	SELECT [ID_User], [UserName], [Password], [Email], [Phone], [Birthday], [Status], [CreateAt], [UpdatedAt], [isFreeLancer], [isEmployer]
	FROM   [dbo].[Users]
	WHERE  [ID_User] = @ID_User
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UsersSelect]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UsersSelect] 
    @ID_User nchar(10)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID_User], [UserName], [Password], [Email], [Phone], [Birthday], [Status], [CreateAt], [UpdatedAt], [isFreeLancer], [isEmployer] 
	FROM   [dbo].[Users] 
	WHERE  ([ID_User] = @ID_User OR @ID_User IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UsersUpdate]    Script Date: 5/21/2021 10:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UsersUpdate] 
    @ID_User nchar(10),
    @UserName nvarchar(20),
    @Password nvarchar(20),
    @Email nvarchar(50),
    @Phone int,
    @Birthday smalldatetime,
    @Status int = NULL,
    @CreateAt smalldatetime = NULL,
    @UpdatedAt smalldatetime = NULL,
    @isFreeLancer bit = NULL,
    @isEmployer bit = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Users]
	SET    [UserName] = @UserName, [Password] = @Password, [Email] = @Email, [Phone] = @Phone, [Birthday] = @Birthday, [Status] = @Status, [CreateAt] = @CreateAt, [UpdatedAt] = @UpdatedAt, [isFreeLancer] = @isFreeLancer, [isEmployer] = @isEmployer
	WHERE  [ID_User] = @ID_User
	
	-- Begin Return Select <- do not remove
	SELECT [ID_User], [UserName], [Password], [Email], [Phone], [Birthday], [Status], [CreateAt], [UpdatedAt], [isFreeLancer], [isEmployer]
	FROM   [dbo].[Users]
	WHERE  [ID_User] = @ID_User	
	-- End Return Select <- do not remove

	COMMIT
GO
