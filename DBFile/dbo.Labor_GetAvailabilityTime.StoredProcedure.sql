USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetAvailabilityTime]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_GetAvailabilityTime]

@AvaliablityID int
AS
BEGIN
select * from LaborAvailabilityTime where   Availabilityid = @AvaliablityID
END
GO
