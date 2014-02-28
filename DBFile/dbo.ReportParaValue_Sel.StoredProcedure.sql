USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[ReportParaValue_Sel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReportParaValue_Sel]
(
	@SubscriptionID int,
	@Type nvarchar(20)
)
as
if ISNULL(@Type,'')='SendEmail' --发送邮件
begin
select SubscriptionID,ParaName,rpv.Value from [ReportParaValue] rpv inner join ReportParameter rp on rpv.ParameterID=rp.ParaID
  where  SubscriptionID=@SubscriptionID
union 
select @SubscriptionID,'StoreName' ParaName,dbo.[fn_GetStoreName1](rpv.value) as Value from [ReportParaValue] rpv 
inner join ReportParameter rp on rpv.ParameterID=rp.ParaID 
where rp.ParaName='StoreID' and SubscriptionID=@SubscriptionID
end
else
begin
	SELECT [SubscriptionID]
      ,[ParameterID]
      ,[Value]
      ,[ID]
  FROM [ReportParaValue]
  where  SubscriptionID=@SubscriptionID
end
GO
