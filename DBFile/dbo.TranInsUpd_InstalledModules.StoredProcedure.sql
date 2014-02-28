USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[TranInsUpd_InstalledModules]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TranInsUpd_InstalledModules]
@StoreID   int,
@HSModule   nvarchar(20),
@Installed   char(1),
@ModuleEnabled   char(1)
AS
begin try
    INSERT INTO InstalledModules
           ([StoreID]
           ,HSModule
           ,Installed
           ,ModuleEnabled
           ,LastUpdate)
     VALUES
           (@StoreID
           ,@HSModule
           ,@Installed
           ,@ModuleEnabled
           ,GETDATE())
END TRY
BEGIN CATCH
	if @@ERROR <>0
		UPDATE InstalledModules
   SET Installed = @Installed
      ,ModuleEnabled = @ModuleEnabled
      ,[LastUpdate] = GETDATE()
 WHERE [StoreID] = @StoreID and HSModule = @HSModule
end  CATCH
GO
