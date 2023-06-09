SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spCheckEmail
   @Email VARCHAR(100)
AS
BEGIN
   SET NOCOUNT ON

   SELECT COUNT(*) FROM [User] 
   WHERE Email = @Email;
END
GO
