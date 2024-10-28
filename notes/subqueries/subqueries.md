---
title: subqueries
layout: home
parent: Notes
---

# Subqueries, 子查询

## Subqueries, 不相关子查询

Subqueries allow you to write more powerful queries. Let’s look at an example…

Let’s say you want to find the course num of every course that has a higher than average num of students. You cannot include an aggregation expression (like AVG) in the WHERE clause because aggregation happens after rows have been filtered. This may seem challenging at first, but sub-queries make it easy:

```
SELECT num
FROM enrollment;
WHERE students >= (
    SELECT AVG(students)
    FROM enrollment;
);
```

The output of this query is:

|num|
|---|
|CS186|
|CS188|

The inner subquery calculated the average and returned one row. The outer query compared the `students` value for each row to what the subquery returned to determine if the row should be kept. Note that this query would be invalid if the subquery returned more than one row because `>=` is meaningless for more than one number. If it returned more than one row we would have to use a set operator like `ALL`.

---

```sql
SELECT *
FROM 学生
WHERE 性别='男' AND 出生日期 > ANY
	(SELECT 出生日期
	 FROM 学生
	 WHERE 性别=女'')
```

## Correlated Subqueries, 相关子查询

The subquery can also be correlated with the outer query. Each row essentially gets plugged in to the subquery and then the subquery uses the values of that row. To illustrate this point, let’s write a query that returns all of the classes that appear in both tables.

```sql
SELECT *
FROM classes
WHERE EXISTS (
    SELECT *
    FROM enrollment
    WHERE classes.num = enrollment.num
);
```

As expected, this query returns:

|num|name|
|---|---|
|CS186|AI|
|CS188|DB|

Let’s start by examining the subquery. It compares the `classes.num` (the num of the class from the current row) to every `enrollment.num` and returns the row if they match. Therefore, the only rows that will ever be returned are rows with classes that occur in each table. The `EXISTS` keyword is a set operator that returns true if any rows are returned by the subquery and false if otherwise. For `CS186` and `CS188` it will return true (because a row is returned by the subquery), but for `CS189` it will return false. There are a lot of other set operators you should know (including `ANY`, `ALL`, `UNION`, `INTERSECT`, `DIFFERENCE`, `IN`) but we will not cover any others in this note (there is plenty of documentation for these operators online).

---

6-30

```sql
SELECT *
FROM 选修 a
WHERE 成绩 > (
	SELECT AVG(成绩) FROM 选修 b
	WHERE a.学号 = b. 学号
);
```

6-31

```sql
-- 相关子查询
SELECT 姓名
FROM 学生 -- 学生名单
WHERE EXISTS (
	SELECT *
	FROM 选修 -- 选修表
	WHERE 学号 = 学生.学号
	AND 成绩 < 60 -- 不及格
);
```

```sql
-- 连接查询
SELECT 姓名
FROM 学生, 选修
WHERE 学号 = 学生.学号
AND 成绩 < 60
```

```sql
-- 不相关子查询
SELECT 姓名
FROM 学生
WHERE 学号
IN (
	SELECT 学号
	FROM 选修
	WHERE 成绩 < 60
);
```

6-32

```sql
-- 相关子查询
SELECT 学号, 姓名
FROM 学生
WHERE NOT EXISTS (
	SELECT *
	FROM 选修
	WHERE 学号 = 学生.学号 AND 课程号 = '01'
);
```

```sql
-- 不相关子查询
SELECT 学号, 姓名
FROM 学生
WHERE 学号 NOT IN (
	SELECT 学号
	FROM 选修
	WHERE 课程号 = '01'
);
```

```sql
SELECT 学号, 姓名
FROM 学生
EXCEPT
SELECT 学号, 姓名
FROM 学生
WHERE 学号 IN (
	SELECT 学号
	FROM 选修
	WHERE 课程号 = '01'
)
```

6-33

```sql
SELECT 姓名
FROM 学生 -- 学生表 -- 不存在不选修的课程
WHERE NOT EXISTS ( -- 不存在课程
	SELECT *
	FROM 课程 -- 课程表
	WHERE NOT EXISTS ( -- 不存在不选修
		SELECT *
		FROM 选修
		WHERE 学号 = 学生.学号 AND 课程号 = 课程.课程号 -- 选修表
	)
)
```

6-34

```sql
SELECT 姓名
FROM 学生 a -- 学生表，查询学生 x
WHERE NOT EXISTS ( -- 不存在课程 y
	SELECT *
	FROM 选修 b -- 选修表
	WHERE b.学号 = '19020102' AND NOT EXISTS ( -- x 不选课程
		SELECT *
		FROM 选修 c -- 选修表
		WHERE c.学号 = a.学号 AND c.课程号 = b.课程号
	)
)
```

---

Last Updated: Thu Oct 17 14:54:55 CST 2024
