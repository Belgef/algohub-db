SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddUser
   @UserName VARCHAR(100),
   @FullName NVARCHAR(200) = NULL,
   @Email VARCHAR(254),
   @PasswordHash CHAR(44),
   @PasswordSalt CHAR(44),
   @IconName VARCHAR(100) = NULL
AS
BEGIN
   SET NOCOUNT ON

   INSERT INTO [User] (UserName, FullName, Email, PasswordHash, PasswordSalt, IconName)
   VALUES (@UserName, @FullName, @Email, @PasswordHash, @PasswordSalt, @IconName);

   SELECT UserId, UserName, FullName, Email, IconName FROM [User] WHERE UserName = @UserName;
END
GO
