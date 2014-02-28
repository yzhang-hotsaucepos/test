USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[QB_ProfileMachStore]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QB_ProfileMachStore](
	[ProfileID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_QB_ProfileMachStore] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QB_ProfileMachStore]  WITH CHECK ADD  CONSTRAINT [FK_QB_ProfileMachStore_QB_Profile] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[QB_Profile] ([ID])
GO
ALTER TABLE [dbo].[QB_ProfileMachStore] CHECK CONSTRAINT [FK_QB_ProfileMachStore_QB_Profile]
GO
