USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[inv_rpt_variance]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[inv_rpt_variance]
(
	@BeginTime datetime,
	@endTime datetime,
	@StoreID nvarchar(200),
	@ItemID int
)
as
if @ItemID=0
begin
select s.StoreName,s.id StoreID, ic1.Name+'/'+ic.Name Category ,item.ID ItemID,item.Description ItemName,
isnull((select UnitOnHand from inv_itemtostoreArchive where ItemID=item.ID and StoreID=s.ID and BusinessDate=@BeginTime),0) BegInv,
isnull((select sum(Qty) from Inv_Invoice i inner join Inv_InvoiceDetail id on i.ID=id.InvoiceID where CONVERT(datetime, CONVERT(nvarchar(20), i.InvoiceDate,101)) between @BeginTime and @endTime and i.storeid=s.ID),0) UnitsPurchased,
isnull((select UnitOnHand from inv_itemtostoreArchive where ItemID=item.ID and StoreID=s.ID and BusinessDate=@endTime),0) EndInv,
isnull((select sum(Usage) from Inv_ItemUsages where InvItemID=item.ID and StoreID=s.ID and BusinessDate between @BeginTime and @endTime),0) Usage
 from inv_item item inner join Inv_ItemCategory ic on item.CategoryID=ic.ID
inner join Inv_ItemCategory ic1 on ic1.ID=ic.ParentID
inner join Store s on s.ID in (select * from dbo.f_split(@StoreID,','))
group by s.StoreName,s.id,ic.ID,ic1.Name+'/'+ic.Name,item.ID,item.Description 
end
else
begin
	select s.StoreName,s.id StoreID, ic1.Name+'/'+ic.Name Category ,item.ID ItemID,item.Description ItemName,
isnull((select UnitOnHand from inv_itemtostoreArchive where ItemID=item.ID and StoreID=s.ID and BusinessDate=@BeginTime),0) BegInv,
isnull((select sum(Qty) from Inv_Invoice i inner join Inv_InvoiceDetail id on i.ID=id.InvoiceID where CONVERT(datetime, CONVERT(nvarchar(20), i.InvoiceDate,101)) between @BeginTime and @endTime and i.storeid=s.ID),0) UnitsPurchased,
isnull((select UnitOnHand from inv_itemtostoreArchive where ItemID=item.ID and StoreID=s.ID and BusinessDate=@endTime),0) EndInv,
isnull((select sum(Usage) from Inv_ItemUsages where InvItemID=item.ID and StoreID=s.ID and BusinessDate between @BeginTime and @endTime),0) Usage
 from inv_item item inner join Inv_ItemCategory ic on item.CategoryID=ic.ID
inner join Inv_ItemCategory ic1 on ic1.ID=ic.ParentID
inner join Store s on s.ID in (select * from dbo.f_split(@StoreID,',')) where item.ID=@ItemID
group by s.StoreName,s.id,ic.ID,ic1.Name+'/'+ic.Name,item.ID,item.Description 
end
GO
