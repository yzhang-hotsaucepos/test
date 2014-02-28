USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_TransferDetail]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_TransferDetail](
	[TransferID] [int] NULL,
	[InvItemID] [int] NULL,
	[Qty] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_TransferDetail]  WITH CHECK ADD  CONSTRAINT [FK_Inv_TransferDetail_Inv_Item] FOREIGN KEY([InvItemID])
REFERENCES [dbo].[Inv_Item] ([ID])
GO
ALTER TABLE [dbo].[Inv_TransferDetail] CHECK CONSTRAINT [FK_Inv_TransferDetail_Inv_Item]
GO
ALTER TABLE [dbo].[Inv_TransferDetail]  WITH CHECK ADD  CONSTRAINT [FK_Inv_TransferDetail_Inv_Transfer] FOREIGN KEY([TransferID])
REFERENCES [dbo].[Inv_Transfer] ([ID])
GO
ALTER TABLE [dbo].[Inv_TransferDetail] CHECK CONSTRAINT [FK_Inv_TransferDetail_Inv_Transfer]
GO
