USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_PositionRpt]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_PositionRpt]
(
	@storeID int
)
as
begin
set nocount on
declare @sql nvarchar(max)
set @sql =' select distinct Name from Position '
if @storeID>0
begin
	set @sql+= ' where storeID='+CONVERT(nvarchar,@storeID) 
end
exec sp_executesql @sql
end
GO
