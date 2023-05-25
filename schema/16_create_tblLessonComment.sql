SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM sys.views WHERE name = 'LessonComment' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP VIEW dbo.LessonComment
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'tblLessonComment' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP TABLE dbo.tblLessonComment
GO

CREATE TABLE dbo.tblLessonComment
(
   LessonCommentId INT NOT NULL IDENTITY(1, 1)
      CONSTRAINT PK_LessonComment PRIMARY KEY CLUSTERED,
   LessonId INT
      CONSTRAINT FK_LessonComment_LessonId FOREIGN KEY REFERENCES tblLesson(LessonId) ON DELETE NO ACTION,
   ParentCommentId INT
      CONSTRAINT FK_LessonComment_ParentCommentId FOREIGN KEY REFERENCES tblLessonComment(LessonCommentId) ON DELETE NO ACTION,
   AuthorId UNIQUEIDENTIFIER
      CONSTRAINT FK_LessonComment_AuthorId FOREIGN KEY REFERENCES tblUser(UserId) ON DELETE SET NULL,
   Content NVARCHAR(400) NOT NULL,
   CreateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_LessonComment_CreateDate DEFAULT SYSUTCDATETIME(),
   UpdateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_LessonComment_UpdateDate DEFAULT SYSUTCDATETIME()
)
GO

CREATE VIEW dbo.LessonComment AS SELECT * FROM dbo.tblLessonComment
GO
