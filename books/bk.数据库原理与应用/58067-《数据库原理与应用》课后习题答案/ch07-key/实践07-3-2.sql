use library
go
create table book_shop(
ԭ�� float,
ʵ��Ӧ����� as
case 
when ԭ��<=100 then ԭ��*1
when ԭ��<=500  then ԭ��*0.9
else 
ԭ��*0.85
end)

