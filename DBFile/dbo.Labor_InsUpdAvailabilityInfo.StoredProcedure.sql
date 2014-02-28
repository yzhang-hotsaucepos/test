USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_InsUpdAvailabilityInfo]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Labor_InsUpdAvailabilityInfo]
@EmpID int,
@Audit int,
@ManagerNotes nvarchar(500)
AS
BEGIN
update LaborAvailabilityInfo set ManagerNotes = @ManagerNotes where EmpID = @EmpID and Audit = @Audit
 if(@@rowcount=0)
 insert into LaborAvailabilityInfo(EmpID,Audit,ManagerNotes) values(@EmpID,@Audit,@ManagerNotes)
END
GO
