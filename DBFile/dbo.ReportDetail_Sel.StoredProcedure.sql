USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[ReportDetail_Sel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReportDetail_Sel]
@ReportListID int
AS
BEGIN
SET NOCOUNT ON;
	if @ReportListID>0
	begin
		select rd.ID ,rd.Name as detailName,rd.DisplayName,rd.Describe,rl.name as listName 
		from reportDetail as rd inner join ReportList as rl on rl.id=rd.ReportListID
		where rl.ID=@ReportListID
		order by rl.Name asc
	end
	else
	begin
		select rd.ID ,rd.Name as detailName,rd.DisplayName,rd.Describe
		from reportDetail as rd 
		order by rd.Name asc
	end
END
GO
