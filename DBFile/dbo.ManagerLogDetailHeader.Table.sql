USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[ManagerLogDetailHeader]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerLogDetailHeader](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ManagerLogID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[StoreID] [int] NULL,
	[LogDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ManagerLogDetailHeader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ManagerLogDetailHeader]  WITH CHECK ADD  CONSTRAINT [managerLog_fk] FOREIGN KEY([ManagerLogID])
REFERENCES [dbo].[ManagerLog] ([ID])
GO
ALTER TABLE [dbo].[ManagerLogDetailHeader] CHECK CONSTRAINT [managerLog_fk]
GO
ALTER TABLE [dbo].[ManagerLogDetailHeader] ADD  CONSTRAINT [DF_ManagerLogDetailHeader_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
