select count(*) as 馆藏数量,作者 
into author from 图书 group by 作者 
having count(*)>=all(select count(*) from 图书 group by 作者)
--或者
select top 1 count(*) as 馆藏数量,作者 
into author from 图书 group by 作者 order by count(*) desc