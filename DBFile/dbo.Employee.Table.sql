USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PayrollID] [nvarchar](50) NULL,
	[SSN] [nvarchar](200) NULL,
	[DOE] [datetime] NULL,
	[Address1] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[EmergencyContact] [nvarchar](50) NULL,
	[EmergencyNumber] [nvarchar](50) NULL,
	[HasPayrollReport] [bit] NOT NULL,
	[EmployeeLastUpdate] [datetime] NULL,
	[JobStatus] [nvarchar](50) NULL,
	[MaritalStatus] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[BirthDate] [datetime] NULL,
	[IsTerminated] [bit] NOT NULL,
	[TerminatedReason] [nvarchar](50) NULL,
	[TerminationDate] [datetime] NULL,
	[Explanation] [nvarchar](500) NULL,
	[DriversLicenseExpDate] [datetime] NULL,
	[InsuranceExpDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[IsShowTipInTime] [bit] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_IsShowTipInTime]  DEFAULT ((1)) FOR [IsShowTipInTime]
GO
