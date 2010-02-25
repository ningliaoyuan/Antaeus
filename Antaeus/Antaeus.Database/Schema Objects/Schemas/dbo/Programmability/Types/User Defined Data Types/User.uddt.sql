﻿CREATE TYPE [dbo].[UserId]
	FROM INT NOT NULL
GO
	
CREATE TYPE [dbo].[Email]
	FROM NVARCHAR(1024) NOT NULL
GO

CREATE TYPE [dbo].[NickName]
	FROM NVARCHAR(256) NOT NULL
GO
	
CREATE TYPE [dbo].[Password]
	FROM NVARCHAR(128) NOT NULL
GO
	
CREATE TYPE [dbo].[UserGender]
	FROM BIT NOT NULL
GO
	
CREATE TYPE [dbo].[BirthDay]
	FROM DATETIME NOT NULL
GO
	
CREATE TYPE [dbo].[UserIM]
	FROM NVARCHAR(1024) NOT NULL
GO
	
CREATE TYPE [dbo].[UserWebSite]
	FROM NVARCHAR(1024) NULL
GO
	
CREATE TYPE [dbo].[LastLogin]
	FROM DATETIME NOT NULL
GO