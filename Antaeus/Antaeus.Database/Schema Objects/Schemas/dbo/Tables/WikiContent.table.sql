CREATE TABLE [dbo].[WikiContent](
    [WikiContentID] BIGINT		NOT NULL,
    [KID]         VARCHAR (600) NOT NULL,
    [Content]     NVARCHAR(MAX) NOT NULL,
    [Reversion]   NVARCHAR (100) NOT NULL,
    [CrUserName]  NVARCHAR (400) NOT NULL,
    [CreatedTime] DATETIME       NOT NULL
);