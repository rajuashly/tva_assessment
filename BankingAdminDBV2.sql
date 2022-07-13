USE [master]
GO
/****** Object:  Database [BankingAdminAppDB]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Table [dbo].[Accounts]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Table [dbo].[Audit_Accounts]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Table [dbo].[Audit_Persons]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Table [dbo].[Audit_Transactions]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Table [dbo].[Persons]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Table [dbo].[Transactions]    Script Date: 2022/07/13 14:51:37 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Account_num]    Script Date: 2022/07/13 14:51:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Account_num] ON [dbo].[Accounts]
(
	[account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Person_id]    Script Date: 2022/07/13 14:51:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Person_id] ON [dbo].[Persons]
(
	[id_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[Audit_Persons] ADD  CONSTRAINT [DF_Audit_Persons_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
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
/****** Object:  StoredProcedure [dbo].[sp_GetAccountByPersonCode]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Trigger [dbo].[trg_AuditAccountRecord]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Trigger [dbo].[trg_AuditPersonsRecord]    Script Date: 2022/07/13 14:51:37 ******/
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
/****** Object:  Trigger [dbo].[trg_AuditTransactionsRecord]    Script Date: 2022/07/13 14:51:37 ******/
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
USE [master]
GO
ALTER DATABASE [BankingAdminAppDB] SET  READ_WRITE 
GO
