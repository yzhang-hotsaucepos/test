USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[GroupToFunction]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupToFunction](
	[GroupID] [int] NOT NULL,
	[FunctionID] [int] NOT NULL,
	[AllOrOneShow] [int] NOT NULL,
	[UserID] [int] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_GroupToFunction] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[FunctionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'all store=1 ,one store=2, both =4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupToFunction', @level2type=N'COLUMN',@level2name=N'AllOrOneShow'
GO
ALTER TABLE [dbo].[GroupToFunction]  WITH CHECK ADD  CONSTRAINT [FK_GroupToFunction_function] FOREIGN KEY([FunctionID])
REFERENCES [dbo].[Function] ([ID])
GO
ALTER TABLE [dbo].[GroupToFunction] CHECK CONSTRAINT [FK_GroupToFunction_function]
GO
ALTER TABLE [dbo].[GroupToFunction]  WITH CHECK ADD  CONSTRAINT [FK_GroupToFunction_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([ID])
GO
ALTER TABLE [dbo].[GroupToFunction] CHECK CONSTRAINT [FK_GroupToFunction_Group]
GO
