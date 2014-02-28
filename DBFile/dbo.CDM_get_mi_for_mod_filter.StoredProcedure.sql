USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[CDM_get_mi_for_mod_filter]    Script Date: 02/28/2014 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CDM_get_mi_for_mod_filter]

@modLink nvarchar(20),
@sortBy varchar(10)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

if upper(@sortBy)= 'ABB_NAME'
	SELECT     item_id, Abbreviated_Name, Price, CATEGORY
	FROM         CDM_tblmenu_items with(nolock)
	where modifier = 'Y'
		AND show_button = 'Y'
		AND category = @modLink
	order by abbreviated_name
else

	SELECT     item_id, Abbreviated_Name, Price, CATEGORY
	FROM         CDM_tblmenu_items with(nolock)
	where modifier = 'Y'
		AND show_button = 'Y'
		AND category = @modLink
	order by category

/*SELECT     item_id, tblMENU_ITEMS.Abbreviated_Name, tblMENU_ITEMS.Price
FROM         tblMODIFIER_MENUS INNER JOIN
                      tblMENU_ITEMS ON tblMODIFIER_MENUS.MenuItemID = tblMENU_ITEMS.Item_Id
WHERE   item_id not in (select menuItemID from tblmodifier_menus where modifierMenuID = @modGroup)
	order by abbreviated_name
*/

return @@error
GO
