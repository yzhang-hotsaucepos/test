USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_D_NumTableByRcByDay]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Rpt_D_NumTableByRcByDay]
	@BeginDate datetime,
	@EndDate datetime,
	@storeID nvarchar(200)
AS  
BEGIN
declare @sql nvarchar(max)
SET NOCOUNT ON;

set @sql='Select o.RevenueCenter RevenueCenter,
	count(o.ID) as NumTables
	--sum(o.GuestCount) as NumGuest   
	From [Order] as o 
	where o.BusinessDate between '''+CONVERT(nvarchar(20),@BeginDate)+''' and '''+CONVERT(nvarchar(20),@EndDate)+''' and o.StoreID in ('+@storeID+')'
set @sql+=' GROUP BY o.RevenueCenter '

--select @sql
exec sp_executesql @sql
end
GO
