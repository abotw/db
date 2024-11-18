---
title: "Lab 11:"
layout: home
parent: Labs
---

# Lab 11: 

### 第1关：创建视图 borrow_inform，引用“读者”表中女生的读者编号、姓名、性别、已借数量

```sql
USE library;
GO

CREATE VIEW borrow_inform AS
SELECT 
    读者编号,
    姓名,
    性别,
    已借数量
FROM 
    读者
WHERE 
    性别 = '女';
GO
```

### 第2关：查询视图 borrow_inform，并显示其中所有数据。然后与查询语句：select 读者编号,姓名,性别,已借数量

```sql
use library;
go

SELECT * FROM borrow_inform;
go

select 读者编号,姓名,性别,已借数量 from 读者 where 性别='女';
go
```

### 第3关：插入视图 borrow_inform，执行 insert into borrow_inform

```sql
use library;
go

INSERT INTO borrow_inform (读者编号, 姓名, 性别) VALUES ('1013', '郝淑敏', '女');
go

select * from 读者 where 读者编号='1013'
go
select * from borrow_inform where 读者编号='1013'
```

### 第4关：更新视图 borrow_inform

```sql
use library;
go

UPDATE borrow_inform SET 性别 = '男' WHERE 读者编号 = '1013';

select * from 读者 where 读者编号='1013'
go
select * from borrow_inform where 读者编号='1013'
```

### 第5关：创建普通索引：在“图书”表的“作者”列上降序建立名为“IX_图书_作者”的普通索引

```sql

```

### 第7关：使用"读者”表，声明游标 mycursor，打开游标，并提取结果集的第一行和最后一行

```sql
-- 指定使用 library 数据库
USE library;
GO

-- 声明游标
DECLARE mycursor CURSOR FOR
SELECT 读者编号, 姓名, 性别, 单位, 电话, 读者类型, 已借数量
FROM 读者;

-- 声明变量来存储结果
DECLARE @读者编号 CHAR(4), 
        @姓名 CHAR(6), 
        @性别 CHAR(2), 
        @单位 VARCHAR(20), 
        @电话 VARCHAR(13), 
        @读者类型 INT, 
        @已借数量 INT;

-- 打开游标
OPEN mycursor;

-- 提取第一行
FETCH NEXT FROM mycursor INTO @读者编号, @姓名, @性别, @单位, @电话, @读者类型, @已借数量;

-- 显示第一行
SELECT @读者编号 AS 读者编号, @姓名 AS 姓名, @性别 AS 性别, @单位 AS 单位, 
       @电话 AS 电话, @读者类型 AS 读者类型, @已借数量 AS 已借数量;

-- 获取最后一行
DECLARE @最后读者编号 CHAR(4), 
        @最后姓名 CHAR(6), 
        @最后性别 CHAR(2), 
        @最后单位 VARCHAR(20), 
        @最后电话 VARCHAR(13), 
        @最后读者类型 INT, 
        @最后已借数量 INT;

-- 循环遍历游标，直到最后一行
FETCH NEXT FROM mycursor INTO @最后读者编号, @最后姓名, @最后性别, @最后单位, @最后电话, @最后读者类型, @最后已借数量;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- 继续获取下一行
    FETCH NEXT FROM mycursor INTO @最后读者编号, @最后姓名, @最后性别, @最后单位, @最后电话, @最后读者类型, @最后已借数量;
END;

-- 显示最后一行
SELECT @最后读者编号 AS 读者编号, @最后姓名 AS 姓名, @最后性别 AS 性别, @最后单位 AS 单位, 
       @最后电话 AS 电话, @最后读者类型 AS 读者类型, @最后已借数量 AS 已借数量;

-- 关闭游标
CLOSE mycursor;

-- 释放游标
DEALLOCATE mycursor;
```








