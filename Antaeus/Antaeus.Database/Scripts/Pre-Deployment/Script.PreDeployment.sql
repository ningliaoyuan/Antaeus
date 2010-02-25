/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/*
如果数据库登陆失败，显示
Login failed for user 'username'. The user is not associated with a trusted SQL Server connection. (Microsoft SQL Server, Error: 18452)

则需要修改数据库属性，ref:http://support.microsoft.com/kb/555332


USE [master]
GO
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', REG_DWORD, 2
GO
*/

IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'ans')
DROP LOGIN [ans]
GO

CREATE LOGIN [ans] WITH PASSWORD=N'123456', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
