--语句1：
select * from 教师 where 职称 in('助教','讲师')
go
--语句2：
select * from 教师 where 职称='助教' or 职称='讲师'
