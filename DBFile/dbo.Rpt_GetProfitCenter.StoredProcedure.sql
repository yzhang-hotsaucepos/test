USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_GetProfitCenter]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Rpt_GetProfitCenter]
(
	@StoreID int
)
as
select Name from RevenueCenter where StoreID=@StoreID
GO
