USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[reportAlerts_update]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[reportAlerts_update]
(
	@id int
)
as
update ReportAlert set LastSendDate=GETDATE() where ID=@id
GO
