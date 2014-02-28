USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[MoveEmployeeToEnterpriseUser]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MoveEmployeeToEnterpriseUser]
@StoreID int 
AS
BEGIN
SET NOCOUNT ON;
declare @EmployeeID int 
declare @FirstName  nvarchar(50)
declare @LastName  nvarchar(50)
declare @Phone  nvarchar(50)
declare @Address1  nvarchar(200)
declare @Address2  nvarchar(200)
declare @City  nvarchar(50)
declare @ZipCode  nvarchar(50)

--delete from EnterpriseUser  where not exists (select * from Employee as e where e.StoreID=EnterpriseUser.StoreID and e.ID=EnterpriseUser.EmployeeID )
--and EnterpriseUser.StoreID=@StoreID
declare cur cursor
	for SELECT ID,FirstName,LastName,Phone,Address1,Address2,City,ZipCode from Employee
	where StoreID=@StoreID
	open cur
	fetch next from cur into @EmployeeID,@FirstName,@LastName,@Phone,@Address1,@Address2,@City,@ZipCode
	while(@@fetch_status=0)
	begin
		begin try
			if not exists(select * from EnterpriseUser where StoreID=@StoreID and EmployeeID=@EmployeeID)
			begin
				INSERT INTO EnterpriseUser(StoreID,EmployeeID,FirstName,LastName,IsManager,Email,HomePhone,MobilePhone,MobileCarrier,Address,AddressCont,City,State,Zip,UserName,Password,LoginCount,IsTerminated,Enable)
					VALUES         (@StoreID,@EmployeeID,@FirstName,@LastName,0,      ''   ,@Phone   ,@Phone     ,''           ,@Address1+' '+@Address2,'',@City,'',@ZipCode,@FirstName+''+@LastName,@FirstName+''+@LastName,0,0,1)
			end
		END TRY
		BEGIN CATCH
		end  CATCH
		fetch next from cur into @EmployeeID,@FirstName,@LastName,@Phone,@Address1,@Address2,@City,@ZipCode
	end
close cur
deallocate cur
END
GO
