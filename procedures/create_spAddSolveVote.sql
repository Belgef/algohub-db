SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddSolveVote
   @SolveId INT,
   @AuthorId UNIQUEIDENTIFIER,
   @IsUpvote BIT = 1
AS
BEGIN
   SET NOCOUNT ON

   BEGIN TRY
   BEGIN TRANSACTION
      IF (SELECT COUNT(*) FROM SolveVote WHERE SolveId = @SolveId AND AuthorId = @AuthorId) > 0
      BEGIN
         DECLARE @Vote INT = (SELECT IsUpvote FROM SolveVote WHERE SolveId = @SolveId AND AuthorId = @AuthorId)

         UPDATE Solve SET Upvotes = Upvotes + @IsUpvote - @Vote, Downvotes = Downvotes + (1 - @IsUpvote) - (1 - @Vote) WHERE SolveId = @SolveId

         UPDATE SolveVote SET IsUpvote = @IsUpvote WHERE SolveId = @SolveId AND AuthorId = @AuthorId;

         SELECT 1;
      END
	  ELSE
	  BEGIN
         UPDATE Solve SET Upvotes = Upvotes + @IsUpvote, Downvotes = Downvotes + (1 - @IsUpvote) WHERE SolveId = @SolveId

         INSERT INTO SolveVote (SolveId, AuthorId, IsUpvote)
         VALUES (@SolveId, @AuthorId, @IsUpvote);

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
