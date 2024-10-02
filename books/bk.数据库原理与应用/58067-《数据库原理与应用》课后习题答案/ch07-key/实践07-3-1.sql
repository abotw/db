use jxgl
go
create table intro_paper(
工号  char(6),
姓名 char(6),
人数 int check(人数>=0 and 人数<=20),
工作量 as
case 
when 人数<8  then 12*人数
when 人数<15  then 12*8+6*(人数-8)
else 12*8+6*7+3*(人数-15)
end
)
go
insert  into intro_paper(工号,姓名)
select 工号,姓名 from 教师