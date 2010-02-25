CREATE TABLE [dbo].[Category] (
    [CategoryID]   BIGINT          NOT NULL,
    [Name]         NVARCHAR (100) NOT NULL,
    [ShortName]    NVARCHAR (20) NOT NULL,
    [QuestionType] NVARCHAR (50) NOT NULL,
    [QuestionTypeMeta] NVARCHAR (3000),
);

