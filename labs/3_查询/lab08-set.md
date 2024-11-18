---
title: "Lab 08: 集合查询"
layout: page
parent: Labs
last updated: 2024-11-14T16:49:00
---

# Lab 08: 集合查询

## Notes

- **union**
- **intersect**
- **except**

## Contents

### 第1关：使用集合查询，查询所有男教师和所有男学生，并标示身份

```sql
use library;
go

-- solution 1: case
-- select 姓名, 性别,
--     case
--         when 读者类型 = 1 then '教师'
--         when 读者类型 = 2 then '学生'
--     end as 身份
-- from 读者
-- where 性别 = '男' and (读者类型 = 1 or 读者类型 = 2)
-- order by 姓名;
-- go

-- solution 2: union
select 姓名, 性别, '教师' as 身份
from 读者
where 性别 = '男' and 读者类型 = 1
union
select 姓名, 性别, '学生' as 身份
from 读者
where 性别 = '男' and 读者类型 = 2;
go
```

### 第2关：使用集合查询，查询只是读者编号“1001”借阅了，而读者编号“1004”没有借阅的图书编号

```sql
use library;
go

select 图书编号
from 借阅
where 读者编号 = '1001'
except
select 图书编号
from 借阅
where 读者编号 = '1004';
go
```

### + 第3关：使用集合查询，查询读者编号“1001”和读者编号“1004”都借阅的图书编号

```sql
use library;
go

select 图书编号
from 借阅
where 读者编号 = '1001'
intersect
select 图书编号
from 借阅
where 读者编号 = '1004';
go
```



