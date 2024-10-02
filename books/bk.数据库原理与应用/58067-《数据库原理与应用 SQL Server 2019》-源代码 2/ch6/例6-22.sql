select  a.学号,a.姓名,a.总分,b.学号,b.姓名 
from 学生 as a inner join  学生 as b on a.总分=b.总分
where a.学号<>b.学号 
order by a.总分
