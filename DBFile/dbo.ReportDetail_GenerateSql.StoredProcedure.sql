USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[ReportDetail_GenerateSql]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReportDetail_GenerateSql]

as
declare @sql nvarchar(max)
declare @id int
declare @name nvarchar(50)
declare @DisplayName nvarchar(50)
declare @Describe nvarchar(50)
declare @ReportListID int
set @sql=''
declare cur cursor  for select id,name,DisplayName,Describe,ReportListID from Reportdetail where reportListID=-1
open cur
fetch next from cur into @id,@name,@DisplayName,@Describe,@ReportListID
while @@FETCH_STATUS=0
begin
	set @sql=@sql+'insert into Reportdetail(id,name,DisplayName,Describe,ReportListID) values('+CONVERT(nvarchar(20),@id)+','''+@name+''','''+@DisplayName+''','''
	+@Describe+''','+convert(nvarchar(20),@ReportListID)+')'
	fetch next from cur into @id,@name,@DisplayName,@Describe,@ReportListID
end
close cur
deallocate cur
select @sql
GO
