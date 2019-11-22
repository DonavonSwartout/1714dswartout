USE [master]
GO
/****** Object:  Database [VGSpeedrunManager]    Script Date: 11/22/2019 5:10:58 AM ******/
CREATE DATABASE [VGSpeedrunManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VGSpeedrunManagerModel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VGSpeedrunManagerModel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VGSpeedrunManagerModel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VGSpeedrunManagerModel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VGSpeedrunManager] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VGSpeedrunManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VGSpeedrunManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [VGSpeedrunManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VGSpeedrunManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VGSpeedrunManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VGSpeedrunManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VGSpeedrunManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VGSpeedrunManager] SET  MULTI_USER 
GO
ALTER DATABASE [VGSpeedrunManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VGSpeedrunManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VGSpeedrunManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VGSpeedrunManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VGSpeedrunManager] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VGSpeedrunManager', N'ON'
GO
ALTER DATABASE [VGSpeedrunManager] SET QUERY_STORE = OFF
GO
USE [VGSpeedrunManager]
GO
/****** Object:  Table [dbo].[Donations]    Script Date: 11/22/2019 5:10:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[DateDonated] [nvarchar](max) NOT NULL,
	[Donator_Id] [int] NOT NULL,
 CONSTRAINT [PK_Donations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 11/22/2019 5:10:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameName] [nvarchar](max) NOT NULL,
	[Judge_Id] [int] NOT NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 11/22/2019 5:10:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Runs]    Script Date: 11/22/2019 5:10:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Runs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateSubmitted] [datetime] NOT NULL,
	[TimeElapsed] [time](7) NOT NULL,
	[Player_Id] [int] NOT NULL,
	[Game_Id] [int] NOT NULL,
 CONSTRAINT [PK_Runs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Donations] ON 
GO
INSERT [dbo].[Donations] ([Id], [Amount], [DateDonated], [Donator_Id]) VALUES (6, CAST(200 AS Decimal(18, 0)), N'7/21/2019', 5)
GO
INSERT [dbo].[Donations] ([Id], [Amount], [DateDonated], [Donator_Id]) VALUES (7, CAST(90 AS Decimal(18, 0)), N'8/19/2019', 3)
GO
SET IDENTITY_INSERT [dbo].[Donations] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 
GO
INSERT [dbo].[Games] ([Id], [GameName], [Judge_Id]) VALUES (1, N'Paper Mario and the Thousand Year Door', 6)
GO
INSERT [dbo].[Games] ([Id], [GameName], [Judge_Id]) VALUES (2, N'Pokemon Crystal', 7)
GO
INSERT [dbo].[Games] ([Id], [GameName], [Judge_Id]) VALUES (3, N'The Elder Scrolls V Skyrim', 7)
GO
INSERT [dbo].[Games] ([Id], [GameName], [Judge_Id]) VALUES (4, N'Scribblenauts Unlimited', 8)
GO
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (1, N'Joe', N'Smodely', N'000-0000', N'joesmodely@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (2, N'John', N'Smith', N'000-0001', N'johnsmith@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (3, N'Ashley', N'Johns', N'000-0002', N'ashleyjohns@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (4, N'Morgan', N'Den', N'000-0003', N'morganden@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (5, N'Yorick', N'Pierce', N'000-0004', N'yorickpierce@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (6, N'Landa', N'Mann', N'000-0005', N'landamann@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (7, N'Peter', N'Mann', N'000-0006', N'petermann@email.com')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Phone], [Email]) VALUES (8, N'Jason', N'Moore', N'000-0007', N'jasonmoore@email.com')
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[Runs] ON 
GO
INSERT [dbo].[Runs] ([Id], [DateSubmitted], [TimeElapsed], [Player_Id], [Game_Id]) VALUES (1, CAST(N'2019-09-17T00:00:00.000' AS DateTime), CAST(N'01:42:38' AS Time), 1, 1)
GO
INSERT [dbo].[Runs] ([Id], [DateSubmitted], [TimeElapsed], [Player_Id], [Game_Id]) VALUES (2, CAST(N'2019-09-17T00:00:00.000' AS DateTime), CAST(N'01:13:20' AS Time), 2, 1)
GO
INSERT [dbo].[Runs] ([Id], [DateSubmitted], [TimeElapsed], [Player_Id], [Game_Id]) VALUES (3, CAST(N'2019-09-21T00:00:00.000' AS DateTime), CAST(N'01:00:09' AS Time), 3, 1)
GO
INSERT [dbo].[Runs] ([Id], [DateSubmitted], [TimeElapsed], [Player_Id], [Game_Id]) VALUES (4, CAST(N'2019-09-04T00:00:00.000' AS DateTime), CAST(N'02:09:34' AS Time), 2, 2)
GO
INSERT [dbo].[Runs] ([Id], [DateSubmitted], [TimeElapsed], [Player_Id], [Game_Id]) VALUES (5, CAST(N'2019-09-07T00:00:00.000' AS DateTime), CAST(N'02:34:54' AS Time), 3, 2)
GO
INSERT [dbo].[Runs] ([Id], [DateSubmitted], [TimeElapsed], [Player_Id], [Game_Id]) VALUES (6, CAST(N'2019-09-05T00:00:00.000' AS DateTime), CAST(N'01:00:05' AS Time), 4, 3)
GO
INSERT [dbo].[Runs] ([Id], [DateSubmitted], [TimeElapsed], [Player_Id], [Game_Id]) VALUES (7, CAST(N'2019-09-21T00:00:00.000' AS DateTime), CAST(N'00:43:20' AS Time), 4, 4)
GO
SET IDENTITY_INSERT [dbo].[Runs] OFF
GO
/****** Object:  Index [IX_FK_PersonDonation]    Script Date: 11/22/2019 5:10:59 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonDonation] ON [dbo].[Donations]
(
	[Donator_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonGame]    Script Date: 11/22/2019 5:10:59 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonGame] ON [dbo].[Games]
(
	[Judge_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_GameRun]    Script Date: 11/22/2019 5:10:59 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_GameRun] ON [dbo].[Runs]
(
	[Game_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonRun]    Script Date: 11/22/2019 5:10:59 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonRun] ON [dbo].[Runs]
(
	[Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Donations]  WITH CHECK ADD  CONSTRAINT [FK_PersonDonation] FOREIGN KEY([Donator_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Donations] CHECK CONSTRAINT [FK_PersonDonation]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_PersonGame] FOREIGN KEY([Judge_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_PersonGame]
GO
ALTER TABLE [dbo].[Runs]  WITH CHECK ADD  CONSTRAINT [FK_GameRun] FOREIGN KEY([Game_Id])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Runs] CHECK CONSTRAINT [FK_GameRun]
GO
ALTER TABLE [dbo].[Runs]  WITH CHECK ADD  CONSTRAINT [FK_PersonRun] FOREIGN KEY([Player_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Runs] CHECK CONSTRAINT [FK_PersonRun]
GO
USE [master]
GO
ALTER DATABASE [VGSpeedrunManager] SET  READ_WRITE 
GO
