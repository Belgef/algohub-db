SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetTags
AS
BEGIN
   SET NOCOUNT ON
   
   SELECT TagName FROM Tag t ORDER BY TagName
END
GO
