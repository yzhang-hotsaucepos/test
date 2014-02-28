USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[QB_EventInUpDel]    Script Date: 02/28/2014 15:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QB_EventInUpDel]
@RefNumber int,
@ProfileID int,
@BeginTime datetime,
@EndTime datetime,
@State int,
@EditorID int,
@EditorName nvarchar(200),
@LastUpdate datetime,
@Type int,
@RefID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@Type =1)
		begin
			insert into QB_Event(ProfileID,BeginTime,EndTime,[State],EditorID,LastUpdate,EditorName)
			values(@ProfileID,@BeginTime,@EndTime,@State,@EditorID,@LastUpdate,@EditorName)
			set @RefID = @@IDENTITY
		end
	else if(@Type = 2)
		begin
			update QB_Event set ProfileID =@ProfileID,BeginTime=@BeginTime,EndTime = @EndTime,[State]=@State,EditorID=@EditorID,LastUpdate=@LastUpdate
			where RefNum =@RefNumber 
		end
	else if(@Type =3)
		begin
			delete from QB_Event where RefNum = @RefNumber
		end
	else if(@Type =4)
		begin
		update QB_Event set [State]=@State ,DownLoadUserName =@EditorName
		where RefNum =@RefNumber 
		end
END
GO
