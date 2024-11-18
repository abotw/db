---
title: "Lab 03: 数据库的创建与管理 (2h)"
layout: page
parent: Labs
last updated: 2024-11-13T19:18:00
---

# Lab 03: 数据库的创建与管理 (2h)

## Contents

### 第1关：使用T-SQL语句创建数据库

```sql
create database lx
on primary
(name = 'lx_data',
 filename = '/data/workspace/myshixun/src/lib/lx_data.mdf',
 size = 10mb,
 maxsize = 100mb,
 filegrowth = 10mb
),
filegroup dx
(name = 'sx_data',
 filename = '/data/workspace/myshixun/src/lib/sx_data.ndf'
)
log on
(name = 'lx_log',
 filename = '/data/workspace/myshixun/src/lib/lx_log.ldf',
 size = 20mb,
 maxsize = unlimited,
 filegrowth = 10%
);
```

### 第2关：修改数据库一：增加包含两个数据文件的文件组

```sql
use lx;
go

alter database lx
add filegroup dy;

alter database lx
add file
(name = 'dya',
 filename = '/data/workspace/myshixun/src/lib/dya.ndf'
) to filegroup dy;

alter database lx
add file
(name = 'dyb',
 filename = '/data/workspace/myshixun/src/lib/dyb.ndf'
) to filegroup dy;
```

### 第3关：修改数据库二：增加两个日志文件

```sql
use lx;
go

alter database lx
add log file
(name = 'dya_log',
 filename = '/data/workspace/myshixun/src/lib/dya_log.ldf',
 size = 8mb,
 maxsize = unlimited,
 filegrowth = 10mb
),
(name = 'dyb_log',
 filename = '/data/workspace/myshixun/src/lib/dyb_log.ldf',
 size = 8mb,
 maxsize = unlimited,
 filegrowth = 10mb
);
```

### 第4关：修改数据库三：删除两个数据文件

```sql
use lx;
go
alter database lx
remove file dya;
alter database lx
remove file dyb;
go
```

### 第5关：修改数据库四：删除日志文件

```sql
use lx;
go
alter database lx
remove file dyb_log;
go
```

- ✅ `remove file`
- ❌ `remove log file`

### 第6关：修改数据库五：删除文件组dy

```sql
use lx;
go
alter database lx
remove filegroup dy;
go
```

### 第7关：修改数据库六：删除文件组dx

```sql
use lx;
go
alter database lx
remove file sx_data;
alter database lx
remove filegroup dx;
go
```

### 第8关：使用T-SQL语句创建数据库：多数据库文件

```sql
create database library
on primary
(name = 'lib_data',
 filename = '/data/workspace/myshixun/src/lib/lib_data.mdf'
),
(name = 'liba_data',
 filename = '/data/workspace/myshixun/src/lib/liba_data.ndf'
),
filegroup group1
(name = 'libb_data',
 filename = '/data/workspace/myshixun/src/lib/libb_data.ndf'
),
filegroup group2
(name = 'libc_data',
 filename = '/data/workspace/myshixun/src/lib/libc_data.ndf'
),
filegroup group3
(name = 'libd_data',
 filename = '/data/workspace/myshixun/src/lib/libd_data.ndf'
)
log on
(name = 'liba_log',
 filename = '/data/workspace/myshixun/src/lib/liba_log.ldf'
),
(name = 'libb_log',
 filename = '/data/workspace/myshixun/src/lib/libb_log.ldf'
);
go
```

### 第9关：使用T-SQL 语句创建数据库：重建数据库

```sql
drop database library;
go
create database library
on primary
(name = 'lib_data',
 filename = '/data/workspace/myshixun/src/lib/lib_data.mdf'
)
log on
(name = 'lib_log',
 filename = '/data/workspace/myshixun/src/lib/lib_log.ldf'
);
go
```

## Notes

### [Create a database](https://learn.microsoft.com/en-us/sql/relational-databases/databases/create-a-database?view=sql-server-ver16)

```sql
USE master;
GO

CREATE DATABASE Sales ON
(NAME = Sales_dat,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\saledat.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
(NAME = Sales_log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\salelog.ldf',
    SIZE = 5 MB,
    MAXSIZE = 25 MB,
    FILEGROWTH = 5 MB);
GO
```

- name
- filename
	- `filename = 'path'`
