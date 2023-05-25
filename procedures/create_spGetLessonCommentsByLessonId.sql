SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetLessonCommentsByLessonId
    @LessonId INT
AS
BEGIN
   SET NOCOUNT ON

   SELECT LessonCommentId,
      LessonId,
	  ParentCommentId,
	  Content,
	  l.CreateDate,
	  u.UserName, 
	  u.FullName, 
      u.IconName
   FROM LessonComment l
   LEFT JOIN [User] u
   ON AuthorId = UserId
   WHERE LessonId = @LessonId;
END
GO
