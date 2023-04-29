USE AlgoHub
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddUser
   @UserName VARCHAR(100),
   @FullName NVARCHAR(200),
   @Email NVARCHAR(100),
   @PasswordHash BINARY(16),
   @IconName NVARCHAR(100)
AS
BEGIN
   SET NOCOUNT ON

   IF @UserName IS NULL
   BEGIN
      RAISERROR ('@UserName can not be null', 11, 1)
      RETURN -1
   END

   IF @Email IS NULL
   BEGIN
      RAISERROR ('@Email can not be null', 11, 1)
      RETURN -1
   END

   IF @PasswordHash IS NULL
   BEGIN
      RAISERROR ('@PasswordHash can not be null', 11, 1)
      RETURN -1
   END

   INSERT INTO [User] (UserName, FullName, Email, PasswordHash, IconName)
   VALUES (@UserName, @FullName, @Email, @PasswordHash, @IconName);

   SELECT CONVERT(INT, SCOPE_IDENTITY()) AS UserId;
END
GO

/** ROLLBACK **
DROP PROCEDURE dbo.spAddUser
*/
