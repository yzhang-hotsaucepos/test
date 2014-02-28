USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AllowShiftTrades] [bit] NULL,
	[ManagerApprovalforTrades] [bit] NULL,
	[View/PrintAllSchedules] [bit] NULL,
	[Status] [nvarchar](20) NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[ID] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [FK_Position_Position] FOREIGN KEY([ID], [StoreID])
REFERENCES [dbo].[Position] ([ID], [StoreID])
GO
ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [FK_Position_Position]
GO
