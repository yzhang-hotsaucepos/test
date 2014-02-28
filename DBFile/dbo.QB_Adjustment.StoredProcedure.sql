USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[QB_Adjustment]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QB_Adjustment]
	-- Add the parameters for the stored procedure here
	@EventID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    declare @BeginTime datetime
    declare @EndTime datetime
    declare @ProfileID int
    select @BeginTime=BeginTime,@EndTime=EndTime,@ProfileID=ProfileID from QB_Event where RefNum=@EventID
	
	--adjustment
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,SUM(oli.qty*oli.AdjustedPrice) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join 
	(  
	select AdjustedPrice,qty,case when RecordType='Void' then (select Name from Void where id=AdjustID and StoreID=o.StoreID) 
  when RecordType='Coupon' then (select Name from Coupon where id=AdjustID and StoreID=o.StoreID)
  when RecordType='Discount' then (select Name from Discount where id=AdjustID and StoreID=o.StoreID)
  when RecordType='Comp' then (select Name from Comp where id=AdjustID and StoreID=o.StoreID) end AdjustName,
  RecordType,StoreID
  from dbo.[fnOrderLineItemTable1](@BeginTime,@EndTime) o
  where StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID) and RecordType<>'NONE'
  --and RecordType in (select EventDataType from QB_EventType where RefNum=@EventID)
  )  oli 
  on am.StoreID=oli.StoreID and am.AdjustType=oli.RecordType and am.AdjustName=oli.AdjustName
  inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
   inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	where am. StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType,ac.Name,ac1.Name
	
	-- GrossSales
	Union all
	
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,SUM(Adjustments) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join (
	select SUM(o.qty*o.Price) Adjustments,o.StoreID,mi.Department from dbo.[fnOrderLineItemTable1](@BeginTime,@EndTime) o
	 inner join MenuItem mi on mi.ID=o.ItemID and mi.StoreID=o.StoreID
	  group by o.StoreID,mi.Department) oli 
	on am.StoreID=oli.StoreID and am.AdjustType= 'Gross Sales' and oli.Department=am.AdjustName
	inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
	 inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	where am.StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType,ac.Name,ac1.Name 
	
	--GCSales
	Union all
	
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,SUM(Adjustments) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join (
	select SUM(o.qty*o.Price) Adjustments,o.StoreID,mi.Department,o.RecordType from dbo.[fnOrderLineItemTable1](@BeginTime,@EndTime) o
	 inner join MenuItem mi on mi.ID=o.ItemID and mi.StoreID=o.StoreID and mi.MIType='GC'
	  group by o.StoreID,mi.Department,o.RecordType) oli 
	on am.StoreID=oli.StoreID and am.AdjustType= 'Other Income' and am.AdjustName='Gift Certificate Sales'
	inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
	 inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	where oli.RecordType <> 'VOID' and oli.RecordType <>'comp'  
	and am.StoreID in(select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType,ac.Name,ac1.Name 
	
	--Paid In
	Union all
	
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,isnull(SUM(ISNULL(Amount,0)),0) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join (select SUM(Amount) Amount,storeid from   dbo.fnPaidInTrxTable1(@BeginTime,@EndTime)
	where Status='PAID_IN' group by StoreID)  pit 
	on am.StoreID=pit.StoreID and am.AdjustType= 'Other Income' and am.AdjustName='Paid Ins'
	inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
	 inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	where 
	 am.StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType,ac.Name,ac1.Name
	
	--In House Payment Sales
	Union all
	
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,isnull(sum(Adjustments),0) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am  inner join (
	select SUM(o.qty*o.Price) Adjustments,o.StoreID,mi.Department,o.RecordType from dbo.[fnOrderLineItemTable1](@BeginTime,@EndTime) o
	 inner join MenuItem mi on mi.ID=o.ItemID and mi.StoreID=o.StoreID and mi.MIType='IHPYMNT'
	  group by o.StoreID,mi.Department,o.RecordType)  oli
	on am.StoreID=oli.StoreID and am.AdjustType= 'Other Income' and am.AdjustName='In House Payments'
	inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
	 inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	where oli.RecordType <> 'VOID' and
	 am.StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType,ac.Name,ac1.Name
	
	--Advance Payment
	Union all
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,isnull(sum(p.Amount),0) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join (select sum(a.Amount) Amount,a.StoreID from dbo.fnPaymentTable1(@BeginTime,@EndTime) a inner join
	dbo.fnCheckTable1(@BeginTime,@EndTime) b on a.StoreID=b.StoreID and b.ID=a.CheckID
	where b.FutureOrderAdvPayment='Y'
	 group by a.StoreID) p on p.StoreID=am.StoreID
	 inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
	  inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	where  am.AdjustType='Other Income' and am.AdjustName='Advance Payments (net)' and
	am.StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType,ac.Name,ac1.Name 
	
	--Surcharge Collected
	Union all
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,isnull(sum(tax.TaxAmt),0) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join (Select isnull(Sum(ISNULL((case when ss.SurchargeGuestPays='Y' then TaxAmt else 0 end),0)),0) TaxAmt,a.StoreID
From dbo.fnTaxTable1(@BeginTime,@EndTime) A 
JOIN TaxCategory B on a.TaxCategoryID = b.ID and B.Category='SUR' and  A.Category=B.Category 
	left outer join StoreSetting as ss on A.StoreID =ss.StoreID
	group by A.StoreID) tax on am.StoreID=tax.StoreID 
	inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
	 inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	where  am.AdjustType='Other Income' and am.AdjustName='Surcharge Collected' and
	am.StoreID in(select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType ,ac.Name,ac1.Name

--Paid Out
	Union all
	
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,isnull(SUM(ISNULL(Amount,0)),0) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join (select SUM(Amount) Amount,storeid from dbo.fnPaidOutTrxTable1(@BeginTime,@EndTime)
	group by StoreID ) pit 
	on am.StoreID=pit.StoreID and am.AdjustType= 'Other Income' and am.AdjustName='Paid Outs'
	inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
	 inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	where 
	 am.StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType,ac.Name,ac1.Name 
	
	
	--Previous payments from Future Order
	
	Union all
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,isnull(SUM(ISNULL(Amount,0)),0) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join (select isnull(SUM(ISNULL(p.amount,0) ),0) Amount,p.StoreID
 From dbo.fnPaymentTable1(@BeginTime,@EndTime) as p
  inner JOIN dbo.fnCheckTable1(@BeginTime,@EndTime) as c ON p.CheckID = c.ID and p.StoreID=c.StoreID  
 inner JOIN dbo.fnOrderTable1(@BeginTime,@EndTime) as O ON c.orderid = O.ID  and O.StoreID=c.StoreID and c.BusinessDate=O.BusinessDate
 where O.FutureOrder = 'Y'	group by p.StoreID) a
 on a.StoreID=am.StoreID
 inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
  inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
 where am.AdjustType= 'Other Income' and am.AdjustName='Previous payments from Future Order' and
	am.StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType,ac.Name,ac1.Name
	
	--Tax
	Union all
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,isnull(SUM(ISNULL(TaxAmt,0)),0) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join (Select tc.Name as TaxName, isnull(SUM(ISNULL(t.TaxAmt,0)),0) as TaxAmt,t.StoreID
			From dbo.fnTaxTable1(@BeginTime,@EndTime) as t inner JOIN TaxCategory tc 
				ON t.TaxCategoryID = tc.ID and t.Category COLLATE SQL_Latin1_General_CP1_CI_AS=tc.Category and tc.StoreID= t.StoreID
	Where  t.Category = 'TAX' 
	Group By tc.Name,t.StoreID) tax
	on am.StoreID=tax.StoreID and am.AdjustName=tax.TaxName
	inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
	 inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	 where am.AdjustType= 'Tax'  and
	am.StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType ,ac.Name,ac1.Name
	
	Union all
	--Payment
	select @EventID EventID,@BeginTime BeginTime,@EndTime EndTime,isnull(SUM(ISNULL(sales,0)),0) Adjustments
	,am.AdjustName,am.AdjustType,am.QBType,ac.Name QBName,ac1.Name as ClassName 
	from [QB_AdjustmentMatch] am inner join (SELECT 
	isnull(SUM(isnull(p.Amount,0)),0) AS sales,P.StoreID,pm.Name
	FROM dbo.fnPaymentTable1(@BeginTime,@EndTime) AS p 
	INNER JOIN PaymentMethod AS pm ON p.MethodID = pm.Name AND pm.StoreID = p.StoreID
	GROUP BY pm.Name,P.StoreID) payment
	on am.StoreID=payment.StoreID and am.AdjustName=payment.Name
	inner join QB_AdjustmentCategory ac on ac.ID=am.QBID
	 inner join QB_AdjustmentCategory ac1 on ac1.ID=am.QBClassID
	where am.AdjustType= 'Payment'  and
	am.StoreID in (select StoreID from QB_ProfileMachStore where ProfileID=@ProfileID)
	--and am.AdjustType in (select EventDataType from QB_EventType where RefNum=@EventID)
	group by am.AdjustName,am.AdjustType, am.QBType  ,ac.Name,ac1.Name 
	
END
GO
