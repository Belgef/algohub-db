SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dbo.spGetProblems
   @OrderColumn VARCHAR(32) = 'ProblemId',
   @OrderDirection VARCHAR(4) = 'ASC',
   @Deleted BIT = 0
AS
BEGIN
   SET NOCOUNT ON

   DECLARE  @Problems TABLE (
      ProblemId INT,
      ProblemName NVARCHAR(100),
      ProblemContent NVARCHAR(MAX),
      ImageName NVARCHAR(100),
      [Views] INT,
      Solves INT,
      Upvotes INT,
      Downvotes INT,
      TimeLimitMs INT,
      MemoryLimitBytes INT,
      CreateDate DATETIME2(2),
      UserName VARCHAR(100),
      FullName NVARCHAR(200),
      IconName NVARCHAR(100)
   )

   INSERT INTO @Problems 
      SELECT ProblemId, 
         ProblemName, 
         ProblemContent, 
         ImageName, 
         [Views], 
         Solves, 
         Upvotes, 
         Downvotes, 
         TimeLimitMs, 
         MemoryLimitBytes, 
         p.CreateDate,
         u.UserName, 
         u.FullName, 
         u.IconName
	   FROM Problem p
	   LEFT JOIN [User] u
	   ON AuthorId = UserId
	   WHERE Deleted = @Deleted;
      
	  IF @OrderColumn LIKE 'ProblemId'
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Problems ORDER BY ProblemId ASC END
		 ELSE BEGIN SELECT * FROM @Problems ORDER BY ProblemId DESC END
      END
	  ELSE IF @OrderColumn LIKE 'ProblemName'
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Problems ORDER BY ProblemName ASC END
		 ELSE BEGIN SELECT * FROM @Problems ORDER BY ProblemName DESC END
      END
      ELSE IF @OrderColumn LIKE 'Views' 
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Problems ORDER BY [Views] ASC END
		 ELSE BEGIN SELECT * FROM @Problems ORDER BY [Views] DESC END
      END
      ELSE IF @OrderColumn LIKE 'Solves' 
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Problems ORDER BY Solves ASC END
		 ELSE BEGIN SELECT * FROM @Problems ORDER BY Solves DESC END
      END
      ELSE IF @OrderColumn LIKE 'Upvotes' 
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Problems ORDER BY Upvotes ASC END
		 ELSE BEGIN SELECT * FROM @Problems ORDER BY Upvotes DESC END
      END
      ELSE IF @OrderColumn LIKE 'Downvotes' 
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Problems ORDER BY Downvotes ASC END
		 ELSE BEGIN SELECT * FROM @Problems ORDER BY Downvotes DESC END
      END
      ELSE IF @OrderColumn LIKE 'CreateDate' 
	  BEGIN 
	     IF @OrderDirection LIKE 'ASC' BEGIN SELECT * FROM @Problems ORDER BY CreateDate ASC END
		 ELSE BEGIN SELECT * FROM @Problems ORDER BY CreateDate DESC END
      END
END
GO
