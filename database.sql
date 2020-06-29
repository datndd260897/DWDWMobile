USE [master]

CREATE DATABASE [DWDB]

USE [DWDB]
GO
/****** Object:  Table [dbo].[Device]    Script Date: 6/29/2020 11:09:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device](
	[deviceId] [int] IDENTITY(1,1) NOT NULL,
	[deviceCode] [nvarchar](50) NULL,
	[deviceStatus] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[deviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/29/2020 11:09:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[locationId] [int] IDENTITY(1,1) NOT NULL,
	[locationCode] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Record]    Script Date: 6/29/2020 11:09:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Record](
	[recordId] [int] IDENTITY(1,1) NOT NULL,
	[deviceId] [int] NULL,
	[recordDate] [datetime] NULL,
	[image] [nvarchar](255) NULL,
	[recordStatus] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[recordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/29/2020 11:09:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/29/2020 11:09:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomId] [int] IDENTITY(1,1) NOT NULL,
	[roomCode] [nvarchar](50) NULL,
	[locationId] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomDevice]    Script Date: 6/29/2020 11:09:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomDevice](
	[roomDeviceId] [int] IDENTITY(1,1) NOT NULL,
	[roomId] [int] NULL,
	[deviceId] [int] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomDeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 6/29/2020 11:09:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[shiftId] [int] IDENTITY(1,1) NOT NULL,
	[userLocationId] [int] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[roomId] [int] NULL,
	[shiftType] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[shiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/29/2020 11:09:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[phone] [int] NULL,
	[dateOfBirth] [datetime] NULL,
	[gender] [int] NULL,
	[deviceToken] [nvarchar](300) NULL,
	[roleId] [int] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLocation]    Script Date: 6/29/2020 11:09:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLocation](
	[userLocationId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[locationId] [int] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Device] ON 

INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (1, N'Rasp1', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (2, N'Rasp2', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (3, N'Rasp3', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (4, N'Rasp4', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (5, N'Rasp5', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (6, N'Rasp6', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (7, N'Rasp7', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (8, N'Rasp8', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (9, N'Rasp9', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (10, N'Rasp10', 1, 1)
INSERT [dbo].[Device] ([deviceId], [deviceCode], [deviceStatus], [isActive]) VALUES (11, N'Rasp11', 1, 1)
SET IDENTITY_INSERT [dbo].[Device] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([locationId], [locationCode], [isActive]) VALUES (1, N'Khu A', 1)
INSERT [dbo].[Location] ([locationId], [locationCode], [isActive]) VALUES (2, N'Khu B', 1)
INSERT [dbo].[Location] ([locationId], [locationCode], [isActive]) VALUES (3, N'Khu C', 1)
INSERT [dbo].[Location] ([locationId], [locationCode], [isActive]) VALUES (4, N'Khu D', 1)
INSERT [dbo].[Location] ([locationId], [locationCode], [isActive]) VALUES (5, N'Khu A3', 0)
INSERT [dbo].[Location] ([locationId], [locationCode], [isActive]) VALUES (6, N'string', 0)
INSERT [dbo].[Location] ([locationId], [locationCode], [isActive]) VALUES (7, N'string2', 0)
INSERT [dbo].[Location] ([locationId], [locationCode], [isActive]) VALUES (8, N'string', 1)
INSERT [dbo].[Location] ([locationId], [locationCode], [isActive]) VALUES (9, N'string', 1)
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleId], [roleName], [isActive]) VALUES (1, N'admin', 1)
INSERT [dbo].[Role] ([roleId], [roleName], [isActive]) VALUES (2, N'manager', 1)
INSERT [dbo].[Role] ([roleId], [roleName], [isActive]) VALUES (3, N'worker', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (1, N'A1', 1, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (2, N'A2', 1, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (3, N'A3', 1, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (4, N'A4', 1, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (5, N'B1', 2, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (6, N'B2', 2, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (7, N'B3', 2, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (8, N'C1', 3, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (9, N'C2', 3, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (10, N'D1', 4, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (11, N'D2', 4, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [locationId], [isActive]) VALUES (15, N'string', 8, 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomDevice] ON 

INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (1, 1, 2, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (2, 2, 3, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (3, 3, 5, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (4, 4, 4, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (5, 5, 6, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (6, 6, 7, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (7, 7, 1, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (8, 8, 8, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (9, 9, 9, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (10, 10, 11, NULL, NULL, 1)
INSERT [dbo].[RoomDevice] ([roomDeviceId], [roomId], [deviceId], [startDate], [endDate], [isActive]) VALUES (11, 11, 10, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[RoomDevice] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userId], [userName], [password], [phone], [dateOfBirth], [gender], [deviceToken], [roleId], [isActive]) VALUES (1, N'cu hac', N'1', 123, CAST(N'2020-06-18T00:00:00.000' AS DateTime), 1, NULL, 1, 1)
INSERT [dbo].[User] ([userId], [userName], [password], [phone], [dateOfBirth], [gender], [deviceToken], [roleId], [isActive]) VALUES (2, N'ong giao', N'1', 1, CAST(N'2020-06-18T00:00:00.000' AS DateTime), NULL, NULL, 2, 1)
INSERT [dbo].[User] ([userId], [userName], [password], [phone], [dateOfBirth], [gender], [deviceToken], [roleId], [isActive]) VALUES (3, N'chi', N'1', 1, CAST(N'2020-06-18T00:00:00.000' AS DateTime), NULL, NULL, 3, 1)
INSERT [dbo].[User] ([userId], [userName], [password], [phone], [dateOfBirth], [gender], [deviceToken], [roleId], [isActive]) VALUES (4, N'tu', N'1', 1, CAST(N'2020-06-18T00:00:00.000' AS DateTime), NULL, NULL, 3, 1)
INSERT [dbo].[User] ([userId], [userName], [password], [phone], [dateOfBirth], [gender], [deviceToken], [roleId], [isActive]) VALUES (5, N'hoang', N'1', 1, CAST(N'2020-06-18T00:00:00.000' AS DateTime), NULL, NULL, 3, 1)
INSERT [dbo].[User] ([userId], [userName], [password], [phone], [dateOfBirth], [gender], [deviceToken], [roleId], [isActive]) VALUES (6, N'dat', N'1', 1, CAST(N'2020-06-18T00:00:00.000' AS DateTime), NULL, NULL, 3, 1)
INSERT [dbo].[User] ([userId], [userName], [password], [phone], [dateOfBirth], [gender], [deviceToken], [roleId], [isActive]) VALUES (7, N'ong giao 2', N'1', 1, NULL, NULL, NULL, 2, 1)
INSERT [dbo].[User] ([userId], [userName], [password], [phone], [dateOfBirth], [gender], [deviceToken], [roleId], [isActive]) VALUES (8, N'ong giao 3', N'1', 1, NULL, NULL, NULL, 2, 1)
INSERT [dbo].[User] ([userId], [userName], [password], [phone], [dateOfBirth], [gender], [deviceToken], [roleId], [isActive]) VALUES (9, N'string', N'string', 0, CAST(N'2020-06-29T14:52:08.573' AS DateTime), 0, N'string', 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLocation] ON 

INSERT [dbo].[UserLocation] ([userLocationId], [userId], [locationId], [startDate], [endDate], [isActive]) VALUES (1, 2, 1, CAST(N'2020-06-10T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[UserLocation] ([userLocationId], [userId], [locationId], [startDate], [endDate], [isActive]) VALUES (2, 2, 2, CAST(N'2020-06-10T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[UserLocation] ([userLocationId], [userId], [locationId], [startDate], [endDate], [isActive]) VALUES (3, 7, 3, CAST(N'2020-06-10T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[UserLocation] ([userLocationId], [userId], [locationId], [startDate], [endDate], [isActive]) VALUES (4, 8, 4, CAST(N'2020-06-10T00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[UserLocation] OFF
GO
/****** Object:  Index [FK]    Script Date: 6/29/2020 11:09:18 PM ******/
CREATE NONCLUSTERED INDEX [FK] ON [dbo].[Record]
(
	[deviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK]    Script Date: 6/29/2020 11:09:18 PM ******/
CREATE NONCLUSTERED INDEX [FK] ON [dbo].[Room]
(
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK]    Script Date: 6/29/2020 11:09:18 PM ******/
CREATE NONCLUSTERED INDEX [FK] ON [dbo].[RoomDevice]
(
	[roomId] ASC,
	[deviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK]    Script Date: 6/29/2020 11:09:18 PM ******/
CREATE NONCLUSTERED INDEX [FK] ON [dbo].[Shift]
(
	[userLocationId] ASC,
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK]    Script Date: 6/29/2020 11:09:18 PM ******/
CREATE NONCLUSTERED INDEX [FK] ON [dbo].[User]
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK]    Script Date: 6/29/2020 11:09:18 PM ******/
CREATE NONCLUSTERED INDEX [FK] ON [dbo].[UserLocation]
(
	[userId] ASC,
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Device] FOREIGN KEY([deviceId])
REFERENCES [dbo].[Device] ([deviceId])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Device]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Location] FOREIGN KEY([locationId])
REFERENCES [dbo].[Location] ([locationId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Location]
GO
ALTER TABLE [dbo].[RoomDevice]  WITH CHECK ADD  CONSTRAINT [FK_RoomDevice_Device] FOREIGN KEY([deviceId])
REFERENCES [dbo].[Device] ([deviceId])
GO
ALTER TABLE [dbo].[RoomDevice] CHECK CONSTRAINT [FK_RoomDevice_Device]
GO
ALTER TABLE [dbo].[RoomDevice]  WITH CHECK ADD  CONSTRAINT [FK_RoomDevice_Room] FOREIGN KEY([roomId])
REFERENCES [dbo].[Room] ([roomId])
GO
ALTER TABLE [dbo].[RoomDevice] CHECK CONSTRAINT [FK_RoomDevice_Room]
GO
ALTER TABLE [dbo].[Shift]  WITH CHECK ADD  CONSTRAINT [FK_Shift_Room] FOREIGN KEY([roomId])
REFERENCES [dbo].[Room] ([roomId])
GO
ALTER TABLE [dbo].[Shift] CHECK CONSTRAINT [FK_Shift_Room]
GO
ALTER TABLE [dbo].[Shift]  WITH CHECK ADD  CONSTRAINT [FK_Shift_UserLocation] FOREIGN KEY([userLocationId])
REFERENCES [dbo].[UserLocation] ([userLocationId])
GO
ALTER TABLE [dbo].[Shift] CHECK CONSTRAINT [FK_Shift_UserLocation]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[UserLocation]  WITH CHECK ADD  CONSTRAINT [FK_UserLocation_Location] FOREIGN KEY([locationId])
REFERENCES [dbo].[Location] ([locationId])
GO
ALTER TABLE [dbo].[UserLocation] CHECK CONSTRAINT [FK_UserLocation_Location]
GO
ALTER TABLE [dbo].[UserLocation]  WITH CHECK ADD  CONSTRAINT [FK_UserLocation_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[UserLocation] CHECK CONSTRAINT [FK_UserLocation_User]
GO
USE [master]
GO
ALTER DATABASE [DWDB] SET  READ_WRITE 
GO
