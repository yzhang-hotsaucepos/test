USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_GetPosition]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_GetPosition]
@StoreID int,
@Oper nvarchar(20)
as
if(@Oper = 'ALL')
begin
SELECT distinct Name  FROM  Position
end
ELSE
BEGIN
SELECT *  FROM  Position where StoreID =@StoreID
END
GO
