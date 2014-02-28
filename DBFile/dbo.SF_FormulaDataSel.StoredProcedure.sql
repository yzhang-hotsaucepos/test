USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[SF_FormulaDataSel]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[SF_FormulaDataSel]
	-- Add the parameters for the stored procedure here
	@StoreID int,
	@ForecastsDate datetime,
	@Type int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		if(@Type = 0)
			begin
					SELECT [ID]
					  ,[StoreID]
					  ,[DayPart]
					  ,[ForecastsDate]
					  ,[ForecastValue]
					  ,[ModifyValue]
					  ,[EditorID]
					  ,[LastUpdate]
				  FROM [SF_FormulaData] 
				  where StoreID = @StoreID and ForecastsDate between @ForecastsDate and dateadd(day,6,@ForecastsDate)   
			end
END
GO
