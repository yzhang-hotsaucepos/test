USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetDetailAttendanceStatuses]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Labor_GetDetailAttendanceStatuses]
	@DetailID int
AS
BEGIN
	select * from LaborDetailAttendanceStatuses where DetailID = @DetailID
END
GO
