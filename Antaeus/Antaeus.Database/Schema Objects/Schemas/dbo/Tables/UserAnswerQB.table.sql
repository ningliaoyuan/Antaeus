CREATE TABLE [dbo].[UserAnswerQB] (
    [UserAnswerQBID] BIGINT		NOT NULL,
    [QuestionID] BIGINT          NOT NULL,
    [Answer]  NVARCHAR (100) NOT NULL,
    [Cost]   INT       NOT NULL,
    [Correct]    BIT       NOT NULL,
    [CrUserName] NVARCHAR (400) NOT NULL,
    [CrTime]     DATETIME        NOT NULL
);

