USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Sel_EmployeeByJobName]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sel_EmployeeByJobName]
(
	@JobName nvarchar(50),
	@StroeID int
)
as
select eu.FirstName+' '+eu.LastName as employeeName,eu.ID from EmployeeJob ej inner join Position p on ej.PositionID=p.ID and ej.StoreID=p.StoreID
inner join EnterpriseUser  eu on ej.EmployeeID=eu.ID and ej.StoreID=eu.StoreID where 
p.Name=@JobName and p.StoreID=@StroeID
GO
