SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetProblemTests
    @ProblemId INT
AS
BEGIN
   SET NOCOUNT ON

   SELECT TestId,
      ProblemId,
	  Input,
	  Output
   FROM Test
   WHERE ProblemId = @ProblemId;
END
GO
