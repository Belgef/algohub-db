SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetUserById
    @UserId UNIQUEIDENTIFIER
AS
BEGIN
   SET NOCOUNT ON

   SELECT UserId, UserName, FullName, Email, IconName, u.CreateDate, r.RoleId, r.RoleName 
   FROM [User] u
   LEFT JOIN [Role] r
   ON u.RoleId = r.RoleId
   WHERE UserId = @UserId;
END
GO
