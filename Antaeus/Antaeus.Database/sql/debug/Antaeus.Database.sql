/*
Deployment script for Antaeus.Database
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Antaeus.Database"
:setvar DefaultDataPath ""

GO
USE [master]

GO
:on error exit
GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL
    AND DATABASEPROPERTYEX(N'$(DatabaseName)','Status') <> N'ONLINE')
BEGIN
    RAISERROR(N'The state of the target database, %s, is not set to ONLINE. To deploy to this database, its state must be set to ONLINE.', 16, 127,N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [Antaeus_0925_Test], FILENAME = '$(DefaultDataPath)$(DatabaseName).mdf', MAXSIZE = UNLIMITED, FILEGROWTH = 1024 KB)
    LOG ON (NAME = [Antaeus_0925_Test_log], FILENAME = '$(DefaultDataPath)$(DatabaseName)_log.LDF', MAXSIZE = 2097152 MB, FILEGROWTH = 10 %) COLLATE SQL_Latin1_General_CP1_CI_AS
GO
EXECUTE sp_dbcmptlevel [$(DatabaseName)], 90;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings for DB_CHAINING or TRUSTWORTHY cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
USE [$(DatabaseName)]

GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO

GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/*
如果数据库登陆失败，显示
Login failed for user 'username'. The user is not associated with a trusted SQL Server connection. (Microsoft SQL Server, Error: 18452)

则需要修改数据库属性，ref:http://support.microsoft.com/kb/555332


USE [master]
GO
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', REG_DWORD, 2
GO
*/

IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'ans')
DROP LOGIN [ans]
GO

CREATE LOGIN [ans] WITH PASSWORD=N'123456', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

GO

GO
PRINT N'Creating dbo.Category...';


GO
CREATE TABLE [dbo].[Category] (
    [CategoryID]       BIGINT          NOT NULL,
    [Name]             NVARCHAR (100)  NOT NULL,
    [ShortName]        NVARCHAR (20)   NOT NULL,
    [QuestionType]     NVARCHAR (50)   NOT NULL,
    [QuestionTypeMeta] NVARCHAR (3000) NULL
);


GO
PRINT N'Creating dbo.Comment...';


GO
CREATE TABLE [dbo].[Comment] (
    [CommentID]   BIGINT          NOT NULL,
    [KID]         VARCHAR (600)   NOT NULL,
    [Content]     NVARCHAR (4000) NOT NULL,
    [Floor]       INT             NOT NULL,
    [ParentCID]   NVARCHAR (400)  NOT NULL,
    [CrUserName]  NVARCHAR (400)  NOT NULL,
    [CreatedTime] DATETIME        NOT NULL
);


GO
PRINT N'Creating dbo.ID...';


GO
CREATE TABLE [dbo].[ID] (
    [Key]   VARCHAR (500) NOT NULL,
    [MaxID] BIGINT        NOT NULL,
    [Cache] INT           NOT NULL
);


GO
PRINT N'Creating dbo.QB...';


GO
CREATE TABLE [dbo].[QB] (
    [QuestionID] BIGINT          NOT NULL,
    [CategoryID] BIGINT          NOT NULL,
    [Source]     NVARCHAR (500)  NOT NULL,
    [CrUserName] NVARCHAR (400)  NOT NULL,
    [CrTime]     DATETIME        NOT NULL,
    [Abstract]   NVARCHAR (4000) NOT NULL
);


GO
PRINT N'Creating dbo.QD...';


GO
CREATE TABLE [dbo].[QD] (
    [QuestionID]   BIGINT          NOT NULL,
    [SourceXml]    NVARCHAR (4000) NOT NULL,
    [QuestionType] NVARCHAR (50)   NOT NULL
);


GO
PRINT N'Creating dbo.Rate...';


GO
CREATE TABLE [dbo].[Rate] (
    [RateID]      BIGINT         NOT NULL,
    [KID]         VARCHAR (600)  NOT NULL,
    [Score]       INT            NOT NULL,
    [CrUserName]  NVARCHAR (400) NOT NULL,
    [CreatedTime] DATETIME       NOT NULL
);


GO
PRINT N'Creating dbo.Role...';


GO
CREATE TABLE [dbo].[Role] (
    [RoleID] BIGINT         NOT NULL,
    [Name]   NVARCHAR (500) NOT NULL
);


GO
PRINT N'Creating dbo.User...';


