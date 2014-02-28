USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetTimeOffByTime]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_GetTimeOffByTime]
@storeID int,
@UserID int,
@TimeNow datetime
as
begin
if(@UserID <> 0 )
	begin
		select * from LaborTimeOff where ApplicantID = @UserID and EndTime >=@TimeNow
	end
else
	begin
		select * from LaborTimeOff join EnterpriseUser on ApplicantID = EnterpriseUser.ID
		where  LaborTimeOff.[Status] = 0 and EndTime >= @TimeNow and EnterpriseUser.StoreID = @storeID
	end
end
GO
