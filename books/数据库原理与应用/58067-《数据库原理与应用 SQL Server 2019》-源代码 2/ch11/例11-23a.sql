use jxgl
go
create role TS_role                                  --�������ݿ��ɫ'TS_role'
alter role TS_role add member sqlloginT_U        --������ݿ��û���Ա
go
grant select on ѧ��(ѧ��,����,����) to TS_role    --�������ݿ��ɫselectȨ��
 with grant option                                    --�������������Ȩ��
