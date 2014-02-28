USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_D_NumGuestSummaryByStoreByDay]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Rpt_D_NumGuestSummaryByStoreByDay]
(
	@BeginDate datetime,
	@EndDate datetime,
	@storeID nvarchar(200)
)
as
declare @sql nvarchar(max)
SET NOCOUNT ON;
set @sql='Select s.StoreName as StoreName,
sum(o.GuestCount) as NumGuests
From [Order] as o inner join Store as s ON o.StoreID = s.ID WHERE  BusinessDate between '''+CONVERT(nvarchar(20),@BeginDate)+''' and '''+CONVERT(nvarchar(20),@EndDate)+''' and o.StoreID in ('+@storeID+') Group by s.StoreName'

execute sp_executesql @sql
--select @sql
GO
