USE [master]
GO
/****** Object:  Database [ImperiaD]    Script Date: 17.06.2024 1:31:02 ******/
CREATE DATABASE [ImperiaD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ImperiaD', FILENAME = N'K:\SSMS\MSSQL15.DOZO\MSSQL\DATA\ImperiaD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ImperiaD_log', FILENAME = N'K:\SSMS\MSSQL15.DOZO\MSSQL\DATA\ImperiaD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ImperiaD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ImperiaD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ImperiaD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ImperiaD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ImperiaD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ImperiaD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ImperiaD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ImperiaD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ImperiaD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ImperiaD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ImperiaD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ImperiaD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ImperiaD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ImperiaD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ImperiaD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ImperiaD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ImperiaD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ImperiaD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ImperiaD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ImperiaD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ImperiaD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ImperiaD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ImperiaD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ImperiaD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ImperiaD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ImperiaD] SET  MULTI_USER 
GO
ALTER DATABASE [ImperiaD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ImperiaD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ImperiaD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ImperiaD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ImperiaD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ImperiaD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ImperiaD] SET QUERY_STORE = OFF
GO
USE [ImperiaD]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [int] NOT NULL,
	[brand_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NULL,
	[LoginDateTime] [datetime] NULL,
	[TypeVxod] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] NOT NULL,
	[photo] [text] NULL,
	[name] [nvarchar](50) NOT NULL,
	[size] [text] NOT NULL,
	[id_brend] [int] NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[code] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
	[total_cost] [int] NULL,
	[delivery_days] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_RIO]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_RIO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[code] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NOT NULL,
	[total_cost] [int] NOT NULL,
	[delivery_days] [int] NOT NULL,
 CONSTRAINT [PK_Orders_RIO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_sostav] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_user]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 17.06.2024 1:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[photo] [text] NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[brand] ([id], [brand_name]) VALUES (1, N'Alessandro Borelli Milano')
INSERT [dbo].[brand] ([id], [brand_name]) VALUES (2, N'ANTONY MORATO')
INSERT [dbo].[brand] ([id], [brand_name]) VALUES (3, N'DIESEL')
INSERT [dbo].[brand] ([id], [brand_name]) VALUES (4, N'BARROW KIDS')
INSERT [dbo].[brand] ([id], [brand_name]) VALUES (5, N'PINKO')
INSERT [dbo].[brand] ([id], [brand_name]) VALUES (6, N'TWINSET')
GO
SET IDENTITY_INSERT [dbo].[LoginHistory] ON 

INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1, 4, CAST(N'2024-06-07T00:12:05.927' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (2, 1, CAST(N'2024-06-07T00:12:11.623' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (3, 2, CAST(N'2024-06-07T00:12:17.000' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (4, 3, CAST(N'2024-06-07T00:12:22.080' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (5, 1, CAST(N'2024-06-07T00:12:28.007' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (6, NULL, CAST(N'2024-06-07T00:12:38.843' AS DateTime), N'Не успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (7, 1, CAST(N'2024-06-07T00:12:47.287' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1002, 3, CAST(N'2024-06-16T22:32:43.030' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1003, 1, CAST(N'2024-06-16T22:38:49.040' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1004, 1, CAST(N'2024-06-16T22:41:48.523' AS DateTime), N'Успешно')
SET IDENTITY_INSERT [dbo].[LoginHistory] OFF
GO
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (1, N'/photo/Diesel/kurtkaDiesel.jpeg', N'Куртка ', N'152', 3, 16880, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (2, N'/photo/Diesel/tolstDiesel.png', N'Толстовка', N'160', 3, 16100, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (3, N'/photo/Barrow/kurtkaBarKids.jpeg', N'Куртка', N'152', 4, 32290, 10)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (4, N'/photo/Pinko/dzinsPinko.jpg', N'Джинсы', N'170', 5, 16640, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (5, N'/photo/Diesel/rukzDiesel.png', N'Рюкзак', N'uni', 3, 16830, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (6, N'/photo/Barrow/tolstBarrow.png', N'Толстовка', N'160', 4, 19560, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (7, N'C:\Users\vipev\Downloads\itlogo.png', N'Проверка', N'1', 2, 5000, 10)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (8, N'/photo/ABM/futABM.jpeg', N'Футболка', N'122', 1, 3570, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (9, N'/photo/ABM/futbABM.jpeg', N'Футболка', N'164', 1, 3660, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (10, N'/photo/ABM/kardABM.png', N'Кардиган', N'152', 1, 8260, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (11, N'/photo/ABM/hudABM.png', N'Худи', N'164', 1, 6880, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (12, N'/photo/ABM/brABM.jpeg', N'Брюки', N'170', 1, 3800, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (13, N'/photo/ABM/kurtkDABM.jpeg', N'Джинсовка', N'158', 1, 10630, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (14, N'/photo/ABM/topABM.png', N'Топ', N'164', 1, 3260, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (15, N'/photo/ABM/fABM.jpeg', N'Футболка', N'158', 1, 2740, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (16, N'/photo/ABM/tolstABM.jpeg', N'Толстовка', N'152', 1, 9880, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (17, N'/photo/ABM/shortABM.jpeg', N'Шорты', N'158', 1, 6340, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (18, N'/photo/AM/hudAM.jpeg', N'Худи', N'164', 2, 8630, 30)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (19, N'/photo/AM/futAM.jpeg', N'Футболка', N'152', 2, 3410, 30)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (20, N'/photo/AM/futbAM.jpeg', N'Футболка', N'170', 2, 4590, 30)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (21, N'/photo/AM/shortAM.jpeg', N'Шорты', N'140', 2, 8630, 30)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (22, N'/photo/AM/tolstAM.jpeg', N'Толстовка', N'164', 2, 8630, 30)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (23, N'/photo/Diesel/futDiesel.jpeg', N'Футболка', N'164', 3, 5830, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (24, N'/photo/Diesel/shortDiesel.jpeg', N'Шорты', N'158', 3, 6230, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (25, N'/photo/Pinko/platPinko.jpeg', N'Платье', N'42', 5, 14670, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (26, N'/photo/Pinko/pltPinko.jpeg', N'Платье', N'48', 5, 18530, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (27, N'/photo/Pinko/kombezPinko.jpeg', N'Комбинезон', N'46', 5, 11240, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (28, N'/photo/Pinko/topPinko.jpeg', N'Топ', N'46', 5, 11160, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (29, N'/photo/Twinset/shorTwinset.jpeg', N'Шорты', N'164', 6, 10640, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (30, N'/photo/Twinset/BrukTwinset.jpeg', N'Брюки', N'140', 6, 16850, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [size], [id_brend], [price], [discount]) VALUES (31, N'/photo/Twinset/ubkaTwinset.jpeg', N'Юбка', N'164', 6, 16200, NULL)
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1, 3, 2, 8, CAST(N'2023-12-24' AS Date), 666, 32290, 10, 32280, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2, 3, 3, 8, CAST(N'2024-02-02' AS Date), 453, 16770, 0, 16770, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (3, 3, 2, 2, CAST(N'2024-02-02' AS Date), 565, 32290, 10, 32280, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (4, 3, 3, 8, CAST(N'2024-02-05' AS Date), 986, 16880, 0, 16880, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (5, 4, 3, 8, CAST(N'2024-06-07' AS Date), 717, 16880, 0, 16880, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1005, 3, 3, 8, CAST(N'2024-06-17' AS Date), 292, 16880, 0, 16880, 6)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders_RIO] ON 

INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (17, 3, 1, 2, CAST(N'2024-02-02' AS Date), 565, 32290, 10, 32280, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (18, 3, 1, 1, CAST(N'2024-03-26' AS Date), 926, 16880, 0, 16880, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (19, 3, 1, 1, CAST(N'2023-12-24' AS Date), 666, 32290, 10, 32280, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (20, 3, 1, 3, CAST(N'2024-03-26' AS Date), 666, 16880, 0, 16880, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (21, 3, 1, 1, CAST(N'2023-12-24' AS Date), 666, 32290, 10, 32280, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (22, 3, 1, 1, CAST(N'2024-03-26' AS Date), 926, 16880, 0, 16880, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (23, 3, 1, 1, CAST(N'2023-12-24' AS Date), 666, 32290, 10, 32280, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (24, 3, 1, 1, CAST(N'2023-12-24' AS Date), 666, 32290, 10, 32280, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (25, 3, 1, 6, CAST(N'2024-03-26' AS Date), 972, 16100, 0, 16100, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1004, 3, 1, 2, CAST(N'2024-04-21' AS Date), 556, 16880, 0, 16880, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2004, 3, 1, 1, CAST(N'2024-05-09' AS Date), 896, 5000, 10, 4990, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2005, 3, 1, 1, CAST(N'2024-05-09' AS Date), 573, 16100, 0, 16100, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2006, 3, 1, 8, CAST(N'2024-06-04' AS Date), 947, 16100, 0, 16100, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2007, 4, 1, 8, CAST(N'2024-06-07' AS Date), 717, 16880, 0, 16880, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (3007, 3, 1, 8, CAST(N'2024-02-05' AS Date), 986, 16880, 0, 16880, 6)
INSERT [dbo].[Orders_RIO] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (3008, 3, 1, 8, CAST(N'2024-06-17' AS Date), 292, 16880, 0, 16880, 6)
SET IDENTITY_INSERT [dbo].[Orders_RIO] OFF
GO
SET IDENTITY_INSERT [dbo].[point] ON 

INSERT [dbo].[point] ([id], [name]) VALUES (1, N'ЦДМ')
INSERT [dbo].[point] ([id], [name]) VALUES (2, N'ТРЦ ЕВРОПЕЙСКИЙ')
INSERT [dbo].[point] ([id], [name]) VALUES (3, N'ТРЦ РИО')
INSERT [dbo].[point] ([id], [name]) VALUES (4, N'ТРЦ "Океания" 3 этаж')
INSERT [dbo].[point] ([id], [name]) VALUES (5, N'Outlet Village Белая Дача')
INSERT [dbo].[point] ([id], [name]) VALUES (6, N'ТЦ "АЭРОБУС"')
INSERT [dbo].[point] ([id], [name]) VALUES (7, N'Vnukovo Premium Outlet')
INSERT [dbo].[point] ([id], [name]) VALUES (8, N'ТРК "ВЕГАС"')
SET IDENTITY_INSERT [dbo].[point] OFF
GO
SET IDENTITY_INSERT [dbo].[sostav] ON 

INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (1, 1, 3, 1, 1, 32290, 10)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (2, 2, 1, 1, 1, 16770, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (3, 3, 3, 1, 1, 32290, 10)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (4, 4, 1, 1, 1, 16880, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (5, 5, 1, 1, 1, 16880, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (1005, 1005, 1, 1, 1, 16880, 0)
SET IDENTITY_INSERT [dbo].[sostav] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([id], [status_name]) VALUES (1, N'Новый
')
INSERT [dbo].[status] ([id], [status_name]) VALUES (2, N'Отменен')
INSERT [dbo].[status] ([id], [status_name]) VALUES (3, N'Завершен')
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[type_user] ON 

INSERT [dbo].[type_user] ([id], [role]) VALUES (1, N'Директор')
INSERT [dbo].[type_user] ([id], [role]) VALUES (2, N'Кассир')
INSERT [dbo].[type_user] ([id], [role]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[type_user] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (1, N'halida', N'12345', N'Халида', N'/res/hal.png', 1)
INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (2, N'elena', N'12345', N'Елена', N'/res/lena.png', 2)
INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (3, N'dozo', N'12345', N'dozopravka', N'/res/dp.png', 3)
INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (4, N'gr', N'1234', N'gr', NULL, 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_LoginHistory_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[LoginHistory] CHECK CONSTRAINT [FK_LoginHistory_users]
GO
ALTER TABLE [dbo].[merch]  WITH CHECK ADD  CONSTRAINT [FK_merch_brand] FOREIGN KEY([id_brend])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[merch] CHECK CONSTRAINT [FK_merch_brand]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_orders] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_orders]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_user] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_user] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_user]
GO
USE [master]
GO
ALTER DATABASE [ImperiaD] SET  READ_WRITE 
GO
