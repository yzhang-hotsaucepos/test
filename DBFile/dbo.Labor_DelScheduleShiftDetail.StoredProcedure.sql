USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_DelScheduleShiftDetail]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Labor_DelScheduleShiftDetail]
@detailID int
AS
BEGIN
	SET NOCOUNT ON;
	delete from LaborScheduleShiftDetail where ID = @detailID
END
GO
