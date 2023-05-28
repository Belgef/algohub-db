SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetLessons
   @OrderColumn VARCHAR(32) = 'LessonId',
   @OrderDirection VARCHAR(4) = 'ASC',
   @Deleted BIT = 0
AS
BEGIN
   SET NOCOUNT ON

   DECLARE @Lessons TABLE (
      LessonId INT,
      Title NVARCHAR(100),
      LessonContent NVARCHAR(MAX),
      ImageName NVARCHAR(100),
      [Views] INT,
      Upvotes INT,
      Downvotes INT,
      CreateDate DATETIME2(2),
      UserName VARCHAR(100),
      FullName NVARCHAR(200),
      IconName NVARCHAR(100)
   )

   INSERT INTO @Lessons 
      SELECT LessonId, 
         Title, 
         LessonContent, 
         ImageName, 
         [Views], 
         Upvotes, 
         Downvotes, 
         l.CreateDate,
         u.UserName, 
         u.FullName, 
         u.IconName
	   FROM Lesson l
	   LEFT JOIN [User] u
	   ON AuthorId = UserId
	   WHERE Deleted = @Deleted;
      
	  IF @OrderColumn LIKE 'LessonId'
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Lessons ORDER BY LessonId ASC END
		 ELSE BEGIN SELECT * FROM @Lessons ORDER BY LessonId DESC END
      END
	  ELSE IF @OrderColumn LIKE 'Title'
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Lessons ORDER BY Title ASC END
		 ELSE BEGIN SELECT * FROM @Lessons ORDER BY Title DESC END
      END
      ELSE IF @OrderColumn LIKE 'Views' 
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Lessons ORDER BY [Views] ASC END
		 ELSE BEGIN SELECT * FROM @Lessons ORDER BY [Views] DESC END
      END
      ELSE IF @OrderColumn LIKE 'Upvotes' 
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Lessons ORDER BY Upvotes ASC END
		 ELSE BEGIN SELECT * FROM @Lessons ORDER BY Upvotes DESC END
      END
      ELSE IF @OrderColumn LIKE 'Downvotes' 
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Lessons ORDER BY Downvotes ASC END
		 ELSE BEGIN SELECT * FROM @Lessons ORDER BY Downvotes DESC END
      END
      ELSE IF @OrderColumn LIKE 'CreateDate' 
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Lessons ORDER BY CreateDate ASC END
		 ELSE BEGIN SELECT * FROM @Lessons ORDER BY CreateDate DESC END
      END
END
GO
