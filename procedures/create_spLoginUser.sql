SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spLoginUser
   @UserName VARCHAR(100),
   @PasswordHash CHAR(44)
AS
BEGIN
   SET NOCOUNT ON

   DECLARE @UserId UNIQUEIDENTIFIER

   SET @UserId = (SELECT UserId FROM [User] WHERE UserName = @UserName AND PasswordHash = @PasswordHash);

   SELECT UserId, UserName, FullName, Email, IconName, u.CreateDate, r.RoleId, RoleName
   FROM [User] u
   LEFT JOIN [Role] r ON u.RoleId = r.RoleId
   WHERE UserId = @UserId;
END
GO
