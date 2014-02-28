USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[StoreID] [int] NOT NULL,
	[CheckID] [bigint] NOT NULL,
	[LineNum] [int] NOT NULL,
	[MethodID] [nvarchar](50) NOT NULL,
	[Amount] [money] NULL,
	[AmountReceived] [money] NULL,
	[Tip] [money] NULL,
	[Gratuity] [money] NULL,
	[BusinessDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[CheckID] ASC,
	[LineNum] ASC,
	[BusinessDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
