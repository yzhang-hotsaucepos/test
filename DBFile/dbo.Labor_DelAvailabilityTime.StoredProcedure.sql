USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_DelAvailabilityTime]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Labor_DelAvailabilityTime]
@AviabilityID int 
as
begin
delete from LaborAvailabilityTime where AvailabilityID = @AviabilityID
end
GO
