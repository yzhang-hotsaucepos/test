USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[RptGetAllPaymentName]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RptGetAllPaymentName]
        (
			@StoreID int
        )
        as
        select dbo.fn_GetPaymentName(@StoreID)
GO
