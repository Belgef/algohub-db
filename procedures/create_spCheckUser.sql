USE AlgoHub
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spCheckUser
    @UserName VARCHAR(100)
   ,@PasswordHash BINARY(32)
AS
BEGIN
   SET NOCOUNT ON;

   SELECT UserId FROM [User] WHERE UserName = @UserName AND PasswordHash = PasswordHash;
END
GO

/** ROLLBACK **
DROP PROCEDURE dbo.spCheckUser
*/
