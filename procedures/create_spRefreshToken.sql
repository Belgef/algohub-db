SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spRefreshToken
   @UserId UNIQUEIDENTIFIER,
   @RefreshToken CHAR(44),
   @RefreshTokenExpireDate DATETIME2(2)
AS
BEGIN
   UPDATE [User] 
   SET RefreshToken = @RefreshToken, 
       RefreshTokenExpireDate = @RefreshTokenExpireDate,
	   UpdateDate = SYSUTCDATETIME()
   WHERE UserId = @UserId;
END
GO
