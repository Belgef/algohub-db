SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetLessonTags
   @LessonId INT
AS
BEGIN
   SET NOCOUNT ON
   
   SELECT TagName FROM Tag t
   INNER JOIN LessonTag pt
   ON t.TagId = pt.TagId
   WHERE LessonId = @LessonId;
END
GO
