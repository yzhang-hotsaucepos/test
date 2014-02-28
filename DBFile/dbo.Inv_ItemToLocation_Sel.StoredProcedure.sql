USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Inv_ItemToLocation_Sel]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inv_ItemToLocation_Sel]
	-- Add the parameters for the stored procedure here
	@StoreID int,
	@InvItemID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		
		select [StoreID]
			   ,[InvItemID]
			   ,[LocationID]
			   ,[DisplaySeq]
			   ,[Creator]
			   ,[Editor]
			   ,[lastUpdate] from [Inv_ItemToLocation] where [StoreID]=@StoreID and [InvItemID]=@InvItemID

END
GO
