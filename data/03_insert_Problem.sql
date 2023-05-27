SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

DELETE FROM [Problem]
GO

DBCC CHECKIDENT ('[tblProblem]', RESEED, 0);
GO

INSERT INTO Problem (ProblemName, ProblemContent, AuthorId, ImageName, TimeLimitMs, MemoryLimitBytes, CreateDate, UpdateDate)
VALUES ('Problem 1', '[]', 'EEA6458B-DD6B-461F-8444-65E7B400ECF0', 'image1.png', 1000, 1024, '2001-01-01', '2011-11-11'),
       ('Problem 2', '[]', NULL, 'image2.png', 2000, 2048, '2002-02-02', '2012-12-12');
GO