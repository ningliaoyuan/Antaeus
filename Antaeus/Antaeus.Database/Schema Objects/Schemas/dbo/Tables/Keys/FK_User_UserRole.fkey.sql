﻿ALTER TABLE [dbo].[UserRole]
    ADD CONSTRAINT [FK_User_UserRole] FOREIGN KEY ([UserName]) REFERENCES [dbo].[User] ([UserName]) ON DELETE NO ACTION ON UPDATE NO ACTION;

