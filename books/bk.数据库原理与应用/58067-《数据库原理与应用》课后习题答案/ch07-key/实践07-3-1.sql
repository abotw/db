use jxgl
go
create table intro_paper(
����  char(6),
���� char(6),
���� int check(����>=0 and ����<=20),
������ as
case 
when ����<8  then 12*����
when ����<15  then 12*8+6*(����-8)
else 12*8+6*7+3*(����-15)
end
)
go
insert  into intro_paper(����,����)
select ����,���� from ��ʦ