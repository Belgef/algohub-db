SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM sys.views WHERE name = 'SolveComment' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP VIEW dbo.SolveComment
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'tblSolveComment' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP TABLE dbo.tblSolveComment
GO

CREATE TABLE dbo.tblSolveComment
(
   SolveCommentId INT NOT NULL IDENTITY(1, 1)
      CONSTRAINT PK_SolveComment PRIMARY KEY CLUSTERED,
   SolveId INT NOT NULL
      CONSTRAINT FK_SolveComment_SolveId FOREIGN KEY REFERENCES tblSolve(SolveId) ON DELETE CASCADE,
   ParentCommentId INT
      CONSTRAINT FK_SolveComment_ParentCommentId FOREIGN KEY REFERENCES tblSolveComment(SolveCommentId) ON DELETE NO ACTION,
   AuthorId UNIQUEIDENTIFIER
      CONSTRAINT FK_SolveComment_AuthorId FOREIGN KEY REFERENCES tblUser(UserId) ON DELETE SET NULL,
   Content NVARCHAR(400) NOT NULL,
   CreateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_SolveComment_CreateDate DEFAULT SYSUTCDATETIME(),
   UpdateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_SolveComment_UpdateDate DEFAULT SYSUTCDATETIME()
)
GO

CREATE VIEW dbo.SolveComment AS SELECT * FROM dbo.tblSolveComment
GO
