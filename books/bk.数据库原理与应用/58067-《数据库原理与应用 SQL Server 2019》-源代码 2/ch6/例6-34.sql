select distinct ѧ�� from ѡ�� a where not exists
 (select * from ѡ�� b where b.ѧ��='19010101' and not exists
  (select * from ѡ�� c where c.ѧ��=a.ѧ�� and c.�γ̺�=b.�γ̺�))
