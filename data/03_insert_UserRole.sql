SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

DELETE FROM UserRole
GO

DBCC CHECKIDENT ('[tblUserRole]', RESEED, 0);
GO

INSERT INTO UserRole (UserId, RoleId) VALUES ('EEA6458B-DD6B-461F-8444-65E7B400ECF0', 1) 