CREATE TYPE [dbo].[AdId]
	FROM varchar(11) NOT NULL
GO

CREATE TYPE [dbo].[AdWidth]
	FROM INT NOT NULL
GO

CREATE TYPE [dbo].[AdHeight]
	FROM INT NOT NULL
GO

CREATE TYPE [dbo].[AdName]
	FROM varchar(64) NOT NULL
GO

CREATE TYPE [dbo].[AdContent]
	FROM varchar(4000) NOT NULL
GO