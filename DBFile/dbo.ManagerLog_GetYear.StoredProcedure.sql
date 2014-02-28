USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[ManagerLog_GetYear]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ManagerLog_GetYear]
(
	@StoreId nvarchar(20),
	@ManagerLogID int
)
as
declare @sql nvarchar(200)
set @sql='
select DATEPART(Year, LogDate) as [Year] from ManagerLogDetailHeader where  StoreID in ('+@StoreId+') and ManagerLogID ='+convert(nvarchar(10),@ManagerLogID)+'
group by DATEPART(Year, LogDate)'
--select @sql
exec sp_executesql @sql
GO
