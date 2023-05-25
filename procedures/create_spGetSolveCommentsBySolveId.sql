SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetSolveCommentsBySolveId
    @SolveId INT
AS
BEGIN
   SET NOCOUNT ON

   SELECT SolveCommentId,
      SolveId,
	  ParentCommentId,
	  Content,
	  l.CreateDate,
	  u.UserName, 
	  u.FullName, 
      u.IconName
   FROM SolveComment l
   LEFT JOIN [User] u
   ON AuthorId = UserId
   WHERE SolveId = @SolveId;
END
GO