- size
- maxsize
- filegrowth

### [ALTER DATABASE (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-database-transact-sql?view=sql-server-ver16&tabs=sqlpool)

```sql
-- SQL Server Syntax
ALTER DATABASE { database_name | CURRENT }
{
    MODIFY NAME = new_database_name
  | COLLATE collation_name
  | <file_and_filegroup_options>
  | SET <option_spec> [ ,...n ] [ WITH <termination> ]
}
[;]

<file_and_filegroup_options>::=
  <add_or_modify_files>::=
  <filespec>::=
  <add_or_modify_filegroups>::=
  <filegroup_updatability_option>::=

<option_spec>::=
{
  | <auto_option>
  | <change_tracking_option>
  | <cursor_option>
  | <database_mirroring_option>
  | 
  | 
  | <db_state_option>
  | <db_update_option>
  | <db_user_access_option>
  | <delayed_durability_option>
  | <external_access_option>
  | <FILESTREAM_options>
  | <HADR_options>
  | <parameterization_option>
  | <query_store_options>
  | <recovery_option>
  | 
  | <snapshot_option>
  | <sql_option>
  | <termination>
  | 
  | 
  | <compatibility_level>
      { 160 | 150 | 140 | 130 | 120 | 110 | 100 | 90 }
}
```

### ALTER DATABASE (Transact-SQL) File and Filegroup Options

```sql
ALTER DATABASE database_name
{
    <add_or_modify_files>
  | <add_or_modify_filegroups>
}

<add_or_modify_files>::=
{
    ADD FILE <filespec> [ ,...n ]
        [ TO FILEGROUP { filegroup_name } ]
  | ADD LOG FILE <filespec> [ ,...n ]
  | REMOVE FILE logical_file_name
  | MODIFY FILE <filespec>
}

<filespec>::=
(
    NAME = logical_file_name
    [ , NEWNAME = new_logical_name ]
    [ , FILENAME = {'os_file_name' | 'filestream_path' | 'memory_optimized_data_path' } ]
    [ , SIZE = size [ KB | MB | GB | TB ] ]
    [ , MAXSIZE = { max_size [ KB | MB | GB | TB ] | UNLIMITED } ]
    [ , FILEGROWTH = growth_increment [ KB | MB | GB | TB| % ] ]
    [ , OFFLINE ]
)

<add_or_modify_filegroups>::=
{
    | ADD FILEGROUP filegroup_name
        [ CONTAINS FILESTREAM | CONTAINS MEMORY_OPTIMIZED_DATA ]
    | REMOVE FILEGROUP filegroup_name
    | MODIFY FILEGROUP filegroup_name
        { <filegroup_updatability_option>
        | DEFAULT
        | NAME = new_filegroup_name
        | { AUTOGROW_SINGLE_FILE | AUTOGROW_ALL_FILES }
        }
}
<filegroup_updatability_option>::=
{
    { READONLY | READWRITE }
    | { READ_ONLY | READ_WRITE }
}
```

### [Add Data or Log Files to a Database](https://learn.microsoft.com/en-us/sql/relational-databases/databases/add-data-or-log-files-to-a-database?view=sql-server-ver16)

```sql
USE master
GO
ALTER DATABASE AdventureWorks2022
ADD FILEGROUP Test1FG1;
GO
ALTER DATABASE AdventureWorks2022 
ADD FILE 
(
    NAME = test1dat3,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\t1dat3.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
),
(
    NAME = test1dat4,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\t1dat4.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
TO FILEGROUP Test1FG1;
GO
```

### [Database files and filegroups](https://learn.microsoft.com/en-us/sql/relational-databases/databases/database-files-and-filegroups?view=sql-server-ver16)

### [Delete Data or Log Files from a Database](https://learn.microsoft.com/en-us/sql/relational-databases/databases/delete-data-or-log-files-from-a-database?view=sql-server-ver16)

```sql
USE master;
GO
ALTER DATABASE AdventureWorks2022
REMOVE FILE test1dat4;
GO
```

### [Increase the Size of a Database](https://learn.microsoft.com/en-us/sql/relational-databases/databases/increase-the-size-of-a-database?view=sql-server-ver16)

```sql
USE master;
GO
ALTER DATABASE AdventureWorks2022 
MODIFY FILE
    (NAME = test1dat3,
    SIZE = 20MB);
GO
```
