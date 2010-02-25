CREATE TABLE [dbo].[Wiki](
    [KID]	        VARCHAR (600)	NOT NULL,    
    [CurrentWikiContentID]	BIGINT  NOT NULL,
    [MaxReversion]	NVARCHAR (100)	NOT NULL,
    [CrUserName]	NVARCHAR (400)	NOT NULL,
    [CreatedTime]	DATETIME		NOT NULL
);