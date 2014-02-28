USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[task_selByID]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[task_selByID]
	-- Add the parameters for the stored procedure here
	@taskID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select ID,Subject,DueDate,Description,case when Status=1 then 'Not Completed' when Status=2 then 'Completed' end Status from Task where ID=@taskID
END
GO
