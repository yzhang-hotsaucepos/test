USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[ReportParameter_sel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReportParameter_sel]
(
	@ReportDetailID int
)
as
select * from ReportParameter where ReportDetailID=@ReportDetailID
GO
