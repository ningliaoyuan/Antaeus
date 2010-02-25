﻿CREATE TYPE [dbo].[CategoryId]
	FROM INT NOT NULL

GO

CREATE TYPE [dbo].[CategoryName]
	FROM NVARCHAR(1024) NOT NULL
GO
	
CREATE TYPE [dbo].[CategoryType]
	FROM NVARCHAR(1024) NOT NULL
GO
	
CREATE TYPE [dbo].[CategoryParentId]
	FROM INT NOT NULL
GO
