USE [ClearHotsauceEnterprise]
GO
/****** Object:  Table [dbo].[Inv_InvoiceAttach]    Script Date: 02/28/2014 15:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_InvoiceAttach](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[FilePath] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[FileType] [nvarchar](50) NOT NULL,
	[FileAlias] [nvarchar](200) NOT NULL,
	[FileName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Inv_InvoiceAttach] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inv_InvoiceAttach]  WITH CHECK ADD  CONSTRAINT [FK_Inv_InvoiceAttach_Inv_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Inv_Invoice] ([ID])
GO
ALTER TABLE [dbo].[Inv_InvoiceAttach] CHECK CONSTRAINT [FK_Inv_InvoiceAttach_Inv_Invoice]
GO
