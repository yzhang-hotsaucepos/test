USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CheckArchive]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CheckArchive](
	[StoreID] [int] NOT NULL,
	[ID] [bigint] NOT NULL,
	[SaleTime] [datetime] NULL,
	[OrderID] [bigint] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Seat] [nvarchar](200) NOT NULL,
	[FutureOrderAdvPayment] [char](1) NOT NULL,
	[BusinessDate] [datetime] NOT NULL,
	[Status] [nvarchar](20) NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_CheckArchive] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
