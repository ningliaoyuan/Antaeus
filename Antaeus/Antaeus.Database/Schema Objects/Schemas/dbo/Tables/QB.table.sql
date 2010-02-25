CREATE TABLE [dbo].[QB] (
    [QuestionID] BIGINT          NOT NULL,
    [CategoryID] BIGINT          NOT NULL,
    [Source]     NVARCHAR (500) NOT NULL,
    [CrUserName] NVARCHAR (400) NOT NULL,
    [CrTime]     DATETIME        NOT NULL,
    [Abstract]   NVARCHAR (4000) NOT NULL
);

