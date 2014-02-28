USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[ReportAlerts_selNeedSendEmail]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReportAlerts_selNeedSendEmail]
as
select id,AlertName,TriggerAboveValues,TriggerBelowValues,StartDate,EndDate,AlertFrequency,SendtoStore,isnull(LastSendDate,'1900-1-1') LastSendDate,UserID,CreateDate,Sendto,dbo.[fn_GetAlterAllValue](SendtoStore,AlertName,AlertFrequency,CreateDate) as CurrValue,dbo.[fn_GetSendTime](SendtoStore) sendTime,dbo.fn_GetStoreName1(SendtoStore) StoreName from ReportAlert where GETDATE() between StartDate and EndDate
GO
