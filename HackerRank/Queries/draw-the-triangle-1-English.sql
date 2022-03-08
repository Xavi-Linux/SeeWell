DECLARE @max AS INT = 20;
DECLARE @str AS VARCHAR(50);
DECLARE @i AS SMALLINT;

SET @str = REPLICATE('* ', @max +1 );
SET @str = LEFT(@str, LEN(@str) - 1);
SET @i = @max;
WHILE @i > 0
BEGIN
    PRINT @str;
    BEGIN TRY
        SET @str = LEFT(@str, LEN(@str) - 2);
    END TRY
    BEGIN CATCH
    END CATCH
    SET @i -= 1;
END;
