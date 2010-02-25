CREATE TABLE [dbo].[User] (
    [UserName]     NVARCHAR (200) NOT NULL,
    [PasswordHash] NVARCHAR (400) NOT NULL,
    [PasswordSalt] NVARCHAR (100) NOT NULL,
    [DisplayName]  NVARCHAR (500) NOT NULL,
    [CreatedTime]  DATETIME        NOT NULL,
    [IsApproved]   BIT             NOT NULL,
    [Email]        NVARCHAR (500) NOT NULL
);

