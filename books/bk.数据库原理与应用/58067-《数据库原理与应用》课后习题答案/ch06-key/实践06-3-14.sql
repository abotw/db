Select max(已借数量),min(已借数量),avg(已借数量) from 读者

--优化代码如下：

update 读者
set 已借数量=(
select COUNT(*) from 借阅 
where 借阅.读者编号=读者.读者编号
group by 读者编号)
go
select max(已借数量) as 最多借阅数,min(已借数量) as 最少借阅数,
avg(已借数量) as 平均借阅数 from 读者 

