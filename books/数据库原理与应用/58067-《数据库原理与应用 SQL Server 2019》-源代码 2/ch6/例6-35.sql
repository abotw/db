select 姓名,性别,'学生' as 身份 from 学生 where 性别 = '女' 
union
select 姓名,性别,'教师' as 身份 from 教师 where 性别 = '女'
