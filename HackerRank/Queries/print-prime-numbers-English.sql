DECLARE @max AS INT = 1000;
DECLARE @str AS VARCHAR(8000)='';
DECLARE @i AS INT = 2;
DECLARE @j AS INT = 2;
DECLARE @a AS BIT = 1;
WHILE @i <= @max
BEGIN
    SET @j = 2;
    SET @a = 1;
    WHILE @j <= SQRT(@i)
    BEGIN
        IF @i % @j = 0
        BEGIN
            SET @a = 0;
        END
        SET @j += 1;
    END
    IF @a = 1
    BEGIN
        SET @str += CAST(@i AS VARCHAR(5)) + '&';
    END
    SET @i += 1;
END
PRINT LEFT(@str, len(@str)-1);