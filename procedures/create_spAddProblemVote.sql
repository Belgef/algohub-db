SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddProblemVote
   @ProblemId INT,
   @AuthorId UNIQUEIDENTIFIER,
   @IsUpvote BIT = 1
AS
BEGIN
   SET NOCOUNT ON

   BEGIN TRY
   BEGIN TRANSACTION
      IF (SELECT COUNT(*) FROM ProblemVote WHERE ProblemId = @ProblemId AND AuthorId = @AuthorId) > 0
      BEGIN
         DECLARE @Vote INT = (SELECT IsUpvote FROM ProblemVote WHERE ProblemId = @ProblemId AND AuthorId = @AuthorId)

         UPDATE Problem SET Upvotes = Upvotes + @IsUpvote - @Vote, Downvotes = Downvotes + (1 - @IsUpvote) - (1 - @Vote) WHERE ProblemId = @ProblemId

         UPDATE ProblemVote SET IsUpvote = @IsUpvote WHERE ProblemId = @ProblemId AND AuthorId = @AuthorId;

         SELECT 1;
      END
	  ELSE
	  BEGIN
         UPDATE Problem SET Upvotes = Upvotes + @IsUpvote, Downvotes = Downvotes + (1 - @IsUpvote) WHERE ProblemId = @ProblemId

         INSERT INTO ProblemVote (ProblemId, AuthorId, IsUpvote)
         VALUES (@ProblemId, @AuthorId, @IsUpvote);

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
