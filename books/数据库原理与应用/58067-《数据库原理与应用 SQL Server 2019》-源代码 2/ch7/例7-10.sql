use jxgl
go
if (select count(*) from ѡ�� where ѧ��='19010101')=0
goto notation
begin
  select '���ڸ�ѧ����ѡ����Ϣ'
  select ѧ��,�γ̺�,�ɼ� from ѡ�� where ѧ��='19010101'
  return                  --�������˳�������ʡ��
end
notation: select '�����ڸ�ѧ����ѡ��'
