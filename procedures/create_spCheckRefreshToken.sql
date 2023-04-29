USE AlgoHub
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spCheckRefreshToken
   @UserId UNIQUEIDENTIFIER,
   @RefreshToken CHAR(44)
AS
BEGIN
   SET NOCOUNT ON

   SELECT COUNT(*) FROM [User] 
   WHERE UserId = @UserId
      AND RefreshToken = @RefreshToken
      AND DATEDIFF(MINUTE, RefreshTokenExpireDate, SYSUTCDATETIME()) < 5;
END
GO

/** ROLLBACK **
DROP PROCEDURE dbo.spCheckRefreshToken
*/
