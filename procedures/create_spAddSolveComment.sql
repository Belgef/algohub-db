SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddSolveComment
   @SolveId INT,
   @ParentCommentId INT = NULL,
   @AuthorId UNIQUEIDENTIFIER,
   @Content NVARCHAR(MAX)
AS
BEGIN
   SET NOCOUNT ON

   INSERT INTO SolveComment (SolveId, ParentCommentId, AuthorId, Content)
   VALUES (@SolveId, @ParentCommentId, @AuthorId, @Content);

   SELECT SCOPE_IDENTITY();
END
GO
