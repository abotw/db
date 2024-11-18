
## Contents

### 第1关：创建并验证一个 SQL Server 身份验证的登录名 stu_login1

```sql
use library;
go

CREATE LOGIN stu_login1
WITH PASSWORD = '123', 
     DEFAULT_DATABASE = master;

SELECT name, type_desc
FROM sys.server_principals
WHERE name = 'stu_login1';
```