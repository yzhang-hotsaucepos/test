USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[GetAllRevenueCenter]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllRevenueCenter]
(
	@StoreID int
)
as
SET NOCOUNT ON;
select dbo.fn_GetRevenueCenter(@StoreID)
GO
