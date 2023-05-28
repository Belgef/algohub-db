SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetLessonById
    @LessonId INT
AS
BEGIN
   SET NOCOUNT ON

   UPDATE Lesson SET [Views]=[Views]+1 WHERE LessonId = @LessonId

   SELECT LessonId, 
      Title, 
	  LessonContent, 
	  ImageName, 
	  [Views], 
	  Upvotes, 
	  Downvotes, 
	  Deleted,
	  l.CreateDate,
	  u.UserName, 
	  u.FullName, 
      u.IconName
   FROM Lesson l
   LEFT JOIN [User] u
   ON AuthorId = UserId
   WHERE LessonId = @LessonId;
END
GO
