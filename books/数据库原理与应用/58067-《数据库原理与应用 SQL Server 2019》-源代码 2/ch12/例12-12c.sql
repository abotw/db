select spid,blocked,loginame,last_batch,status,cmd,hostname,program_name
from sysprocesses
where spid in 
(select blocked from sysprocesses where blocked<>0) or (blocked<>0) 
