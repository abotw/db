---
title: "Lab 09: 数据修改"
layout: page
parent: Labs
last updated: 2024-11-14T08:03:00
---

# Lab 09: 数据修改

## Contents

### 第1关：在"读者"表中插入一条记录：1012，赵珊珊，女，艺术学院，13305512054，2，NULL

```sql
use library;
go

insert into 读者 (读者编号, 姓名, 性别, 单位, 电话, 读者类型, 已借数量)
values ('1012', '赵珊珊', '女', '艺术学院', '13305512054', 2, null);
go
```

### 第2关：更新“图书”表中一条记录：将“C语言程序设计”且作者是“谭浩强”的图书定价由25.00元修改为79.00元

```sql
use library;
go

update 图书
set 定价 = 79.00
where 书名 = 'C语言程序设计' and 作者 = '谭浩强';
go
```

### 第3关：更新“读者”表中“已借数量”为NULL值

```sql
use library;
go

update 读者
set 已借数量 = null;
go
```

### 第4关：删除“读者”表中”单位”艺术学院“已借数量”为NULL值的记录

```sql
use library;
go

delete from 读者
where 单位 = '艺术学院' and 已借数量 is null;
go
```

### 第5关：“统计”并“更新”读者表中的“已借数量”

```sql
use library;
go

update 读者
set 已借数量 = (
    select count(*)
    from 借阅
    where 借阅.读者编号 = 读者.读者编号
);
go
```

## Notes



