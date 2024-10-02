--语句1：
select 教师.*,授课.* from 教师 inner join 授课 on 教师.工号=授课.工号
go
--语句2：
select 教师.*,授课.* from 教师,授课 where 教师.工号=授课.工号