GO
CREATE TABLE [dbo].[User] (
    [UserName]     NVARCHAR (200) NOT NULL,
    [PasswordHash] NVARCHAR (400) NOT NULL,
    [PasswordSalt] NVARCHAR (100) NOT NULL,
    [DisplayName]  NVARCHAR (500) NOT NULL,
    [CreatedTime]  DATETIME       NOT NULL,
    [IsApproved]   BIT            NOT NULL,
    [Email]        NVARCHAR (500) NOT NULL
);


GO
PRINT N'Creating dbo.UserAnswerQB...';


GO
CREATE TABLE [dbo].[UserAnswerQB] (
    [UserAnswerQBID] BIGINT         NOT NULL,
    [QuestionID]     BIGINT         NOT NULL,
    [Answer]         NVARCHAR (100) NOT NULL,
    [Cost]           INT            NOT NULL,
    [Correct]        BIT            NOT NULL,
    [CrUserName]     NVARCHAR (400) NOT NULL,
    [CrTime]         DATETIME       NOT NULL
);


GO
PRINT N'Creating dbo.UserRole...';


GO
CREATE TABLE [dbo].[UserRole] (
    [UserRoleID] BIGINT         NOT NULL,
    [UserName]   NVARCHAR (200) NOT NULL,
    [RoleID]     BIGINT         NOT NULL
);


GO
PRINT N'Creating dbo.Wiki...';


GO
CREATE TABLE [dbo].[Wiki] (
    [KID]                  VARCHAR (600)  NOT NULL,
    [CurrentWikiContentID] BIGINT         NOT NULL,
    [MaxReversion]         NVARCHAR (100) NOT NULL,
    [CrUserName]           NVARCHAR (400) NOT NULL,
    [CreatedTime]          DATETIME       NOT NULL
);


GO
PRINT N'Creating dbo.WikiContent...';


GO
CREATE TABLE [dbo].[WikiContent] (
    [WikiContentID] BIGINT         NOT NULL,
    [KID]           VARCHAR (600)  NOT NULL,
    [Content]       NVARCHAR (MAX) NOT NULL,
    [Reversion]     NVARCHAR (100) NOT NULL,
    [CrUserName]    NVARCHAR (400) NOT NULL,
    [CreatedTime]   DATETIME       NOT NULL
);


GO
PRINT N'Creating dbo.PK_Category...';


