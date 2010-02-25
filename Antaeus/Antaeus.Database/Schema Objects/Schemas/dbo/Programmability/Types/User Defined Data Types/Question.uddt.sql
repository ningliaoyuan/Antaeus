SET NOCOUNT ON
GO

CREATE TABLE #Datatypes (
    TypeName    sysname     NOT NULL,
    Datatype    varchar(15) NOT NULL,
    Nullability varchar(8)  NOT NULL
)

INSERT INTO #Datatypes VALUES ( 'Questionid', 'INT', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'QuestionContent', 'NVARCHAR(4000)', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'QuestionAsk', 'NVARCHAR(2560)', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'QuestionType', 'INT', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'QuestionKnowledge', 'NVARCHAR(1024)', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'QuestionRelated', 'NVARCHAR(1024)', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'QuestionSource', 'NVARCHAR(1024)', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'QuestionValue', 'INT', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'QuestionView', 'INT', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'CreatedDatetime', 'DATETIME', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'CreatedUserId', 'INT', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'OptionId', 'INT', 'NULL' )
INSERT INTO #Datatypes VALUES ( 'OptionContent', 'NVARCHAR(4000)', 'NULL' )
	
GO

CREATE PROCEDURE #prc_AddType (
        @TypeName sysname,
        @Datatype varchar(15),
        @Nullability varchar(8)
    ) AS

    DECLARE @Msg varchar(255)           -- Message string buffer.
    DECLARE @RetCode INT                -- Procedure return code values.

    SELECT @Msg = 'Type:  ' + CONVERT(CHAR(30), @TypeName) + '; '

    IF EXISTS (SELECT *
                 FROM INFORMATION_SCHEMA.DOMAINS
                WHERE DOMAIN_NAME = @TypeName)
        IF EXISTS (SELECT *
                     FROM INFORMATION_SCHEMA.COLUMN_DOMAIN_USAGE
                    WHERE DOMAIN_NAME = @TypeName)
            BEGIN
                SELECT @Msg = @Msg + 'Type exists...'
                GOTO PrintMsg
            END

        ELSE
            BEGIN
                SELECT @Msg = @Msg + 'Destroying...'
                EXECUTE @RetCode = sp_droptype @TypeName
                IF (@@ERROR <> 0) OR (@RetCode <> 0) GOTO PrintMsg
            END

    SELECT @Msg = @Msg + 'Creating...'
    EXECUTE sp_addtype @TypeName, @Datatype, @Nullability

PrintMsg:

    IF EXISTS (SELECT *
                 FROM INFORMATION_SCHEMA.DOMAINS
                WHERE DOMAIN_NAME = @TypeName)
        SELECT @Msg = @Msg + 'SUCCEEDED!'
    ELSE
        SELECT @Msg = @Msg + 'FAILED!'

    PRINT @Msg

GO

DECLARE @TypeName sysname
DECLARE @Datatype varchar(15)
DECLARE @Nullability varchar(8)

DECLARE hC INSENSITIVE CURSOR FOR SELECT * FROM #Datatypes
OPEN hC
FETCH hC INTO @TypeName, @Datatype, @Nullability

WHILE @@FETCH_STATUS <> -1
    BEGIN
        EXECUTE #prc_AddType @TypeName, @Datatype, @Nullability
        FETCH hC INTO @TypeName, @Datatype, @Nullability
    END

CLOSE hC
DEALLOCATE hC

GO

IF (OBJECT_ID('tempdb..#Datatypes') IS NOT NULL) DROP TABLE #Datatypes
IF (OBJECT_ID('tempdb..#prc_AddType') IS NOT NULL) DROP PROCEDURE #prc_AddType
GO