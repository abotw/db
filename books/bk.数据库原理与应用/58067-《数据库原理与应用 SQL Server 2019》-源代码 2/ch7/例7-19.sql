use jxgl
go
create function score_info(@courseid char(2))
returns @total_score table(�γ̺� char(2),ѧ�� char(8),
���� char(6),�Ա� char(2),�ɼ� tinyint)
as
begin
insert @total_score
select �γ̺�,ѡ��.ѧ��,����,�Ա�,�ɼ�
from ѡ��,ѧ�� 
where ѡ��.ѧ��=ѧ��.ѧ�� and �γ̺�=@courseid
return
end
go
select * from score_info('02')
