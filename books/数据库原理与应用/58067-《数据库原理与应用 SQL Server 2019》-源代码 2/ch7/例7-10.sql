use jxgl
go
if (select count(*) from 选修 where 学号='19010101')=0
goto notation
begin
  select '存在该学生的选修信息'
  select 学号,课程号,成绩 from 选修 where 学号='19010101'
  return                  --无条件退出，不能省略
end
notation: select '不存在该学生的选修'
