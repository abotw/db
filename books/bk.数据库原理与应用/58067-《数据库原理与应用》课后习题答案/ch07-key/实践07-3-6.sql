use library
go
create function dbo.tushu_inform(@tsbh char(6))
returns @total_tushu table (
���� varchar(20),������ varchar(20),���� varchar(20),���� money)
as
begin
insert @total_tushu
select ����,������,����,����
from ͼ��
where ͼ����=@tsbh
return 
end 
go 
select  * from dbo.tushu_inform('TP0001')