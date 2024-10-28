---
title: T-SQL
layout: page
parent: Notes
---

# T-SQL

- 程序设计基础
	- 常量
	- 变量
	- 运算符（优先级） & 表达式
- 控制流
- 函数

### 标准 SQL 格式 / 排版 

* 关键字：大写字母
* 注释：`--` 双短横线

## General

### [GO](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/sql-server-utilities-statements-go?view=sql-server-ver16)

```sql
GO [count]
```

### [USE](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/use-transact-sql?view=sql-server-ver16)

```sql
USE { database_name }   
[;]
```

### [PRINT](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/print-transact-sql?view=sql-server-ver16)

```sql
PRINT msg_str | @local_variable | string_expr
```

## Constants

- https://learn.microsoft.com/en-us/sql/t-sql/data-types/constants-transact-sql?view=sql-server-ver16

## Variables

- https://learn.microsoft.com/en-us/sql/t-sql/language-elements/variables-transact-sql?view=sql-server-ver16



7-1

```sql
-- 计算两数之和
DECLARE @sum INT, @a AS INT, @b AS INT;
SET @a = 10; -- 必须要加`SET`
SET @b = 90;
SET @sum = @a + @b;
PRINT @sum;
```

7-2

```sql
USE jxgl
DECLARE @avgscore FLOAT, @sumscore FLOAT;
SELECT {@avgscore = AVG(成绩), @sumscore = SUM(成绩)}
FROM 学生, 选修
WHERE 学生.学号 = 选修.学号 AND 性别 = '男'
SELECT @avgscore, @sumscore
```

```sql
SELECT AVG(成绩), SUM(成绩)
FROM 学生, 选修
WHERE 学生.学号 = 选修.学号 AND 性别 = '男'
```

## Comments, 注释

