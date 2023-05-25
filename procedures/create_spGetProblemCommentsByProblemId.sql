SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetProblemCommentsByProblemId
    @ProblemId INT
AS
BEGIN
   SET NOCOUNT ON

   SELECT ProblemCommentId,
      ProblemId,
	  ParentCommentId,
	  Content,
	  l.CreateDate,
	  u.UserName, 
	  u.FullName, 
      u.IconName
   FROM ProblemComment l
   LEFT JOIN [User] u
   ON AuthorId = UserId
   WHERE ProblemId = @ProblemId;
END
GO
