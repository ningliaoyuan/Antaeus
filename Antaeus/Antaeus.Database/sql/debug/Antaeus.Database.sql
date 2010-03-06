/*
Deployment script for Antaeus_DB
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Antaeus_DB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\"

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

IF NOT EXISTS (SELECT 1 FROM [master].[dbo].[sysdatabases] WHERE [name] = N'$(DatabaseName)')
BEGIN
    RAISERROR(N'You cannot deploy this update script to target ZIZ-SHMSCOM-01\SQLEXPRESS. The database for which this script was built, Antaeus_DB, does not exist on this server.', 16, 127) WITH NOWAIT
    RETURN
END

GO

IF (@@servername != 'ZIZ-SHMSCOM-01\SQLEXPRESS')
BEGIN
    RAISERROR(N'The server name in the build script %s does not match the name of the target server %s. Verify whether your database project settings are correct and whether your build script is up to date.', 16, 127,N'ZIZ-SHMSCOM-01\SQLEXPRESS',@@servername) WITH NOWAIT
    RETURN
END

GO

IF CAST(DATABASEPROPERTY(N'$(DatabaseName)','IsReadOnly') as bit) = 1
BEGIN
    RAISERROR(N'You cannot deploy this update script because the database for which it was built, %s , is set to READ_ONLY.', 16, 127, N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
USE [$(DatabaseName)]

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
IF NOT EXISTS (SELECT * from dbo.Category)
BEGIN 
INSERT INTO [dbo].[Category]
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
  
INSERT INTO [dbo].[Category]
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
           
INSERT INTO [dbo].[Category]
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

INSERT INTO [dbo].[Category]
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

INSERT INTO [dbo].[Category]
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

INSERT INTO [dbo].[Category]
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

INSERT INTO [dbo].[Category]
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
           
INSERT INTO [dbo].[ID]
           ([Key]
           ,[MaxID]
           ,[Cache])
     VALUES
           ('Category'
           ,20
           ,20)
END

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
