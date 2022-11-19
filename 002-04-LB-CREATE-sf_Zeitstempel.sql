USE FirmaUebung;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	Die Funktion generiert so was: 20210105-105151150
-- =============================================
CREATE OR ALTER FUNCTION sf_Zeitstempel 
(
)
RETURNS char(18)
AS
BEGIN
	-- Variante 1 --
	--DECLARE @Zeitstempel char(18);

	--SET @Zeitstempel = CONVERT(VARCHAR(20), GETDATE(), 112) + 
	--	'-' + 
	--	REPLACE(CONVERT(VARCHAR(40), GETDATE(), 114),':','');

	---- Return the result of the function
	--RETURN @Zeitstempel;
			
	-- Variante 2 --
	--RETURN (SELECT CONVERT(VARCHAR(8), GETDATE(), 112) + 
	--	'-' + 
	--	REPLACE(CONVERT(VARCHAR(12), GETDATE(),114),':','')); 
	
		
	-- Variante 3 ---
	RETURN FORMAT(GETDATE(), 'yyyyMMdd-HHmmssfff');
	
-- https://www.sqlservercentral.com/articles/using-format-for-dates
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/format-transact-sql?view=sql-server-ver15

END
GO

