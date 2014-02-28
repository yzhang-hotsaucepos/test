USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[LoopingCalculateDailySummaryByTransDateRecordMinute]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoopingCalculateDailySummaryByTransDateRecordMinute]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

declare @storeID int
declare @BeginTime as datetime=CONVERT(varchar(12) , dateadd(day,-1, getdate()), 101 ) 
declare @EndTime as datetime=CONVERT(varchar(12) , getdate(), 101 ) 

declare curTransDateRecord cursor for 
select ID from Store
open curTransDateRecord
fetch next from curTransDateRecord into @storeID
while (@@FETCH_STATUS=0)
begin
exec CalculateDailySummaryPeriod  @BeginTime,@EndTime,@storeID

fetch next from curTransDateRecord into @storeID
end
CLOSE curTransDateRecord
DEALLOCATE curTransDateRecord
END
GO
