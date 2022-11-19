--(SELECT CONVERT(VARCHAR(8), GETDATE(), 112) + 
--		'-' + 
--		REPLACE(CONVERT(VARCHAR(12), GETDATE(), 114),':',''));


DECLARE @DatumsTeil AS CHAR(8);
SET @DatumsTeil = CONVERT(VARCHAR(8), GETDATE(), 112);
PRINT @DatumsTeil;

DECLARE @ZeitTeil1 AS CHAR(12);
SET @ZeitTeil1 = CONVERT(VARCHAR(12), GETDATE(), 114);
PRINT @ZeitTeil1;

DECLARE @ZeitTeil2 AS CHAR(9);
SET @ZeitTeil2 = REPLACE(@ZeitTeil1,':','')
PRINT @ZeitTeil2;

DECLARE @Zeitstempel AS CHAR(18);
SET @Zeitstempel = @DatumsTeil + '-' + @ZeitTeil2;
PRINT @Zeitstempel;