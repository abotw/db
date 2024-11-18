---
title: Assessment 2
layout: page
parent: Assessments
last updated: 2024-11-18T23:39:00
---

# Assessment 2

{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## p0: create a database named `library`

- [Create a database](https://learn.microsoft.com/en-us/sql/relational-databases/databases/create-a-database?view=sql-server-ver16)

```sql
create database library
on
(name = library_dat,
 filename = 'E:\db\LibraryData\librarydt.mdf',
 size = 10,
 maxsize = 50,
 filegrowth = 5
)
log on
(name = library_log,
 filename = 'E:\db\LibraryData\librarylog.mdf',
 size = 5mb,
 maxsize = 25mb,
 filegrowth = 5mb
);
go
```

## p1: create tables part 1

> 在 library 数据库中，使用 T-SQL 语句创建“图书”表和“读者”两表。
> 两表结构分别定义如表5-16和表5-17所示，利用T-SQL创建两表。（备注列括号内的内容暂不处理）

```sql
use library;
go
-- 1. 创建图书表
create table 图书 (
	图书编号 char(6) not null primary key,
	书名 varchar(20) not null,
	类别 char(12),
	作者 varchar(20),
	出版社 varchar(20),
	出版日期 datetime,
	定价 money
);
-- 2. 创建读者表
create table 读者 (
	读者编号 char(4) not null,
	姓名 char(6) not null,
	性别 char(2),
	单位 varchar(20),
	电话 varchar(13),
	读者类型 int,
	已借数量 int
);
go
```

### 1. "图书"表结构

表5-16

| 列名   | 数据类型        | 备注                    |
| ---- | ----------- | --------------------- |
| 图书编号 | char(6)     | not null, primary key |
| 书名   | varchar(20) | not null              |
| 类别   | char(12)    |                       |
| 作者   | varchar(20) |                       |
| 出版社  | varchar(20) |                       |
| 出版日期 | datetime    |                       |
| 定价   | money       |                       |

```sql
use library;
go
-- 1. 创建图书表
create table 图书 (
	图书编号 char(6) not null primary key,
	书名 varchar(20) not null,
	类别 char(12),
	作者 varchar(20),
	出版社 varchar(20),
	出版日期 datetime,
	定价 money
);
go
```

| 图书编号   | 书名              | 类别  | 出版社     | 作者     | 定价  | 出版日期    |
| ------ | --------------- | --- | ------- | ------ | --- | ------- |
| TP0001 | 数据结构            | 计算机 | 机械工业出版社 | 敬一明    | 50  |         |
| TP0002 | 计算机应用基础         | 计算机 | 高等教育出版社 | 杨正东    | 20  |         |
| TP0013 | SQL Server 2000 | 计算机 | 大连理工出版社 | 叶潮流    | 30  | 2010.01 |
| TP0004 | C语言程序设计         | 计算机 | 清华大学出版社 | 谭浩强    | 25  |         |
| H31001 | 实用英语精读          | 英语  | 中国人大出版社 | 张锦芯    | 25  |         |
| F27505 | 管理学概论           | 管理  | 高等教育出版社 | 李道芳    | 35  | 2011.11 |
| TB0004 | 工业管理            | 管理  | 机械工业出版社 | Fayol  | 70  |         |
| O15005 | 线性代数            | 数学  | 机械工业出版社 | 李京平    | 50  |         |
| FO0006 | 电子商务            | 管理  | 机械工业出版社 | Durark | 14  |         |
| TP0038 | ASP程序设计         | 计算机 | 水利水电出版社 | 叶潮流    | 29  | 2008.10 |

---

- [USE (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/use-transact-sql?view=sql-server-ver16)

### 2. "读者"表结构


表5-17

| 列名   | 数据类型        | 备注                      |
| ---- | ----------- | ----------------------- |
| 读者编号 | char(4)     | not null, (primary key) |
| 姓名   | char(6)     | not null                |
| 性别   | char(2)     |                         |
| 单位   | varchar(20) |                         |
| 电话   | varchar(13) |                         |
| 读者类型 | int         | (foreign key)           |
| 已借数量 | int         |                         |

```sql
use library;
go
-- 2. 创建读者表
create table 读者 (
	读者编号 char(4) not null,
	姓名 char(6) not null,
	性别 char(2),
	单位 varchar(20),
	电话 varchar(13),
	读者类型 int,
	已借数量 int
);
go
```

| 读者编号 | 姓名  | 性别  | 单位   | 电话          | 读者类型 | 已借数量 |
| ---- | --- | --- | ---- | ----------- | ---- | ---- |
| 1001 | 刘春华 | 男   | 管理学院 | 81234567    | 1    |      |
| 1002 | 王新刚 | 男   | 经济学院 | 13829023456 | 2    |      |
| 1003 | 何立锋 | 女   | 管理学院 | 13805514067 | 2    |      |
| 1004 | 王永平 | 男   | 文学院  | 13908423456 | 1    |      |
| 1005 | 周士杰 | 女   | 教育学院 | 13105654567 | 1    |      |
| 1006 | 庞丽萍 | 男   | 数理学院 | 1380551**** | 1    |      |
| 1007 | 张涵韵 | 女   | 艺术学院 | 1860551**** | 2    |      |
| 1008 | 王晓静 | 男   | 电子学院 | 1332901**** | 1    |      |
| 1009 | 罗国明 | 女   | 电子学院 | 1320565**** | 2    |      |
| 1010 | 李春刚 | 男   | 机电学院 | 1330551**** | 2    |      |

## p2: create table part 2

> 在 librar y数据库中增加“读者类型”表和“借阅”两表。
> 两表结构分别定义如表5-18和表5-19所示，利用 T-SQL 语句完成以下功能。（备注列括号内的内容暂不处理）

```sql
use library;
go
-- 3. 创建读者类型表
create table 读者类型 (
	类型编号 int not null,
	类型名称 char(8) not null,
	限借数量 int not null,
	借阅期限 int
);
-- 4. 创建借阅表
create table 借阅 (
	读者编号 char(4) not null,
	图书编号 char(6),
	借书日期 datetime not null,
	还书日期 datetime,
	foreign key (图书编号) references 图书(图书编号)
);
go
```

### 3. "读者类型"表结构

表5-18

| 列名   | 数据类型    | 备注                      |
| ---- | ------- | ----------------------- |
| 类型编号 | int     | not null, （primary key) |
| 类型名称 | char(8) | not null                |
| 限借数量 | int     | not null                |
| 借阅期限 | int     |                         |

```sql
use library;
go
-- 3. 创建读者类型表
create table 读者类型 (
	类型编号 int not null,
	类型名称 char(8) not null,
	限借数量 int not null,
	借阅期限 int
);
go
```

| 类型编号 | 类型名称 | 限借数量 | 借阅期限 |
| ---- | ---- | ---- | ---- |
| 1    | 教师   | 20   | 180  |
| 2    | 学生   | 10   | 90   |

### 4. "借阅"表结构

表5-19

| 列名   | 数据类型     | 备注                      |
| ---- | -------- | ----------------------- |
| 读者编号 | char(4)  | not null, (foreign key) |
| 图书编号 | char(6)  | not null, foreign key   |
| 借书日期 | datetime | not null                |
| 还书日期 | datetime |                         |

```sql
use library;
go
-- 4. 创建借阅表
create table 借阅 (
	读者编号 char(4) not null,
	图书编号 char(6),
	借书日期 datetime not null,
	还书日期 datetime,
	foreign key (图书编号) references 图书(图书编号)
);
go
```

| 串号  | 读者编号 | 图书编号   | 借书日期       | 还书日期       |
| --- | ---- | ------ | ---------- | ---------- |
| 1   | 1001 | TP0001 | 2011-10-08 | 2011-12-18 |
| 2   | 1001 | TP0002 | 2011-10-08 | 2011-12-18 |
| 3   | 1003 | TP0013 | 2011-9-1   |            |
| 4   | 1004 | TP0001 | 2011-10-26 |            |
| 5   | 1005 | H31001 | 2011-11-23 |            |
| 6   | 1006 | F27505 | 2011-9-18  |            |
| 7   | 1001 | TB0004 | 2010-5-18  |            |
| 8   | 1005 | O15005 | 2012-1--15 |            |
| 9   | 1009 | FO0006 | 2012-1-8   |            |
| 10  | 1006 | TP0038 | 2011-12-20 |            |

### 题目

#### 1. 使用T-SQL语句在library数据库中创建“读者类型”表。

#### 2. 使用T-SQL语句在library数据库中创建“借阅”表。

#### 3. 使用T-SQL语句为“读者”表的“读者编号”列添加主键。

```sql
use library;
go

alter table 读者
add constraint pk_读者_读者编号 primary key (读者编号);
go
```

#### 4. 使用T-SQL语句为“读者”表的“性别”列添加check约束，使之取值为男或女。

```sql
use library;
go

alter table 读者
add constraint ck_读者_性别 check (性别 = '男' or 性别 = '女');
go
```

#### 5. 使用T-SQL语句为“借阅”表增加“串号”列，数据类型为varchar(10)，并为主键。

```sql
use library;
go

alter table 借阅
add 串号 varchar(10)
constraint pk_借阅_串号 primary key;
go
```

#### 6. 使用T-SQL语句为“借阅”表的“借书日期”列添加一默认约束，取值为getdate()。

```sql
use library;
go

alter table 借阅
add constraint df_借阅_借书日期
default getdate() for 借书日期;
go
```

#### 7. 使用T-SQL语句为“借阅”表的“读者编号”列增加一外键约束，关联于“读者”表的“读者编号”列。

```sql
use library;
go

alter table 借阅
add constraint fk_借阅_读者编号 foreign key (读者编号) references 读者(读者编号);
go
```

#### 8.使用T-SQL语句为“借阅”表的“图书编号”和“读者编号”两列设置唯一约束。

```sql
use library;
go

alter table 借阅
add constraint uk_借阅
unique (图书编号, 读者编号);
go
```

## appendix

```sql
create database library
on
(name = library_dat,
 filename = 'E:\db\LibraryData\librarydt.mdf',
 size = 10,
 maxsize = 50,
 filegrowth = 5
)
log on
(name = library_log,
 filename = 'E:\db\LibraryData\librarylog.mdf',
 size = 5mb,
 maxsize = 25mb,
 filegrowth = 5mb
);
go

use library;
go

-- 1. 创建图书表
create table 图书 (
	图书编号 char(6) not null primary key,
	书名 varchar(20) not null,
	类别 char(12),
	作者 varchar(20),
	出版社 varchar(20),
	出版日期 datetime,
	定价 money
);
go

-- 2. 创建读者表
create table 读者 (
	读者编号 char(4) not null,
	姓名 char(6) not null,
	性别 char(2),
	单位 varchar(20),
	电话 varchar(13),
	读者类型 int,
	已借数量 int
);
go

-- 3. 创建读者类型表
create table 读者类型 (
	类型编号 int not null,
	类型名称 char(8) not null,
	限借数量 int not null,
	借阅期限 int
);
go

-- 4. 创建借阅表
create table 借阅 (
	读者编号 char(4) not null,
	图书编号 char(6),
	借书日期 datetime not null,
	还书日期 datetime,
	foreign key (图书编号) references 图书(图书编号)
);
go

alter table 读者
add constraint pk_读者_读者编号 primary key (读者编号);
go

alter table 读者
add constraint ck_读者_性别 check (性别 = '男' or 性别 = '女');
go

alter table 借阅
add 串号 varchar(10)
constraint pk_借阅_串号 primary key;
go

alter table 借阅
add constraint df_借阅_借书日期
default getdate() for 借书日期;
go

alter table 借阅
add constraint fk_借阅_读者编号 foreign key (读者编号) references 读者(读者编号);
go

alter table 借阅
add constraint uk_借阅
unique (图书编号, 读者编号);
go
```











