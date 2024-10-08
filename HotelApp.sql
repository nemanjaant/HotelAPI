USE [master]
GO
/****** Object:  Database [HotelApp]    Script Date: 8.9.2024. 23:46:23 ******/
CREATE DATABASE [HotelApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HotelApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HotelApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HotelApp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelApp] SET  MULTI_USER 
GO
ALTER DATABASE [HotelApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelApp] SET QUERY_STORE = OFF
GO
USE [HotelApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8.9.2024. 23:46:23 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[Size] [nvarchar](max) NOT NULL,
	[RoomTypeId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogEntries]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Actor] [nvarchar](max) NULL,
	[ActorId] [int] NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[UseCaseData] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_LogEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NULL,
	[PriceValue] [float] NOT NULL,
	[RoomTypeId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Prices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CheckIn] [datetime2](7) NOT NULL,
	[CheckOut] [datetime2](7) NOT NULL,
	[GuestId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[DeletedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservedRooms]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservedRooms](
	[ReservationId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_ReservedRooms] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC,
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUseCase]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUseCase](
	[RoleId] [int] NULL,
	[UseCaseId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[TypeOfRoomId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](max) NULL,
	[MaxCapacity] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_RoomTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](70) NOT NULL,
	[LastName] [nvarchar](70) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[Username] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 8.9.2024. 23:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[DeletedBy] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230825165235_Initial_migration', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230825180119_fixed_db_migration', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230825180356_fixed_db_migration2', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230825180902_fixed_db_migration3', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230825182240_fixed_db_migration4', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230825183305_fixed_db_migration5', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230825184306_room type fix', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230829211645_newtablesmigration', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230829215747_updatedrolesandusecases', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230829225037_updatedb3008', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230829230355_overridensavechanges', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230830005414_logentrytable', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230901210729_lastmigration', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[LogEntries] ON 

INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1, N'unauthorized', 0, N'Search Users', N'{"Keyword":"n"}', CAST(N'2023-08-30T01:21:02.9087617' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (2, N'unauthorized', 0, N'Search Users', N'{"Keyword":"Paja"}', CAST(N'2023-08-30T01:22:18.9109955' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (3, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T02:53:07.6335619' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (4, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:07:50.3711105' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (5, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:09:07.4548167' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (6, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:13:53.3982116' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (7, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:16:01.7978073' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (8, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:18:31.8076056' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (9, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:27:03.6249424' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (10, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:29:03.8782609' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (11, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:31:40.2848368' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (12, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:33:00.1634657' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (13, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:40:12.8507448' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (14, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:42:38.5094992' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (15, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tringdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:44:23.9692744' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (16, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tr$ingdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:45:01.2449546' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (17, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"string","Email":"string@ict.com","Password":"st3Tr$ingdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:45:10.2154618' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (18, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"sdsdasdas","Email":"string@ict.com","Password":"st3Tr$ingdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:45:20.5219204' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (19, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"sdsdasdas","Email":"nmnjauuuu@ict.com","Password":"st3Tr$ingdsg","RoleId":null,"Id":0}', CAST(N'2023-08-30T03:45:29.4337262' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (20, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"fsfsfsf","Email":"nemanjaant@ict.com","Password":"Nemanja123!","RoleId":null,"Id":0}', CAST(N'2023-08-31T02:44:38.3589786' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (21, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"String","Username":"fsfsfsf","Email":"nemanjaant@ict.com","Password":"Nemanja123!","RoleId":null,"Id":0}', CAST(N'2023-08-31T02:44:43.6928487' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (22, N'unauthorized', 0, N'Search Users', N'{"Keyword":"hgiu7"}', CAST(N'2023-08-31T03:59:52.9733159' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (23, N'fsfsfsf', 7, N'Search Users', N'{"Keyword":"Nemanja"}', CAST(N'2023-08-31T04:39:01.7126926' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (24, N'fsfsfsf', 7, N'Search Users', N'{"Keyword":"Nemanja"}', CAST(N'2023-08-31T04:42:00.1096060' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (25, N'fsfsfsf', 7, N'Search Users', N'{"Keyword":"Nemanja"}', CAST(N'2023-08-31T04:55:18.1495174' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (26, N'fsfsfsf', 7, N'Search Users', N'{"Keyword":"Nemanja"}', CAST(N'2023-08-31T04:56:03.7038871' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (27, N'unauthorized', 0, N'User registration', N'{"FirstName":"Jovan","LastName":"Jovanovic","Username":"jovan123","Email":"jovan123@gmail.com","Password":"NekaLozinka11","RoleId":1,"Id":0}', CAST(N'2023-08-31T05:01:26.4403300' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (28, N'unauthorized', 0, N'User registration', N'{"FirstName":"Jovan","LastName":"Jovanovic","Username":"jovan123","Email":"jovan123@gmail.com","Password":"NekaLozinka1!1","RoleId":1,"Id":0}', CAST(N'2023-08-31T05:01:37.0970717' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (29, N'jovan123', 8, N'Search Users', N'{"Keyword":"Nemanja"}', CAST(N'2023-08-31T05:02:57.9065888' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (30, N'unauthorized', 0, N'Search Users', N'{"Keyword":"Nemanja"}', CAST(N'2023-09-01T19:04:16.6035076' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (31, N'unauthorized', 0, N'Search Users', N'{"Keyword":"Nemanja"}', CAST(N'2023-09-01T19:05:59.1191064' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (32, N'unauthorized', 0, N'User registration', N'{"FirstName":"Jovan","LastName":"Jovanovic","Username":"jovan1234","Email":"jovan1234@gmail.com","Password":"NekaLozinka1!1","RoleId":2}', CAST(N'2023-09-01T19:58:04.2232905' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (33, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","MinPrice":10.0,"MaxPrice":800.0}', CAST(N'2023-09-02T13:34:42.3302446' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (34, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","MinPrice":10.0,"MaxPrice":800.0}', CAST(N'2023-09-02T13:35:16.3251497' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (35, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T13:37:27.4726578' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (36, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T13:40:11.7833889' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (37, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T13:41:43.2229093' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (38, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":10.0,"MaxPrice":600.0}', CAST(N'2023-09-02T13:41:55.5332919' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (39, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-10T00:00:00","DateTo":"2023-09-02T00:00:00","MinPrice":10.0,"MaxPrice":600.0}', CAST(N'2023-09-02T13:44:02.2220107' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (40, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-10T00:00:00","DateTo":"2023-09-02T00:00:00","MinPrice":1000.0,"MaxPrice":600.0}', CAST(N'2023-09-02T13:44:37.5782168' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (41, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T13:46:01.7231262' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (42, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","MinPrice":10.0,"MaxPrice":10.0}', CAST(N'2023-09-02T13:47:33.6399855' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (43, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":10.0,"MaxPrice":100.0}', CAST(N'2023-09-02T13:49:20.1330944' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (44, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","MinPrice":10.0,"MaxPrice":100.0}', CAST(N'2023-09-02T13:51:33.9605917' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (45, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T14:00:56.0969160' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (46, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T14:01:22.0137884' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (47, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-10T00:00:00","DateTo":"2023-09-02T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T14:01:33.0978290' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (48, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T14:06:50.1771746' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (49, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T14:25:06.2741636' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (50, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T14:25:24.0497481' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (51, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T15:13:02.0659207' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (52, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T15:25:54.2292402' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (53, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T15:38:43.2387860' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (54, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T15:42:22.3421560' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (55, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T15:44:07.3164452' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (56, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T15:45:45.9675245' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (57, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":"2023-09-10T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T15:45:53.6609104' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (58, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":"2023-09-10T00:00:00","MinPrice":10.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T15:46:15.7112596' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (59, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":"2023-09-10T00:00:00","MinPrice":10.0,"MaxPrice":700.0}', CAST(N'2023-09-02T15:46:23.6584596' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (60, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T15:48:49.4474412' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (61, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T15:52:01.8363511' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (62, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T16:12:09.3626191' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (63, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T16:16:23.6256453' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (64, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T17:46:32.3328129' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (65, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T18:15:52.8232173' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (66, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":960.0,"MaxPrice":null}', CAST(N'2023-09-02T18:16:18.5927940' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (67, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":960.0,"MaxPrice":970.0}', CAST(N'2023-09-02T18:16:35.3891847' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (68, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":6.0,"MaxPrice":10.0}', CAST(N'2023-09-02T18:17:21.6100957' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (69, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T18:22:31.4267159' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (70, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T18:32:27.6728426' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (71, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T18:59:52.7047242' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (72, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T19:00:12.0077613' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (73, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":0.0,"MaxPrice":0.0}', CAST(N'2023-09-02T19:03:26.4592328' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (74, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":900.0}', CAST(N'2023-09-02T19:04:38.9683663' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (75, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T19:09:29.9234715' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (76, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":900.0}', CAST(N'2023-09-02T19:09:56.8927667' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (77, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T19:20:54.6904619' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (78, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":900.0}', CAST(N'2023-09-02T19:21:04.1073165' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (79, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":900.0}', CAST(N'2023-09-02T19:21:08.9587279' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (80, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T19:22:52.6788756' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (81, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":900.0}', CAST(N'2023-09-02T19:24:01.9568585' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (82, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T19:26:12.9221784' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (83, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":900.0}', CAST(N'2023-09-02T19:26:23.4012855' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (84, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T19:27:16.7523670' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (85, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":500.0,"MaxPrice":900.0}', CAST(N'2023-09-02T19:32:33.7461013' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (86, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":900.0}', CAST(N'2023-09-02T19:37:17.4167526' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (87, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":900.0}', CAST(N'2023-09-02T19:37:34.6480050' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (88, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T19:44:54.0922140' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (89, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":100.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T19:47:52.6186313' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (90, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":1000.0,"MaxPrice":5000.0}', CAST(N'2023-09-02T19:49:37.4823639' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (91, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T20:25:03.1089812' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (92, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T20:25:24.2334258' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (93, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T20:25:40.0785469' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (94, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T20:26:31.7291468' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (95, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T20:27:35.7769273' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (96, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":null,"MaxPrice":null}', CAST(N'2023-09-02T20:31:09.5799129' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (97, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":null,"MinPrice":950.0,"MaxPrice":5000.0}', CAST(N'2023-09-02T20:33:28.4224707' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (98, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":950.0,"MaxPrice":5000.0}', CAST(N'2023-09-02T20:50:29.3188782' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (99, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-10T00:00:00","MinPrice":950.0,"MaxPrice":100000.0}', CAST(N'2023-09-02T20:51:22.6273091' AS DateTime2), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (100, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":100000.0}', CAST(N'2023-09-02T20:53:52.2267647' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (101, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T20:55:41.4802192' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (102, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T20:57:42.6108077' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (103, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T21:00:43.6198426' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (104, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T21:04:02.5749938' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (105, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T21:06:15.5837681' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (106, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T21:12:39.2959106' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (107, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T21:13:01.7560691' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (108, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-22T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T21:23:33.3953146' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (109, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-22T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T21:23:48.3006265' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (110, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T21:28:41.7993803' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (111, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":10000.0}', CAST(N'2023-09-02T21:31:41.4678123' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (112, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":100000.0}', CAST(N'2023-09-02T21:36:31.7841132' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (113, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T21:37:48.9551218' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (114, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T21:38:50.4260221' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (115, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T21:39:20.5797792' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (116, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T21:44:15.3252646' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (117, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T21:47:03.0964820' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (118, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T21:53:20.9105115' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (119, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T21:54:46.2600906' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (120, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":null,"MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T22:13:47.4531839' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (121, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":null,"DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T22:13:57.2609931' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (122, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T22:14:39.0257037' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (123, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T22:14:51.9228823' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (124, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T22:15:08.7405420' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (125, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T22:16:18.3447748' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (126, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T22:18:25.5146583' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (127, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T22:22:37.4707269' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (128, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":950.0,"MaxPrice":1000.0}', CAST(N'2023-09-02T22:23:30.2315527' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (129, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":60.0,"MaxPrice":1000.0}', CAST(N'2023-09-03T09:13:28.4854697' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (130, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":60.0,"MaxPrice":1000.0}', CAST(N'2023-09-03T09:14:24.4053543' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (131, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":60.0,"MaxPrice":1000.0}', CAST(N'2023-09-03T09:16:00.9425271' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (132, N'unauthorized', 0, N'Search Room Query', N'{"RoomName":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-12T00:00:00","MinPrice":60.0,"MaxPrice":1000.0}', CAST(N'2023-09-03T09:22:49.6452017' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1002, N'unauthorized', 0, N'User registration', N'{"FirstName":"Neee","LastName":"Maaa","Username":"stringsd33","Email":"string@mail.com","Password":"stringJJ5!","RoleId":null,"Id":0}', CAST(N'2024-09-08T12:15:47.4599750' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1003, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"Sttring","Username":"string34","Email":"string@mail.com","Password":"strinG1#fgs","RoleId":null,"Id":0}', CAST(N'2024-09-08T12:26:13.4414793' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1004, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"Sttring","Username":"string34","Email":"string@mail.com","Password":"strinG1#fgs!","RoleId":null,"Id":0}', CAST(N'2024-09-08T12:26:27.1124520' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1005, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"Sttring","Username":"string34","Email":"string@mail.com","Password":"Gasfd6#fgs!","RoleId":null,"Id":0}', CAST(N'2024-09-08T12:26:42.7529330' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1006, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"Sttring","Username":"string34","Email":"string@mail.com","Password":"Gasfd6#fgs!@","RoleId":null,"Id":0}', CAST(N'2024-09-08T12:26:55.1226595' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1007, N'unauthorized', 0, N'User registration', N'{"FirstName":"String","LastName":"Sttring","Username":"string34","Email":"string@mail.com","Password":"NekaLozinka123!!!!","RoleId":null,"Id":0}', CAST(N'2024-09-08T12:27:05.6932798' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1008, N'unauthorized', 0, N'User registration', N'{"FirstName":"Nemanja","LastName":"Antanasijevic","Username":"stringewrewr","Email":"string@mail.com","Password":"stringG23@","RoleId":null,"Id":0}', CAST(N'2024-09-08T12:30:05.7042566' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1009, N'unauthorized', 0, N'User registration', N'{"FirstName":"Nemanja","LastName":"Antanasijevic","Username":"stringewrewr","Email":"stringiucccc@mail.com","Password":"stringG23@","RoleId":null,"Id":0}', CAST(N'2024-09-08T12:30:17.4734901' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1010, N'unauthorized', 0, N'User registration', N'{"FirstName":"Sttt","LastName":"SFffff","Username":"strin42334gfsg","Email":"string@gmailii.com","Password":"stringGG77&","RoleId":1,"Id":0}', CAST(N'2024-09-08T12:33:25.2579363' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1011, N'unauthorized', 0, N'User registration', N'{"FirstName":"Sttt","LastName":"Sffff","Username":"strin42334g","Email":"string@gmailii.com","Password":"stringGG77&","RoleId":1,"Id":0}', CAST(N'2024-09-08T12:33:41.2501158' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1012, N'unauthorized', 0, N'User registration', N'{"FirstName":"Nemanja","LastName":"Antanasijevic","Username":"nemanja123","Email":"string@mail.com","Password":"string123!","RoleId":1,"Id":0}', CAST(N'2024-09-08T13:15:23.5883670' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1013, N'unauthorized', 0, N'User registration', N'{"FirstName":"Nemanja","LastName":"Antanasijevic","Username":"nemanja123","Email":"string333@mail.com","Password":"String123!","RoleId":1,"Id":0}', CAST(N'2024-09-08T13:15:53.6107871' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1014, N'nemanja123', 1007, N'Search Users', N'{"Keyword":"Nemanja"}', CAST(N'2024-09-08T13:17:58.9609458' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1015, N'nemanja123', 1007, N'Search Rooms Query', N'{"Keyword":"standard","DateFrom":"2024-05-29T00:00:00","DateTo":"2024-05-30T00:00:00"}', CAST(N'2024-09-08T14:12:02.1054955' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1016, N'nemanja123', 1007, N'Search Rooms Query', N'{"Keyword":"single","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-06T00:00:00"}', CAST(N'2024-09-08T14:19:25.8356480' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1017, N'nemanja123', 1007, N'Search Rooms Query', N'{"Keyword":"economy","DateFrom":"2023-09-02T00:00:00","DateTo":"2023-09-06T00:00:00"}', CAST(N'2024-09-08T14:22:20.9381343' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1018, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":2,"DateFrom":"2024-08-28T00:00:00","DateTo":"2024-08-30T00:00:00"}', CAST(N'2024-09-08T16:01:26.6716628' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1019, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":2,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:01:39.4034161' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1020, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:03:10.5827799' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1021, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:03:14.8457863' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1022, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:03:17.0006715' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1023, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:03:18.0130430' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1024, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:03:19.1258605' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1025, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:03:20.1759318' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1026, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:03:21.3304564' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1027, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:08:00.1338312' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1028, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T16:11:43.3228291' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1029, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-09-28T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T18:19:33.1098834' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1030, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":6,"numberOfPeople":4,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:20:05.8168045' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1031, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":7,"numberOfPeople":4,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:20:24.1703007' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1032, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":7,"numberOfPeople":4,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:20:25.8926704' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1033, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":7,"numberOfPeople":4,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:20:27.1411259' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1034, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":7,"numberOfPeople":4,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:20:28.2909385' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1035, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":7,"numberOfPeople":1,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:20:35.6927495' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1036, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":7,"numberOfPeople":0,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:20:40.4348014' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1037, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":666,"numberOfPeople":0,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:21:21.4560754' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1038, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":666,"numberOfPeople":3,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:21:29.8283246' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1039, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":666,"numberOfPeople":3,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:22:00.2620445' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1040, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":666,"numberOfPeople":3,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:26:13.5958356' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1041, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":666,"numberOfPeople":3,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:27:44.1379086' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1042, N'nemanja123', 1007, N'Make a reservation', N'{"roomTypeId":1,"numberOfPeople":3,"DateFrom":"2024-10-28T00:00:00","DateTo":"2024-10-30T00:00:00"}', CAST(N'2024-09-08T18:27:54.9761301' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1043, N'nemanja123', 1007, N'Cancel reservation', N'1', CAST(N'2024-09-08T18:33:21.7672075' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1044, N'unauthorized', 0, N'Search Audit Log Query', N'{"Keyword":"Search","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00"}', CAST(N'2024-09-08T21:28:20.7862545' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1045, N'unauthorized', 0, N'Search Audit Log Query', N'{"Keyword":"Search","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00"}', CAST(N'2024-09-08T21:30:32.2626141' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1046, N'unauthorized', 0, N'Search Audit Log Query', N'{"Keyword":"Search","DateFrom":"2023-08-30T00:00:00","DateTo":"2024-08-30T00:00:00"}', CAST(N'2024-09-08T21:31:12.1866327' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1047, N'unauthorized', 0, N'Search Audit Log Query', N'{"Keyword":null,"DateFrom":"2023-08-30T00:00:00","DateTo":"2024-08-30T00:00:00"}', CAST(N'2024-09-08T21:31:17.6608341' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1048, N'unauthorized', 0, N'Search Audit Log Query', N'{"Keyword":null,"DateFrom":"2024-01-30T00:00:00","DateTo":"2024-08-30T00:00:00"}', CAST(N'2024-09-08T21:31:32.0308785' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1049, N'unauthorized', 0, N'Search Audit Log Query', N'{"Keyword":null,"DateFrom":"2023-08-30T00:00:00","DateTo":"2024-08-30T00:00:00"}', CAST(N'2024-09-08T21:31:41.6708080' AS DateTime2), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1050, N'unauthorized', 0, N'Search Audit Log Query', N'{"Keyword":null,"DateFrom":"2024-01-30T00:00:00","DateTo":"2024-09-30T00:00:00"}', CAST(N'2024-09-08T21:31:53.7368148' AS DateTime2), NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[LogEntries] OFF
GO
SET IDENTITY_INSERT [dbo].[Prices] ON 

INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), NULL, 600, 1, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (2, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), NULL, 750, 2, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (3, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), NULL, 800, 3, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (4, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), NULL, 900, 4, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (5, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), NULL, 950, 5, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (6, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), NULL, 1000, 6, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (7, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), NULL, 700, 7, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (8, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-04T00:00:00.0000000' AS DateTime2), 800, 1, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (9, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-04T00:00:00.0000000' AS DateTime2), 900, 2, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (10, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-04T00:00:00.0000000' AS DateTime2), 950, 3, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (11, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-04T00:00:00.0000000' AS DateTime2), 1000, 4, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (12, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-04T00:00:00.0000000' AS DateTime2), 750, 5, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (13, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-04T00:00:00.0000000' AS DateTime2), 700, 6, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Prices] ([Id], [ValidFrom], [ValidTo], [PriceValue], [RoomTypeId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (14, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-04T00:00:00.0000000' AS DateTime2), 850, 7, CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), CAST(N'2023-09-01T22:39:43.4900000' AS DateTime2), NULL, N'Admin', NULL, 1)
SET IDENTITY_INSERT [dbo].[Prices] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1, CAST(N'2023-09-02T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-05T00:00:00.0000000' AS DateTime2), 7, 0, CAST(N'2023-09-02T23:10:57.2266667' AS DateTime2), CAST(N'2024-09-08T18:33:21.9221821' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (2, CAST(N'2023-09-06T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), 7, 1, CAST(N'2023-09-02T23:10:57.2266667' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (3, CAST(N'2023-09-09T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-15T00:00:00.0000000' AS DateTime2), 7, 1, CAST(N'2023-09-02T23:10:57.2266667' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (4, CAST(N'2023-09-02T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-05T00:00:00.0000000' AS DateTime2), 7, 1, CAST(N'2023-09-02T23:10:57.2266667' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (5, CAST(N'2023-09-06T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), 7, 1, CAST(N'2023-09-02T23:10:57.2266667' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (6, CAST(N'2023-09-09T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-15T00:00:00.0000000' AS DateTime2), 7, 1, CAST(N'2023-09-02T23:10:57.2266667' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1004, CAST(N'2024-09-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T16:01:39.6262261' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1005, CAST(N'2024-09-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T16:03:10.6092972' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1006, CAST(N'2024-09-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T16:03:14.8685989' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1007, CAST(N'2024-09-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T16:03:17.0189584' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1008, CAST(N'2024-09-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T16:03:18.0339853' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1009, CAST(N'2024-09-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T16:03:19.1530997' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1010, CAST(N'2024-09-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T16:03:20.2057597' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1011, CAST(N'2024-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T18:20:05.9329452' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1012, CAST(N'2024-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T18:20:24.2072865' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1013, CAST(N'2024-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T18:20:25.9214913' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1014, CAST(N'2024-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T18:20:27.1638451' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reservations] ([Id], [CheckIn], [CheckOut], [GuestId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy]) VALUES (1015, CAST(N'2024-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-30T00:00:00.0000000' AS DateTime2), 1007, 1, CAST(N'2024-09-08T18:27:55.1059929' AS DateTime2), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1015, 2)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1004, 7)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1011, 7)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1012, 8)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1015, 9)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1005, 14)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1011, 14)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (2, 15)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (3, 15)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1012, 15)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1005, 21)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1012, 22)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1006, 33)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1012, 34)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1006, 40)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1013, 41)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1007, 47)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1013, 48)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1007, 54)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1008, 60)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1013, 61)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1008, 67)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1013, 68)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1009, 74)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1014, 75)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1009, 81)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1014, 82)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1010, 88)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1014, 89)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1010, 95)
INSERT [dbo].[ReservedRooms] ([ReservationId], [RoomId]) VALUES (1014, 96)
GO
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 1)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 3)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 3)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 4)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 4)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 5)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 5)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 6)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 7)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 8)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 9)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 10)
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (2, 1, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (3, 2, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (4, 3, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (5, 4, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (6, 5, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (7, 6, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (8, 7, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (9, 8, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (10, 9, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (11, 10, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (12, 11, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (13, 12, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (14, 13, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (15, 14, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (16, 15, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (17, 16, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (18, 17, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (19, 18, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (20, 19, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (21, 20, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (22, 21, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (23, 22, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (24, 23, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (25, 24, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (26, 25, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (27, 26, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (28, 1, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (29, 2, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (30, 3, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (31, 4, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (32, 5, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (33, 6, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (34, 7, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (35, 8, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (36, 9, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (37, 10, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (38, 11, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (39, 12, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (40, 13, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (41, 14, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (42, 15, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (43, 16, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (44, 17, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (45, 18, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (46, 19, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (47, 20, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (48, 21, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (49, 22, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (50, 23, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (51, 24, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (52, 25, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (53, 26, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (54, 27, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (55, 1, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (56, 2, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (57, 3, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (58, 4, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (59, 5, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (60, 6, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (61, 7, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (62, 8, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (63, 9, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (64, 10, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (65, 11, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (66, 12, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (67, 13, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (68, 14, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (69, 15, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (70, 16, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (71, 17, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (72, 18, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (73, 19, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (74, 20, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (75, 21, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (76, 22, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (77, 23, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (78, 24, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (79, 25, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (80, 26, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (81, 27, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (82, 28, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (83, 29, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (84, 30, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (85, 31, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (86, 32, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (87, 33, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (88, 34, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (89, 35, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (90, 36, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (91, 37, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (92, 38, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (93, 39, 1, 4, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'4', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (94, 40, 1, 5, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'5', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (95, 41, 1, 6, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'6', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (96, 42, 1, 7, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'7', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (97, 43, 1, 1, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'1', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (98, 44, 1, 2, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [IsAvailable], [TypeOfRoomId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (99, 45, 1, 3, CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), CAST(N'2023-09-01T22:31:33.7566667' AS DateTime2), NULL, N'3', NULL, 1)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([Id], [TypeName], [MaxCapacity], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (1, N'Standard Room', 2, CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [MaxCapacity], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (2, N'Deluxe Suite', 5, CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [MaxCapacity], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (3, N'Ocean View Villa', 5, CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [MaxCapacity], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (4, N'Luxury Penthouse', 4, CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [MaxCapacity], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (5, N'Economy Triple', 3, CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [MaxCapacity], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (6, N'Economy Double', 2, CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), NULL, N'2', NULL, 1)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [MaxCapacity], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive]) VALUES (7, N'Economy Single', 1, CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), CAST(N'2023-09-01T22:31:00.6666667' AS DateTime2), NULL, N'2', NULL, 1)
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [RoleId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive], [Username]) VALUES (1, N'Nemanja', N'Antanasijevic', N'nemanja.antanasijevic.42.18@ict.edu.rs', N'lozzzzinka', 1, CAST(N'2023-08-26T16:04:46.4600000' AS DateTime2), NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [RoleId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive], [Username]) VALUES (2, N'Paja', N'Patak', N'paja.patak@gmail.com', N'lozzzzinka', 2, CAST(N'2023-08-26T16:04:46.4600000' AS DateTime2), NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [RoleId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive], [Username]) VALUES (7, N'String', N'String', N'nemanjaant@ict.com', N'$2a$10$AyGbzCV1m0LKUt0UkdLlPeFA9Ov984GMrsdxvhyqLiyukpr4B7gBi', 2, CAST(N'2023-08-31T02:44:39.3897119' AS DateTime2), NULL, NULL, NULL, NULL, 1, N'fsfsfsf')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [RoleId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive], [Username]) VALUES (1004, N'String', N'Sttring', N'string@mail.com', N'$2a$10$vO0DZS5gcfFNz9kr87uPCeMk.nJbFXJmOAValgppMk82XkyuXzLBC', 1, CAST(N'2024-09-08T12:27:05.9039168' AS DateTime2), NULL, NULL, NULL, NULL, 1, N'string34')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [RoleId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive], [Username]) VALUES (1005, N'Nemanja', N'Antanasijevic', N'stringiucccc@mail.com', N'$2a$10$P6DUp1V3Df0ybk6TaPGqpuP9G7cd33QQ0zQymccc0d2Ps.eVIDbJC', 1, CAST(N'2024-09-08T12:30:17.6194927' AS DateTime2), NULL, NULL, NULL, NULL, 1, N'stringewrewr')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [RoleId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive], [Username]) VALUES (1006, N'Sttt', N'Sffff', N'string@gmailii.com', N'$2a$10$QxUIo7mbN7TElyZKkOCKruH5boD9SfsPTQfmM83k7PJeZ26CepSda', 1, CAST(N'2024-09-08T12:33:41.4175414' AS DateTime2), NULL, NULL, NULL, NULL, 1, N'strin42334g')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [RoleId], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive], [Username]) VALUES (1007, N'Nemanja', N'Antanasijevic', N'string333@mail.com', N'$2a$10$C4G0O0QwX/WDw/A.1K3DmuRyQF5.coKProwo1llW5n2NWgngfqVfC', 2, CAST(N'2024-09-08T13:15:53.8954081' AS DateTime2), NULL, NULL, NULL, NULL, 1, N'nemanja123')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([Id], [RoleName], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive], [IsDefault]) VALUES (1, N'user', CAST(N'2023-08-26T16:02:32.0466667' AS DateTime2), NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[UserTypes] ([Id], [RoleName], [CreatedAt], [ModifiedAt], [DeletedAt], [ModifiedBy], [DeletedBy], [IsActive], [IsDefault]) VALUES (2, N'admin', CAST(N'2023-08-26T16:02:32.0466667' AS DateTime2), NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
/****** Object:  Index [IX_Images_RoomTypeId]    Script Date: 8.9.2024. 23:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_Images_RoomTypeId] ON [dbo].[Images]
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prices_RoomTypeId]    Script Date: 8.9.2024. 23:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_Prices_RoomTypeId] ON [dbo].[Prices]
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_GuestId]    Script Date: 8.9.2024. 23:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_GuestId] ON [dbo].[Reservations]
(
	[GuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReservedRooms_RoomId]    Script Date: 8.9.2024. 23:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_ReservedRooms_RoomId] ON [dbo].[ReservedRooms]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_TypeOfRoomId]    Script Date: 8.9.2024. 23:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_TypeOfRoomId] ON [dbo].[Rooms]
(
	[TypeOfRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 8.9.2024. 23:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserTypes_RoleName]    Script Date: 8.9.2024. 23:46:23 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserTypes_RoleName] ON [dbo].[UserTypes]
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (N'') FOR [Path]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (N'') FOR [Size]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Prices] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Prices] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[RoomTypes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[RoomTypes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [RoleId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserTypes] ADD  DEFAULT (N'') FOR [RoleName]
GO
ALTER TABLE [dbo].[UserTypes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[UserTypes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserTypes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDefault]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_RoomTypes_RoomTypeId] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomTypes] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_RoomTypes_RoomTypeId]
GO
ALTER TABLE [dbo].[Prices]  WITH CHECK ADD  CONSTRAINT [FK_Prices_RoomTypes_RoomTypeId] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomTypes] ([Id])
GO
ALTER TABLE [dbo].[Prices] CHECK CONSTRAINT [FK_Prices_RoomTypes_RoomTypeId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Users_GuestId] FOREIGN KEY([GuestId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Users_GuestId]
GO
ALTER TABLE [dbo].[ReservedRooms]  WITH CHECK ADD  CONSTRAINT [FK_ReservedRooms_Reservations_ReservationId] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservedRooms] CHECK CONSTRAINT [FK_ReservedRooms_Reservations_ReservationId]
GO
ALTER TABLE [dbo].[ReservedRooms]  WITH CHECK ADD  CONSTRAINT [FK_ReservedRooms_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservedRooms] CHECK CONSTRAINT [FK_ReservedRooms_Rooms_RoomId]
GO
ALTER TABLE [dbo].[RoleUseCase]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomTypes_TypeOfRoomId] FOREIGN KEY([TypeOfRoomId])
REFERENCES [dbo].[RoomTypes] ([Id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomTypes_TypeOfRoomId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes_RoleId]
GO
USE [master]
GO
ALTER DATABASE [HotelApp] SET  READ_WRITE 
GO
