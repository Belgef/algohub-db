SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetLessonVote
   @LessonId INT,
   @AuthorId UNIQUEIDENTIFIER
AS
BEGIN
   SET NOCOUNT ON

   SELECT IsUpvote FROM LessonVote
   WHERE LessonId = @LessonId AND AuthorId = @AuthorId;
END
GO