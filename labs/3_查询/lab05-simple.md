---
title: "Lab 05: 简单查询 (2h)"
layout: page
parent: Labs
last updated: 2024-11-13T19:22:00
---
# Lab 05: 简单查询 (2h)

## Contents

### +第1关：查询“读者”表的所有信息

```sql
use library;
go

select * from 读者;
go
```

### 第2关：查询“图书”表中图书的“种类”

```sql
use library;
go

select distinct 类别 as 种类
from 图书;
go
```

### +第3关：查询“读者类型”表的所有信息，并增加一个说明列“工作日”，列值也为“工作日”

```sql
use library;
go

select *, '工作日' as 工作日
from 读者类型;
go
```

### 第4关：查询“读者”表中前3位读者编号、姓名、性别和单位

```sql
use library;
go

select top 3 读者编号, 姓名, 性别, 单位
from 读者;
go
```

### 第5关：查阅读者编号为“1001”读者的借阅信息

```sql
use library;
go

select *
from 借阅
where 读者编号 = '1001';
go
```

### 第6关：查询“图书”表中“人民邮电出版社”出版的图书信息

```sql
use library;
go

select *
from 图书
where 出版社 = '人民邮电出版社';
go
```

### 第7关：查询“图书”馆总计“藏书数量”

```sql
use library;
go

select count(*) as 藏书数量
from 图书;
go
```

### 第8关：查询“图书”馆中图书的“平均定价”

```sql
use library;
go

select avg(定价) as 平均定价
from 图书;
go
```

### 第9关：查询“图书”表中图书“定价"在40~60之间的图书信息

```sql
use library;
go

select *
from 图书
where 定价 between 40 and 60;
go
```

### 第10关：查询“图书”表中书名中包含“程序设计”的图书信息

```sql
use library;
go

select *
from 图书
where 书名 like '%程序设计%';
go
```

### 第11关：查询“图书”表中“计算机”类别的图书信息，输出结果按“出版日期”升序输出

```sql
use library;
go

select *
from 图书
where 类别 = '计算机'
order by 出版日期;
go
```

### 第12关：查询“读者”表中各单位的“读者总数”

```sql
use library;
go

select 单位, count(*) as 读者总数
from 读者
group by 单位;
go
```

### +第13关：在“借阅”表中查询==各==读者编号"借书日期“在“2021-10-1”到“2022-10-1”期间的“借阅数量”

```sql
use library;
go

select 读者编号, count(*) as 借阅数量
from 借阅
where 借书日期 between '2021-10-1' and '2022-10-1'
group by 读者编号;
go
```

### 第14关：查询“图书”定价最高的前3本图书的图书编号、书名、定价

```sql
use library;
go

select top 3 图书编号, 书名, 定价
from 图书
order by 定价 desc;
go
```

### 第15关：在“借阅”表中查询借阅图书次数超过3次（含3次）的读者编号、借阅数量

```sql
use library;
go

select 读者编号, count(*) as 借阅数量
from 借阅
group by 读者编号
having count(*) >= 3;
go
```

### 第16关：查询各出版社的馆藏“图书数量”，并存储到 pubpress 表中

```sql
use library;
go

select 出版社, count(*) as 图书数量
into pubpress
from 图书
group by 出版社;
go
```

## Notes

### [SELECT - INTO Clause (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/queries/select-into-clause-transact-sql?view=sql-server-ver16)

```sql
[ INTO new_table ]
[ ON filegroup ]
```

#### [A. Creating a table by specifying columns from multiple sources](https://learn.microsoft.com/en-us/sql/t-sql/queries/select-into-clause-transact-sql?view=sql-server-ver16#a-creating-a-table-by-specifying-columns-from-multiple-sources)

```sql
SELECT c.FirstName, c.LastName, e.JobTitle, a.AddressLine1, a.City,   
    sp.Name AS [State/Province], a.PostalCode  
INTO dbo.EmployeeAddresses  
FROM Person.Person AS c  
    JOIN HumanResources.Employee AS e   
    ON e.BusinessEntityID = c.BusinessEntityID  
    JOIN Person.BusinessEntityAddress AS bea  
    ON e.BusinessEntityID = bea.BusinessEntityID  
    JOIN Person.Address AS a  
    ON bea.AddressID = a.AddressID  
    JOIN Person.StateProvince as sp   
    ON sp.StateProvinceID = a.StateProvinceID;  
GO
```


