/*�����޸�*/
use jxgl
update �ڿ�
 set �γ� = ѧʱ* case 
  when ְ��='����' then 150
  when ְ��='������' then 120
  when ְ��='��ʦ' then 100
  else 60
  end 
 from ��ʦ,�γ�,�ڿ�
 where ��ʦ.����=�ڿ�.���� 
   and �γ�.�γ̺�=�ڿ�.�γ̺�
go
select * from �ڿ�
