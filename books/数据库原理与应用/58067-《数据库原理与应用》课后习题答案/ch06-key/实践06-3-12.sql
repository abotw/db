Select 读者编号, count(*) from 借阅 
where 借书日期 between '2021-10-1' and '2022-10-1'
group by 读者编号 