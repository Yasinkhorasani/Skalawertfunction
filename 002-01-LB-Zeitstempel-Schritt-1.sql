/*
BACKUP DATABASE [FirmaUebung] 
TO DISK = N'C:\SQL-Kurs\DB\BackupCursorScript\FirmaUebung-20210622-120115765.bak';

gewünschte Backup-Datei Name:
"C:\SQL-Kurs\DB\BackupCursorScript\FirmaUebung-20191029-093008320.BAK"
Zeitstempel: 20190805-103009340
*/


SELECT GETDATE(); -- 2022-01-07 09:17:35.577 TODO: umwandeln in 20220107-091735577

-- CONVERT ohne STYLE Ohne Jahrhundert mon tt jjjj hh:miAM
SELECT CONVERT(VARCHAR(MAX), GETDATE()); -- Jan  7 2022  9:19AM

/*
CAST und CONVERT (Transact-SQL)
https://docs.microsoft.com/de-de/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15
*/



-- CONVERT mit STYLE --
SELECT CONVERT(VARCHAR(MAX), GETDATE(), 1); -- 01/07/22
SELECT CONVERT(VARCHAR(MAX), GETDATE(), 101); -- 01/07/2022
SELECT CONVERT(VARCHAR(20), GETDATE(), 102); -- ANSI 2022.01.07
SELECT CONVERT(VARCHAR(20), GETDATE(), 112); -- ISO 20210105
SELECT CONVERT(VARCHAR(20), GETDATE(), 113); -- Europ. Standard + Millisekunden 05 Jan 2021 10:43:17	
SELECT CONVERT(VARCHAR(20), GETDATE(), 114); -- hh:mi:ss:mmm (24h) 10:44:36:107 
SELECT CONVERT(VARCHAR(30), GETDATE(), 121); -- ODBC kanonisch (mit Millisekunden) 2021-01-05 10:42:10.357
SELECT CONVERT(VARCHAR(30), GETDATE(), 130); -- Hijri 15 ???? 1442 11:20:40:497AM
SELECT CONVERT(VARCHAR(30), GETDATE(), 131); -- Hijri 15/10/1442 11:21:54:060AM
SELECT CONVERT(VARCHAR(30), GETDATE(), 126); -- ISO8601 2021-05-26T11:25:12.797


-- TODO: 20220107-092533550
-- Teil 1: 112
-- Teil 2: 114 
-- 114 TODO: Doppelpunkte entfernen ---

SELECT REPLACE(CONVERT(VARCHAR(40), GETDATE(), 114),':','_'); -- 09_28_57_847
SELECT REPLACE(CONVERT(VARCHAR(40), GETDATE(), 114),':',''); -- 113546287

-- Wir verwenden 112 (Datum) und 114 (Zeit)
-- Datum und Zeit
SELECT CONVERT(VARCHAR(8), GETDATE(), 112) + 
		'-' + 
		REPLACE(CONVERT(VARCHAR(12), GETDATE(),114),':',''); -- 20220107-093152647