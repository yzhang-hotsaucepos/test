USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_DelAvailability]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Labor_DelAvailability]
@AviabilityID int 
as
begin
delete from LaborAvailability where ID = @AviabilityID
end
GO
