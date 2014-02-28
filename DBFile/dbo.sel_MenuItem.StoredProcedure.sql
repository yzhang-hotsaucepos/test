USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_MenuItem]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_MenuItem]
(
	@storeID int,
	@CategoryName nvarchar(20)
)
as
if ISNULL(@storeID,0)=0
begin
	if ISNULL(@CategoryName,'')=''
	select distinct Department+'/'+Category Name,Department+'/'+Category ItemID
	,case when	(select COUNT(*) from MenuItem where Department=mi.Department and Category=mi.Category
	and Name not in (select imi.Name from Inv_MenuItem imi inner join Inv_MenuItemCategory mic
	on imi.CategoryID=mic.ID where mic.Name=mi.Category and 
	(select Name from Inv_ItemGroup where ID=mic.GroupID)=mi.Department) )>0
	then 0 else 1 end IsImport from MenuItem mi order by Department+'/'+Category
	else
	begin
		select distinct Name,ID ItemID,
		case when	(select COUNT(*) from Inv_MenuItem imi inner join Inv_MenuItemCategory mic
	on imi.CategoryID=mic.ID where mic.Name=mi.Category and imi.Name=mi.Name and
	(select Name from Inv_ItemGroup where ID=mic.GroupID)=mi.Department)>0 then 1 else 0 end IsImport,
		@CategoryName as CategoryName ,mi.Price
		 from MenuItem mi where Department+'/'+Category=@CategoryName 
		 order by Name
	end
end
else
begin
	if ISNULL(@CategoryName,'')=''
	begin
		select distinct Department+'/'+Category Name,Department+'/'+Category ItemID from MenuItem where StoreID=@storeID 
	end
	else
	begin
		select distinct Name,ID ItemID from MenuItem where StoreID=@storeID and Department+'/'+Category=@CategoryName Order By Name
	end
end
GO
