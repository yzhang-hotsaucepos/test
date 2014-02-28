USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[DeliveryReimbursements]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryReimbursements](
	[StoreID] [int] NOT NULL,
	[EmployeeID] [nchar](10) NOT NULL,
	[ReimbursementTtl] [money] NULL,
	[Status] [nvarchar](10) NULL,
	[BusinessDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_DeliveryReimbursements_1] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeliveryReimbursements] ADD  CONSTRAINT [DF_DeliveryReimbursements_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
