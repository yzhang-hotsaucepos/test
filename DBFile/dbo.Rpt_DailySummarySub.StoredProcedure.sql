USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_DailySummarySub]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Rpt_DailySummarySub]
(
	@BeginTime datetime,
	@endTime datetime,
	@StoreID int
)
as
declare @tipWithHeld decimal(18,2)
execute Rpt_DepartmentSalesSub @BeginTime,@endTime,@StoreID
GO
