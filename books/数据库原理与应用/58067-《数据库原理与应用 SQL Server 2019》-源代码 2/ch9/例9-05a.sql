use jxgl
go
create proc pro_avg_成绩
@xm char(6)='储兆雯',@avgscore float output
as
select @avgscore=avg(成绩)
 from 学生,选修
 where 学生.学号=选修.学号 and 姓名=@xm
go
