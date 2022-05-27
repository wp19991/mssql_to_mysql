from mssql_to_mysql_tool import mssql_file_to_mysql_file

if __name__ == "__main__":
    mssql_file_to_mysql_file(mssql_file="./SQL_Server_output.sql", mysql_file="./mysql_db.sql")