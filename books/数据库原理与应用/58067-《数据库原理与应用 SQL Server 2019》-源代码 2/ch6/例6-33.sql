select ���� from ѧ�� where not exists						/*��ѯѧ��x*/
 (select * from �γ� where not exists						/*�����ڿγ�y*/
  (select * from ѡ�� where ѧ��=ѧ��.ѧ�� and �γ̺�=�γ�.�γ̺�)) /*x��ѡ�γ�*/
