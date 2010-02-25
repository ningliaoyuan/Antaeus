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