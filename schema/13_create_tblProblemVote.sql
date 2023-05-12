SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM sys.views WHERE name = 'ProblemVote' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP VIEW dbo.ProblemVote
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'tblProblemVote' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP TABLE dbo.tblProblemVote
GO

CREATE TABLE dbo.tblProblemVote
(
   ProblemVoteId INT NOT NULL IDENTITY(1, 1)
      CONSTRAINT PK_ProblemVote PRIMARY KEY CLUSTERED,
   ProblemId INT NOT NULL
      CONSTRAINT FK_ProblemVote_ProblemId FOREIGN KEY REFERENCES tblProblem(ProblemId) ON DELETE CASCADE,
   AuthorId UNIQUEIDENTIFIER
      CONSTRAINT FK_ProblemVote_AuthorId FOREIGN KEY REFERENCES tblUser(UserId) ON DELETE SET NULL,
   IsUpvote BIT NOT NULL
      CONSTRAINT DFT_ProblemVote_IsUpvote DEFAULT 1,
   CreateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_ProblemVote_CreateDate DEFAULT SYSUTCDATETIME(),
   UpdateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_ProblemVote_UpdateDate DEFAULT SYSUTCDATETIME()
)
GO

CREATE VIEW dbo.ProblemVote AS SELECT * FROM dbo.tblProblemVote
GO
