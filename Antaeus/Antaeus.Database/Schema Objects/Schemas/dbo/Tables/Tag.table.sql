CREATE TABLE [dbo].[Tag]
(
	[TagID] BIGINT NOT NULL,
    [KID] VARCHAR (600)	NOT NULL,    
	[CrUserName]  NVARCHAR (400) NOT NULL,
    [CreatedTime]	DATETIME NOT NULL,
    [Tags] VARCHAR (600)	NOT NULL
)
