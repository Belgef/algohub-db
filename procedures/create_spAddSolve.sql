SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddSolve
   @ProblemId INT,
   @AuthorId UNIQUEIDENTIFIER,
   @LanguageName NVARCHAR(20),
   @Code NVARCHAR(MAX),
   @TimeMs INT,
   @MemoryBytes INT
AS
BEGIN
   SET NOCOUNT ON

   INSERT INTO Solve (ProblemId, AuthorId, LanguageId, Code, TimeMs, MemoryBytes)
   VALUES (
      @ProblemId, 
	  @AuthorId, 
	  (SELECT LanguageId FROM [Language] WHERE LanguageInternalName = @LanguageName), 
	  @Code, 
	  @TimeMs, 
	  @MemoryBytes);

   SELECT SCOPE_IDENTITY();
END
GO
