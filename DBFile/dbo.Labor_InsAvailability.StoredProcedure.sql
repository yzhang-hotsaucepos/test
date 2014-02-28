USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_InsAvailability]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_InsAvailability]
	   @id int
	  ,@StoreID int
      ,@EmpID int
      ,@StartTime datetime
      ,@EndTime datetime
      ,@Audit int 
      ,@Comments nvarchar(500)
      ,@ManagerNode nvarchar(500)
      ,@Type int
AS
if(@Type = 0)
BEGIN
insert into  
LaborAvailability(
	StoreID,
    EmpID,
    StartTime,
    EndTime,
    Audit,
    Comments,
    ManagerNode)
    values
      (	  @StoreID 
      ,@EmpID
      ,@StartTime
      ,@EndTime
      ,@Audit 
      ,@Comments
      ,@ManagerNode)
select @@IDENTITY
END
else
begin
update LaborAvailability set Audit =@Audit , Comments=@Comments where ID=@id
end
GO
