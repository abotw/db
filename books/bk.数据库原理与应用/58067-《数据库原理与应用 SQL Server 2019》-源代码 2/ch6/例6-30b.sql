select 学号,avg(成绩) as avg_成绩 into temp from 选修 group by 学号
go
select 选修.* from 选修,temp  where  选修.学号=temp.学号 and 成绩>avg_成绩
