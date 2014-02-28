USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[sel_UserByTask]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_UserByTask]
	-- Add the parameters for the stored procedure here
	@isStoreManger int
AS
BEGIN
	if @isStoreManger>0
	begin
		select otu.UserID 
		,eu.FirstName+' '+eu.LastName UserName
		from OrganizationToUser as otu inner join Organization as o on o.ID=otu.OrganizationID
		inner join EnterpriseUser as eu on otu.UserID=eu.ID 
		where o.StoreID > 0 
	end
	else
	begin
		select eu.ID UserID,eu.FirstName+' '+eu.LastName UserName
		from OrganizationToUser as otu inner join Organization as o on o.ID=otu.OrganizationID
		inner join EnterpriseUser as eu on otu.UserID=eu.ID
		where o.StoreID=0
	end
	
END
GO
