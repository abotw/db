---
title: "Lab 05: 数据表的创建与管理 (2h)"
layout: home
parent: Labs
---

# Lab 05: 数据表的创建与管理 (2h)

## Q1

在 `library` 数据库中，使用 T-SQL 创建“图书”和“读者”两表：

**“图书”表结构**

| 列名   | 数据类型          | 备注                    |
| ---- | ------------- | --------------------- |
| 图书编号 | `char(6)`     | not null, primary key |
| 书名   | `varchar(30)` | not null              |
| 类别   | `char(12)`    |                       |
| 作者   | `varchar(20)` |                       |
| 出版社  | `varchar(20)` |                       |
| 出版日期 | `datetime`    |                       |
| 定价   | `money`       |                       |

**“读者”表结构**

| 列名   | 数据类型          | 备注       |
| ---- | ------------- | -------- |
| 读者编号 | `char(4)`     | not null |
| 姓名   | `char(6)`     | not null |
| 性别   | `char(2)`     |          |
| 单位   | `varchar(20)` |          |
| 电话   | `varchar(13)` |          |
| 读者类型 | `int`         |          |
| 已借数量 | `int`         |          |

```sql
-- 指定使用 library 数据库
USE library;
GO

-- 创建图书表
CREATE TABLE 图书 (
    图书编号 CHAR(6) NOT NULL PRIMARY KEY,
    书名 VARCHAR(30) NOT NULL,
    类别 CHAR(12),
    作者 VARCHAR(20),
    出版社 VARCHAR(20),
    出版日期 DATETIME,
    定价 MONEY
);

-- 创建读者表
CREATE TABLE 读者 (
    读者编号 CHAR(4) NOT NULL,
    姓名 CHAR(6) NOT NULL,
    性别 CHAR(2),
    单位 VARCHAR(20),
    电话 VARCHAR(13),
    读者类型 INT,
    已借数量 INT
);
```

## Q2

在 `library` 数据库中，使用 T-SQL 语句创建“读者类型”和“借阅”两表：

**"读者类型" 表结构**

| 列名   | 数据类型      | 备注       |
| ---- | --------- | -------- |
| 类型编号 | `int`     | not null |
| 类型名称 | `char(6)` | not null |
| 限借数量 | `int`     | not null |
| 借阅期限 | `int`     |          |

**”借阅“表结构**

| 列名   | 数据类型       | 备注                    |
| ---- | ---------- | --------------------- |
| 读者编号 | `char(4)`  | not null              |
| 图书编号 | `char(6)`  | not null, foreign key |
| 借书日期 | `datetime` | not null              |
| 还书日期 | `datetime` |                       |

```sql
-- 指定使用 library 数据库
USE library;
GO

-- 创建读者类型表
CREATE TABLE 读者类型 (
    类型编号 INT NOT NULL,
    类型名称 CHAR(6) NOT NULL,
    限借数量 INT NOT NULL,
    借阅期限 INT
);

-- 创建借阅表
CREATE TABLE 借阅 (
    读者编号 CHAR(4) NOT NULL,
    图书编号 CHAR(6) NOT NULL,
    借书日期 DATETIME NOT NULL,
    还书日期 DATETIME,
    FOREIGN KEY (图书编号) REFERENCES 图书(图书编号)   -- 图书编号外键，引用图书表
);
```

## Q3

```sql
-- 指定使用 library 数据库
USE library;
GO

-- 将类型编号列设置为主键
ALTER TABLE 读者类型
ADD CONSTRAINT PK_读者类型_类型编号 PRIMARY KEY (类型编号);

```

---

Last Updated: Sun Oct  6 11:33:56 CST 2024

