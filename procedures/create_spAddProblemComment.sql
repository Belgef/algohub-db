SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddProblemComment
   @ProblemId INT,
   @ParentCommentId INT = NULL,
   @AuthorId UNIQUEIDENTIFIER,
   @Content NVARCHAR(MAX)
AS
BEGIN
   SET NOCOUNT ON

   INSERT INTO ProblemComment (ProblemId, ParentCommentId, AuthorId, Content)
   VALUES (@ProblemId, @ParentCommentId, @AuthorId, @Content);

   SELECT SCOPE_IDENTITY();
END
GO
