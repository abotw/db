select * from 读者 a where 已借数量<=(
select min(已借数量) from 读者 b where a.读者类型=b.读者类型)
