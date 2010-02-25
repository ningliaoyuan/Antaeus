CREATE TABLE [dbo].[Comment] (
    [CommentID]   BIGINT          NOT NULL,
    [KID]         VARCHAR (600)	  NOT NULL,
    [Content]     NVARCHAR (4000) NOT NULL,
    [Floor]       INT             NOT NULL,
    [ParentCID]   NVARCHAR (400)  NOT NULL,
    [CrUserName]  NVARCHAR (400)  NOT NULL,
    [CreatedTime] DATETIME        NOT NULL
);

