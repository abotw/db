select ѧ��,���� from ѧ��
 where not exists (select * from ѡ�� where ѧ��= ѧ��.ѧ�� and �γ̺�='01')
--�ȼ����1��
select ѧ��,����from ѧ��
 where ѧ��not in (select ѧ��from ѡ�� where  �γ̺�='01')
--�ȼ����2��
select ѧ��,����from ѧ��
except
select ѧ��,����from ѧ�� where ѧ��in (
  select ѧ��from ѡ��where �γ̺�='01')
