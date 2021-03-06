USE [master]
GO
/****** Object:  Database [BankingAdminDB]    Script Date: 2022/07/13 23:49:47 ******/
CREATE DATABASE [BankingAdminDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankingAdminDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BankingAdminDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BankingAdminDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BankingAdminDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BankingAdminDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankingAdminDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankingAdminDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankingAdminDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankingAdminDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankingAdminDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankingAdminDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankingAdminDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BankingAdminDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankingAdminDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankingAdminDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankingAdminDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankingAdminDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankingAdminDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankingAdminDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankingAdminDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankingAdminDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BankingAdminDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankingAdminDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankingAdminDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankingAdminDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankingAdminDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankingAdminDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BankingAdminDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankingAdminDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BankingAdminDB] SET  MULTI_USER 
GO
ALTER DATABASE [BankingAdminDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankingAdminDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankingAdminDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankingAdminDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BankingAdminDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BankingAdminDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BankingAdminDB', N'ON'
GO
ALTER DATABASE [BankingAdminDB] SET QUERY_STORE = OFF
GO
USE [BankingAdminDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[code] [int] IDENTITY(1,1) NOT NULL,
	[person_code] [int] NOT NULL,
	[account_number] [varchar](50) NOT NULL,
	[outstanding_balance] [money] NOT NULL,
	[is_active] [bit] NOT NULL,
	[Personscode] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_Accounts]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Accounts](
	[accountauditid] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NOT NULL,
	[person_code] [int] NOT NULL,
	[account_number] [varchar](50) NOT NULL,
	[outstanding_balance] [money] NOT NULL,
	[is_active] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](128) NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Audit_Accounts] PRIMARY KEY CLUSTERED 
(
	[accountauditid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_Persons]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Persons](
	[personsauditid] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[surname] [varchar](50) NULL,
	[id_number] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[UpdatedBy] [nvarchar](128) NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Audit_Persons] PRIMARY KEY CLUSTERED 
(
	[personsauditid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_Transactions]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Transactions](
	[transactionauditid] [int] IDENTITY(1,1) NOT NULL,
	[account_code] [int] NOT NULL,
	[transaction_date] [datetime] NOT NULL,
	[capture_date] [datetime] NOT NULL,
	[amount] [money] NOT NULL,
	[description] [varchar](100) NOT NULL,
	[UpdatedBy] [nvarchar](128) NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Audit_Transactions] PRIMARY KEY CLUSTERED 
