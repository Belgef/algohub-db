SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddLessonComment
   @LessonId INT,
   @ParentCommentId INT = NULL,
   @AuthorId UNIQUEIDENTIFIER,
   @Content NVARCHAR(MAX)
AS
BEGIN
   SET NOCOUNT ON

   INSERT INTO LessonComment (LessonId, ParentCommentId, AuthorId, Content)
   VALUES (@LessonId, @ParentCommentId, @AuthorId, @Content);

   SELECT SCOPE_IDENTITY();
END
GO
