USE [master]
GO
/****** Object:  Database [BankingAdminAppDB]    Script Date: 2022/07/13 01:40:57 ******/
CREATE DATABASE [BankingAdminAppDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankingAdminAppDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BankingAdminAppDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BankingAdminAppDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BankingAdminAppDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BankingAdminAppDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankingAdminAppDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankingAdminAppDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankingAdminAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankingAdminAppDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BankingAdminAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankingAdminAppDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BankingAdminAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [BankingAdminAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankingAdminAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankingAdminAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankingAdminAppDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BankingAdminAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BankingAdminAppDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BankingAdminAppDB', N'ON'
GO
ALTER DATABASE [BankingAdminAppDB] SET QUERY_STORE = OFF
GO
USE [BankingAdminAppDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022/07/13 01:40:57 ******/
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
/****** Object:  Table [dbo].[Accounts]    Script Date: 2022/07/13 01:40:57 ******/
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
/****** Object:  Table [dbo].[Persons]    Script Date: 2022/07/13 01:40:57 ******/
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
/****** Object:  Table [dbo].[Transactions]    Script Date: 2022/07/13 01:40:57 ******/
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

INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (1, 1, N'10000577', 212223.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (2, 2, N'10001085', 0.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (3, 3, N'1000373', 524.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (4, 4, N'10007792', 524.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (5, 5, N'10011773', 24000.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (6, 6, N'10012044', 524.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (7, 7, N'100137', 0.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (8, 8, N'10014357', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (9, 9, N'10015256', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (10, 10, N'10016473', 0.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (11, 11, N'10017712', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (12, 12, N'10019324', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (13, 13, N'10019766', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (14, 14, N'10020241', 0.0000, 0, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (15, 15, N'10020918', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (16, 16, N'10021663', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (17, 17, N'10021698', 0.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (18, 18, N'10022821', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (19, 19, N'10022996', 24012.2200, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (20, 20, N'10024492', 45.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (21, 21, N'10027262', 0.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (22, 22, N'Ten', 12.2200, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (23, 23, N'10028579', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (24, 24, N'1002864', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (25, 25, N'10032223', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (26, 26, N'10032274', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (27, 27, N'1003267', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (28, 28, N'10036466', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (29, 29, N'10036474', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (30, 30, N'10036679', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (31, 31, N'10037489', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (32, 32, N'10039015', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (33, 33, N'10039384', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (34, 34, N'10040919', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (35, 35, N'asd', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (36, 36, N'10044361', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (37, 37, N'10045473', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (38, 38, N'10045856', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (39, 39, N'100460892', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (40, 40, N'10048022', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (41, 41, N'10048812', 24000.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (42, 42, N'1005022', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (43, 43, N'10050523', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (44, 44, N'10052623', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (45, 45, N'10052712', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (46, 46, N'10053581', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (47, 47, N'10053794', 24000.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (48, 48, N'10054855', 24123.2200, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (49, 49, N'10056262', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (50, 50, N'10057269', 524.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (51, 35, N'Test', 0.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (52, 10, N'1212', 121.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (53, 10, N'12222', 12.0000, 1, NULL)
INSERT [dbo].[Accounts] ([code], [person_code], [account_number], [outstanding_balance], [is_active], [Personscode]) VALUES (54, 22, N'Testas', 0.0000, 1, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
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
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (14, N'', N'COETZEE', N'56XX2351400XX', 1)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (15, N'', N'BEN', N'65XX1003960XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (16, N'SOPHIE', N'SIHLANGU', N'Test', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (17, N'BUYISELWA', N'KEPATA', N'71XX2451300XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (18, N'ZANELE', N'NDLOVU', N'72XX2702550XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (19, N'', N'BARNABAS', N'62XX2207640XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (20, N'', N'ABRAHAMS', N'75XX2302470XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (21, NULL, N'GOVENDER', N'73XX1104570XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (22, N'asdasd', N'ABDUL', N'65XX0106100XX', 0)
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
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (35, NULL, NULL, N'70XX0355620XX', 0)
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
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (47, N'TEST', N'JACOBS', N'76XX2902020XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (48, N'', N'GERTENBACH', N'58XX1802150XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (49, N'', N'MAMORARE', N'78XX1701830XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (50, N'', N'KHUMALO', N'45XX2605080XX', 0)
INSERT [dbo].[Persons] ([code], [name], [surname], [id_number], [is_deleted]) VALUES (51, N'ASD', N'asd', N'asd', 0)
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (1, 1, CAST(N'2022-07-12T11:05:57.230' AS DateTime), CAST(N'2022-07-12T11:05:57.230' AS DateTime), 12222.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (2, 2, CAST(N'2022-07-12T11:05:57.243' AS DateTime), CAST(N'2022-07-12T11:05:57.243' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (3, 3, CAST(N'2022-07-12T11:05:57.247' AS DateTime), CAST(N'2022-07-12T11:05:57.247' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (4, 4, CAST(N'2022-07-12T11:05:57.253' AS DateTime), CAST(N'2022-07-12T11:05:57.253' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (5, 5, CAST(N'2022-07-20T00:00:00.000' AS DateTime), CAST(N'2022-07-12T22:54:36.133' AS DateTime), 24000.0000, N'Test')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (6, 6, CAST(N'2022-07-12T11:05:57.257' AS DateTime), CAST(N'2022-07-12T11:05:57.257' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (7, 7, CAST(N'2022-07-12T11:05:57.257' AS DateTime), CAST(N'2022-07-12T11:05:57.257' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (8, 8, CAST(N'2022-07-12T11:05:57.257' AS DateTime), CAST(N'2022-07-12T11:05:57.257' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (9, 9, CAST(N'2022-07-12T11:05:57.260' AS DateTime), CAST(N'2022-07-12T11:05:57.260' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (10, 10, CAST(N'2022-07-12T11:05:57.260' AS DateTime), CAST(N'2022-07-12T11:05:57.260' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (11, 11, CAST(N'2022-07-12T11:05:57.260' AS DateTime), CAST(N'2022-07-12T11:05:57.260' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (12, 12, CAST(N'2022-07-12T11:05:57.260' AS DateTime), CAST(N'2022-07-12T11:05:57.260' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (13, 13, CAST(N'2022-07-12T11:05:57.260' AS DateTime), CAST(N'2022-07-12T11:05:57.260' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (14, 14, CAST(N'2022-07-12T11:05:57.000' AS DateTime), CAST(N'2022-07-12T19:24:29.457' AS DateTime), 12.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (15, 15, CAST(N'2022-07-12T11:05:57.260' AS DateTime), CAST(N'2022-07-12T11:05:57.260' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (16, 16, CAST(N'2022-07-12T11:05:57.260' AS DateTime), CAST(N'2022-07-12T11:05:57.260' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (17, 17, CAST(N'2022-07-12T11:05:57.260' AS DateTime), CAST(N'2022-07-12T11:05:57.260' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (18, 18, CAST(N'2022-07-12T11:05:57.260' AS DateTime), CAST(N'2022-07-12T11:05:57.260' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (19, 19, CAST(N'2022-07-12T11:05:57.263' AS DateTime), CAST(N'2022-07-12T11:05:57.263' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (20, 20, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-12T23:21:17.853' AS DateTime), 33.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (21, 21, CAST(N'2022-07-12T11:05:57.263' AS DateTime), CAST(N'2022-07-12T11:05:57.263' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (23, 23, CAST(N'2022-07-12T11:05:57.263' AS DateTime), CAST(N'2022-07-12T11:05:57.263' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (24, 24, CAST(N'2022-07-12T11:05:57.263' AS DateTime), CAST(N'2022-07-12T11:05:57.263' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (25, 25, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (26, 27, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (27, 28, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (28, 30, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (29, 31, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (30, 32, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (31, 34, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (32, 35, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (33, 36, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (34, 37, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (35, 38, CAST(N'2022-07-12T11:05:57.267' AS DateTime), CAST(N'2022-07-12T11:05:57.267' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (36, 41, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-13T00:13:41.053' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (37, 42, CAST(N'2022-07-12T11:05:57.270' AS DateTime), CAST(N'2022-07-12T11:05:57.270' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (38, 43, CAST(N'2022-07-12T11:05:57.270' AS DateTime), CAST(N'2022-07-12T11:05:57.270' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (39, 44, CAST(N'2022-07-12T11:05:57.270' AS DateTime), CAST(N'2022-07-12T11:05:57.270' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (40, 45, CAST(N'2022-07-12T11:05:57.270' AS DateTime), CAST(N'2022-07-12T11:05:57.270' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (41, 46, CAST(N'2022-07-12T11:05:57.270' AS DateTime), CAST(N'2022-07-12T11:05:57.270' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (42, 47, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-12T19:37:55.597' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (43, 48, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-12T23:04:41.537' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (44, 49, CAST(N'2022-07-12T11:05:57.270' AS DateTime), CAST(N'2022-07-12T11:05:57.270' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (45, 50, CAST(N'2022-07-12T11:05:57.270' AS DateTime), CAST(N'2022-07-12T11:05:57.270' AS DateTime), 24000.0000, N'Charge Off Amount')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (46, 1, CAST(N'2022-07-12T00:00:00.000' AS DateTime), CAST(N'2022-07-12T00:00:00.000' AS DateTime), 1.0000, N'C')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (48, 1, CAST(N'2022-07-21T00:00:00.000' AS DateTime), CAST(N'2022-07-21T00:00:00.000' AS DateTime), 200000.0000, N'C')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (49, 19, CAST(N'2022-07-21T00:00:00.000' AS DateTime), CAST(N'2022-07-12T18:50:29.387' AS DateTime), 12.2200, N'adad')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (50, 14, CAST(N'2022-07-20T00:00:00.000' AS DateTime), CAST(N'2022-07-12T19:26:08.000' AS DateTime), 12.0000, N'Test')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (51, 48, CAST(N'2022-07-28T00:00:00.000' AS DateTime), CAST(N'2022-07-12T23:05:07.923' AS DateTime), 123.2200, N'Resf')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (52, 20, CAST(N'2022-07-27T00:00:00.000' AS DateTime), CAST(N'2022-07-12T23:24:39.193' AS DateTime), 12.0000, N'Rest')
INSERT [dbo].[Transactions] ([code], [account_code], [transaction_date], [capture_date], [amount], [description]) VALUES (53, 22, CAST(N'2022-07-14T00:00:00.000' AS DateTime), CAST(N'2022-07-13T00:55:45.840' AS DateTime), 12.2200, N'test')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Account_num]    Script Date: 2022/07/13 01:40:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Account_num] ON [dbo].[Accounts]
(
	[account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Person_id]    Script Date: 2022/07/13 01:40:57 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAccountByPersonCode]    Script Date: 2022/07/13 01:40:57 ******/
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
USE [master]
GO
ALTER DATABASE [BankingAdminAppDB] SET  READ_WRITE 
GO