- [-- (Comment) (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/comment-transact-sql?view=sql-server-ver16)
- [Slash Star (Block Comment) (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/slash-star-comment-transact-sql?view=sql-server-ver16)

```sql
-- text_of_comment
```

```sql
/*  
text_of_comment  
*/
```

## [Control of Flow](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/control-of-flow?view=sql-server-ver16), 控制流

### [WAITFOR](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/waitfor-transact-sql?view=sql-server-ver16)

```sql
WAITFOR   
{  
    DELAY 'time_to_pass'   
  | TIME 'time_to_execute'   
  | [ ( receive_statement ) | ( get_conversation_group_statement ) ]   
    [ , TIMEOUT timeout ]  
}
```

```sql
WAITFOR
{
	TIME '10:30'
}
```

### [BEGIN...END](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/begin-end-transact-sql?view=sql-server-ver16) (Statement Block)

```sql
BEGIN
    { sql_statement | statement_block }
END
```

```sql
-- 7-3
USE jxgl;
GO

IF (SELECT AVG(成绩) FROM 选修 WHERE 学号 = '19010101') >= 60
BEGIN
	PRINT '该同学通过全部考试，没有挂科'
END;
```

### [IF...ELSE](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/if-else-transact-sql?view=sql-server-ver16)

```sql
IF boolean_expression
    { sql_statement | statement_block }
[ ELSE
    { sql_statement | statement_block } ]
```

```sql
-- 7-4 根据给定教师的姓名，查询该教师的本校工龄是否在30年以上
USE jxgl;
GO

IF (SELECT DATEDIFF(YEAR, 工作日期, GETDATE())
	FROM 教师
	WHERE 姓名 = '李力群'
) >= 30
	PRINT '该教师的工龄至少30年，可以提出退休申请';
ELSE
	PRINT '该教师的工龄至少30年，不可以提出退休申请';
```

```sql
-- 7-5
USE jxgl;
GO

IF EXISTS(SELECT *
		  FROM 课程
		  WHERE 课程类型 = '考查')
	SELECT COUNT(*) AS '考查课门数'
	FROM 课程
	WHERE 课程类型 = '考查';
ELSE
	PRINT '没有考查课';
```

#### e.g.

``` SQL
-- 声明并初始化循环计数器变量
DECLARE @i INTEGER; -- (1)
SET @i = 1;

-- 循环开始
WHILE @i <= 51
BEGIN -- (2)
    -- 向表中插入数据
    INSERT INTO table_name ([column1], [column2])
    VALUES (CONCAT('类型名', @i), CONCAT('类型描述', @i)); -- (3)
    
    -- 更新循环计数器
    SET @i = @i + 1;
END -- (4)

```

1. `DECLARE @i INTEGER` - 声明了一个名为 `@i` 的整数变量。这个变量将被用来追踪循环的计数。
2. `BEGIN` - 这个关键字标志着循环的开始，表示下面的代码块是循环体。
3. `CONCAT` 函数用于将字符串的值拼接在一起
4. `END` - 这个关键字标志着循环的结束，表示循环体的代码块结束。

### [WHILE](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/while-transact-sql?view=sql-server-ver16)

```sql
WHILE boolean_expression
    { sql_statement | statement_block | BREAK | CONTINUE }
```

```sql
DECLARE @sum AS INT;
DECLARE @i AS SMALLINT;
SET @sum = 0;
SET @i = 0;

WHILE @i <= 100 -- 外层循环从1到100
BEGIN
	SET @i= @i + 1
	
	IF（@i % 2） = 0 -- 如果@i能够被 2 整除，则不是奇数
		CONTINUE
	ELSE
		SET @sum = @sum + @i
		
	IF @i >= 99
		BREAK
END

PRINT '1到100的奇数之和为：' + CONVERT(char(6), @sum); -- 输出和
```

## [BREAK](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/break-transact-sql?view=sql-server-ver16)

### [RETURN](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/return-transact-sql?view=sql-server-ver16)

```sql
RETURN [ integer_expression ]
```

### [GOTO](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/goto-transact-sql?view=sql-server-ver16)

```sql
Define the label:   
label:   
Alter the execution:  
GOTO label
```

### [THROW](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/throw-transact-sql?view=sql-server-ver16)

```sql
THROW [ { error_number | @local_variable }
    , { message | @local_variable }
    , { state | @local_variable } ]
[ ; ]
```

```sql
-- 7-11
USE jxgl;
GO

BEGIN TRY
	INSERT INTO 选修(成绩编码, 学号, 课程号, 成绩)
	VALUES (20, '19020104', '02', 99)
END TRY
BEGIN CATCH
	THROW 51000, '成绩编码列上有identity约束，不能人为插入值', 1
END CATCH
```

## Expressions, 表达式

### [CASE](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/case-transact-sql?view=sql-server-ver16)

```sql
-- Simple CASE expression:
CASE input_expression
     WHEN when_expression THEN result_expression [ ...n ]
     [ ELSE else_result_expression ]
END

-- Searched CASE expression:
CASE
     WHEN Boolean_expression THEN result_expression [ ...n ]
     [ ELSE else_result_expression ]
END
```

```sql
-- 7-6
USE jxgl;
GO

SELECT 学号, 课程号,
	CASE 课程号
		WHEN '01' THEN '计算机基础'
		WHEN '02' THEN '企业管理'
		WHEN '03' THEN 'C程序设计'
		ELSE '其他课程'
		END AS 课程名称,
	成绩
FROM 选修
```

```sql
-- 7-7
USE jxgl;
GO

UPDATE 授课
SET 课酬 = 学时 * (
		CASE
			WHEN 职称 = '教授' THEN 150
			WHEN 职称 = '副教授' THEN 120
			WHEN 职称 = '讲师' THEN 100
			ELSE 60
			END
		)
FROM 教师, 课程, 授课
WHERE 教师.工号 = 授课.工号 AND 课程.课程号 = 授课.课程号;
GO

SELECT *
FROM 授课;
```

## Functions, 函数

```sql
-- 7-12
SELECT 课程号, COUNT(*) AS 选修人数
FROM 选修
GROUP BY 选修号
```

```sql
-- 7-13
SELECT PATINDEX('%李_%', 姓名)
FROM 教师
```

```sql
-- 7-14
DECLARE @num money
SET @num = 1234.56
SELECT CONVERT(varchar(50), @num, 0)
SELECT CONVERT(varchar(50), @num, 1)
SELECT CONVERT(varchar(50), @num, 2)
```

```sql
-- 7-15
DECLARE @num2 float
SET @num2 = 1234.56
SELECT CONVERT(varchar(50), @num2, 0)
SELECT CONVERT(varchar(50), @num2, 1)
SELECT CONVERT(varchar(50), @num2, 2)
```

```sql
-- 7-16
USE jxgl;
GO

CREATE FUNCTION dbo.fsum (@num1 INT, @num2 INT = 6)
RETURNS INT
AS
BEGIN
	RETURN @num1 + @num2
END
GO

DECLARE @j INT
EXECUTE
```

```sql
-- 7-17
USE jxgl
GO

CREATE FUNCTION dbo.fage(@priordate DATETIME, @curdate DATETIME)
RETURNS INT
AS
BEGIN
RETURN YEAR(@curdate) - YEAR(@priordate)
END
GO

SELECT 学号, 姓名, 性别, dbo.fage(出生日期, GETDATE())
AS 年龄 FROM 学生
SELECT 工号, 姓名, 性别, dbo.fage(工作日期, GETDATE())
AS 工龄 FROM 教师
```

```sql
-- 7-18
USE jxgl
GO

CREATE FUNCTION dbo.finfo (@xh char(8) = '19010101')
RETURNS TABLE
AS
RETURN
(
	SELECT 学生.学号, 姓名, 性别, 课程号, 成绩 FROM 学生, 选修
	WHERE 学生.学号 = 选修.学号 AND 学生.学号 = @xh
);
GO

SELECT *
FROM dbo.finfo(default)
```

https://learn.microsoft.com/en-us/sql/relational-databases/user-defined-functions/create-user-defined-functions-database-engine?view=sql-server-ver16#TVF

```sql
IF OBJECT_ID (N'Sales.ufn_SalesByStore', N'IF') IS NOT NULL
    DROP FUNCTION Sales.ufn_SalesByStore;
GO
CREATE FUNCTION Sales.ufn_SalesByStore (@storeid int)
RETURNS TABLE
AS
RETURN
(
    SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'Total'
    FROM Production.Product AS P
    JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID
    JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID
    JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID
    WHERE C.StoreID = @storeid
    GROUP BY P.ProductID, P.Name
);
```

```sql
-- 7-19
USE jxgl;
GO

CREATE FUCNTION score_info (@courseid char(2))
RETURNS @total_score TABLE (
	课程号 char(2),
	学号 char(8),
	姓名 char(6),
	性别 char(2),
	成绩 TINYINT
) AS
BEGIN
	INSERT @total_score
	SELECT 课程号, 选修.学号, 姓名, 性别, 成绩
	FROM 选修, 学生
	WHERE 选修.学号 = 学生.学号 AND 课程号 = @courseid
	RETURN
END
GO

SELECT *
FROM score_info('02')
```

---

Last Updated: Tue Oct 22 11:07:03 CST 2024




