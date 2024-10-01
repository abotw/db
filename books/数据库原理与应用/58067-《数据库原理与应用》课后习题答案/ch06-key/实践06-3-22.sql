 select * from 图书
where 定价>all(select avg(定价) from 图书)
--拓展题目：
--（22）使用嵌套查询，查询作者所著图书的平均定价大于所有图书的平均定价的作者。
select 作者,avg(定价) as 作者所著图书的平均定价 from 图书 group by 作者
 having avg(定价)>(select avg(定价) as 所有图书的平均定价 from 图书)
 go
 select avg(定价) as 所有图书的平均定价 from 图书