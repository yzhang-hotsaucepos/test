USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_EmployeeByRpt]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_EmployeeByRpt]
(
	@StoreID int
)
as
select distinct e.ID as EmployeeID,e.FirstName+' '+e.LastName as EmployeeName from Employee as e
LEFT OUTER JOIN EmployeeJob as ej on ej.StoreID=e.StoreID and ej.EmployeeID=e.ID
 where e.StoreID=@StoreID  and ej.WageType = 'HOURLY' AND e.HasPayrollReport = 1 order by e.FirstName+' '+e.LastName
GO
