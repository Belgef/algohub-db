SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM sys.views WHERE name = 'Language' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP VIEW dbo.Language
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'tblLanguage' AND SCHEMA_NAME(schema_id) = 'dbo')
   DROP TABLE dbo.tblLanguage
GO

CREATE TABLE dbo.tblLanguage
(
   LanguageId INT NOT NULL IDENTITY(1, 1)
      CONSTRAINT PK_Language PRIMARY KEY CLUSTERED,
   LanguageName NVARCHAR(50) NOT NULL,
   LanguageInternalName NVARCHAR(20) NOT NULL,
   LanguageIconName NVARCHAR(100),
   CreateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_Language_CreateDate DEFAULT SYSUTCDATETIME(),
   UpdateDate DATETIME2(2) NOT NULL
      CONSTRAINT DFT_Language_UpdateDate DEFAULT SYSUTCDATETIME()
)
GO

CREATE VIEW dbo.Language AS SELECT * FROM dbo.tblLanguage
GO
