SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

DELETE FROM Tag
GO

DBCC CHECKIDENT ('[tblTag]', RESEED, 0);
GO

INSERT INTO Tag (TagName) VALUES 
   ('graph'), 
   ('vectors'),
   ('simple'),
   ('dijkstra'),
   ('matrix'),
   ('sorting')