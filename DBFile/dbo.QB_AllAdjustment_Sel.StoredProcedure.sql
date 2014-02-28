USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[QB_AllAdjustment_Sel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QB_AllAdjustment_Sel]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select StoreID,ID,Name,'VOID' AdjustedType from Void
	union
	select StoreID,ID,Name,'COMP' AdjustedType from Comp
	union
	select StoreID,ID,Name,'DISCOUNT' AdjustedType from Discount
	union
	select StoreID,ID,Name,'COUPON' AdjustedType from Coupon
END
GO
