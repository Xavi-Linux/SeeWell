DECLARE @i AS SmallINT = 0;
DECLARE @str AS VARCHAR(50) = '*';
WHILE @i < 20
BEGIN
    print @str;
    SET @i += 1;
    SET @str += ' ' + '*';
END;