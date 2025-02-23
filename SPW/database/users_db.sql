USE [master]
GO
/****** Object:  Database [users_db]    Script Date: 28-04-2023 00:39:40 ******/
CREATE DATABASE [users_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'users_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\users_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'users_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\users_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [users_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [users_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [users_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [users_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [users_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [users_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [users_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [users_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [users_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [users_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [users_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [users_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [users_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [users_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [users_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [users_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [users_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [users_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [users_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [users_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [users_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [users_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [users_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [users_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [users_db] SET RECOVERY FULL 
GO
ALTER DATABASE [users_db] SET  MULTI_USER 
GO
ALTER DATABASE [users_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [users_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [users_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [users_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [users_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [users_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'users_db', N'ON'
GO
ALTER DATABASE [users_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [users_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [users_db]
GO
/****** Object:  User [root]    Script Date: 28-04-2023 00:39:41 ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [root]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [root]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [root]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [root]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [root]
GO
ALTER ROLE [db_datareader] ADD MEMBER [root]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [root]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [root]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [root]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 28-04-2023 00:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[product] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[price] [varchar](255) NOT NULL,
	[quantity] [varchar](255) NOT NULL,
	[Address] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 28-04-2023 00:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[brand] [varchar](255) NOT NULL,
	[code] [varchar](255) NOT NULL,
	[price] [int] NULL,
	[image] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 28-04-2023 00:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[accesslevel] [varchar](25) NULL,
	[isactive] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (1, N'twt', N'table1', N'amiket', N'amiket@gmail', N'3', N'1', N'Tom, NCI, Dublin, D1 E2223')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (2, N'tww', N'wardrobe1', N'amiket', N'amiket@gmail', N'1', N'1', N'Tom, NCI, Dublin, D1 E2223')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (3, N'twt', N'table1', N'amiket', N'amiket@gmail', N'3', N'1', N'Jay, Bhu, surat, as123423')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (4, N'tww', N'wardrobe1', N'amiket', N'amiket@gmail', N'1', N'1', N'Jay, Bhu, surat, as123423')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (5, N'twt', N'table1', N'amiket', N'amiket@gmail', N'3', N'1', N'Jay, Bhu, surat, as123423')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (6, N'tww', N'wardrobe1', N'amiket', N'amiket@gmail', N'1', N'1', N'Jay, Bhu, surat, as123423')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (7, N'twt', N'table1', N'amiket', N'amiket@gmail', N'3', N'1', N'aas, s, s, sasassad')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (8, N'tww', N'wardrobe1', N'amiket', N'amiket@gmail', N'1', N'1', N'aas, s, s, sasassad')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (9, N'twt', N'table1', N'amiket', N'amiket@gmail', N'3', N'1', N'aas, s, s, sasassad')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (10, N'tww', N'wardrobe1', N'amiket', N'amiket@gmail', N'1', N'1', N'aas, s, s, sasassad')
INSERT [dbo].[orders] ([order_id], [product], [name], [username], [email], [price], [quantity], [Address]) VALUES (11, N'twb', N'bed1', N'amiket', N'amiket@gmail', N'1', N'1', N'Amiket, am, Del, nk2nj3jn')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (1, N'chair1', N'Touchwood', N'twc', 2, N'chair.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (2, N'table1', N'Touchwood', N'twt', 3, N'table.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (3, N'bed1', N'Touchwood', N'twb', 1, N'bed1.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (4, N'wardrobe1', N'Touchwood', N'tww', 1, N'wardrobe.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (5, N'chair2', N'Starwood', N'swc', 2, N'chair2.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (6, N'table2', N'Starwood', N'swt', 2, N'table2.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (7, N'bed2', N'Starwood', N'swb', 2, N'bed2.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (8, N'wardrobe2', N'Starwood', N'sww', 2, N'wardrobe2.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (9, N'chair3', N'Woodensolly', N'wsc', 2, N'chair3.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (10, N'table3', N'Woodensolly', N'wst', 2, N'table3.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (11, N'bed3', N'Woodensolly', N'wsb', 2, N'bed3.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (12, N'wardrobe3', N'Woodensolly', N'wsw', 2, N'wardrobe3.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (13, N'chair4', N'Lilywood', N'lwc', 2, N'chair4.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (18, N'table4', N'Lilywood', N'lwt', 1, N'table4.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (22, N'bed4', N'Lilywood', N'lwb', 3, N'bed4.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (24, N'wardrobe', N'Lilywood', N'lww', 1, N'wardrobe4.png')
INSERT [dbo].[products] ([id], [name], [brand], [code], [price], [image]) VALUES (32, N'Amazon Web Services', N'Amazon', N'aws', 10, N'aws.png')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [email], [accesslevel], [isactive]) VALUES (1, N'amiket', N'rope', N'amiket@gmail', N'admin', N'yes')
INSERT [dbo].[users] ([id], [username], [password], [email], [accesslevel], [isactive]) VALUES (4, N'abdul', N'rrr', N'abdul@gmail', N'user', N'yes')
INSERT [dbo].[users] ([id], [username], [password], [email], [accesslevel], [isactive]) VALUES (5, N'kartikey', N'indian', N'kartikey@nci', N'user', N'yes')
INSERT [dbo].[users] ([id], [username], [password], [email], [accesslevel], [isactive]) VALUES (8, N'jay', N'jay', N'jay@gmail', N'fulfillment', N'yes')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164B44DF86D]    Script Date: 28-04-2023 00:39:41 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572E872B539]    Script Date: 28-04-2023 00:39:41 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('user') FOR [accesslevel]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('yes') FOR [isactive]
GO
USE [master]
GO
ALTER DATABASE [users_db] SET  READ_WRITE 
GO
