USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[QB_AdjustmentMatchInUpDel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QB_AdjustmentMatchInUpDel]
	@AdjustType nvarchar(200),
	@AdjustName nvarchar(200),
	@StoreID int,
	@QBID nvarchar(200),
	@QBType nvarchar(200),
	@OppQBID nvarchar(200),
	@QBClassID nvarchar(50),
	@Type int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if(@Type=0)
		begin
			insert into QB_AdjustmentMatch(AdjustName,StoreID,AdjustType,QBID,QBType,OppQBID,QBClassID) 
			values (@AdjustName,@StoreID,@AdjustType,@QBID,@QBType,@OppQBID,@QBClassID)
		end
	else if(@Type=1)
		begin
			delete from QB_AdjustmentMatch 
		end
END
GO
