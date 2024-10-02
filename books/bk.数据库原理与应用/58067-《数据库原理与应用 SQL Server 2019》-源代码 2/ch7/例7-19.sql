use jxgl
go
create function score_info(@courseid char(2))
returns @total_score table(课程号 char(2),学号 char(8),
姓名 char(6),性别 char(2),成绩 tinyint)
as
begin
insert @total_score
select 课程号,选修.学号,姓名,性别,成绩
from 选修,学生 
where 选修.学号=学生.学号 and 课程号=@courseid
return
end
go
select * from score_info('02')
