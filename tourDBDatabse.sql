IF DB_ID('tourismDB') IS NOT NULL
	DROP DATABASE tourismDB

CREATE DATABASE tourismDB
GO


USE [tourismDB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 /****** Object:  Table [dbo].[admin_login_tbl]    Script Date: 15/10/2021 ******/
CREATE TABLE [dbo].[admin_login_tbl](
	[username] [nvarchar] (50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[full_name] [nvarchar](50)  NULL,
)
GO
INSERT [dbo].[admin_login_tbl] ([username],[password],[full_name]) VALUES (N'Admin',N'Admin123',NULL)
INSERT [dbo].[admin_login_tbl] ([username],[password],[full_name]) VALUES (N'Hetvee',N'Hetvee@2000',NULL)
INSERT [dbo].[admin_login_tbl] ([username],[password],[full_name]) VALUES (N'ruchi9839',N'ruchi9839',NULL)

 /****** Object:  Table [dbo].[member_signup_tbl]    Script Date: 15/10/2021 ******/
 SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_signup_tbl](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[full_name] [nvarchar](50)  NULL,
    [dob] [nvarchar](50)  NULL,
    [contact_no] [nvarchar](50)  NULL,
    [email] [nvarchar](50)  NULL,
    [state] [nvarchar](50)  NULL,
    [city] [nvarchar](50)  NULL,
    [pincode] [nvarchar](50)  NULL,
	[full_address] [nvarchar](MAX)  NULL,
    [account_status] [nvarchar](50)  NULL,
    PRIMARY KEY (member_id)
)
GO
INSERT [dbo].[member_signup_tbl] ([password],[full_name],[dob],[contact_no],[email],[state],[city],[pincode],[full_address],[account_status]) VALUES (N'test000',NULL,NULL,9849384972,N'Test@mail',NULL,NULL,NULL,NULL,NULL)
INSERT [dbo].[member_signup_tbl] ([password],[full_name],[dob],[contact_no],[email],[state],[city],[pincode],[full_address],[account_status]) VALUES (N'bhimji123',N'bhimjilal mansukhlal dave',NULL,9849384972,N'Test@mail',NULL,NULL,NULL,NULL,NULL)
INSERT [dbo].[member_signup_tbl] ([password],[full_name],[dob],[contact_no],[email],[state],[city],[pincode],[full_address],[account_status]) VALUES (N'rama123',N'Ramakant bhimjilal dave',NULL,9849384972,N'Test@mail',NULL,NULL,NULL,NULL,NULL)

 /****** Object:  Table [dbo].[category_management_tbl]    Script Date: 15/10/2021 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[category_management_tbl](
	[category_id] [INT] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
	PRIMARY KEY (category_id),
)
GO
INSERT [dbo].[category_management_tbl] ([category_name]) VALUES (N'International packages')
INSERT [dbo].[category_management_tbl] ([category_name]) VALUES (N'National packages')

 /****** Object:  Table [dbo].[category_management_tbl]    Script Date: 15/10/2021 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[package_management_tbl](
	[package_id] [INT] IDENTITY(1,1) NOT NULL,
	[package_name] [nvarchar](50) NOT NULL,
	[package_category] [nvarchar](50)  NULL,
	[price] [INT] NOT NULL,
	[description] [nvarchar](MAX) NULL,
	[images] [nvarchar](MAX)  NULL,
	PRIMARY KEY (package_id),
)
GO
INSERT [dbo].[package_management_tbl] ([package_name],[package_category],[price],[description],[images]) VALUES (N'Shrinagar',N'National packages',1999,NULL,NULL)
 /****** Object:  Table [dbo].[category_management_tbl]    Script Date: 15/10/2021 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[booking_contact_details_tbl](
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [INT] NULL,
	[total_days] [INT] NOT NULL,
	[total_member] [INT] NOT NULL,
	[total_price] [INT] NULL,
	[special_request] [nvarchar](50)  NULL,
)
GO
INSERT [dbo].[booking_contact_details_tbl] ([name],[email],[phone],[total_days],[total_member],[total_price],[special_request]) VALUES (N'Lalabhai','LALo@gamil.com',9857374628,2,2,4999,NULL)

