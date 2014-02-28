USE [ClearHotsauceEnterprise]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_TaxSummaryAll]    Script Date: 02/28/2014 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Rpt_TaxSummaryAll]
	@BeginDate datetime,
	@EndDate datetime,
	@storeID nvarchar(2000)
AS
begin
SET NOCOUNT ON;
Select tc.Name as TaxName, ISNULL(SUM(t.TaxAmt),0) as TaxAmt, ISNULL(SUM(t.TaxOrderAmt),0) as OrderAmt
		From [dbo].[fnTaxTable](@BeginDate,@EndDate,@storeID) as t inner JOIN TaxCategory tc 
			ON t.TaxCategoryID = tc.ID and t.Category=tc.Category and tc.StoreID= t.StoreID
		Where  t.Category = 'TAX'
Group By tc.Name

end
GO
