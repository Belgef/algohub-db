SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddLesson
   @Title NVARCHAR(200),
   @LessonContent NVARCHAR(MAX),
   @AuthorId UNIQUEIDENTIFIER,
   @ImageName NVARCHAR(100) = NULL
AS
BEGIN
   SET NOCOUNT ON

   INSERT INTO Lesson (Title, LessonContent, AuthorId, ImageName)
   VALUES (@Title, @LessonContent, @AuthorId, @ImageName);

   SELECT SCOPE_IDENTITY();
END
GO
