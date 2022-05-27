import re


class db_table_field:
    def __init__(self):
        self.field_name = ''  # 字段名称
        self.field_data_type = ''  # 字段数据类型
        self.field_need = ''  # 字段时候为空 null,not null,not null auto_increment

        self.field_default = ''  # 字段默认值
        self.field_comment = ''  # 字段注释


class db_table:
    def __init__(self):
        self.table_name = ""  # 表名称
        self.pk_name = ''  # 主键名称
        self.table_comment = ''  # 表注释
        self.pk_field_name_list = []  # 主键名称列表

        self.table_field_list = []  # db_table_field


class db_index:
    def __init__(self):
        self.index_name = ""  # 索引名称
        self.index_table_name = ''  # 索引所在的表名称
        self.index_field_name = ''  # 索引的字段名称


class db_view:
    def __init__(self):
        self.view_name = ""  # 视图名称
        self.view_str = ''  # 视图的全部，不知道怎么处理
        self.view_field_comment = ''  # 视图字段的注释
        self.view_comment = ''  # 视图名称注释
        self.view_comment_value = ''  # 视图名称值注释


class db_stored_procedure:
    def __init__(self):
        self.stored_procedure_name = ''  # 存储过程名称
        self.stored_procedure_str = ''  # 存储过程的全部，不知道怎么处理


class db_user_defined_function:
    def __init__(self):
        self.function_name = ''  # 函数名称
        self.function_str = ''  # 函数的全部，不知道怎么处理


class sql_db:
    def __init__(self):
        self.db_name = ""
        self.db_user_defined_function_list = []  # db_user_defined_function
        self.db_view_list = []  # db_view
        self.db_index_list = []  # db_index
        self.db_stored_procedure_list = []  # db_stored_procedure

        self.db_table_list = []  # db_table