(
	[transactionauditid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[code] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[surname] [varchar](50) NULL,
	[id_number] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[code] [int] IDENTITY(1,1) NOT NULL,
	[account_code] [int] NOT NULL,
	[transaction_date] [datetime] NOT NULL,
	[capture_date] [datetime] NOT NULL,
	[amount] [money] NOT NULL,
	[description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (1, 1, N'10000577', 234.9900, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (2, 2, N'10001085', 267.6100, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (3, 3, N'1000373', 520.6700, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (4, 4, N'10007792', 328.7000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (5, 5, N'10011773', 0.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (6, 6, N'10012044', 157.6000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (7, 7, N'100137', 936.4100, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (8, 8, N'10014357', 440.8700, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (9, 9, N'10015256', 0.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (10, 10, N'10016473', 663.7700, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (11, 11, N'10017712', 1471.2700, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (12, 12, N'10019324', 269.8200, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (13, 13, N'10019766', 485.7800, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (14, 14, N'10020241', 715.8300, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (15, 15, N'10020918', 0.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (16, 16, N'10021663', 627.1300, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (17, 17, N'10021698', 426.4300, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (18, 18, N'10022821', 557.3000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (19, 19, N'10022996', 299.2000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (20, 20, N'10024492', 2001200.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (21, 21, N'10027262', 483.5500, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (22, 22, N'10027602', 0.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (23, 23, N'10028579', 1008.9900, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (24, 24, N'1002864', 1059.4300, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (25, 25, N'10032223', 719.6500, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (26, 26, N'10032274', 0.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (27, 27, N'1003267', 843.5900, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (28, 28, N'10036466', 1186.8500, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (29, 29, N'10036474', 0.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (30, 30, N'10036679', 226.7900, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (31, 31, N'10037489', 117.5200, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (32, 32, N'10039015', 542.0800, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (33, 33, N'10039384', 0.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (34, 34, N'10040919', 612.1000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (35, 35, N'10041745', 191.7000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (36, 36, N'10044361', 807.6000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (37, 37, N'10045473', 806.4500, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (38, 38, N'10045856', 310.0300, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (39, 39, N'100460892', 0.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (40, 40, N'10048022', 0.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (41, 41, N'10048812', 0.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (42, 42, N'1005022', 260.8500, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (43, 43, N'10050523', 532.6300, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (44, 44, N'10052623', 302.8500, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (45, 45, N'10052712', 633.4300, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (46, 46, N'10053581', 281.7700, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (47, 47, N'10053794', 268.4600, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (48, 48, N'10054855', 1803.2800, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (49, 49, N'10056262', 789.7400, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (50, 50, N'10057269', 359.6000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (51, 20, N'123123123', 122.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (52, 20, N'5300022020', 0.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (53, 15, N'1238709173', 0.0000, 0, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Audit_Accounts] ON 

INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (1, 1, 1, N'10000577', 234.9900, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.263' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (2, 2, 2, N'10001085', 267.6100, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.300' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (3, 3, 3, N'1000373', 520.6700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.300' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (4, 4, 4, N'10007792', 328.7000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.300' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (5, 5, 5, N'10011773', 641.7000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.300' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (6, 6, 6, N'10012044', 157.6000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.300' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (7, 7, 7, N'100137', 936.4100, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.300' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (8, 8, 8, N'10014357', 440.8700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.310' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (9, 9, 9, N'10015256', 170.6800, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.310' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (10, 10, 10, N'10016473', 663.7700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.310' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (11, 11, 11, N'10017712', 1471.2700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.310' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (12, 12, 12, N'10019324', 269.8200, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.310' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (13, 13, 13, N'10019766', 485.7800, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.313' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (14, 14, 14, N'10020241', 715.8300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.313' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (15, 15, 15, N'10020918', 81.3500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.313' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (16, 16, 16, N'10021663', 627.1300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.313' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (17, 17, 17, N'10021698', 426.4300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.317' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (18, 18, 18, N'10022821', 557.3000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.317' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (19, 19, 19, N'10022996', 299.2000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.317' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (20, 20, 20, N'10024492', 767.2500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.317' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (21, 21, 21, N'10027262', 483.5500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.317' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (22, 22, 22, N'10027602', 724.2600, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.317' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (23, 23, 23, N'10028579', 1008.9900, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.320' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (24, 24, 24, N'1002864', 1059.4300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.320' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (25, 25, 25, N'10032223', 719.6500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.320' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (26, 26, 26, N'10032274', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.320' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (27, 27, 27, N'1003267', 843.5900, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.320' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (28, 28, 28, N'10036466', 1186.8500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.320' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (29, 29, 29, N'10036474', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.320' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (30, 30, 30, N'10036679', 226.7900, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.320' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (31, 31, 31, N'10037489', 117.5200, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.320' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (32, 32, 32, N'10039015', 542.0800, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.323' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (33, 33, 33, N'10039384', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.323' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (34, 34, 34, N'10040919', 612.1000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.323' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (35, 35, 35, N'10041745', 191.7000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.323' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (36, 36, 36, N'10044361', 807.6000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.323' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (37, 37, 37, N'10045473', 806.4500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.323' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (38, 38, 38, N'10045856', 310.0300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.323' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (39, 39, 39, N'100460892', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.327' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (40, 40, 40, N'10048022', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.327' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (41, 41, 41, N'10048812', 648.3500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.327' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (42, 42, 42, N'1005022', 260.8500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.327' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (43, 43, 43, N'10050523', 532.6300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.327' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (44, 44, 44, N'10052623', 302.8500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.327' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (45, 45, 45, N'10052712', 633.4300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.327' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (46, 46, 46, N'10053581', 281.7700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.327' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (47, 47, 47, N'10053794', 268.4600, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.330' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (48, 48, 48, N'10054855', 1803.2800, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.330' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (49, 49, 49, N'10056262', 789.7400, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.330' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (50, 50, 50, N'10057269', 359.6000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.330' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (51, 1, 1, N'10000577', 234.9900, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.607' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (52, 2, 2, N'10001085', 267.6100, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.610' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (53, 3, 3, N'1000373', 520.6700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.610' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (54, 4, 4, N'10007792', 328.7000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.610' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (55, 5, 5, N'10011773', 641.7000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.613' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (56, 6, 6, N'10012044', 157.6000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.613' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (57, 7, 7, N'100137', 936.4100, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.613' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (58, 8, 8, N'10014357', 440.8700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.617' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (59, 9, 9, N'10015256', 170.6800, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.617' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (60, 10, 10, N'10016473', 663.7700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (61, 11, 11, N'10017712', 1471.2700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (62, 12, 12, N'10019324', 269.8200, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (63, 13, 13, N'10019766', 485.7800, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (64, 14, 14, N'10020241', 715.8300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (65, 15, 15, N'10020918', 81.3500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.623' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (66, 16, 16, N'10021663', 627.1300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.623' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (67, 17, 17, N'10021698', 426.4300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.623' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (68, 18, 18, N'10022821', 557.3000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.627' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (69, 19, 19, N'10022996', 299.2000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.627' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (70, 20, 20, N'10024492', 767.2500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.627' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (71, 21, 21, N'10027262', 483.5500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.630' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (72, 22, 22, N'10027602', 724.2600, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.630' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (73, 23, 23, N'10028579', 1008.9900, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.630' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (74, 24, 24, N'1002864', 1059.4300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.633' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (75, 25, 25, N'10032223', 719.6500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.633' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (76, 27, 27, N'1003267', 843.5900, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.633' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (77, 28, 28, N'10036466', 1186.8500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.637' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (78, 30, 30, N'10036679', 226.7900, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.637' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (79, 31, 31, N'10037489', 117.5200, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.637' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (80, 32, 32, N'10039015', 542.0800, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.640' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (81, 34, 34, N'10040919', 612.1000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.640' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (82, 35, 35, N'10041745', 191.7000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.640' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (83, 36, 36, N'10044361', 807.6000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.640' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (84, 37, 37, N'10045473', 806.4500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.643' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (85, 38, 38, N'10045856', 310.0300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.643' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (86, 41, 41, N'10048812', 648.3500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.643' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (87, 42, 42, N'1005022', 260.8500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.643' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (88, 43, 43, N'10050523', 532.6300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.647' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (89, 44, 44, N'10052623', 302.8500, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.647' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (90, 45, 45, N'10052712', 633.4300, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.650' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (91, 46, 46, N'10053581', 281.7700, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.650' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (92, 47, 47, N'10053794', 268.4600, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.650' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (93, 48, 48, N'10054855', 1803.2800, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.650' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (94, 49, 49, N'10056262', 789.7400, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.653' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (95, 50, 50, N'10057269', 359.6000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.653' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (96, 51, 20, N'123123123', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:13:28.670' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (97, 20, 20, N'10024492', -1000.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:14:01.583' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (98, 20, 20, N'10024492', -1000.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:15:18.510' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (99, 20, 20, N'10024492', 200.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:15:48.130' AS DateTime))
GO
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (100, 20, 20, N'10024492', 1200.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:16:26.927' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (101, 20, 20, N'10024492', 2001200.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:16:55.277' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (102, 52, 20, N'5300022020', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:17:19.480' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (103, 52, 20, N'5300022020', 0.0000, 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:17:24.967' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (104, 39, 39, N'100460892', 0.0000, 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:17:58.050' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (105, 9, 9, N'10015256', 170.6800, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:18:37.840' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (106, 9, 9, N'10015256', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:18:55.257' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (107, 41, 41, N'10048812', 12.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:19:30.937' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (108, 41, 41, N'10048812', 24.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:19:45.657' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (109, 41, 41, N'10048812', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:19:54.893' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (110, 41, 41, N'10048812', 0.0000, 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:20:03.917' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (111, 5, 5, N'10011773', -641.7000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:20:44.397' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (112, 5, 5, N'10011773', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:20:59.610' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (113, 5, 5, N'10011773', 0.0000, 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:21:10.057' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (114, 51, 20, N'123123123', 122.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:22:32.507' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (115, 51, 20, N'123123123', 122.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:22:48.953' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (116, 22, 22, N'10027602', 1448.5200, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:23:55.900' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (117, 22, 22, N'10027602', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:24:11.987' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (118, 22, 22, N'10027602', 0.0000, 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:24:29.467' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (119, 53, 15, N'1238709173', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:24:49.583' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (120, 15, 15, N'10020918', 0.0000, 1, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:25:13.240' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (121, 15, 15, N'10020918', 0.0000, 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:25:20.387' AS DateTime))
INSERT [dbo].[Audit_Accounts] ([accountauditid], [code], [person_code], [account_number], [outstanding_balance], [is_active], [UpdatedBy], [UpdatedOn]) VALUES (122, 53, 15, N'1238709173', 0.0000, 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:25:24.267' AS DateTime))
SET IDENTITY_INSERT [dbo].[Audit_Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Audit_Persons] ON 

INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (1, 1, N'REJOCE', N'MAJOLA', N'63XX2907910XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.020' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (2, 2, N'', N'MOKOMELE', N'70XX2403660XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.020' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (3, 3, N'NTOMBIKHONA', N'MLAMBO', N'42XX1002420XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.020' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (4, 4, N'KLAAS', N'OCKHUIS', N'39XX1400850XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.020' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (5, 5, N'FERDI', N'LUUS', N'59XX0110380XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.020' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (6, 6, N'SHAUN', N'LOVELOT', N'67XX1807700XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.020' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (7, 7, N'', N'MOSOOANE', N'74XX2301550XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.023' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (8, 8, N'', N'MOTENO', N'59XX1901940XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.023' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (9, 9, N'', N'ZWANE', N'66XX0354900XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.023' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (10, 10, N'JOSEPH', N'MOSWEU', N'72XX1806150XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.023' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (11, 11, N'', N'ZULU', N'78XX0650010XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.023' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (12, 12, N'', N'SKINI', N'72XX2205500XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.023' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (13, 13, N'', N'MASOPA', N'60XX0707320XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.023' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (14, 14, N'', N'COETZEE', N'56XX2351400XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.023' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (15, 15, N'', N'BEN', N'65XX1003960XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.023' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (16, 16, N'SOPHIE', N'SIHLANGU', N'68XX1612540XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.027' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (17, 17, N'BUYISELWA', N'KEPATA', N'71XX2451300XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.027' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (18, 18, N'ZANELE', N'NDLOVU', N'72XX2702550XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.027' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (19, 19, N'', N'BARNABAS', N'62XX2207640XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.027' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (20, 20, N'', N'ABRAHAMS', N'75XX2302470XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.027' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (21, 21, N'', N'GOVENDER', N'73XX1104570XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.027' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (22, 22, N'', N'ABDUL', N'65XX0106100XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (23, 23, N'', N'MBIXANE', N'47XX2706770XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (24, 24, N'MAVIS', N'MBOMBO', N'59XX1002010XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (25, 25, N'', N'RAMALEPE', N'44XX0801450XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (26, 26, N'', N'MRSHALOI', N'70XX3105540XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (27, 27, N'', N'DE MEYER', N'69XX2604250XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (28, 28, N'MICHAELINE', N'SITUMA', N'73XX0311610XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (29, 29, N'', N'NDWANE', N'66XX2705830XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (30, 30, N'', N'WEAVER', N'76XX2904740XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (31, 31, N'REBECCA', N'JOOSTE', N'70XX2251240XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (32, 32, N'', N'MOKETSI', N'67XX2750210XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.030' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (33, 33, N'BUSISIWE', N'MTHANTI', N'77XX0952460XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.033' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (34, 34, N'MICHEAL', N'TRUTER', N'67XX1256390XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.033' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (35, 35, N'GLORY', N'SITHOLE', N'70XX0355620XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.033' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (36, 36, N'ANNA', N'KOBE', N'57XX1907550XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.033' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (37, 37, N'', N'PARTAB', N'69XX2459930XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.033' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (38, 38, N'STORY', N'MAIPATO', N'70XX1507650XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.033' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (39, 39, N'', N'SOTYATO', N'69XX2005003XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.033' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (40, 40, N'FRANS', N'TOSKEY', N'73XX1306320XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.037' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (41, 41, N'LILLIAN', N'DANIELS', N'58XX3100790XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.037' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (42, 42, N'THEMBILE', N'MLUMBI', N'72XX0401610XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.037' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (43, 43, N'BERENICE', N'MEINTJIES', N'67XX1105810XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.037' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (44, 44, N'', N'NOMAVUKA', N'73XX1807580XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.037' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (45, 45, N'NONHLANHLA', N'NGWENYA', N'68XX1211490XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.037' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (46, 46, N'ELIZABETH', N'MOSES', N'77XX2304150XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.037' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (47, 47, N'', N'JACOBS', N'76XX2902020XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.037' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (48, 48, N'', N'GERTENBACH', N'58XX1802150XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.037' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (49, 49, N'', N'MAMORARE', N'78XX1701830XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.040' AS DateTime))
INSERT [dbo].[Audit_Persons] ([personsauditid], [code], [name], [surname], [id_number], [is_deleted], [UpdatedBy], [UpdatedOn]) VALUES (50, 50, N'', N'KHUMALO', N'45XX2605080XX', 0, N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[Audit_Persons] OFF
GO
SET IDENTITY_INSERT [dbo].[Audit_Transactions] ON 

INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (1, 1, CAST(N'2022-07-13T23:12:26.557' AS DateTime), CAST(N'2022-07-13T23:12:26.557' AS DateTime), 234.9900, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.560' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (2, 2, CAST(N'2022-07-13T23:12:26.610' AS DateTime), CAST(N'2022-07-13T23:12:26.610' AS DateTime), 267.6100, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.610' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (3, 3, CAST(N'2022-07-13T23:12:26.610' AS DateTime), CAST(N'2022-07-13T23:12:26.610' AS DateTime), 520.6700, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.610' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (4, 4, CAST(N'2022-07-13T23:12:26.610' AS DateTime), CAST(N'2022-07-13T23:12:26.610' AS DateTime), 328.7000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.610' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (5, 5, CAST(N'2022-07-13T23:12:26.613' AS DateTime), CAST(N'2022-07-13T23:12:26.613' AS DateTime), 641.7000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.613' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (6, 6, CAST(N'2022-07-13T23:12:26.613' AS DateTime), CAST(N'2022-07-13T23:12:26.613' AS DateTime), 157.6000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.613' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (7, 7, CAST(N'2022-07-13T23:12:26.613' AS DateTime), CAST(N'2022-07-13T23:12:26.613' AS DateTime), 936.4100, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.613' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (8, 8, CAST(N'2022-07-13T23:12:26.617' AS DateTime), CAST(N'2022-07-13T23:12:26.617' AS DateTime), 440.8700, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.617' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (9, 9, CAST(N'2022-07-13T23:12:26.617' AS DateTime), CAST(N'2022-07-13T23:12:26.617' AS DateTime), 170.6800, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.617' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (10, 10, CAST(N'2022-07-13T23:12:26.617' AS DateTime), CAST(N'2022-07-13T23:12:26.617' AS DateTime), 663.7700, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (11, 11, CAST(N'2022-07-13T23:12:26.620' AS DateTime), CAST(N'2022-07-13T23:12:26.620' AS DateTime), 1471.2700, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (12, 12, CAST(N'2022-07-13T23:12:26.620' AS DateTime), CAST(N'2022-07-13T23:12:26.620' AS DateTime), 269.8200, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (13, 13, CAST(N'2022-07-13T23:12:26.620' AS DateTime), CAST(N'2022-07-13T23:12:26.620' AS DateTime), 485.7800, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (14, 14, CAST(N'2022-07-13T23:12:26.620' AS DateTime), CAST(N'2022-07-13T23:12:26.620' AS DateTime), 715.8300, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.620' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (15, 15, CAST(N'2022-07-13T23:12:26.623' AS DateTime), CAST(N'2022-07-13T23:12:26.623' AS DateTime), 81.3500, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.623' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (16, 16, CAST(N'2022-07-13T23:12:26.623' AS DateTime), CAST(N'2022-07-13T23:12:26.623' AS DateTime), 627.1300, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.623' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (17, 17, CAST(N'2022-07-13T23:12:26.623' AS DateTime), CAST(N'2022-07-13T23:12:26.623' AS DateTime), 426.4300, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.623' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (18, 18, CAST(N'2022-07-13T23:12:26.627' AS DateTime), CAST(N'2022-07-13T23:12:26.627' AS DateTime), 557.3000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.627' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (19, 19, CAST(N'2022-07-13T23:12:26.627' AS DateTime), CAST(N'2022-07-13T23:12:26.627' AS DateTime), 299.2000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.627' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (20, 20, CAST(N'2022-07-13T23:12:26.627' AS DateTime), CAST(N'2022-07-13T23:12:26.627' AS DateTime), 767.2500, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.627' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (21, 21, CAST(N'2022-07-13T23:12:26.630' AS DateTime), CAST(N'2022-07-13T23:12:26.630' AS DateTime), 483.5500, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.630' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (22, 22, CAST(N'2022-07-13T23:12:26.630' AS DateTime), CAST(N'2022-07-13T23:12:26.630' AS DateTime), 724.2600, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.630' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (23, 23, CAST(N'2022-07-13T23:12:26.630' AS DateTime), CAST(N'2022-07-13T23:12:26.630' AS DateTime), 1008.9900, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.630' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (24, 24, CAST(N'2022-07-13T23:12:26.630' AS DateTime), CAST(N'2022-07-13T23:12:26.630' AS DateTime), 1059.4300, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.630' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (25, 25, CAST(N'2022-07-13T23:12:26.633' AS DateTime), CAST(N'2022-07-13T23:12:26.633' AS DateTime), 719.6500, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.633' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (26, 27, CAST(N'2022-07-13T23:12:26.633' AS DateTime), CAST(N'2022-07-13T23:12:26.633' AS DateTime), 843.5900, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.633' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (27, 28, CAST(N'2022-07-13T23:12:26.633' AS DateTime), CAST(N'2022-07-13T23:12:26.633' AS DateTime), 1186.8500, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.633' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (28, 30, CAST(N'2022-07-13T23:12:26.637' AS DateTime), CAST(N'2022-07-13T23:12:26.637' AS DateTime), 226.7900, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.637' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (29, 31, CAST(N'2022-07-13T23:12:26.637' AS DateTime), CAST(N'2022-07-13T23:12:26.637' AS DateTime), 117.5200, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.637' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (30, 32, CAST(N'2022-07-13T23:12:26.637' AS DateTime), CAST(N'2022-07-13T23:12:26.637' AS DateTime), 542.0800, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.637' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (31, 34, CAST(N'2022-07-13T23:12:26.640' AS DateTime), CAST(N'2022-07-13T23:12:26.640' AS DateTime), 612.1000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.640' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (32, 35, CAST(N'2022-07-13T23:12:26.640' AS DateTime), CAST(N'2022-07-13T23:12:26.640' AS DateTime), 191.7000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.640' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (33, 36, CAST(N'2022-07-13T23:12:26.640' AS DateTime), CAST(N'2022-07-13T23:12:26.640' AS DateTime), 807.6000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.640' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (34, 37, CAST(N'2022-07-13T23:12:26.640' AS DateTime), CAST(N'2022-07-13T23:12:26.640' AS DateTime), 806.4500, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.640' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (35, 38, CAST(N'2022-07-13T23:12:26.643' AS DateTime), CAST(N'2022-07-13T23:12:26.643' AS DateTime), 310.0300, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.643' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (36, 41, CAST(N'2022-07-13T23:12:26.643' AS DateTime), CAST(N'2022-07-13T23:12:26.643' AS DateTime), 648.3500, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.643' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (37, 42, CAST(N'2022-07-13T23:12:26.643' AS DateTime), CAST(N'2022-07-13T23:12:26.643' AS DateTime), 260.8500, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.643' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (38, 43, CAST(N'2022-07-13T23:12:26.647' AS DateTime), CAST(N'2022-07-13T23:12:26.647' AS DateTime), 532.6300, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.647' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (39, 44, CAST(N'2022-07-13T23:12:26.647' AS DateTime), CAST(N'2022-07-13T23:12:26.647' AS DateTime), 302.8500, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.647' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (40, 45, CAST(N'2022-07-13T23:12:26.650' AS DateTime), CAST(N'2022-07-13T23:12:26.650' AS DateTime), 633.4300, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.650' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (41, 46, CAST(N'2022-07-13T23:12:26.650' AS DateTime), CAST(N'2022-07-13T23:12:26.650' AS DateTime), 281.7700, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.650' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (42, 47, CAST(N'2022-07-13T23:12:26.650' AS DateTime), CAST(N'2022-07-13T23:12:26.650' AS DateTime), 268.4600, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.650' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (43, 48, CAST(N'2022-07-13T23:12:26.650' AS DateTime), CAST(N'2022-07-13T23:12:26.650' AS DateTime), 1803.2800, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.650' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (44, 49, CAST(N'2022-07-13T23:12:26.653' AS DateTime), CAST(N'2022-07-13T23:12:26.653' AS DateTime), 789.7400, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.653' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (45, 50, CAST(N'2022-07-13T23:12:26.653' AS DateTime), CAST(N'2022-07-13T23:12:26.653' AS DateTime), 359.6000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:12:26.653' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (46, 20, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:14:01.553' AS DateTime), -1000.0000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:14:01.570' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (47, 20, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:15:18.470' AS DateTime), -1000.0000, N'Debit Order', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:15:18.500' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (48, 20, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:15:48.120' AS DateTime), 1200.0000, N'Addition of another.', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:15:48.130' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (49, 20, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:16:26.900' AS DateTime), 2200.0000, N'Addition of another.', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:16:26.913' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (50, 20, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:16:55.267' AS DateTime), 2000000.0000, N'Credit', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:16:55.277' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (51, 9, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:18:37.813' AS DateTime), 170.6800, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:18:37.830' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (52, 9, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:18:55.253' AS DateTime), -170.6800, N'Debit', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:18:55.257' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (53, 41, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:19:30.910' AS DateTime), 12.0000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:19:30.923' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (54, 41, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:19:45.650' AS DateTime), 12.0000, N'Debit Order', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:19:45.657' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (55, 41, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:19:54.883' AS DateTime), -12.0000, N'Debit Order', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:19:54.893' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (56, 5, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:20:44.370' AS DateTime), -641.7000, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:20:44.387' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (57, 5, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:20:59.590' AS DateTime), 641.7000, N'Test', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:20:59.610' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (58, 51, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:22:32.490' AS DateTime), 122.0000, N'MAGTAPE', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:22:32.497' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (59, 51, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:22:48.927' AS DateTime), 122.0000, N'MAGTAPE', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:22:48.943' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (60, 22, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:23:55.873' AS DateTime), 724.2600, N'Test', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:23:55.887' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (61, 22, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:24:11.973' AS DateTime), -724.2600, N'Charge Off Amount', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:24:11.987' AS DateTime))
INSERT [dbo].[Audit_Transactions] ([transactionauditid], [account_code], [transaction_date], [capture_date], [amount], [description], [UpdatedBy], [UpdatedOn]) VALUES (62, 15, CAST(N'2022-07-11T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:25:13.213' AS DateTime), -81.3500, N'Momentum', N'ASHLY\Ashly Raju', CAST(N'2022-07-13T23:25:13.220' AS DateTime))
SET IDENTITY_INSERT [dbo].[Audit_Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (1, N'REJOCE', N'MAJOLA', N'63XX2907910XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (2, N'', N'MOKOMELE', N'70XX2403660XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (3, N'NTOMBIKHONA', N'MLAMBO', N'42XX1002420XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (4, N'KLAAS', N'OCKHUIS', N'39XX1400850XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (5, N'FERDI', N'LUUS', N'59XX0110380XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (6, N'SHAUN', N'LOVELOT', N'67XX1807700XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (7, N'', N'MOSOOANE', N'74XX2301550XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (8, N'', N'MOTENO', N'59XX1901940XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (9, N'', N'ZWANE', N'66XX0354900XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (10, N'JOSEPH', N'MOSWEU', N'72XX1806150XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (11, N'', N'ZULU', N'78XX0650010XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (12, N'', N'SKINI', N'72XX2205500XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (13, N'', N'MASOPA', N'60XX0707320XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (14, N'', N'COETZEE', N'56XX2351400XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (15, N'', N'BEN', N'65XX1003960XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (16, N'SOPHIE', N'SIHLANGU', N'68XX1612540XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (17, N'BUYISELWA', N'KEPATA', N'71XX2451300XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (18, N'ZANELE', N'NDLOVU', N'72XX2702550XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (19, N'', N'BARNABAS', N'62XX2207640XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (20, N'', N'ABRAHAMS', N'75XX2302470XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (21, N'', N'GOVENDER', N'73XX1104570XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (22, N'', N'ABDUL', N'65XX0106100XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (23, N'', N'MBIXANE', N'47XX2706770XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (24, N'MAVIS', N'MBOMBO', N'59XX1002010XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (25, N'', N'RAMALEPE', N'44XX0801450XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (26, N'', N'MRSHALOI', N'70XX3105540XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (27, N'', N'DE MEYER', N'69XX2604250XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (28, N'MICHAELINE', N'SITUMA', N'73XX0311610XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (29, N'', N'NDWANE', N'66XX2705830XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (30, N'', N'WEAVER', N'76XX2904740XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (31, N'REBECCA', N'JOOSTE', N'70XX2251240XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (32, N'', N'MOKETSI', N'67XX2750210XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (33, N'BUSISIWE', N'MTHANTI', N'77XX0952460XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (34, N'MICHEAL', N'TRUTER', N'67XX1256390XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (35, N'GLORY', N'SITHOLE', N'70XX0355620XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (36, N'ANNA', N'KOBE', N'57XX1907550XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (37, N'', N'PARTAB', N'69XX2459930XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (38, N'STORY', N'MAIPATO', N'70XX1507650XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (39, N'', N'SOTYATO', N'69XX2005003XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (40, N'FRANS', N'TOSKEY', N'73XX1306320XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (41, N'LILLIAN', N'DANIELS', N'58XX3100790XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (42, N'THEMBILE', N'MLUMBI', N'72XX0401610XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (43, N'BERENICE', N'MEINTJIES', N'67XX1105810XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (44, N'', N'NOMAVUKA', N'73XX1807580XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (45, N'NONHLANHLA', N'NGWENYA', N'68XX1211490XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (46, N'ELIZABETH', N'MOSES', N'77XX2304150XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (47, N'', N'JACOBS', N'76XX2902020XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (48, N'', N'GERTENBACH', N'58XX1802150XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (49, N'', N'MAMORARE', N'78XX1701830XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (50, N'', N'KHUMALO', N'45XX2605080XX', 0)
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (1, 1, CAST(N'2022-07-13T23:12:26.557' AS DateTime), CAST(N'2022-07-13T23:12:26.557' AS DateTime), 234.9900, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (2, 2, CAST(N'2022-07-13T23:12:26.610' AS DateTime), CAST(N'2022-07-13T23:12:26.610' AS DateTime), 267.6100, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (3, 3, CAST(N'2022-07-13T23:12:26.610' AS DateTime), CAST(N'2022-07-13T23:12:26.610' AS DateTime), 520.6700, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (4, 4, CAST(N'2022-07-13T23:12:26.610' AS DateTime), CAST(N'2022-07-13T23:12:26.610' AS DateTime), 328.7000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (5, 5, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:20:44.370' AS DateTime), -641.7000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (6, 6, CAST(N'2022-07-13T23:12:26.613' AS DateTime), CAST(N'2022-07-13T23:12:26.613' AS DateTime), 157.6000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (7, 7, CAST(N'2022-07-13T23:12:26.613' AS DateTime), CAST(N'2022-07-13T23:12:26.613' AS DateTime), 936.4100, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (8, 8, CAST(N'2022-07-13T23:12:26.617' AS DateTime), CAST(N'2022-07-13T23:12:26.617' AS DateTime), 440.8700, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (9, 9, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:18:37.813' AS DateTime), 170.6800, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (10, 10, CAST(N'2022-07-13T23:12:26.617' AS DateTime), CAST(N'2022-07-13T23:12:26.617' AS DateTime), 663.7700, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (11, 11, CAST(N'2022-07-13T23:12:26.620' AS DateTime), CAST(N'2022-07-13T23:12:26.620' AS DateTime), 1471.2700, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (12, 12, CAST(N'2022-07-13T23:12:26.620' AS DateTime), CAST(N'2022-07-13T23:12:26.620' AS DateTime), 269.8200, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (13, 13, CAST(N'2022-07-13T23:12:26.620' AS DateTime), CAST(N'2022-07-13T23:12:26.620' AS DateTime), 485.7800, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (14, 14, CAST(N'2022-07-13T23:12:26.620' AS DateTime), CAST(N'2022-07-13T23:12:26.620' AS DateTime), 715.8300, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (15, 15, CAST(N'2022-07-13T23:12:26.623' AS DateTime), CAST(N'2022-07-13T23:12:26.623' AS DateTime), 81.3500, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (16, 16, CAST(N'2022-07-13T23:12:26.623' AS DateTime), CAST(N'2022-07-13T23:12:26.623' AS DateTime), 627.1300, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (17, 17, CAST(N'2022-07-13T23:12:26.623' AS DateTime), CAST(N'2022-07-13T23:12:26.623' AS DateTime), 426.4300, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (18, 18, CAST(N'2022-07-13T23:12:26.627' AS DateTime), CAST(N'2022-07-13T23:12:26.627' AS DateTime), 557.3000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (19, 19, CAST(N'2022-07-13T23:12:26.627' AS DateTime), CAST(N'2022-07-13T23:12:26.627' AS DateTime), 299.2000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (20, 20, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:15:18.470' AS DateTime), -1000.0000, N'Debit Order')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (21, 21, CAST(N'2022-07-13T23:12:26.630' AS DateTime), CAST(N'2022-07-13T23:12:26.630' AS DateTime), 483.5500, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (22, 22, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:24:11.973' AS DateTime), -724.2600, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (23, 23, CAST(N'2022-07-13T23:12:26.630' AS DateTime), CAST(N'2022-07-13T23:12:26.630' AS DateTime), 1008.9900, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (24, 24, CAST(N'2022-07-13T23:12:26.630' AS DateTime), CAST(N'2022-07-13T23:12:26.630' AS DateTime), 1059.4300, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (25, 25, CAST(N'2022-07-13T23:12:26.633' AS DateTime), CAST(N'2022-07-13T23:12:26.633' AS DateTime), 719.6500, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (26, 27, CAST(N'2022-07-13T23:12:26.633' AS DateTime), CAST(N'2022-07-13T23:12:26.633' AS DateTime), 843.5900, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (27, 28, CAST(N'2022-07-13T23:12:26.633' AS DateTime), CAST(N'2022-07-13T23:12:26.633' AS DateTime), 1186.8500, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (28, 30, CAST(N'2022-07-13T23:12:26.637' AS DateTime), CAST(N'2022-07-13T23:12:26.637' AS DateTime), 226.7900, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (29, 31, CAST(N'2022-07-13T23:12:26.637' AS DateTime), CAST(N'2022-07-13T23:12:26.637' AS DateTime), 117.5200, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (30, 32, CAST(N'2022-07-13T23:12:26.637' AS DateTime), CAST(N'2022-07-13T23:12:26.637' AS DateTime), 542.0800, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (31, 34, CAST(N'2022-07-13T23:12:26.640' AS DateTime), CAST(N'2022-07-13T23:12:26.640' AS DateTime), 612.1000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (32, 35, CAST(N'2022-07-13T23:12:26.640' AS DateTime), CAST(N'2022-07-13T23:12:26.640' AS DateTime), 191.7000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (33, 36, CAST(N'2022-07-13T23:12:26.640' AS DateTime), CAST(N'2022-07-13T23:12:26.640' AS DateTime), 807.6000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (34, 37, CAST(N'2022-07-13T23:12:26.640' AS DateTime), CAST(N'2022-07-13T23:12:26.640' AS DateTime), 806.4500, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (35, 38, CAST(N'2022-07-13T23:12:26.643' AS DateTime), CAST(N'2022-07-13T23:12:26.643' AS DateTime), 310.0300, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (36, 41, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:19:30.910' AS DateTime), 12.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (37, 42, CAST(N'2022-07-13T23:12:26.643' AS DateTime), CAST(N'2022-07-13T23:12:26.643' AS DateTime), 260.8500, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (38, 43, CAST(N'2022-07-13T23:12:26.647' AS DateTime), CAST(N'2022-07-13T23:12:26.647' AS DateTime), 532.6300, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (39, 44, CAST(N'2022-07-13T23:12:26.647' AS DateTime), CAST(N'2022-07-13T23:12:26.647' AS DateTime), 302.8500, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (40, 45, CAST(N'2022-07-13T23:12:26.650' AS DateTime), CAST(N'2022-07-13T23:12:26.650' AS DateTime), 633.4300, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (41, 46, CAST(N'2022-07-13T23:12:26.650' AS DateTime), CAST(N'2022-07-13T23:12:26.650' AS DateTime), 281.7700, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (42, 47, CAST(N'2022-07-13T23:12:26.650' AS DateTime), CAST(N'2022-07-13T23:12:26.650' AS DateTime), 268.4600, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (43, 48, CAST(N'2022-07-13T23:12:26.650' AS DateTime), CAST(N'2022-07-13T23:12:26.650' AS DateTime), 1803.2800, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (44, 49, CAST(N'2022-07-13T23:12:26.653' AS DateTime), CAST(N'2022-07-13T23:12:26.653' AS DateTime), 789.7400, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (45, 50, CAST(N'2022-07-13T23:12:26.653' AS DateTime), CAST(N'2022-07-13T23:12:26.653' AS DateTime), 359.6000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (46, 20, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:16:26.900' AS DateTime), 2200.0000, N'Addition of another.')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (47, 20, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:16:55.267' AS DateTime), 2000000.0000, N'Credit')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (48, 9, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:18:55.253' AS DateTime), -170.6800, N'Debit')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (49, 41, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:19:54.883' AS DateTime), -12.0000, N'Debit Order')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (50, 5, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:20:59.590' AS DateTime), 641.7000, N'Test')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (51, 51, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:22:48.927' AS DateTime), 122.0000, N'MAGTAPE')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (52, 22, CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:23:55.873' AS DateTime), 724.2600, N'Test')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (53, 15, CAST(N'2022-07-11T00:00:00.000' AS DateTime), CAST(N'2022-07-13T23:25:13.213' AS DateTime), -81.3500, N'Momentum')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Account_num]    Script Date: 2022/07/13 23:49:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Account_num] ON [dbo].[Accounts]
(
	[account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Person_id]    Script Date: 2022/07/13 23:49:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Person_id] ON [dbo].[Persons]
(
	[id_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[Persons] ADD  CONSTRAINT [DF_Persons_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_Person] FOREIGN KEY([person_code])
REFERENCES [dbo].[Persons] ([code])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_Person]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account] FOREIGN KEY([account_code])
REFERENCES [dbo].[Accounts] ([code])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transaction_Account]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAccountByPersonCode]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAccountByPersonCode]
  @person_code int	
AS
BEGIN
	SET NOCOUNT ON;
	SELECT *, Accounts.person_code as Personscode FROM Accounts 
	WHERE person_code = @person_code
END
GO
/****** Object:  Trigger [dbo].[trg_AuditAccountRecord]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_AuditAccountRecord] on [dbo].[Accounts]
AFTER UPDATE, INSERT
AS 
BEGIN

	SET NOCOUNT ON;
	
	INSERT INTO Audit_Accounts
	(code, person_code, account_number, outstanding_balance, is_active, UpdatedBy, UpdatedOn)
	SELECT i.code, i.person_code, i.account_number, i.outstanding_balance, i.is_active, SUSER_SNAME(), GetDate()
	FROM Accounts t
	INNER JOIN INSERTED i on t.code = i.code

END
GO
ALTER TABLE [dbo].[Accounts] ENABLE TRIGGER [trg_AuditAccountRecord]
GO
/****** Object:  Trigger [dbo].[trg_AuditPersonsRecord]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_AuditPersonsRecord] on [dbo].[Persons]
AFTER UPDATE, INSERT
AS 
BEGIN

	SET NOCOUNT ON;
	
	INSERT INTO Audit_Persons
	(code, name, surname, id_number, is_deleted, UpdatedBy, UpdatedOn)
	SELECT i.code, i.name, i.surname, i.id_number, i.is_deleted, SUSER_SNAME(), GetDate()
	FROM Persons p
	INNER JOIN INSERTED i on p.code = i.code

END
GO
ALTER TABLE [dbo].[Persons] ENABLE TRIGGER [trg_AuditPersonsRecord]
GO
/****** Object:  Trigger [dbo].[trg_AuditTransactionsRecord]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[trg_AuditTransactionsRecord] on [dbo].[Transactions]
AFTER UPDATE, INSERT
AS 
BEGIN

	SET NOCOUNT ON;
	
	INSERT INTO Audit_Transactions
	(account_code, transaction_date, capture_date, amount, description, UpdatedBy, UpdatedOn)
	SELECT i.account_code, i.transaction_date, i.capture_date, i.amount, i.description, SUSER_SNAME(), GetDate()
	FROM Transactions t
	INNER JOIN INSERTED i on t.code = i.code

END
GO
ALTER TABLE [dbo].[Transactions] ENABLE TRIGGER [trg_AuditTransactionsRecord]
GO
/****** Object:  Trigger [dbo].[trg_UpdateAccountOnTransactionChange]    Script Date: 2022/07/13 23:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_UpdateAccountOnTransactionChange]
	ON [dbo].[Transactions] 
AFTER INSERT, UPDATE
AS 
BEGIN

	SET NOCOUNT ON;

	UPDATE Accounts  
	SET outstanding_balance = 
	(
		SELECT SUM(t.amount) FROM Transactions t
		INNER JOIN Accounts a on t.account_code = a.code
		WHERE a.code = i.account_code 
	)
	FROM Inserted as i
	WHERE Accounts.code = i.account_code
END
GO
ALTER TABLE [dbo].[Transactions] ENABLE TRIGGER [trg_UpdateAccountOnTransactionChange]
GO
USE [master]
GO
ALTER DATABASE [BankingAdminDB] SET  READ_WRITE 
GO
