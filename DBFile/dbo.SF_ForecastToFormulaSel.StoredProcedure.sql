USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[SF_ForecastToFormulaSel]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SF_ForecastToFormulaSel]
	-- Add the parameters for the stored procedure here
	@StoreID int,
	@Type int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		if(@Type = 0)
			begin
			  SELECT [StoreID]
				  ,[ForecastID]
				  ,[EditorID]
				  ,EditorName
				  ,[LastUpdate]
			  FROM [SF_ForecastToFormula]
			end
		else if(@Type = 1)
		begin
			SELECT [StoreID]
				  ,[ForecastID]
				  ,[EditorID]
				  ,EditorName
				  ,[LastUpdate]
			  FROM [SF_ForecastToFormula]
			  where StoreID = @StoreID
		end
END
GO
