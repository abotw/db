select * from 图书
where 出版社='高等教育出版社' and 定价>all(select avg(定价) from 图书)


--拓展题目：
--（23）查询各出版社出版的定价高于其所有图书的平均定价的图书信息。
Select * from 图书 a
 where 定价>(select avg(定价) from 图书 b where a.出版社=b.出版社)
