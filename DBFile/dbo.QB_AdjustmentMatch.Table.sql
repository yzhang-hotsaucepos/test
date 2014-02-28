USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[QB_AdjustmentMatch]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QB_AdjustmentMatch](
	[AdjustName] [nvarchar](200) NOT NULL,
	[StoreID] [int] NOT NULL,
	[AdjustType] [nvarchar](50) NOT NULL,
	[QBID] [nvarchar](200) NOT NULL,
	[QBType] [nvarchar](50) NOT NULL,
	[OppQBID] [nvarchar](200) NULL,
	[QBClassID] [nvarchar](200) NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对应QBID的ID，' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QB_AdjustmentMatch', @level2type=N'COLUMN',@level2name=N'OppQBID'
GO
ALTER TABLE [dbo].[QB_AdjustmentMatch]  WITH CHECK ADD  CONSTRAINT [CK_QB_AdjustmentMatch] CHECK  (([QBtype]='DEBIT' OR [QBtype]='CREDIT'))
GO
ALTER TABLE [dbo].[QB_AdjustmentMatch] CHECK CONSTRAINT [CK_QB_AdjustmentMatch]
GO
