USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[ReportParaValue_InUpDel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReportParaValue_InUpDel]
(
	@SubscriptionID int,
	@ParameterID int,
	@Value nvarchar(200),
	@SQLOperationType nvarchar(50)
)
as
if @SQLOperationType='SQLInsert'
begin
	INSERT INTO [ReportParaValue]
           ([SubscriptionID]
           ,[ParameterID]
           ,[Value])
     VALUES(@SubscriptionID,@ParameterID,@Value)
end

else if @SQLOperationType='SQLUpdate'
begin
	UPDATE [ReportParaValue]
	SET [Value] = @Value
	WHERE [SubscriptionID] = @SubscriptionID and[ParameterID] = @ParameterID
end

else if @SQLOperationType='SQLDelete'
begin
	delete from [ReportParaValue] where [SubscriptionID]=@SubscriptionID
end
GO
