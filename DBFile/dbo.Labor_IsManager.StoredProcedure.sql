USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Labor_IsManager]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Labor_IsManager]
@userID int
as
begin
select * from EnterpriseUser where ID = @userID
end
GO
