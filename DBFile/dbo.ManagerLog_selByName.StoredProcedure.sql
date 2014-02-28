USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[ManagerLog_selByName]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ManagerLog_selByName]
(
	@Name nvarchar(50)
)
as

declare @ManagerLogID int
select @ManagerLogID=ID from ManagerLog where Name=@Name
select * from ManagerLog where ParentID=@ManagerLogID
GO
