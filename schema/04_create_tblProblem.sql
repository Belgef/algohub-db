SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM sys.views WHERE name = 'Problem' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP VIEW dbo.Problem
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'tblProblem' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP TABLE dbo.tblProblem
GO

CREATE TABLE dbo.tblProblem
(
   ProblemId INT NOT NULL IDENTITY(1, 1)
      CONSTRAINT PK_Problem PRIMARY KEY CLUSTERED,
   ProblemName NVARCHAR(100) NOT NULL,
   [ProblemContentFileName] NVARCHAR(100) NOT NULL,
   AuthorId UNIQUEIDENTIFIER
      CONSTRAINT FK_Problem_AuthorId FOREIGN KEY REFERENCES tblUser(UserId) ON DELETE SET NULL,
   ImageName NVARCHAR(100) NOT NULL,
   [Views] INT NOT NULL
      CONSTRAINT DFT_Problem_Views DEFAULT 0,
   Solves INT NOT NULL
      CONSTRAINT DFT_Problem_Solves DEFAULT 0,
   Upvotes INT NOT NULL
      CONSTRAINT DFT_Problem_Upvotes DEFAULT 0,
   Downvotes INT NOT NULL
      CONSTRAINT DFT_Problem_Downvotes DEFAULT 0,
   TimeLimitMs INT NOT NULL,
   MemoryLimitBytes INT NOT NULL,
   CreateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_Problem_CreateDate DEFAULT SYSUTCDATETIME(),
   UpdateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_Problem_UpdateDate DEFAULT SYSUTCDATETIME()
)
GO

CREATE VIEW dbo.Problem AS SELECT * FROM dbo.tblProblem
GO
