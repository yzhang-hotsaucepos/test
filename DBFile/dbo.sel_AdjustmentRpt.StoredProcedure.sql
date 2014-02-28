USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_AdjustmentRpt]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_AdjustmentRpt]
(
	@storeID int,
	@AdjustType nvarchar(20)
)
as
begin
set nocount on
declare @sql nvarchar(max)
set @sql ='select distinct Name+'''+'('+@AdjustType+')'+''' as Name  from  '+@AdjustType
if @storeID>0
begin
	set @sql+= ' where storeID='+CONVERT(nvarchar,@storeID) 
end
exec sp_executesql @sql
end
GO
