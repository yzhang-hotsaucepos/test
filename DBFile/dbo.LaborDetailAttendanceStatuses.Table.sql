USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[LaborDetailAttendanceStatuses]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaborDetailAttendanceStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceStatusesID] [int] NOT NULL,
	[DetailID] [int] NOT NULL,
 CONSTRAINT [PK_LaborDetailAttendanceStatuses] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
