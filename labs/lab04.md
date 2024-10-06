---
title: "Lab 04: 数据库的创建与管理 (2h)"
layout: home
parent: Labs
---

# Lab 4: 数据库的创建与管理 (2h)

- SSMS: SQL Server Mangament Studio
- T-SQL

```sql
CREATE DATABASE lx
ON 
PRIMARY 
(
    NAME = 'lx_data',                   -- 逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/lx_data.mdf',  -- 物理名
    SIZE = 10MB,                        -- 初始大小
    MAXSIZE = 100MB,                    -- 最大大小
    FILEGROWTH = 10MB                   -- 增长方式
),
FILEGROUP dx
(
    NAME = 'sx_data',                   -- 逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/sx_data.ndf'   -- 物理名
)
LOG ON
(
    NAME = 'lx_log',                    -- 逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/lx_log.ldf',   -- 物理名
    SIZE = 20MB,                        -- 初始大小
    MAXSIZE = UNLIMITED,                -- 不限制最大大小
    FILEGROWTH = 10%                    -- 增长方式
);
```

```sql
-- 添加文件组 dy
ALTER DATABASE lx
ADD FILEGROUP dy;

-- 在文件组 dy 中添加第一个数据文件 dya
ALTER DATABASE lx
ADD FILE
(
    NAME = 'dya',   -- 逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/dya.ndf'  -- 物理名
)
TO FILEGROUP dy;

-- 在文件组 dy 中添加第二个数据文件 dyb
ALTER DATABASE lx
ADD FILE
(
    NAME = 'dyb',   -- 逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/dyb.ndf'  -- 物理名
)
TO FILEGROUP dy;
```

```sql
-- 在数据库 lx 中添加第一个日志文件 dya_log
ALTER DATABASE lx
ADD LOG FILE
(
    NAME = 'dya_log',   -- 逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/dya_log.ldf',  -- 物理名
    SIZE = 8MB,         -- 初始大小
    MAXSIZE = UNLIMITED, -- 最大大小不限制
    FILEGROWTH = 10MB   -- 增长方式
);

-- 在数据库 lx 中添加第二个日志文件 dyb_log
ALTER DATABASE lx
ADD LOG FILE
(
    NAME = 'dyb_log',   -- 逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/dyb_log.ldf',  -- 物理名
    SIZE = 8MB,         -- 初始大小
    MAXSIZE = UNLIMITED, -- 最大大小不限制
    FILEGROWTH = 10MB   -- 增长方式
);
```

```sql
-- 删除数据文件 dya
ALTER DATABASE lx
REMOVE FILE dya;
```

```sql
-- 删除日志文件 dyb_log
ALTER DATABASE lx
REMOVE FILE dyb_log;
```

```sql
-- 删除文件组 dx 中的文件 sx_data
ALTER DATABASE lx
REMOVE FILE sx_data;
-- 删除文件组 dx
ALTER DATABASE lx
REMOVE FILEGROUP dx;
```

```sql
-- 创建数据库 library，并配置主数据文件
CREATE DATABASE library
ON 
PRIMARY 
(
    NAME = 'lib_data',    -- 主文件的逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/lib_data.mdf'  -- 主文件的物理名
),
-- 次文件 1，逻辑名 liba_data，物理名 liba_data.ndf
(
    NAME = 'liba_data',
    FILENAME = '/data/workspace/myshixun/src/lib/liba_data.ndf'
),
-- 文件组 group1，次文件 2，逻辑名 libb_data，物理名 libb_data.ndf
FILEGROUP group1
(
    NAME = 'libb_data',
    FILENAME = '/data/workspace/myshixun/src/lib/libb_data.ndf'
),
-- 文件组 group2，次文件 3，逻辑名 libc_data，物理名 libc_data.ndf
FILEGROUP group2
(
    NAME = 'libc_data',
    FILENAME = '/data/workspace/myshixun/src/lib/libc_data.ndf'
),
-- 文件组 group3，次文件 4，逻辑名 libd_data，物理名 libd_data.ndf
FILEGROUP group3
(
    NAME = 'libd_data',
    FILENAME = '/data/workspace/myshixun/src/lib/libd_data.ndf'
)
LOG ON 
-- 日志文件 1，逻辑名 liba_log，物理名 liba_log.ldf
(
    NAME = 'liba_log',
    FILENAME = '/data/workspace/myshixun/src/lib/liba_log.ldf'
),
-- 日志文件 2，逻辑名 libb_log，物理名 libb_log.ldf
(
    NAME = 'libb_log',
    FILENAME = '/data/workspace/myshixun/src/lib/libb_log.ldf'
);
```

```sql
-- 删除数据库 library
DROP DATABASE library;
-- 重新创建数据库 library
CREATE DATABASE library
ON 
-- 主文件，逻辑名为 lib_data，物理名为 lib_data.mdf
PRIMARY 
(
    NAME = 'lib_data',                                          -- 逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/lib_data.mdf'  -- 物理名
)
LOG ON 
-- 日志文件，逻辑名为 lib_log，物理名为 lib_log.ldf
(
    NAME = 'lib_log',                                           -- 逻辑名
    FILENAME = '/data/workspace/myshixun/src/lib/lib_log.ldf'   -- 物理名
);
```

## Reference

- CREATE: <https://learn.microsoft.com/en-us/sql/t-sql/statements/create-database-transact-sql?view=sql-server-ver16&tabs=sqlpool>
- ALTER: <https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-database-transact-sql?view=sql-server-ver16&tabs=sqlpool>

---

Last Updated: Thu Oct  3 10:09:37 CST 2024
