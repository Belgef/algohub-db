SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

DELETE FROM [User]

INSERT INTO [User] (UserId, UserName, FullName, Email, PasswordHash, PasswordSalt) 
VALUES (
   'EEA6458B-DD6B-461F-8444-65E7B400ECF0',
   'admin',
   'Administrator',
   'mykola.hirnyi.pz.2019@lpnu.ua',
   'J26Tw+6yjtKbVcQuXwnqgJMII6bH+ClqY7o5GF1PNUw=',
   'MBbSA5JRx6qTneAlcrasgyCXZL9WtqELwlaLI9CVAa4='),

   ('EEA6458B-DD6B-461F-8444-65E7B400ECF1',
   'user',
   'User',
   'girnyimykola@gmail.com',
   'J26Tw+6yjtKbVcQuXwnqgJMII6bH+ClqY7o5GF1PNUw=',
   'MBbSA5JRx6qTneAlcrasgyCXZL9WtqELwlaLI9CVAa4=')