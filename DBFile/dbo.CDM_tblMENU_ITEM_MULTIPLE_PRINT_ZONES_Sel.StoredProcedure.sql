USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[CDM_tblMENU_ITEM_MULTIPLE_PRINT_ZONES_Sel]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[CDM_tblMENU_ITEM_MULTIPLE_PRINT_ZONES_Sel]
	-- Add the parameters for the stored procedure here
	@menuItemID int,
	@sqlType nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if (@sqlType='SQLSELECT')
		SELECT itemID,Print_Zone from CDM_tblMENU_ITEM_MULTIPLE_PRINT_ZONES
		where itemID=@menuItemID
END
GO
