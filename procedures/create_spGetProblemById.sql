SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetProblemById
    @ProblemId INT
AS
BEGIN
   SET NOCOUNT ON

   UPDATE Problem SET [Views]=[Views]+1 WHERE ProblemId = @ProblemId

   SELECT ProblemId, 
      ProblemName, 
	  ProblemContent, 
	  ImageName, 
	  [Views], 
	  Solves, 
	  Upvotes, 
	  Downvotes, 
	  TimeLimitMs, 
	  MemoryLimitBytes, 
	  p.CreateDate,
	  u.UserName, 
	  u.FullName, 
      u.IconName
   FROM Problem p
   LEFT JOIN [User] u
   ON AuthorId = UserId
   WHERE ProblemId = @ProblemId;
END
GO
