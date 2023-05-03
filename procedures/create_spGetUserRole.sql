SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetUserRole
    @UserId UNIQUEIDENTIFIER
AS
BEGIN
   SET NOCOUNT ON

   SELECT r.RoleId, RoleName FROM [Role] r
   INNER JOIN UserRole ur ON r.RoleId = ur.RoleId
   WHERE UserId = @UserId;
END
GO
