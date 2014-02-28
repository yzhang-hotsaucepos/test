USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetEnterpriseByID]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Labor_GetEnterpriseByID]
@EmpID int,
@StoreID int,
@Type int
as
begin
if(@Type=0)
	begin
		select * from EnterpriseUser where EmployeeID = @EmpID AND StoreID = @StoreID
	end
end
GO
