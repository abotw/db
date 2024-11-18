---
title: "Lab 10: T-SQL程序设计"
layout: page
parent: Labs
last updated: 2024-11-13T21:04:00
---

# Lab 10: T-SQL程序设计

## Contents

### 第1关：创建一个数据表work_study，记录学生勤工助学的信息

```sql
USE library;
GO

CREATE TABLE work_study (
    串号 INT IDENTITY(1,1),
    读者编号 CHAR(4) NOT NULL,
    姓名 CHAR(6) NOT NULL,
    编目本数 INT NOT NULL,
    劳务费 AS (
        CASE
            WHEN 编目本数 <= 8 THEN 12 * 编目本数
            WHEN 编目本数 <= 15 THEN 12 * 8 + 6 * (编目本数 - 8)
            WHEN 编目本数 <= 20 THEN 12 * 8 + 6 * 7 + 3 * (编目本数 - 15)
            ELSE 0
        END
    ),
    FOREIGN KEY (读者编号) REFERENCES 读者(读者编号)
);
GO

INSERT INTO work_study (读者编号, 姓名, 编目本数)
SELECT 读者编号, 姓名, 10
FROM 读者
WHERE 读者编号 = '1001';
GO
```

### 第2关：创建一个数据表book_shop，记录图书馆售卖图书的信息

```sql
USE library;
GO

-- 创建 'book_shop' 表
CREATE TABLE book_shop (
    串号 INT IDENTITY(1,1) PRIMARY KEY,
    读者编号 char(4) FOREIGN KEY REFERENCES 读者(读者编号),
    姓名 char(6) NOT NULL,
    应付金额 int NOT NULL,
    实付金额 AS (
        CASE
            WHEN 应付金额 <= 100 THEN 1 * 应付金额
            WHEN 应付金额 <= 300 THEN 0.8 * 应付金额
            WHEN 应付金额 <= 500 THEN 0.6 * 应付金额
            ELSE 0
        END
    )
);

-- 插入数据
INSERT INTO book_shop (读者编号, 姓名, 应付金额)
SELECT 1001, (SELECT 姓名 FROM 读者 WHERE 读者编号 = 1001), 150;

select * from book_shop
where 读者编号 = 1001;
```

### 第3关：函数体主体是循环语句：有规律数据的计算

```sql
use library;
go

create function quadsum(@n int)
returns bigint
as
begin
    declare @sum bigint = 0;
    declare @i int = 1;

    while @i <= @n
    begin
        set @sum = @sum + power(@i, 2);
        set @i = @i + 1;
    end

    return @sum;
end;
go
```

### 第4关：函数体主体是循环语句：有规则图形的打印

```sql
use library;
go

declare @i int = 1, @rows int = 4;
declare @stars nvarchar(max);

while @i <= @rows
begin
    set @stars = replicate(' *', 2*@i - 1);
    print @stars + ' ';
    set @i = @i + 1;
end;
```

### 第5关：创建一个内嵌表值函数

```sql
use library;
GO

CREATE FUNCTION duzhe_finfo (@dzbh CHAR(4) = '1001')
RETURNS TABLE
AS
RETURN (
    SELECT 
        d.姓名,
        d.性别,
        b.书名,
        br.借书日期,
        br.还书日期
    FROM 
        读者 as d
    INNER JOIN 
        借阅 as br ON d.读者编号 = br.读者编号
    INNER JOIN 
        图书 as b ON br.图书编号 = b.图书编号
    WHERE 
        d.读者编号 = @dzbh
);
GO

SELECT * FROM dbo.duzhe_finfo('1001');
go
```

### 第6关：编写一个多语句表值函数

```sql
use library;
GO

CREATE FUNCTION dbo.tushu_info(@tsbh CHAR(6))
RETURNS @BookInfo TABLE
(
    书名 VARCHAR(20),
    出版社 VARCHAR(20),
    作者 VARCHAR(20),
    定价 money
)
AS
BEGIN
    INSERT INTO @BookInfo
    SELECT 
        书名, 
        出版社, 
        作者, 
        定价
    FROM 图书
    WHERE 图书编号 = @tsbh;

    RETURN;
END;
GO

SELECT * FROM dbo.tushu_info('TP0001');
```

### 第7关：创建一个内嵌表值函数，实现指定读者编号时，输出该读者的读者编号，并统计出该读者的借书总数（不得使用读者表中“已借数量”）

```sql
use library;
go

CREATE FUNCTION dbo.duzhe_cntinfo(@dzbh CHAR(4) = '1001')
RETURNS TABLE
AS
RETURN
(
    SELECT 
        读者.读者编号,
        COUNT(*) AS 借书总数
    FROM 
        借阅
    INNER JOIN 
        读者 ON 借阅.读者编号 = 读者.读者编号
    WHERE 
        读者.读者编号 = @dzbh
    GROUP BY 
        读者.读者编号, 读者.姓名
);
GO

SELECT * FROM dbo.duzhe_cntinfo('1001');
```

### 第8关：创建一个内嵌表值函数，实现指定读者姓名时，输出该读者的姓名、读者编号，并统计出该读者的借书总数（不得使用读者表中“已借数\

```sql
use library;
go

CREATE FUNCTION dbo.duzhe_cntinfo2(@dzxm CHAR(6) = '刘春华')
RETURNS TABLE
AS
RETURN
(
    SELECT 
        读者.姓名,
        读者.读者编号,
        COUNT(*) AS 借书总数
    FROM 
        借阅
    INNER JOIN 
        读者 ON 借阅.读者编号 = 读者.读者编号
    WHERE 
        读者.姓名 = @dzxm
    GROUP BY 
        读者.姓名, 读者.读者编号
);
GO

SELECT * FROM dbo.duzhe_cntinfo2('刘春华');
```

## Notes

### [DROP FUNCTION (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/statements/drop-function-transact-sql?view=sql-server-ver16)

```sql
-- SQL Server, Azure SQL Database 

DROP FUNCTION [ IF EXISTS ] { [ schema_name. ] function_name } [ ,...n ]   
[;]
```

