## mssql_to_mysql

- 这是一个工具，可以把 `SQL Server` 导出的数据库脚本💻，转换为 `mysql` 的数据库脚本💻。
- This is a tool that can convert database scripts exported from 'SQL Server' to 'MySQL'.

- 只用到了re库，无第三方库引用。
- Only the re library is used, and there is no third-party library reference.

<div align="center">
<img src="./doc/mssql.png" width="35%" alt="">=>
<img src="./doc/mysql.png" width="40%" alt="">
</div>

## Support

|Support                                           |支持情况|
|--------------------------------------------------|-----------------|
| ✅Database name                                   |✅数据库名称|
| ✅Table (name, comment, primary key)              |✅表(名称，注释，主键)|
| ✅Table index                                     |✅表索引|
| ✅Field (field name, data type, default value)    |✅字段(字段名称，数据类型，默认值)|

| Not supported yet   | ️暂未支持|
|---------------------|------------------|
| ⛏️stored procedure  |  ⛏️存储过程|
| ⛏️view                | ⛏️视图|
| ⛏️User defined method | ⛏️用户自定义方法|

## usage method

- Pass the file to be converted into the parameter, and then a MySQL database file name (which can be empty)
- 将待转换的文件传入参数中，再传入一个mysql数据库文件名称(可以为空)


- example

```python
from mssql_to_mysql_tool import mssql_file_to_mysql_file

if __name__ == "__main__":
    mssql_file_to_mysql_file(mssql_file="./SQL_Server_output.sql", mysql_file="./mysql_db.sql")
```

- 运行结束以后可以查看`mysql_db.sql`文件。
- After running, you can view `mysql_db.sql` file.