GO
ALTER TABLE [dbo].[Category]
    ADD CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([CategoryID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Comment...';


GO
ALTER TABLE [dbo].[Comment]
    ADD CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED ([CommentID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_ID...';


GO
ALTER TABLE [dbo].[ID]
    ADD CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED ([Key] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_QB...';


GO
ALTER TABLE [dbo].[QB]
    ADD CONSTRAINT [PK_QB] PRIMARY KEY CLUSTERED ([QuestionID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_QD...';


GO
ALTER TABLE [dbo].[QD]
    ADD CONSTRAINT [PK_QD] PRIMARY KEY CLUSTERED ([QuestionID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Rate...';


GO
ALTER TABLE [dbo].[Rate]
    ADD CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED ([RateID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Role...';


GO
ALTER TABLE [dbo].[Role]
    ADD CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([RoleID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_User...';


GO
ALTER TABLE [dbo].[User]
    ADD CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([UserName] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_UserAnswerQB...';


GO
ALTER TABLE [dbo].[UserAnswerQB]
    ADD CONSTRAINT [PK_UserAnswerQB] PRIMARY KEY CLUSTERED ([UserAnswerQBID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_UserRole...';


GO
ALTER TABLE [dbo].[UserRole]
    ADD CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED ([UserRoleID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Wiki...';


GO
ALTER TABLE [dbo].[Wiki]
    ADD CONSTRAINT [PK_Wiki] PRIMARY KEY CLUSTERED ([KID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_WikiContent...';


GO
ALTER TABLE [dbo].[WikiContent]
    ADD CONSTRAINT [PK_WikiContent] PRIMARY KEY CLUSTERED ([WikiContentID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.Category_QB...';


GO
ALTER TABLE [dbo].[QB]
    ADD CONSTRAINT [Category_QB] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Category] ([CategoryID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_Role_UserRole...';


GO
ALTER TABLE [dbo].[UserRole]
    ADD CONSTRAINT [FK_Role_UserRole] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Role] ([RoleID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_User_UserRole...';


GO
ALTER TABLE [dbo].[UserRole]
    ADD CONSTRAINT [FK_User_UserRole] FOREIGN KEY ([UserName]) REFERENCES [dbo].[User] ([UserName]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.KF_WikiContent_Wiki...';


GO
ALTER TABLE [dbo].[WikiContent]
    ADD CONSTRAINT [KF_WikiContent_Wiki] FOREIGN KEY ([KID]) REFERENCES [dbo].[Wiki] ([KID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ans')
DROP USER [ans]
GO
CREATE USER [ans] FOR LOGIN [ans] WITH DEFAULT_SCHEMA=[dbo]
GO
EXEC sp_addrolemember N'db_owner', N'ans'
GO

INSERT INTO [Antaeus_DB].[dbo].[Category]
           ([CategoryID]
           ,[Name]
           ,[ShortName]
           ,[QuestionType]
           ,[QuestionTypeMeta])
     VALUES
           (1
           ,'Sentences Corrected'
           ,'SC'
           ,N'选择题'
           ,N'<meta><i key="meta.ChoiceNumber" val="5" /><i key="meta.IsMultiple" val="0" /></meta>')
  
INSERT INTO [Antaeus_DB].[dbo].[Category]
           ([CategoryID]
           ,[Name]
           ,[ShortName]
           ,[QuestionType]
           ,[QuestionTypeMeta])
     VALUES
           (2
           ,'Reading Comprehension'
           ,'RC'
           ,N'阅读题'
           ,'<meta><i key="meta.QuestionNumber" val="0" /><i key="meta.ChoiceNumber" val="5" /><i key="meta.IsMultiple" val="0" /></meta>')   
           
INSERT INTO [Antaeus_DB].[dbo].[Category]
           ([CategoryID]
           ,[Name]
           ,[ShortName]
           ,[QuestionType]
           ,[QuestionTypeMeta])
     VALUES
           (3
           ,'Critical Reasoning'
           ,'CR'
           ,N'选择题'
           ,'<meta><i key="meta.ChoiceNumber" val="5" /><i key="meta.IsMultiple" val="0" /><i key="meta.QuestionPlace" val="2" /></meta>')       

INSERT INTO [Antaeus_DB].[dbo].[Category]
           ([CategoryID]
           ,[Name]
           ,[ShortName]
           ,[QuestionType]
           ,[QuestionTypeMeta])
     VALUES
           (4
           ,'Problem Solving'
           ,'PS'
           ,N'选择题'
           ,'<meta><i key="meta.ChoiceNumber" val="5" /><i key="meta.IsMultiple" val="0" /><i key="meta.QuestionPlace" val="2" /></meta>')       

INSERT INTO [Antaeus_DB].[dbo].[Category]
           ([CategoryID]
           ,[Name]
           ,[ShortName]
           ,[QuestionType]
           ,[QuestionTypeMeta])
     VALUES
           (5
           ,'PData Sufficient'
           ,'DS'
           ,N'选择题'
           ,'<meta><i key="meta.ChoiceNumber" val="4" /><i key="meta.IsMultiple" val="0" /><i key="meta.QuestionPlace" val="2" /></meta>')       

INSERT INTO [Antaeus_DB].[dbo].[Category]
           ([CategoryID]
           ,[Name]
           ,[ShortName]
           ,[QuestionType]
           ,[QuestionTypeMeta])
     VALUES
           (6
           ,'Writing: Issue'
           ,'Issue'
           ,N'作文题'
           ,'<meta><i key="meta.QuestionPlace" val="2" /></meta>')       

INSERT INTO [Antaeus_DB].[dbo].[Category]
           ([CategoryID]
           ,[Name]
           ,[ShortName]
           ,[QuestionType]
           ,[QuestionTypeMeta])
     VALUES
           (7
           ,'Writing: Argument'
           ,'Argu'
           ,N'作文题'
           ,'<meta><i key="meta.QuestionPlace" val="1" /></meta>')       
           
INSERT INTO [Antaeus_DB].[dbo].[ID]
           ([Key]
           ,[MaxID]
           ,[Cache])
     VALUES
           ('Category'
           ,20
           ,20)

GO

GO

GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        DECLARE @VarDecimalSupported AS BIT;
        SELECT @VarDecimalSupported = 0;
        IF ((ServerProperty(N'EngineEdition') = 3)
            AND (((@@microsoftversion / power(2, 24) = 9)
                  AND (@@microsoftversion & 0xffff >= 3024))
                 OR ((@@microsoftversion / power(2, 24) = 10)
                     AND (@@microsoftversion & 0xffff >= 1600))))
            SELECT @VarDecimalSupported = 1;
        IF (@VarDecimalSupported > 0)
            BEGIN
                EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
            END
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET MULTI_USER 
    WITH ROLLBACK IMMEDIATE;


GO
