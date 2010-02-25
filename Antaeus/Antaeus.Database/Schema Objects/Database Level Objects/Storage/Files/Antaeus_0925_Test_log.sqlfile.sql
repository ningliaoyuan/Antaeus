ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [Antaeus_0925_Test_log], FILENAME = '$(DefaultDataPath)$(DatabaseName)_log.LDF', MAXSIZE = 2097152 MB, FILEGROWTH = 10 %);

