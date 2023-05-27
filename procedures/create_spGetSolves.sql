SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetSolves
    @ProblemId INT
AS
BEGIN
   SET NOCOUNT ON

   SELECT s.SolveId,
      s.ProblemId,
	  s.Code,
	  s.[Views],
	  s.Upvotes,
	  s.Downvotes,
	  s.TimeMs,
	  s.MemoryBytes,
	  s.CreateDate,
	  u.UserName,
	  u.FullName,
	  u.Email,
	  u.IconName,
	  l.LanguageName,
	  l.LanguageInternalName,
	  l.LanguageIconName
   FROM Solve s
   LEFT JOIN [User] u
   ON AuthorId = UserId
   LEFT JOIN [Language] l
   ON s.LanguageId = l.LanguageId
   WHERE ProblemId = @ProblemId;
END
GO
