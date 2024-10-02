select 姓名,性别,'教师' as 身份 from 读者 where 性别 = '男' and 读者类型=1
 union
select 姓名,性别,'学生' as 身份 from 读者 where 性别 = '男'  and 读者类型=2
