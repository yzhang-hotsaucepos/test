USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetAvailabilityInfo]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Labor_GetAvailabilityInfo]
@EmpID int,
@Audit int
AS
BEGIN
select * from LaborAvailabilityInfo where EmpID= @EmpID and Audit = @Audit
END
GO
