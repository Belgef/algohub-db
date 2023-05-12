SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spAddProblem
   @ProblemName NVARCHAR(100),
   @ProblemContent NVARCHAR(MAX),
   @AuthorId UNIQUEIDENTIFIER,
   @ImageName NVARCHAR(100) = NULL,
   @TimeLimitMs INT,
   @MemoryLimitBytes INT
AS
BEGIN
   SET NOCOUNT ON

   INSERT INTO Problem (ProblemName, ProblemContent, AuthorId, ImageName, TimeLimitMs, MemoryLimitBytes)
   VALUES (@ProblemName, @ProblemContent, @AuthorId, @ImageName, @TimeLimitMs, @MemoryLimitBytes);

   SELECT SCOPE_IDENTITY();
END
GO
