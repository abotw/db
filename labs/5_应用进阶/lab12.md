---
title: "Lab 12: 存储过程与触发器"
layout: home
parent: Labs
---

# Lab 12: 存储过程与触发器

## Contents

### 第1关：编写存储过程 Narcissus，实现输出所有水仙花数。

```sql
use library;
go

-- 创建存储过程 Narcissus
CREATE PROCEDURE Narcissus
AS
BEGIN
    -- 创建一个表变量来存储水仙花数
    DECLARE @NarcissusNumbers TABLE (Number INT);

    -- 定义变量
    DECLARE @number INT, @hundreds INT, @tens INT, @units INT;

    -- 遍历所有 3 位数，寻找水仙花数
    SET @number = 100;
    WHILE @number <= 999
    BEGIN
        -- 计算每一位上的数字
        SET @hundreds = @number / 100; -- 百位
        SET @tens = (@number / 10) % 10; -- 十位
        SET @units = @number % 10; -- 个位

        -- 检查是否满足水仙花数的条件
        IF (@hundreds * @hundreds * @hundreds + 
            @tens * @tens * @tens + 
            @units * @units * @units) = @number
        BEGIN
            -- 将水仙花数插入到表变量中
            INSERT INTO @NarcissusNumbers (Number) VALUES (@number);
        END

        -- 下一个数字
        SET @number = @number + 1;
    END

    -- 使用 SELECT 语句输出所有的水仙花数
    SELECT Number AS 水仙花数 FROM @NarcissusNumbers;
END;

EXEC Narcissus;
```