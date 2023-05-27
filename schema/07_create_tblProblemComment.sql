SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM sys.views WHERE name = 'ProblemComment' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP VIEW dbo.ProblemComment
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'tblProblemComment' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP TABLE dbo.tblProblemComment
GO

CREATE TABLE dbo.tblProblemComment
(
   ProblemCommentId INT NOT NULL IDENTITY(1, 1)
      CONSTRAINT PK_ProblemComment PRIMARY KEY CLUSTERED,
   ProblemId INT NOT NULL
      CONSTRAINT FK_ProblemComment_ProblemId FOREIGN KEY REFERENCES tblProblem(ProblemId) ON DELETE CASCADE,
   ParentCommentId INT
      CONSTRAINT FK_ProblemComment_ParentCommentId FOREIGN KEY REFERENCES tblProblemComment(ProblemCommentId) ON DELETE NO ACTION,
   AuthorId UNIQUEIDENTIFIER
      CONSTRAINT FK_ProblemComment_AuthorId FOREIGN KEY REFERENCES tblUser(UserId) ON DELETE SET NULL,
   Content NVARCHAR(400) NOT NULL,
   CreateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_ProblemComment_CreateDate DEFAULT SYSUTCDATETIME(),
   UpdateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_ProblemComment_UpdateDate DEFAULT SYSUTCDATETIME()
)
GO

CREATE VIEW dbo.ProblemComment AS SELECT * FROM dbo.tblProblemComment
GO
