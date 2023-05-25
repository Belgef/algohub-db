SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddLessonVote
   @LessonId INT,
   @AuthorId UNIQUEIDENTIFIER,
   @IsUpvote BIT = 1
AS
BEGIN
   SET NOCOUNT ON

   BEGIN TRY
   BEGIN TRANSACTION
      IF (SELECT COUNT(*) FROM LessonVote WHERE LessonId = @LessonId AND AuthorId = @AuthorId) > 0
      BEGIN
         DECLARE @Vote INT = (SELECT IsUpvote FROM LessonVote WHERE LessonId = @LessonId AND AuthorId = @AuthorId)

         UPDATE Lesson SET Upvotes = Upvotes + @IsUpvote - @Vote, Downvotes = Downvotes + (1 - @IsUpvote) - (1 - @Vote) WHERE LessonId = @LessonId

         UPDATE LessonVote SET IsUpvote = @IsUpvote WHERE LessonId = @LessonId AND AuthorId = @AuthorId;

         SELECT 1;
      END
	  ELSE
	  BEGIN
         UPDATE Lesson SET Upvotes = Upvotes + @IsUpvote, Downvotes = Downvotes + (1 - @IsUpvote) WHERE LessonId = @LessonId

         INSERT INTO LessonVote (LessonId, AuthorId, IsUpvote)
         VALUES (@LessonId, @AuthorId, @IsUpvote);

         SELECT SCOPE_IDENTITY();
	  END

      COMMIT TRANSACTION
   END TRY
   BEGIN CATCH
      IF @@TRANCOUNT > 0
      BEGIN
         ROLLBACK TRANSACTION
      END

      RAISERROR ('An error occurred during data insert', 11, 4);
      RETURN -1;
   END CATCH
END
GO
