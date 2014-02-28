USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborAvailabilityTime]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborAvailabilityTime](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WeekDays] [nvarchar](50) NOT NULL,
	[TimeScale] [nvarchar](50) NOT NULL,
	[AvailabilityID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_AvailabilityTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
