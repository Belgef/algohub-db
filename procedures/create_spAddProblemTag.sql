SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddProblemTag
   @Tag NVARCHAR(50),
   @ProblemId INT
AS
BEGIN
   SET NOCOUNT ON

   BEGIN TRY
   BEGIN TRANSACTION
      IF (SELECT COUNT(*) FROM Tag WHERE TagName LIKE @Tag) = 0
      BEGIN
         INSERT INTO Tag(TagName) VALUES (@Tag)
      END

	  DECLARE @TagId INT = (SELECT TagId FROM Tag WHERE TagName LIKE @Tag);

      INSERT INTO ProblemTag (ProblemId, TagId)
      VALUES (@ProblemId, @TagId);

      SELECT @TagId;

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
