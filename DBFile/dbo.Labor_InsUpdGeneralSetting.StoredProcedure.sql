USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_InsUpdGeneralSetting]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Labor_InsUpdGeneralSetting]
@WorkWeekOvertime int,
@WorkDayOvertime int ,
@PublishUnassignedShifts bit,
@AllowOnCallShifts bit,
@CaliforniaLaborLaws bit 

AS

	UPDATE  LaborGeneralSetting 
	SET WorkWeekOvertime=@WorkWeekOvertime ,
		WorkDayOvertime=@WorkDayOvertime,
		PublishUnassignedShifts= @PublishUnassignedShifts,
		AllowOnCallShifts = @AllowOnCallShifts,
		CaliforniaLaborLaws = @CaliforniaLaborLaws

if @@ROWCOUNT = 0
INSERT INTO LaborGeneralSetting(
WorkWeekOvertime,
WorkDayOvertime,
PublishUnassignedShifts,
AllowOnCallShifts,
CaliforniaLaborLaws
)VALUES(@WorkWeekOvertime,@WorkDayOvertime,@PublishUnassignedShifts,@AllowOnCallShifts,@CaliforniaLaborLaws)
GO
