USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[LoopingMoveArchive]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoopingMoveArchive]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
EXECUTE  MoveOrderToArchive
EXECUTE  MoveOrderLineItemToArchive
EXECUTE  MoveCheckToArchive
EXECUTE  MovePaymentToArchive
EXECUTE  MovePaidInTrxToArchive
EXECUTE  MovePaidOutTrxToArchive
EXECUTE  MoveTaxToArchive
EXECUTE  MoveAchiveDeleteRecords
EXECUTE MoveEmailToLog
END
GO
