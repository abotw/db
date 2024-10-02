use jxgl
select 学号,课程号,
case 课程号 
 when '01' then '计算机基础'
 when '02' then '企业管理'
 when '03' then 'C语言程序设计'
 else '其他课程'
end as 课程名称,成绩
from 选修