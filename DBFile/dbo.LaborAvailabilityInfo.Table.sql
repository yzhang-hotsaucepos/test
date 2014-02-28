USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborAvailabilityInfo]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborAvailabilityInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[Audit] [int] NOT NULL,
	[ManagerNotes] [nvarchar](500) NULL,
 CONSTRAINT [PK_LaborAvailabilityInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
