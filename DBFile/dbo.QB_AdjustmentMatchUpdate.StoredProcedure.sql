USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[QB_AdjustmentMatchUpdate]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QB_AdjustmentMatchUpdate]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  DELETE from  [QB_AdjustmentMatch]
  where QBID not in(select ID from QB_AdjustmentCategory where type = 'Category')
  
  update [QB_AdjustmentMatch] set QBClassID = ''
  where QBClassID not in (select ID from QB_AdjustmentCategory where type = 'ClassRet')  
  
END
GO
