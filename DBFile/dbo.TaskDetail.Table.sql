USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[TaskDetail]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ResolveUserID] [int] NULL,
	[ResolveTime] [datetime] NOT NULL,
	[AssignedStoreID] [int] NULL,
	[Enable] [bit] NULL,
 CONSTRAINT [PK_TaskDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键,任务明细' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskDetail', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskDetail', @level2type=N'COLUMN',@level2name=N'TaskID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskDetail', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskDetail', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'指派的员工' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskDetail', @level2type=N'COLUMN',@level2name=N'ResolveUserID'
GO
ALTER TABLE [dbo].[TaskDetail]  WITH CHECK ADD  CONSTRAINT [FK_TaskDetail_EnterpriseEmplyee] FOREIGN KEY([ResolveUserID])
REFERENCES [dbo].[EnterpriseUser] ([ID])
GO
ALTER TABLE [dbo].[TaskDetail] CHECK CONSTRAINT [FK_TaskDetail_EnterpriseEmplyee]
GO
ALTER TABLE [dbo].[TaskDetail]  WITH CHECK ADD  CONSTRAINT [FK_TaskDetail_Task1] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task] ([ID])
GO
ALTER TABLE [dbo].[TaskDetail] CHECK CONSTRAINT [FK_TaskDetail_Task1]
GO
