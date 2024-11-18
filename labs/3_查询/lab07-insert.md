---
title: "Lab 07: 嵌套查询"
layout: page
parent: Labs
last updated: 2024-11-14T08:42:00
---

# Lab 07: 嵌套查询

## Contents

### 第1关：使用嵌套查询，查询“作者所著图书的平均定价”大于“所有图书的平均定价”的作者

```sql
use library;
go

select 作者, avg(定价) as 作者所著图书的平均定价
from 图书
group by 作者
having avg(定价) > (
    select avg(定价)
    from 图书
);
go
```

### 第2关：使用嵌套查询，查询借阅了读者编号“1009”借阅图书的借阅信息

```sql
use library;
go

select 借阅.读者编号, 借阅.图书编号, 借阅.借书日期, 借阅.还书日期
from 借阅
where 借阅.图书编号 in (
    select 借阅.图书编号
    from 借阅
    where 借阅.读者编号 = '1009'
);
go
```

### 第3关：使用嵌套查询，查询“定价”高于所有图书“平均单价”的图书信息

```sql
use library;
go

select *
from 图书
where 定价 > (
    select avg(定价)
    from 图书
);
go
```

### 第4关：使用嵌套查询，查询高等教育出版社中定价低于所有图书平均定价的图书信息

```sql
use library;
go

select *
from 图书
where 出版社 = '高等教育出版社'
and 定价 < (
    select avg(定价)
    from 图书
);
go
```

### +第5关：使用嵌套查询，查询各出版社中定价高于其所有图书的"平均定价"的图书信息

> 查询==各==出版社中“定价”高于其所有==图书==的“平均定价”的图书信息。

```sql
use library;
go

select *
from 图书 as t1
where 定价 > (
    select avg(定价)
    from 图书 as t2
    where t1.出版社 = t2. 出版社
);
go
```

### 第6关：使用嵌套查询，查询借阅图书的读者信息

```sql
use library;
go

select *
from 读者
where 读者编号 in (
    select 读者编号
    from 借阅
);
go
```

### 第7关：使用嵌套查询，查询没有借阅图书的读者信息

```sql
use library;
go

select *
from 读者
where 读者编号 not in (
    select 读者编号
    from 借阅
);
go
```

### 第8关：使用嵌套查询，查询馆藏图书最多的作者姓名及馆藏数量

```sql
use library;
go

-- solution 1
-- select top 1 作者, count(*) as 馆藏数量
-- from 图书
-- group by 作者
-- order by count(*) desc;
-- go

-- solution 2
select 作者, count(*) as 馆藏数量
from 图书
where 作者 = (
    select top 1 作者
    from 图书
    group by 作者
    order by count(*) desc
)
group by 作者;
go
```

### 第9关：使用嵌套查询，查询借阅数量超过3（包括3）的读者信息

```sql
use library;
go

select *
from 读者
where 读者编号 in (
    select 读者编号
    from 借阅
    group by 读者编号
    having count(*) >= 3
);
go
```

### 第10关：使用嵌套查询，查询借阅人数超过3（包括3）的图书编号，图书名称

```sql
use library;
go

select 图书编号, 书名 as 图书名称
from 图书
where 图书编号 in (
    select 图书编号
    from 借阅
    group by 图书编号
    having count(distinct 读者编号) >= 3
);
go
```

### 第11关：使用嵌套查询，查询至少借阅了读者编号“1004”全部借阅图书的读者“姓名”

```sql
use library;
go

select 姓名
from 读者
where 读者编号 in (
    select 读者编号
    from 借阅
    -- 借的书是1004借过的书
    where 图书编号 in (
        select 图书编号
        from 借阅
        where 读者编号 = '1004'
    )
    -- 借书的数量和1004一致
    group by 读者编号
    having count(distinct 图书编号) = (
        select count(distinct 图书编号)
        from 借阅
        where 读者编号 = '1004'
    )
);
go
```

### 第12关：使用嵌套查询，查询借阅了“TP0001”日期最近的读者的读者编号、姓名、图书编号、借书日期

```sql
select 读者.读者编号, 读者.姓名, 借阅.图书编号, 借阅.借书日期
from 读者
join 借阅 on 读者.读者编号 = 借阅.读者编号
where 借阅.图书编号 = 'TP0001'
and 借阅.借书日期 = (
    select MAX(借书日期)
    from 借阅
    where 图书编号 = 'TP0001'
);
go
```

### 第13关：使用嵌套查询，查询读者表中已借数量最少的教师和学生

```sql
use library;
go

select *
from 读者
where (读者类型 = 2 and 已借数量 = (
    select min(已借数量)
    from 读者
    where 读者类型 = 2
))
or (读者类型 = 1 and 已借数量 = (
    select min(已借数量)
    from 读者
    where 读者类型 = 1
))
order by 读者类型;
go
```

### 第14关：使用嵌套查询，在读者表中查询借书数大于平均借书数的读者信息

```sql
use library;
go

select *
from 读者
where 已借数量 > (
    select avg(已借数量)
    from 读者
);
go
```

## Notes

