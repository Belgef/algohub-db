SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetProblemTags
   @ProblemId INT
AS
BEGIN
   SET NOCOUNT ON

   SELECT TagName FROM Tag t
   INNER JOIN ProblemTag pt
   ON t.TagId = pt.TagId
   WHERE ProblemId = @ProblemId;
END
GO
