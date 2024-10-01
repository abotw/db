/* 做了普遍性优化，原来程序也行*/
use jxgl
go
create procedure avgscore 
@classname varchar(20),@score float output
as
declare @classid int        --返回值类型只能是int类型
set @classid = 0
--通过班级名称参数@classname, 获取班级编号@classid
select @classid = 班级号 from 班级
  where 班级名称=@classname   
if @classid=0				--字符类型可转换为int类型
  return 0 					--设置返回值为0
else
  begin
 select @score=avg(成绩) from 学生,选修
    where 选修.学号=学生.学号
	 and 班级号=@classid
  return 1					--设置返回值为1
  end
