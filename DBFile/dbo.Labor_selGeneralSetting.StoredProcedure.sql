USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_selGeneralSetting]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Labor_selGeneralSetting]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from LaborGeneralSetting
END
GO
