SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM sys.views WHERE name = 'ProblemTag' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP VIEW dbo.ProblemTag
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'tblProblemTag' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP TABLE dbo.tblProblemTag
GO

CREATE TABLE dbo.tblProblemTag
(
   ProblemTagId INT NOT NULL IDENTITY(1, 1)
      CONSTRAINT PK_ProblemTag PRIMARY KEY CLUSTERED,
   ProblemId INT NOT NULL
      CONSTRAINT FK_ProblemTag_ProblemId FOREIGN KEY REFERENCES tblProblem(ProblemId) ON DELETE CASCADE,
   TagId INT NOT NULL
      CONSTRAINT FK_ProblemTag_TagId FOREIGN KEY REFERENCES tblTag(TagId) ON DELETE CASCADE,
)
GO

CREATE VIEW dbo.ProblemTag AS SELECT * FROM dbo.tblProblemTag
GO