def mssql_file_to_mysql_file(mssql_file="./SQL_Server_output.sql", mysql_file="./ok.sql"):
    mssql_text = ""
    with open(mssql_file, "r", encoding="utf-16LE") as f:
        mssql_text = "".join(f.readlines())

    mssql_text_list = mssql_text.split("/****** ")

    mssql_Database_object = []
    mssql_UserDefinedFunction_object = []
    mssql_Table_object = []
    mssql_View_object = []
    mssql_Index_object = []
    mssql_DEFAULT_value = []
    mssql_StoredProcedure_object = []
    mssql_sp_addextendedproperty_value = []

    for i in mssql_text_list:
        if 'Object:  Database' in i:
            mssql_Database_object.append(i)
        elif 'Object:  UserDefinedFunction ' in i:
            mssql_UserDefinedFunction_object.append(i)
        elif 'Object:  Table [dbo].' in i:
            mssql_Table_object.append(i)
        elif 'Object:  View [dbo].[' in i:
            mssql_View_object.append(i)
        elif 'Object:  Index [' in i:
            if "ALTER TABLE [dbo]." in i:
                # 有默认值：
                temp_index = i.split('GO')[0] + "GO\n"
                mssql_Index_object.append(temp_index)
                # temp_DEFAULT = "GO".join(i.split('GO')[1:])

                mssql_DEFAULT_value = i.split('GO')[1:]
            else:
                # 没有默认值
                mssql_Index_object.append(i)
        elif 'Object:  StoredProcedure [dbo].[' in i:
            if 'EXEC sys.sp_addextendedproperty' in i:
                # 说明这个有注释部分
                temp_StoredProcedure = i.split('EXEC sys.sp_addextended')[0]
                mssql_StoredProcedure_object.append(temp_StoredProcedure)
                # 剩下的都是字段注释部分
                temp_sp_addextendedproperty = "EXEC sys.sp_addextended" + \
                                              "EXEC sys.sp_addextended".join(i.split('EXEC sys.sp_addextended')[1:])

                temp_sp_addextendedproperty = temp_sp_addextendedproperty.split('USE [master]')[0]
                mssql_sp_addextendedproperty_value = temp_sp_addextendedproperty.split('USE [master]')[0].split('GO')
                # 丢弃最后4行
            else:
                # 没有注释部分,可以直接添加进去
                mssql_StoredProcedure_object.append(i)

    print('mssql_Database_object:'.rjust(50, '-'), len(mssql_Database_object))
    print('mssql_UserDefinedFunction_object:'.rjust(50, '-'), len(mssql_UserDefinedFunction_object))
    print('mssql_Table_object:'.rjust(50, '-'), len(mssql_Table_object))
    print('mssql_View_object:'.rjust(50, '-'), len(mssql_View_object))
    print('mssql_Index_object:'.rjust(50, '-'), len(mssql_Index_object))
    print('mssql_DEFAULT_value:'.rjust(50, '-'), len(mssql_DEFAULT_value))
    print('mssql_StoredProcedure_object:'.rjust(50, '-'), len(mssql_StoredProcedure_object))
    print('mssql_sp_addextendedproperty_value:'.rjust(50, '-'), len(mssql_sp_addextendedproperty_value))

    sql_db_0 = sql_db()

    try:
        mp = re.search(pattern='Object:  Database \[.*\]', string=mssql_Database_object[0])
        sql_db_0.db_name = mp.group()[19:-1]
    except:
        sql_db_0.db_name = mssql_text[6:].split(']')[0]

    sql_db_0.db_user_defined_function_list = []
    for i in mssql_UserDefinedFunction_object:
        mp = re.search(pattern='Object:  UserDefinedFunction \[dbo\].\[.*\]', string=i)
        temp_db_user_defined_function = db_user_defined_function()
        temp_db_user_defined_function.function_name = mp.group()[36:-1]
        temp_db_user_defined_function.function_str = "".join(i.split('******/')[1:])
        sql_db_0.db_user_defined_function_list.append(temp_db_user_defined_function)

    sql_db_0.db_view_list = []
    for i in mssql_View_object:
        mp = re.search(pattern='Object:  View \[dbo\].\[.*\]', string=i)
        temp_db_view = db_view()
        temp_db_view.view_name = mp.group()[21:-1]
        temp_db_view.view_str = "".join(i.split('******/')[1:])
        temp_db_view.view_comment = ""
        for p in mssql_sp_addextendedproperty_value:
            if "type=N'VIEW',@level1name=N'{}'".format(temp_db_view.view_name) in p:
                if ", @level2type=N'COLUMN'," not in p:
                    # 视图名称注释
                    # print(p)
                    try:
                        temp_db_view.view_comment = p.split("addextendedproperty @name=N'")[1].split("'")[0]
                        temp_db_view.view_comment_value = p.split("', @value=")[1].split(" , @level")[0]
                    except:
                        print(p)
                else:
                    # 视图字段的注释
                    temp_db_view.view_field_comment += "#" + p
        sql_db_0.db_view_list.append(temp_db_view)

    sql_db_0.db_index_list = []
    for i in mssql_Index_object:
        mp = re.search(pattern='Object:  Index \[.*\]', string=i)
        temp_db_index = db_index()
        temp_db_index.index_name = mp.group()[16:-1]
        mp = re.search(pattern='\] ON \[dbo\].\[.*\]', string=i)
        temp_db_index.index_table_name = mp.group()[12:-1]
        mp = re.search(pattern='	\[.*\]', string=i)
        temp_db_index.index_field_name = mp.group()[2:-1]
        sql_db_0.db_index_list.append(temp_db_index)

    sql_db_0.db_stored_procedure_list = []
    for i in mssql_StoredProcedure_object:
        mp = re.search(pattern='Object:  StoredProcedure \[dbo\].\[.*\]', string=i)
        temp_db_stored_procedure = db_stored_procedure()
        temp_db_stored_procedure.stored_procedure_name = mp.group()[32:-1]
        temp_db_stored_procedure.stored_procedure_str = "".join(i.split('******/')[1:])
        sql_db_0.db_stored_procedure_list.append(temp_db_stored_procedure)

    sql_db_0.db_table_list = []
    for i in mssql_Table_object:
        mp = re.search(pattern='Object:  Table \[dbo\].\[.*\]', string=i)
        temp_db_table = db_table()
        temp_db_table.table_name = mp.group()[22:-1]

        temp_db_table.pk_name = ""
        if 'PRIMARY KEY CLUSTERED' in i:
            # 有主键
            if 'CONSTRAINT [' in i:
                # 主键有名称
                mp = re.search(pattern='CONSTRAINT \[.*\] PRIMARY KEY CLUSTERED', string=i)
                temp_db_table.pk_name = mp.group()[12:-23]
            else:
                # 主键没有名称,就让表名称作为pk的名称
                temp_db_table.pk_name = "PK_" + temp_db_table.table_name

        # 表名称注释
        temp_db_table.table_comment = ""
        for p in mssql_sp_addextendedproperty_value:
            if ",@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'{}'".format(temp_db_table.table_name) in p:
                if ", @level2type=N'COLUMN'," not in p:
                    # 这个就是表名称
                    temp_db_table.table_comment = p.split("@name=N'MS_Description', @value=N'")[1].split("'")[0]

        # 主键名称列表
        temp_db_table.pk_field_name_list = []
        r = re.findall(pattern='	\[.*\] ASC', string=i)
        for p in r:
            temp_pk_name = p.split('] A')[0][2:]
            temp_db_table.pk_field_name_list.append(temp_pk_name)

        # db_table_field
        temp_db_table.table_field_list = []
        r = re.findall(pattern='	\[.*\] \[.*\].*', string=i)
        for p in r:
            # 每个字段
            temp = db_table_field()
            temp.field_name = p.split('] [')[0][2:]
            if '(' in p:
                # 说明这个字段带有括号
                zdlx = p.split('] [')[1].split(')')[0] + ")"
            else:
                zdlx = p.split('] [')[1].split(']')[0]
            if 'nvarchar' in zdlx:
                # =>nvarchar](50)
                zdlx = 'nvarchar({})'.format(zdlx.split('](')[1][:-1])
            elif 'varchar' in zdlx:
                # =>nvarchar](50)
                zdlx = 'varchar({})'.format(zdlx.split('](')[1][:-1])
            elif 'varbinary' in zdlx:
                # =>varbinary](200)
                zdlx = 'varbinary({})'.format(zdlx.split('](')[1][:-1])
            elif 'char' in zdlx:
                # =>char](7)
                zdlx = 'char({})'.format(zdlx.split('](')[1][:-1])
            elif 'uniqueidentifier' in zdlx:
                zdlx = 'char(36)'
            elif 'bit' in zdlx:
                zdlx = 'tinyint(1)'
            elif 'ntext' in zdlx:
                zdlx = 'text'
            elif 'float' in zdlx:
                zdlx = 'float'
            elif 'datetime' in zdlx:
                zdlx = 'datetime'
            elif 'int' in zdlx:
                zdlx = 'int'
            elif 'decimal' in zdlx:
                temp_zdls = p.split('] [')[1].split(') ')[0].split('(')[-1].split(', ')
                # print(temp_zdls)
                zdlx = 'decimal({},{})'.format(temp_zdls[0], temp_zdls[1])
            elif 'numeric' in zdlx:
                # =>numeric](18, 2)
                temp_zdls = zdlx.split('](')[1][:-1].split(',')
                zdlx = 'numeric({},{})'.format(temp_zdls[0], temp_zdls[1])
            # 如果是主键，char不能大于767
            if temp.field_name in temp_db_table.pk_field_name_list:
                if 'char(' in zdlx:
                    zdlx = zdlx.split('(')[0] + "(700)"
            temp.field_data_type = zdlx

            need = 'null'
            if 'IDENTITY' in p:
                need = 'not null auto_increment'
            elif 'NOT NULL' in p:
                need = 'not null'
            # 如果是主键，不能是null
            if temp.field_name in temp_db_table.pk_field_name_list:
                if need == 'null':
                    need = 'not null'
            temp.field_need = need

            if need == 'not null auto_increment' and (temp.field_name not in temp_db_table.pk_field_name_list):
                # 如果他是自增，但是他不是主键
                # 把主键替换成这个
                temp_db_table.pk_field_name_list = [temp.field_name]
                temp_db_table.pk_name = "PK_" + temp_db_table.table_name

            # 字段注释
            temp.field_comment = ''
            for zs in mssql_sp_addextendedproperty_value:
                if ",@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'{}'".format(temp_db_table.table_name) in zs:
                    if "@level2type=N'COLUMN',@level2name=N'{}'".format(temp.field_name) in zs:
                        temp.field_comment = zs.split("@name=N'MS_Description', @value=N'")[1].split("'")[0]
                        # 这个就是字段的名称

            # 字段默认值
            temp.field_default = ''
            for df in mssql_DEFAULT_value:
                if "ALTER TABLE [dbo].[{}] ADD".format(temp_db_table.table_name) in df:
                    # 锁定这个表
                    if " FOR [{}]".format(temp.field_name) in df:
                        # 锁定这个字段
                        if 'getdate' in df:
                            temp.field_default = 'current_timestamp'
                        else:
                            temp.field_default = df.split("DEFAULT (")[1].split(") FOR [")[0]
                            if '0x' in df:
                                temp.field_default = '0x80'
                            elif '((' in df:
                                #  ((2009)-(1))-(1)
                                temp.field_default = temp.field_default.replace("(", "")
                                temp.field_default = temp.field_default.replace(")", "")
                                temp.field_default = temp.field_default.replace(" ", "")
                                temp.field_default = "'" + temp.field_default + "'"
                            elif ' - ' in df:
                                # 2009 - 1 - 1
                                temp.field_default = temp.field_default.replace("(", "")
                                temp.field_default = temp.field_default.replace(")", "")
                                temp.field_default = temp.field_default.replace(" ", "")
                                temp.field_default = "'" + temp.field_default + "'"
                            else:
                                temp.field_default = temp.field_default

            temp_db_table.table_field_list.append(temp)

        sql_db_0.db_table_list.append(temp_db_table)

    # 按照mysql的格式拼接字符串
    res = """
use mysql;
drop database if exists {}_db;

create database if not exists {}_db
    default character set utf8mb4
    default collate utf8mb4_unicode_ci;

use {}_db;
""".format(sql_db_0.db_name, sql_db_0.db_name, sql_db_0.db_name)

    for i in sql_db_0.db_table_list:
        res += ("-- " + i.table_comment.center(100, "=") + "\n\n")
        res += "drop table if exists `{}`;\n".format(i.table_name)
        res += "create table `{}`\n(\n".format(i.table_name)
        auto_pk_flag = False
        auto_pk_field_name = ''
        for index, p in enumerate(i.table_field_list):
            temp = ""
            if p.field_need == "not null auto_increment":
                auto_pk_flag = True
                auto_pk_field_name = p.field_name
            if p.field_default != "":
                temp = "`" + p.field_name + "`" + " " + p.field_data_type + " " + p.field_need + " " + "default" + " " + \
                       p.field_default + " " + "comment '" + p.field_comment + "'"
            else:
                temp = "`" + p.field_name + "`" + " " + p.field_data_type + " " + p.field_need + " " + "comment '" + \
                       p.field_comment + "'"
            if index != len(i.table_field_list) - 1:
                temp += ",\n"
            res += "    {}".format(temp)

        if len(i.pk_field_name_list) != 0:
            res += ",\n    constraint {} primary key ({})\n".format(i.pk_name,
                                                                    "`" + "`,`".join(i.pk_field_name_list) + "`")
        else:
            if auto_pk_flag:
                res += ",\n    constraint {} primary key (`{}`)\n".format("PK_" + i.table_name, auto_pk_field_name)
            else:
                res += "\n"

        if i.table_comment != "":
            res += ") engine = InnoDB comment '{}';\n".format(i.table_comment)
        else:
            res += ") engine = InnoDB comment '{}';\n".format(i.table_name)

        # 如果有这个表的索引，现在加到表中
        for p in sql_db_0.db_index_list:
            if p.index_table_name == i.table_name:
                res += "create index `{}` on `{}` (`{}`);\n".format(p.index_name, p.index_table_name,
                                                                    p.index_field_name)

    # print(res)

    with open(mysql_file, "w", encoding="utf-8") as f:
        f.write(res)

    # TODO 视图

    # TODO 存储过程

    # TODO 用户自定义方法


if __name__ == "__main__":
    mssql_file_to_mysql_file(mssql_file="SQL_Server_output.sql", mysql_file="./mysql_db.sql")
