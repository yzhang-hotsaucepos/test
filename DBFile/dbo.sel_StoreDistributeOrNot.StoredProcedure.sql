USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_StoreDistributeOrNot]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_StoreDistributeOrNot]
	@Distribute  int
AS
BEGIN
--select  Distribute store
if @Distribute=1
begin
	select s.ID,s.StoreName from Store as s where exists (select * from Organization as o where o.StoreID=s.ID)
end
else
--select not Distribute store
begin
	select s.ID,s.StoreName from Store as s where not exists (select * from Organization as o where o.StoreID=s.ID)
end
END
GO
