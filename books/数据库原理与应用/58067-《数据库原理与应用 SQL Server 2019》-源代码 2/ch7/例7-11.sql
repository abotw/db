/** �̲��е�raiserror����ѹ�ʱ������̭������ʹ��throw���
����7-11������ѡ�ޡ����������ʱ��ʹ���׳��쳣���������������Ĳ����쳣��Ϣ��
*/
use jxgl
go
begin try
 insert into ѡ��(�ɼ�����,ѧ��,�γ̺�,�ɼ�)
   values(20,'19020104','02',99)
end try 
begin catch
 throw 51000,'�ɼ�����������identityԼ����������Ϊ����ֵ',1
end catch
/**
7���׳��쳣���
�﷨��ʽ���¡�
throw [{error_number|@local_variable},{message|@local_variable},
       {state|@local_variable}][;]
���ܣ�����try��catch�����catchģ���У��׳��쳣������Ϣ��
˵����
��1��error_number|@local_variable��ָ���쳣��Ϣ�ı�ʶ�ţ���ȡֵ50000~2147483647֮��ĳ��������������������Ϊint��
��2��message|@local_variable��ָ���쳣��Ϣ�������ı�����ȡ�ַ����������ֵΪ2048������������Ϊnvarchar(n)��
��3��state|@local_variable��ָ���쳣��Ϣ��״̬�룬��ȡֵ0~255֮��ĳ��������������������Ϊtinyint��
*/