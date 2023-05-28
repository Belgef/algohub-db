SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spRetrieveProblem
   @ProblemId INT
AS
BEGIN
   UPDATE Problem SET Deleted = 0 WHERE ProblemId = @ProblemId
END
GO
