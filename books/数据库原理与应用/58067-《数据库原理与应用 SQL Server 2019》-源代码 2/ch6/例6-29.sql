--语句1：
select 姓名,出生日期 from 学生 where 性别='男'
 and 出生日期>any(select 出生日期 from 学生 where 性别='女')
  go
--语句2：
select 姓名,出生日期 from 学生 where 性别='男'
 and 出生日期>(select min(出生日期) from 学生 where 性别='女')
