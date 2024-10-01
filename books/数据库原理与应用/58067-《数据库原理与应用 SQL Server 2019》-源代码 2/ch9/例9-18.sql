if exists (select * from sys.server_triggers where name='alt_JXGL')
  drop trigger alt_jxgl on all server 	--删除已存在的同名触发器
