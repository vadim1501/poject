USE [master]
GO
/****** Object:  Database [sponsors]    Script Date: 17.10.2020 13:58:47 ******/
CREATE DATABASE [sponsors]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sponsors', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\sponsors.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sponsors_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\sponsors_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [sponsors] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sponsors].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sponsors] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sponsors] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sponsors] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sponsors] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sponsors] SET ARITHABORT OFF 
GO
ALTER DATABASE [sponsors] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sponsors] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sponsors] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sponsors] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sponsors] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sponsors] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sponsors] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sponsors] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sponsors] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sponsors] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sponsors] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sponsors] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sponsors] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sponsors] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sponsors] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sponsors] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sponsors] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sponsors] SET RECOVERY FULL 
GO
ALTER DATABASE [sponsors] SET  MULTI_USER 
GO
ALTER DATABASE [sponsors] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sponsors] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sponsors] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sponsors] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sponsors] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'sponsors', N'ON'
GO
ALTER DATABASE [sponsors] SET QUERY_STORE = OFF
GO
USE [sponsors]
GO
/****** Object:  Table [dbo].[Задания]    Script Date: 17.10.2020 13:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Задания](
	[id_задания] [int] IDENTITY(1,1) NOT NULL,
	[проблема] [varchar](100) NULL,
	[резаультат] [varchar](50) NULL,
	[выполнено] [bit] NULL,
	[сотрудник] [int] NULL,
	[контактное_лицо] [int] NULL,
 CONSTRAINT [PK_Задания] PRIMARY KEY CLUSTERED 
(
	[id_задания] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Контактные_лица]    Script Date: 17.10.2020 13:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Контактные_лица](
	[id_контактного_лица] [int] IDENTITY(1,1) NOT NULL,
	[фамилия] [varchar](50) NULL,
	[имя] [varchar](50) NULL,
	[отчество] [varchar](50) NULL,
	[должность] [varchar](50) NULL,
 CONSTRAINT [PK_Контактные_лица] PRIMARY KEY CLUSTERED 
(
	[id_контактного_лица] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Мероприятия]    Script Date: 17.10.2020 13:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Мероприятия](
	[id_мероприятия] [int] IDENTITY(1,1) NOT NULL,
	[название] [varchar](50) NULL,
	[дата] [date] NULL,
	[время] [time](7) NULL,
	[место] [varchar](50) NULL,
	[исполнитель] [varchar](50) NULL,
	[дата_планирования] [date] NULL,
	[выполнено] [bit] NULL,
	[сотрудник] [int] NULL,
	[задание] [int] NULL,
 CONSTRAINT [PK_Мероприятия] PRIMARY KEY CLUSTERED 
(
	[id_мероприятия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 17.10.2020 13:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[id_сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[фамилия] [nchar](10) NULL,
	[имя] [nchar](10) NULL,
	[отчество] [nchar](10) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[id_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Спонсоры]    Script Date: 17.10.2020 13:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Спонсоры](
	[id_спонсора] [int] IDENTITY(1,1) NOT NULL,
	[название] [varchar](50) NULL,
	[тип] [varchar](50) NULL,
	[адрес] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[телефон] [varchar](50) NULL,
	[контактное_лицо] [int] NULL,
 CONSTRAINT [PK_Спонсоры] PRIMARY KEY CLUSTERED 
(
	[id_спонсора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Задания]  WITH CHECK ADD  CONSTRAINT [FK_Задания_Контактные_лица] FOREIGN KEY([контактное_лицо])
REFERENCES [dbo].[Контактные_лица] ([id_контактного_лица])
GO
ALTER TABLE [dbo].[Задания] CHECK CONSTRAINT [FK_Задания_Контактные_лица]
GO
ALTER TABLE [dbo].[Задания]  WITH CHECK ADD  CONSTRAINT [FK_Задания_Сотрудники] FOREIGN KEY([сотрудник])
REFERENCES [dbo].[Сотрудники] ([id_сотрудника])
GO
ALTER TABLE [dbo].[Задания] CHECK CONSTRAINT [FK_Задания_Сотрудники]
GO
ALTER TABLE [dbo].[Мероприятия]  WITH CHECK ADD  CONSTRAINT [FK_Мероприятия_Задания] FOREIGN KEY([задание])
REFERENCES [dbo].[Задания] ([id_задания])
GO
ALTER TABLE [dbo].[Мероприятия] CHECK CONSTRAINT [FK_Мероприятия_Задания]
GO
ALTER TABLE [dbo].[Мероприятия]  WITH CHECK ADD  CONSTRAINT [FK_Мероприятия_Сотрудники] FOREIGN KEY([сотрудник])
REFERENCES [dbo].[Сотрудники] ([id_сотрудника])
GO
ALTER TABLE [dbo].[Мероприятия] CHECK CONSTRAINT [FK_Мероприятия_Сотрудники]
GO
ALTER TABLE [dbo].[Спонсоры]  WITH CHECK ADD  CONSTRAINT [FK_Спонсоры_Контактные_лица] FOREIGN KEY([контактное_лицо])
REFERENCES [dbo].[Контактные_лица] ([id_контактного_лица])
GO
ALTER TABLE [dbo].[Спонсоры] CHECK CONSTRAINT [FK_Спонсоры_Контактные_лица]
GO
USE [master]
GO
ALTER DATABASE [sponsors] SET  READ_WRITE 
GO
