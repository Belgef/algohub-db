SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddUser
   @UserName VARCHAR(100),
   @FullName NVARCHAR(200) = NULL,
   @Email VARCHAR(254),
   @PasswordHash CHAR(44),
   @PasswordSalt CHAR(44),
   @IconName VARCHAR(100) = NULL,
   @RoleId INT = NULL
AS
BEGIN
   SET NOCOUNT ON

   INSERT INTO [User] (UserName, FullName, Email, PasswordHash, PasswordSalt, IconName, RoleId)
   VALUES (@UserName, @FullName, @Email, @PasswordHash, @PasswordSalt, @IconName, ISNULL(@RoleId, 1));

   SELECT UserId FROM [User] WHERE UserName = @UserName;
END
GO
