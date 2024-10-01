select * from 借阅 where 图书编号=
(select 图书编号 from 图书 where 作者='谭浩强')and 借书日期 between '2021-10-1' and '2022-10-1'
--或
select 借阅.* from 借阅,图书
where 借阅.图书编号=图书.图书编号 and 图书.作者='谭浩强'
and 借书日期 between '2021-10-1' and '2022-10-1'

