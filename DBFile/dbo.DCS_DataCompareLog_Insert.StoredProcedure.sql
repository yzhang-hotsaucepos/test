USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[DCS_DataCompareLog_Insert]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DCS_DataCompareLog_Insert]
	-- Add the parameters for the stored procedure here
	@storeID int,
	@Datetime datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into DCS_DataCompareLog values(@storeID,@Datetime)
	
END
GO
