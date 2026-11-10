USE [exer1]
GO
/****** Objeto:  Table [dbo].[projects]    Data do Script: 09/11/2026 22:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projects](
	[id] [int] IDENTITY(10001,1) NOT NULL,
	[name] [varchar](45) NOT NULL,
	[description] [varchar](45) NOT NULL,
	[date_proj] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[user_has_projects]    Data do Script: 09/11/2026 22:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_has_projects](
	[users_id] [int] NOT NULL,
	[projects_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[users_id] ASC,
	[projects_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[users]    Data do Script: 09/11/2026 22:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NOT NULL,
	[username] [varchar](10) NOT NULL,
	[password] [varchar](8) NOT NULL,
	[email] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('123mudar') FOR [password]
GO
ALTER TABLE [dbo].[user_has_projects]  WITH CHECK ADD  CONSTRAINT [fk_projects] FOREIGN KEY([projects_id])
REFERENCES [dbo].[projects] ([id])
GO
ALTER TABLE [dbo].[user_has_projects] CHECK CONSTRAINT [fk_projects]
GO
ALTER TABLE [dbo].[user_has_projects]  WITH CHECK ADD  CONSTRAINT [fk_users] FOREIGN KEY([users_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_has_projects] CHECK CONSTRAINT [fk_users]
GO
ALTER TABLE [dbo].[projects]  WITH NOCHECK ADD  CONSTRAINT [resDate] CHECK  (([date_proj]>'2014-09-12'))
GO
ALTER TABLE [dbo].[projects] CHECK CONSTRAINT [resDate]
GO
