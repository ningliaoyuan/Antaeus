CREATE TABLE [dbo].[Rate] (
    [RateID]      BIGINT		NOT NULL,
    [KID]         VARCHAR (600) NOT NULL,
    [Score]       INT NOT NULL,
    [CrUserName]  NVARCHAR (400) NOT NULL,
    [CreatedTime] DATETIME        NOT NULL
);

