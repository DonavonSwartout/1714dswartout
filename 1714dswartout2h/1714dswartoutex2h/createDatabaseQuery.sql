
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/22/2019 04:23:13
-- Generated from EDMX file: C:\Users\Donavon Swartout\Documents\1714dswartout\1714dswartout\1714dswartoutex2h\VGSpeedrunManagerModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
--USE [VGSpeedrunManagerModel];
--GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PersonRun]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Runs] DROP CONSTRAINT [FK_PersonRun];
GO
IF OBJECT_ID(N'[dbo].[FK_GameRun]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Runs] DROP CONSTRAINT [FK_GameRun];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonGame]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Games] DROP CONSTRAINT [FK_PersonGame];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonDonation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Donations] DROP CONSTRAINT [FK_PersonDonation];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Games]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Games];
GO
IF OBJECT_ID(N'[dbo].[Runs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Runs];
GO
IF OBJECT_ID(N'[dbo].[Donations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Donations];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Games'
CREATE TABLE [dbo].[Games] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GameName] nvarchar(max)  NOT NULL,
    [Judge_Id] int  NOT NULL
);
GO

-- Creating table 'Runs'
CREATE TABLE [dbo].[Runs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateSubmitted] datetime  NOT NULL,
    [TimeElapsed] time  NOT NULL,
    [Player_Id] int  NOT NULL,
    [Game_Id] int  NOT NULL
);
GO

-- Creating table 'Donations'
CREATE TABLE [dbo].[Donations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [DateDonated] nvarchar(max)  NOT NULL,
    [Donator_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [PK_Games]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Runs'
ALTER TABLE [dbo].[Runs]
ADD CONSTRAINT [PK_Runs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Donations'
ALTER TABLE [dbo].[Donations]
ADD CONSTRAINT [PK_Donations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Player_Id] in table 'Runs'
ALTER TABLE [dbo].[Runs]
ADD CONSTRAINT [FK_PersonRun]
    FOREIGN KEY ([Player_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonRun'
CREATE INDEX [IX_FK_PersonRun]
ON [dbo].[Runs]
    ([Player_Id]);
GO

-- Creating foreign key on [Game_Id] in table 'Runs'
ALTER TABLE [dbo].[Runs]
ADD CONSTRAINT [FK_GameRun]
    FOREIGN KEY ([Game_Id])
    REFERENCES [dbo].[Games]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GameRun'
CREATE INDEX [IX_FK_GameRun]
ON [dbo].[Runs]
    ([Game_Id]);
GO

-- Creating foreign key on [Judge_Id] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [FK_PersonGame]
    FOREIGN KEY ([Judge_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonGame'
CREATE INDEX [IX_FK_PersonGame]
ON [dbo].[Games]
    ([Judge_Id]);
GO

-- Creating foreign key on [Donator_Id] in table 'Donations'
ALTER TABLE [dbo].[Donations]
ADD CONSTRAINT [FK_PersonDonation]
    FOREIGN KEY ([Donator_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonDonation'
CREATE INDEX [IX_FK_PersonDonation]
ON [dbo].[Donations]
    ([Donator_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------