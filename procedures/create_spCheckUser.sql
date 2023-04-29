USE AlgoHub
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spCheckUser
   @UserName VARCHAR(100),
   @PasswordHash CHAR(44)
AS
BEGIN
   SELECT UserId FROM [User] WHERE UserName = @UserName AND PasswordHash = @PasswordHash;
END
GO

/** ROLLBACK **
DROP PROCEDURE dbo.spCheckUser
*/
