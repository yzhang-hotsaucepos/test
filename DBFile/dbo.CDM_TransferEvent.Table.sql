USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[CDM_TransferEvent]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDM_TransferEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EditorID] [int] NOT NULL,
	[EditorName] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[StoreIDs] [nvarchar](max) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_CDMTransferEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
