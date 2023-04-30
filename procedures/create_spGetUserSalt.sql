USE AlgoHub
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetUserSalt
    @UserName VARCHAR(100)
AS
BEGIN
   SET NOCOUNT ON

   SELECT PasswordSalt FROM [User] WHERE UserName = @UserName;
END
GO

/** ROLLBACK **
DROP PROCEDURE dbo.spGetUserSalt
*/
