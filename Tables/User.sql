﻿CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
	[RoleId] INT NOT NULL,
	[DepartmentId] INT NULL,
	[RegionId] INT NULL,
	[LocationId] INT NULL,
    [Login] VARCHAR(50) NOT NULL, 
    [Password] VARCHAR(200) NOT NULL, 
    [Name] VARCHAR(200) NULL, 
    [Surname] VARCHAR(200) NOT NULL, 
	[UserNo] INT NOT NULL,
    [CreationDate] DATETIME NOT NULL DEFAULT getdate(), 
    [ModifiationDate] DATETIME NULL ,
	CONSTRAINT [UK_User_Login] UNIQUE ([Login]),
	CONSTRAINT [UK_User_UserNo] UNIQUE ([UserNo]),
	CONSTRAINT [FK_User_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role]([Id]),
	CONSTRAINT [FK_User_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department]([Id]),
	CONSTRAINT [FK_User_Region] FOREIGN KEY ([RegionId]) REFERENCES [dbo].[Region]([Id]),
	CONSTRAINT [FK_User_Location] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location]([Id])
)
GO

CREATE INDEX [IX_User_Department] ON [dbo].[User] ([DepartmentId] ASC)
GO

CREATE INDEX [IX_User_Region] ON [dbo].[User] ([RegionId] ASC)
GO

CREATE INDEX [IX_User_Location] ON [dbo].[User] ([LocationId] ASC)
GO

CREATE INDEX [IX_User_Role] ON [dbo].[User] ([RoleId] ASC)
GO

CREATE INDEX [IX_User_UserNo] ON [dbo].[User] ([UserNo] ASC)
GO