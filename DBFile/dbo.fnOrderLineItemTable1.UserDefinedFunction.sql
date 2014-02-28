USE [ClearHotsauceEnterprise]
GO
/****** Object:  UserDefinedFunction [dbo].[fnOrderLineItemTable1]    Script Date: 02/28/2014 15:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fnOrderLineItemTable1]
(
	@BeginDate datetime,
	@EndDate datetime
)
RETURNS @resultTable TABLE ([StoreID] int,
	[ID] bigint,
	[OrderID] bigint,
	[RecordType] nvarchar(50),
	[ItemID] int,
	[Price] money,
	[Qty] int,
	[Seat] nvarchar(50),
	[AdjustedPrice] money,
	[AdjustID] int,
	[EmployeeID] int,
	[TimeOrdered] datetime,
	[ParentSplitLineNum] int,
	[NumSplits] smallint,
	[SI] nvarchar(3),
	[SIText] nvarchar(50),
	[AsEntree] char(1),
	[BusinessDate] datetime,
	[LastUpdate] datetime)
AS

Begin
declare @historyDate datetime=DATEADD(YEAR,-2,CONVERT(varchar(10), GETDATE(), 120 ))
if(@BeginDate<@historyDate and @EndDate>=@historyDate)
begin
	INSERT INTO @resultTable([StoreID],[ID],[OrderID],[RecordType],[ItemID],[Price],[Qty],[Seat],[AdjustedPrice],[AdjustID],[EmployeeID],[TimeOrdered],[ParentSplitLineNum],[NumSplits],[SI],[SIText],[AsEntree],[BusinessDate],[LastUpdate])
	SELECT [StoreID],[ID],[OrderID],[RecordType],[ItemID],[Price],[Qty],[Seat],[AdjustedPrice],[AdjustID],[EmployeeID],[TimeOrdered],[ParentSplitLineNum],[NumSplits],[SI],[SIText],[AsEntree],[BusinessDate],[LastUpdate]
	FROM [orderlineitem] where [BusinessDate] between @historyDate and @EndDate and status='CLOSE'

	INSERT INTO @resultTable([StoreID],[ID],[OrderID],[RecordType],[ItemID],[Price],[Qty],[Seat],[AdjustedPrice],[AdjustID],[EmployeeID],[TimeOrdered],[ParentSplitLineNum],[NumSplits],[SI],[SIText],[AsEntree],[BusinessDate],[LastUpdate])
	SELECT [StoreID],[ID],[OrderID],[RecordType],[ItemID],[Price],[Qty],[Seat],[AdjustedPrice],[AdjustID],[EmployeeID],[TimeOrdered],[ParentSplitLineNum],[NumSplits],[SI],[SIText],[AsEntree],[BusinessDate],[LastUpdate]
	FROM [orderlineitemArchive] where [BusinessDate] between @BeginDate and @historyDate  and status='CLOSE'

end
else if (@BeginDate>=@historyDate)
begin
	INSERT INTO @resultTable([StoreID],[ID],[OrderID],[RecordType],[ItemID],[Price],[Qty],[Seat],[AdjustedPrice],[AdjustID],[EmployeeID],[TimeOrdered],[ParentSplitLineNum],[NumSplits],[SI],[SIText],[AsEntree],[BusinessDate],[LastUpdate])
	SELECT [StoreID],[ID],[OrderID],[RecordType],[ItemID],[Price],[Qty],[Seat],[AdjustedPrice],[AdjustID],[EmployeeID],[TimeOrdered],[ParentSplitLineNum],[NumSplits],[SI],[SIText],[AsEntree],[BusinessDate],[LastUpdate]
	FROM [orderlineitem] where [BusinessDate] between @BeginDate and @EndDate and status='CLOSE'
end
else if (@EndDate<@historyDate)
begin
INSERT INTO @resultTable([StoreID],[ID],[OrderID],[RecordType],[ItemID],[Price],[Qty],[Seat],[AdjustedPrice],[AdjustID],[EmployeeID],[TimeOrdered],[ParentSplitLineNum],[NumSplits],[SI],[SIText],[AsEntree],[BusinessDate],[LastUpdate])
SELECT [StoreID],[ID],[OrderID],[RecordType],[ItemID],[Price],[Qty],[Seat],[AdjustedPrice],[AdjustID],[EmployeeID],[TimeOrdered],[ParentSplitLineNum],[NumSplits],[SI],[SIText],[AsEntree],[BusinessDate],[LastUpdate]
FROM [orderlineitemArchive] where [BusinessDate] between @BeginDate and @EndDate and status='CLOSE'
end

return 
End
GO
