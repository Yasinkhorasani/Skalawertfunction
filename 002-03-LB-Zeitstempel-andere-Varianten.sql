-- Zeitstempel --
--- andere Varianten ---



-------------------------------------------------------------------
PRINT REPLACE(REPLACE(convert(nvarchar(20),GetDate(),120),':',''),' ','_');
 -- 120  ODBC kanonisch jjjj-mm-tt hh:mi:ss (24h) 
 -- 2020-07-14_10-47-49 ohne Millisekunden

 -- Datum und Zeit --
PRINT REPLACE(REPLACE(REPLACE(REPLACE(convert(nvarchar(30),GetDate(),121),':',''),'-',''),' ','_'),'.',''); -- 20200714_104859920
-- 121 jjjj-mm-tt hh:mi:ss.mmm (24h)
-- ODBC kanonisch (mit Millisekunden) Standard für time, date, datetime2 und datetimeoffset

PRINT REPLACE(REPLACE(REPLACE(REPLACE(convert(nvarchar(30),GetDate(),121),':',''),'-',''),' ','-'),'.','');

-----------------------------------------------------------------------------
-- DATEPART
-- https://docs.microsoft.com/de-de/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver15


DECLARE @CurrentDateTime datetime
DECLARE @YEAR int
DECLARE @MONTH int
DECLARE @MONTHTWODIGITS CHAR(2) -- immer 2 Zeichen:  01 für Januar (nicht 1) etc.
DECLARE @DAY int
DECLARE @HOUR int
DECLARE @MIN int
DECLARE @SEC int
DECLARE @MSEC int -- millisecond
DECLARE @DATETIME VARCHAR(40) 


SET @CurrentDateTime = GETDATE();
SET @YEAR = Year(@CurrentDateTime);
--SET @MONTH = Month(@CurrentDateTime);
SET @MONTH = DATEPART(MM,@CurrentDateTime);
SET @DAY = Day(@CurrentDateTime);
SET @HOUR = DATEPART(HOUR,@CurrentDateTime);
SET @MIN = DATEPART(MINUTE,@CurrentDateTime);
SET @SEC = DATEPART(SECOND,@CurrentDateTime);
SET @MSEC = DATEPART(MILLISECOND,@CurrentDateTime);


IF (@MONTH < 10)
	SET @MONTHTWODIGITS = '0' + CONVERT(VARCHAR, @MONTH)
ELSE	
	SET @MONTHTWODIGITS = CONVERT(VARCHAR(2), @MONTH)

-- TODO: 2 Zeichen für Std, Min, Sec, ms


SET @DATETIME = CONVERT(VARCHAR(4), @YEAR) + 
				--CONVERT(VARCHAR(2), @MONTH) + -- TODO: immer 2 Zeichen 
				+ @MONTHTWODIGITS +  -- immer 2 Zeichen 
				CONVERT(VARCHAR(2), @DAY) +  -- TODO: immer 2 Zeichen
				'-' + 
				CONVERT(VARCHAR(2), @HOUR) +  -- TODO: immer 2 Zeichen
				-- + 'h' + -- wenn wir so was sehen wollen: 09h36m22s5621ms
				CONVERT(VARCHAR(2), @MIN) +  -- TODO: immer 2 Zeichen
				CONVERT(VARCHAR(2), @SEC) +  -- TODO: immer 2 Zeichen
				CONVERT(VARCHAR(3), @MSEC); -- TODO: immer 3 Zeichen


--SELECT  @YEAR as 'Jahr', @DATETIME AS 'Result'
--SELECT  @MSEC as 'MSEC'
SELECT  @MONTHTWODIGITS as '@MONTH'
SELECT  @DATETIME AS 'Result'

------------------------------------------------------------------------------


SELECT SUBSTRING(CONVERT(char,YEAR(GETDATE())),1,4) +
CASE 
	WHEN MONTH(GETDATE()) < 10 
	THEN '0' + SUBSTRING(CONVERT(char,MONTH(GETDATE())),1,1)
	ELSE SUBSTRING(CONVERT(char,MONTH(GETDATE())),1,2)
END +
CASE 
	WHEN DAY(GETDATE()) < 10 
	THEN '0' + SUBSTRING(CONVERT(char,DAY(GETDATE())),1,1)
	ELSE SUBSTRING(CONVERT(char,DAY(GETDATE())),1,2)
END
-- TODO: Zeit;

-----------------------------------------------------

-----------------------------------
-- sehr kompakt und einfach ---
-- https://www.sqlservercentral.com/articles/using-format-for-dates
PRINT FORMAT(GETDATE(), 'yyyyMMdd-HHmmssfff');
