SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

DELETE FROM [Language]
GO

DBCC CHECKIDENT ('[tblLanguage]', RESEED, 0);
GO

INSERT INTO [Language](LanguageName, LanguageInternalName, LanguageIconName)
VALUES ('C++', 'cpp', '_cpp.png'),
       ('C#', 'csharp', '_csharp.png'),
       ('Java', 'java', '_java.jpg'),
       ('JavaScript', 'javascript', '_js.png'),
       ('PHP', 'php', '_php.png'),
       ('Python', 'python', '_python.png')
GO