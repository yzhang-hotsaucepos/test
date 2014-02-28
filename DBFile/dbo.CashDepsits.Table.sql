USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CashDepsits]    Script Date: 02/28/2014 15:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashDepsits](
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[BusinessDate] [smalldatetime] NOT NULL,
	[CashDeposit] [money] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_CashDeosits] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
