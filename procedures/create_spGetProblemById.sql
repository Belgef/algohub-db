SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetProblemById
    @ProblemId INT
AS
BEGIN
   SET NOCOUNT ON

   SELECT ProblemId, 
      ProblemName, 
	  ProblemContentFileName, 
	  FullName AuthorName, 
	  UserName AuthorUserName, 
      IconName AuthorIconName, 
	  ImageName, 
	  [Views], 
	  Solves, 
	  Upvotes, 
	  Downvotes, 
	  TimeLimitMs, 
	  MemoryLimitBytes, 
	  p.CreateDate 
   FROM Problem p
   JOIN [User] u
   ON AuthorId = UserId
   WHERE ProblemId = @ProblemId;
END
GO
