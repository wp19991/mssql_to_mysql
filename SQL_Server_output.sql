USE [master]
GO
/****** Object:  Database [Db_Tank]    Script Date: 2022/5/24 14:05:20 ******/
CREATE DATABASE [Db_Tank]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'Db_Tank_Data', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\1.mdf' , SIZE = 1883456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 512000KB )
 LOG ON
( NAME = N'Db_Tank_Log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\1.ldf' , SIZE = 2377088KB , MAXSIZE = UNLIMITED, FILEGROWTH = 307200KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Db_Tank] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db_Tank].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Db_Tank] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Db_Tank] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Db_Tank] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Db_Tank] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Db_Tank] SET ARITHABORT OFF
GO
ALTER DATABASE [Db_Tank] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Db_Tank] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Db_Tank] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Db_Tank] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Db_Tank] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Db_Tank] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Db_Tank] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Db_Tank] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Db_Tank] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Db_Tank] SET  DISABLE_BROKER
GO
ALTER DATABASE [Db_Tank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Db_Tank] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Db_Tank] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Db_Tank] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Db_Tank] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Db_Tank] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Db_Tank] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Db_Tank] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Db_Tank] SET  MULTI_USER
GO
ALTER DATABASE [Db_Tank] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [Db_Tank] SET DB_CHAINING OFF
GO
ALTER DATABASE [Db_Tank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [Db_Tank] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO
ALTER DATABASE [Db_Tank] SET DELAYED_DURABILITY = DISABLED
GO
EXEC sys.sp_db_vardecimal_storage_format N'Db_Tank', N'ON'
GO
ALTER DATABASE [Db_Tank] SET QUERY_STORE = OFF
GO
USE [Db_Tank]
GO
/****** Object:  UserDefinedFunction [dbo].[ChineseTranslation]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--中文简体语言包
CREATE   FUNCTION [dbo].[ChineseTranslation](@TranslationID as nvarchar(200))
RETURNS nvarchar(200) as
begin
 declare @translated as nvarchar(200)


 select  @translated =
	case @TranslationID
	when 'SP_Active_PullDown.Sender' then N'系统管理员'
	when 'SP_Active_PullDown.Title' then N'您获得活动奖品!'
	when 'SP_Active_PullDown.Content' then N'您获得活动奖品!'
	when 'SP_Auction_Delete.Sender' then N'拍卖中心'
	when 'SP_Auction_Delete.Title' then N'撤消拍卖!'
	when 'SP_Auction_Delete.Content' then N'撤消拍卖!'
	when 'SP_Auction_Scan.Sender' then N'拍卖中心'
	when 'SP_Auction_Scan.Title' then N'拍卖成功!'
	when 'SP_Auction_Scan.Content' then N'拍卖成功!'
	when 'SP_Auction_Scan.Msg1' then N'拍卖过期:    '
	when 'SP_Auction_Scan.Msg2' then N'您所拍卖的  {0}  超过保管时间!!'
	when 'SP_Auction_Scan.Msg3' then N'竞标成功:    '
	when 'SP_Auction_Scan.Msg4' then N'您成功竞标<{0}>拍卖的  {1}  , 支付{2}点券!'
	when 'SP_Auction_Scan.Msg5' then N'拍卖成功:    '
	when 'SP_Auction_Scan.Msg6' then N'您所拍卖的  {0}  被<{1}>购买 , 交易金额为{2}点券!, 其中扣除交易费用{3}点券 , 您一共获得{4}点券!'
	when 'SP_Auction_Scan.Msg7' then N'您所拍卖的  {0}  被<{1}>购买 , 交易金额为{2}点券!, 您一共获得{4}点券!'
	when 'SP_Auction_Update.Sender' then N'拍卖中心'
	when 'SP_Auction_Update.Title' then N'拍卖返回!'
	when 'SP_Auction_Update.Content' then N'拍卖返回!'
	when 'SP_Auction_Update.Msg1' then N'竞标失败:    '
	when 'SP_Auction_Update.Msg2' then N'您竞标的  {0}  价格被 <{1}> 超出，返回{2}点券!'
	when 'SP_Auction_Update.Msg3' then N'竞标成功:    '
	when 'SP_Auction_Update.Msg4' then N'您成功竞标<{0}>拍卖的  {1}  ,支付{2}点券!'
	when 'SP_Auction_Update.Msg5' then N'拍卖成功:    '
	when 'SP_Auction_Update.Msg6' then N'您所拍卖的  {0}  被 <{1}> 购买 , 交易金额为{2}点券, 其中扣除交易费用{3}点券 , 您一共获得{4}点券!'
	when 'SP_Auction_Update.Msg7' then N'您所拍卖的  {0}  被 <{1}> 购买 , 交易金额为{2}点券,  您一共获得{4}点券!'
	when 'SP_Consortia_Add.Duty1' then N'会长'
	when 'SP_Consortia_Add.Duty2' then N'副会长'
	when 'SP_Consortia_Add.Duty3' then N'官员'
	when 'SP_Consortia_Add.Duty4' then N'精英'
	when 'SP_Consortia_Add.Duty5' then N'会员'
	when 'SP_ConsortiaAlly_Add.Msg1' then N'<{0}> 向你们宣战，成为敌对状态!'
	when 'SP_ConsortiaAlly_Add.Msg2' then N'你们向 <{0}> 宣战，成为敌对状态!'
	when 'SP_ConsortiaAlly_Add.Msg3' then N'<{0}> 与你们解除盟约，相互中立!'
	when 'SP_ConsortiaAlly_Add.Msg4' then N'你们与 <{0}> 解除盟约，相互中立!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg1' then N'你们与 <{0}> 成功结盟!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg2' then N'<{0}> 与你们成功结盟!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg3' then N'你们与 <{0}> 议和成功，相互中立!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg4' then N'<{0}> 与你们议和成功，相互中立!'
	when 'SP_Mail_Delete.Msg1' then N'退回信函:   '
	when 'SP_Mail_Delete.Msg2' then N'您寄往<{0}>的邮件由于对方拒绝接收或超过邮件保留期而被退回!'
	when 'SP_Mail_PaymentCancel.Msg1' then N'退回信函:    '
	when 'SP_Mail_PaymentCancel.Msg2' then N'您寄往<{0}>的邮件由于对方拒绝接收或超过邮件保留期而被退回!'
	when 'SP_Mail_Scan.Sender' then N'拍卖中心'
	when 'SP_Mail_Scan.Title' then N'拍卖成功!'
	when 'SP_Mail_Scan.Content' then N'拍卖成功!'
	when 'SP_Mail_Scan.Msg1' then N'退回信函:    '
	when 'SP_Mail_Scan.Msg2' then N'您寄往<{0}>的邮件由于对方拒绝接收或超过邮件保留期而被退回!'
	when 'SP_Mail_Update.Msg1' then N'付款信函:    '
	when 'SP_Mail_Update.Msg2' then N'您寄往<{0}>的  {1}  已经付费，付款金额为{2}点券!'
	when 'SP_Consortia_Riches_Add.Msg1' then N'公会成员{0}捐献{1}点公会财富!'
	when 'SP_Mail_Update.Msg3' then N'附件为:1、点券{0}'
	when 'SP_Admin_SendAllItem.Sender' then N'系统管理员'
	else @TranslationID
	end

 return @translated
end




















GO
/****** Object:  UserDefinedFunction [dbo].[EnglishTranslation]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--英文语言包
CREATE   FUNCTION [dbo].[EnglishTranslation](@TranslationID as nvarchar(200))
RETURNS nvarchar(200) as
begin
 declare @translated as nvarchar(200)

select @translated =
	case @TranslationID
	when 'SP_Active_PullDown.Sender' then N'System Administrator'
	when 'SP_Active_PullDown.Title' then N'You obtain activity reward!'
	when 'SP_Active_PullDown.Content' then N'You obtain activity reward!'
	when 'SP_Auction_Delete.Sender' then N'Auction Center'
	when 'SP_Auction_Delete.Title' then N'Withdraw auction!'
	when 'SP_Auction_Delete.Content' then N'Withdraw auction!'
	when 'SP_Auction_Scan.Sender' then N'Auction Center'
	when 'SP_Auction_Scan.Title' then N'Auction successfully!'
	when 'SP_Auction_Scan.Content' then N'Auction successfully!'
	when 'SP_Auction_Scan.Msg1' then N'Auction expired:'
	when 'SP_Auction_Scan.Msg2' then N'Your auction item {0} has passed it management time!!'
	when 'SP_Auction_Scan.Msg3' then N'Bid successfully:'
	when 'SP_Auction_Scan.Msg4' then N'You successful bid the item {1} auction by <{0}> with {2} point value!'
	when 'SP_Auction_Scan.Msg5' then N'Auction successfully:'
	when 'SP_Auction_Scan.Msg6' then N'Your auction item {0} has been buyout by <{1}>. Payment is {2} point value. You receive {4} point value after deducted the transaction fee of {3} point value.'
	when 'SP_Auction_Update.Sender' then N'Auction Center'
	when 'SP_Auction_Update.Title' then N'Return to auction!'
	when 'SP_Auction_Update.Content' then N'Return to auction!'
	when 'SP_Auction_Update.Msg1' then N'Bid failed:'
	when 'SP_Auction_Update.Msg2' then N'Your bid price {0} has been exceeded by the bid price of <{1}>. Return {2} point value!'
	when 'SP_Auction_Update.Msg3' then N'Bid successfully:'
	when 'SP_Auction_Update.Msg4' then N'You successfully obtain the auction item {1} by <{0}>. Pay {2} point value!'
	when 'SP_Auction_Update.Msg5' then N'Auction successfully:'
	when 'SP_Auction_Update.Msg6' then N'Your auction item {0} has been buyout by <{1}>. Payment is {2} point value. You receive {4} point value after deducted the transaction fee of {3} point value.'
	when 'SP_Consortia_Add.Duty1' then N'President'
	when 'SP_Consortia_Add.Duty2' then N'Vice President'
	when 'SP_Consortia_Add.Duty3' then N'Officer'
	when 'SP_Consortia_Add.Duty4' then N'Committee'
	when 'SP_Consortia_Add.Duty5' then N'Member'
	when 'SP_ConsortiaAlly_Add.Msg1' then N'<{0}> declares war to you. A hostile condition is formed!'
	when 'SP_ConsortiaAlly_Add.Msg2' then N'You declare war to <{0}>. A hostile condition is formed!'
	when 'SP_ConsortiaAlly_Add.Msg3' then N'<{0}> relieves the treaty of alliance with you. You are in mutual neutrality now!'
	when 'SP_ConsortiaAlly_Add.Msg4' then N'You relieves the treaty of alliance with <{0}>. You are in mutual neutrality now!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg1' then N'You successfully form an alliance with <{0}>!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg2' then N'<{0}> successfully form an alliance with you!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg3' then N'You successfully peace negotiate with <{0}>. You are in mutual neutrality now!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg4' then N'<{0}> successfully peace negotiate with you. You are in mutual neutrality now!'
	when 'SP_Mail_Delete.Msg1' then N'Message return:'
	when 'SP_Mail_Delete.Msg2' then N'The message you sent to <{0}> were rejected or exceeded the retaining time!'
	when 'SP_Mail_PaymentCancel.Msg1' then N'Message return:'
	when 'SP_Mail_PaymentCancel.Msg2' then N'The message you sent to <{0}> were rejected or exceeded the retaining time!'
	when 'SP_Mail_Scan.Sender' then N'Auction Center'
	when 'SP_Mail_Scan.Title' then N'Auction successfully!'
	when 'SP_Mail_Scan.Content' then N'Auction successfully!'
	when 'SP_Mail_Scan.Msg1' then N'Message return:'
	when 'SP_Mail_Scan.Msg2' then N'The message you sent to <{0}> were rejected or exceeded the retaining time!'
	when 'SP_Mail_Update.Msg1' then N'Pay message:'
	when 'SP_Mail_Update.Msg2' then N'The {1} you sent to <{0}> were paid. Payment amount is {2} point value!'
	when 'SP_Consortia_Riches_Add.Msg1' then N'Alliance member {0} contributes {1} points as alliance wealth.'
	when 'SP_Mail_Update.Msg3' then N'Attachment is: 1. {0} point value.'
	when 'SP_Admin_SendAllItem.Sender' then N'System Administrator'
	else @TranslationID
	end
 return @translated
end





















GO
/****** Object:  UserDefinedFunction [dbo].[FiltSql]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   FUNCTION [dbo].[FiltSql] (@FiltSql Varchar(1000))
RETURNS int  AS
BEGIN
Declare @result int

Declare @f1 varchar(20)
Declare @f2 varchar(20)
Declare @f3 varchar(20)
Declare @f4 varchar(20)
Declare @f5 varchar(20)
Declare @f6 varchar(20)
Declare @f7 varchar(20)

Set @f1='update '
Set @f2='insert '
Set @f3='table '
Set @f4='delete '
Set @f5='drop '
Set @f6='exec '
Set @f7='select '


SET @result=1
IF((charindex(@f1,@FiltSql,1)>0) OR (charindex(@f2,@FiltSql,1)>0) OR (charindex(@f3,@FiltSql,1)>0) OR (charindex(@f4,@FiltSql,1)>0) OR (charindex(@f5,@FiltSql,1)>0) OR  (charindex(@f6,@FiltSql,1)>0) OR (charindex(@f7,@FiltSql,1)>0))
begin
  Set @result=0
end

Return @result
END





GO
/****** Object:  UserDefinedFunction [dbo].[fn_hex_to_char]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   function   [dbo].[fn_hex_to_char]   (
      @x   varbinary(100),   --   binary   hex   value
      @l   int   --   number   of   bytes
      )   returns   varchar(200)
    as
  --   Written   by:   Gregory   A.   Larsen
  --   Date:   May   25,   2004
  --   Description:     This   function   will   take   any   binary   value   and   return
  --                               the   hex   value   as   a   character   representation.
  --                               In   order   to   use   this   function   you   need   to   pass   the
  --                               binary   hex   value   and   the   number   of   bytes   you   want   to
  --                               convert.
  begin

  declare   @i   varbinary(10)
  declare   @digits   char(16)
  set   @digits   =   '0123456789ABCDEF'
  declare   @s   varchar(100)
  declare   @h   varchar(100)
  declare   @j   int
  set   @j   =   0
  set   @h   =   ''
  --   process   all     bytes
  while   @j   <   @l
  begin
      set   @j=   @j   +   1
      --   get   first   character   of   byte
      set   @i   =   substring(cast(@x   as   varbinary(100)),@j,1)
      --   get   the   first   character
      set   @s   =   cast(substring(@digits,@i%16+1,1)   as   char(1))
      --   shift   over   one   character
      set   @i   =   @i/16
      --   get   the   second   character
      set   @s   =   cast(substring(@digits,@i%16+1,1)   as   char(1))   +   @s
      --   build   string   of   hex   characters
      set   @h   =   @h   +   @s
  end
  return(@h)
  end
GO
/****** Object:  UserDefinedFunction [dbo].[GetTranslation]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--获取语言包
CREATE    FUNCTION [dbo].[GetTranslation](@TranslationID as nvarchar(200))
RETURNS nvarchar(200) as
BEGIN
 --定义变量
 declare @language as nvarchar(200)
 declare @translated as nvarchar(200)
 SET @language='Chinese'
 SELECT @language=ISNULL(value,'Chinese') FROM dbo.Server_Config WHERE Name='Language'

 --调用相应的函数


 SELECT @translated  =
     CASE @language
     WHEN 'Chinese' THEN dbo.ChineseTranslation(@TranslationID)        --简体中文
     WHEN 'English' THEN dbo.EnglishTranslation(@TranslationID)        --英文
     WHEN 'Traditional' THEN dbo.TraditionalTranslation(@TranslationID)--繁体
     WHEN 'Vietnam' THEN dbo.VietnamTranslation(@TranslationID)        --越南文
     ELSE dbo.ChineseTranslation(@TranslationID) end
 return @translated
end
















GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <XiaoV>
-- Create date:   <2009/7/6>
-- Description:   <拆分字符串函数>
-- =============================================
CREATE FUNCTION [dbo].[Split]
(
 @SplitString  nvarchar(4000),
 @Separator varchar(2) = ','
)
RETURNS @SplitStringsTable TABLE
(
 [id] int identity(1,1),
 [value]  nvarchar(50)
)
AS
BEGIN
    DECLARE @CurrentIndex int;
    DECLARE @NextIndex int;
    DECLARE @ReturnText  nvarchar(4000);
    SELECT @CurrentIndex=1;
    WHILE(@CurrentIndex<=len(@SplitString))
    BEGIN
        SELECT @NextIndex=charindex(@Separator,@SplitString,@CurrentIndex);
        IF(@NextIndex=0 OR @NextIndex IS NULL)
            SELECT @NextIndex=len(@SplitString)+1;

        SELECT @ReturnText=substring(@SplitString,@CurrentIndex,@NextIndex-@CurrentIndex);

        INSERT INTO @SplitStringsTable([value])
        VALUES(@ReturnText);

        SELECT @CurrentIndex=@NextIndex+1;
    END
    RETURN;
END


GO
/****** Object:  UserDefinedFunction [dbo].[TraditionalTranslation]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--中文繁体语言包
CREATE   FUNCTION [dbo].[TraditionalTranslation](@TranslationID as nvarchar(200))
RETURNS nvarchar(200) as
begin
 declare @translated as nvarchar(200)


 select  @translated =
	case @TranslationID
	when 'SP_Active_PullDown.Sender' then N'系統管理員'
	when 'SP_Active_PullDown.Title' then N'您獲得活動獎品!'
	when 'SP_Active_PullDown.Content' then N'您獲得活動獎品!'
	when 'SP_Auction_Delete.Sender' then N'拍賣中心'
	when 'SP_Auction_Delete.Title' then N'撤銷拍賣!'
	when 'SP_Auction_Delete.Content' then N'撤銷拍賣!'
	when 'SP_Auction_Scan.Sender' then N'拍賣中心'
	when 'SP_Auction_Scan.Title' then N'拍賣成功!'
	when 'SP_Auction_Scan.Content' then N'拍賣成功!'
	when 'SP_Auction_Scan.Msg1' then N'拍賣過期:    '
	when 'SP_Auction_Scan.Msg2' then N'您所拍賣的  {0}  超過保管時間!!'
	when 'SP_Auction_Scan.Msg3' then N'競標成功:    '
	when 'SP_Auction_Scan.Msg4' then N'您成功競標<{0}>拍賣的  {1}  , 支付{2}點券!'
	when 'SP_Auction_Scan.Msg5' then N'拍賣成功:    '
	when 'SP_Auction_Scan.Msg6' then N'您所拍賣的  {0}  被<{1}>購買 , 交易金額為{2}點券! 其中扣除交易費用{3}點券 , 您一共獲得{4}點券!'
	when 'SP_Auction_Scan.Msg7' then N'您所拍賣的  {0}  被<{1}>購買 , 交易金額為{2}點券! 您一共獲得{4}點券!'
	when 'SP_Auction_Update.Sender' then N'拍賣中心'
	when 'SP_Auction_Update.Title' then N'拍賣返回!'
	when 'SP_Auction_Update.Content' then N'拍賣返回!'
	when 'SP_Auction_Update.Msg1' then N'競標失敗:    '
	when 'SP_Auction_Update.Msg2' then N'您競標的  {0}  價格被 <{1}> 超出，返回{2}點券!'
	when 'SP_Auction_Update.Msg3' then N'競標成功:    '
	when 'SP_Auction_Update.Msg4' then N'您成功競標<{0}>拍賣的  {1}  ,支付{2}點券!'
	when 'SP_Auction_Update.Msg5' then N'拍賣成功:    '
	when 'SP_Auction_Update.Msg6' then N'您所拍賣的  {0}  被 <{1}> 購買 , 交易金額為{2}點券! 其中扣除交易費用{3}點券 , 您一共獲得{4}點券!'
	when 'SP_Auction_Update.Msg7' then N'您所拍賣的  {0}  被<{1}>購買 , 交易金額為{2}點券! 您一共獲得{4}點券!'
	when 'SP_Consortia_Add.Duty1' then N'會長'
	when 'SP_Consortia_Add.Duty2' then N'副會長'
	when 'SP_Consortia_Add.Duty3' then N'官員'
	when 'SP_Consortia_Add.Duty4' then N'精英'
	when 'SP_Consortia_Add.Duty5' then N'會員'
	when 'SP_ConsortiaAlly_Add.Msg1' then N'<{0}> 向你們宣戰，成為敵對狀態!'
	when 'SP_ConsortiaAlly_Add.Msg2' then N'你們向 <{0}> 宣戰，成為敵對狀態!'
	when 'SP_ConsortiaAlly_Add.Msg3' then N'<{0}> 與你們解除盟約，相互中立!'
	when 'SP_ConsortiaAlly_Add.Msg4' then N'你們與 <{0}> 解除盟約，相互中立!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg1' then N'你們與 <{0}> 成功結盟!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg2' then N'<{0}> 與你們成功結盟!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg3' then N'你們與 <{0}> 議和成功，相互中立!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg4' then N'<{0}> 與你們議和成功，相互中立!'
	when 'SP_Mail_Delete.Msg1' then N'退回信函:   '
	when 'SP_Mail_Delete.Msg2' then N'您寄往<{0}>的郵件由於對方拒絕接收或超過郵件保留期而被退回!'
	when 'SP_Mail_PaymentCancel.Msg1' then N'退回信函:    '
	when 'SP_Mail_PaymentCancel.Msg2' then N'您寄往<{0}>的郵件由於對方拒絕接收或超過郵件保留期而被退回!'
	when 'SP_Mail_Scan.Sender' then N'拍賣中心'
	when 'SP_Mail_Scan.Title' then N'拍賣成功!'
	when 'SP_Mail_Scan.Content' then N'拍賣成功!'
	when 'SP_Mail_Scan.Msg1' then N'退回信函:    '
	when 'SP_Mail_Scan.Msg2' then N'您寄往<{0}>的郵件由於對方拒絕接收或超過郵件保留期而被退回!'
	when 'SP_Mail_Update.Msg1' then N'付款信函:    '
	when 'SP_Mail_Update.Msg2' then N'您寄往<{0}>的  {1}  已經付費，付款金額為{2}點券!'
	when 'SP_Consortia_Riches_Add.Msg1' then N'公會成員{0}捐獻{1}點公會財富!'

	when 'SP_Mail_Update.Msg3' then N'附件為:1、點券{0}'
	when 'SP_Admin_SendAllItem.Sender' then N'系統管理員'
	else @TranslationID
	end
 return @translated
end






















GO
/****** Object:  UserDefinedFunction [dbo].[VietnamTranslation]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--中文繁体语言包
CREATE   FUNCTION [dbo].[VietnamTranslation](@TranslationID as nvarchar(200))
RETURNS nvarchar(200) as
begin
 declare @translated as nvarchar(200)


  select  @translated =
	case @TranslationID
	when 'SP_Active_PullDown.Sender' then N'Quản lý hệ thống'
	when 'SP_Active_PullDown.Title' then N'Bạn nhận được phần thưởng hoạt động!'
	when 'SP_Active_PullDown.Content' then N'Bạn nhận được phần thưởng hoạt động!'
	when 'SP_Auction_Delete.Sender' then N'Trung tâm bán đấu giá'
	when 'SP_Auction_Delete.Title' then N'Hủy bán đấu giá!'
	when 'SP_Auction_Delete.Content' then N'Hủy bán đấu giá!'
	when 'SP_Auction_Scan.Sender' then N'Trung tâm bán đấu giá'
	when 'SP_Auction_Scan.Title' then N'Bán đấu giá thành công!'
	when 'SP_Auction_Scan.Content' then N'Bán đấu giá thành công!'
	when 'SP_Auction_Scan.Msg1' then N'Bán đấu giá quá hạn:    '
	when 'SP_Auction_Scan.Msg2' then N'Bạn bán đấu giá {0} đã quá hạn!!'
	when 'SP_Auction_Scan.Msg3' then N'Đấu giá thành công:    '
	when 'SP_Auction_Scan.Msg4' then N'Bạn đã đấu giá thành công <{0}> vật phẩm {1}, trả {2} điểm khoán!'
	when 'SP_Auction_Scan.Msg5' then N'Bán đấu giá thành công:    '
	when 'SP_Auction_Scan.Msg6' then N'{0} bán đấu giá đã được <{1}> mua đi, nhận được {2} điểm khoán!!'
	when 'SP_Auction_Update.Sender' then N'Trung tâm bán đấu giá'
	when 'SP_Auction_Update.Title' then N'Bán đấu giá trả về!'
	when 'SP_Auction_Update.Content' then N'Bán đấu giá trả về!'
	when 'SP_Auction_Update.Msg1' then N'Đấu giá thất bại:    '
	when 'SP_Auction_Update.Msg2' then N'Giá {0} bạn đưa ra thấp hơn <{1}>, trả lại {2} điểm khoán!'
	when 'SP_Auction_Update.Msg3' then N'Đấu giá thành công:    '
	when 'SP_Auction_Update.Msg4' then N'Bạn đấu giá <{0}> thành công vật phẩm {1}, chi trả {2} điểm khoán!'
	when 'SP_Auction_Update.Msg5' then N'Bán đấu giá thành công:    '
	when 'SP_Auction_Update.Msg6' then N'{0} bán đấu giá đã được <{1}> mua đi, nhận được {2} điểm khoán!'
	when 'SP_Consortia_Add.Duty1' then N'Hội trưởng'
	when 'SP_Consortia_Add.Duty2' then N'Phó hội trưởng'
	when 'SP_Consortia_Add.Duty3' then N'Quan viên'
	when 'SP_Consortia_Add.Duty4' then N'Tinh anh'
	when 'SP_Consortia_Add.Duty5' then N'Hội viên'
	when 'SP_ConsortiaAlly_Add.Msg1' then N'<{0}> tuyên chiến, thù địch!'
	when 'SP_ConsortiaAlly_Add.Msg2' then N' Chuyển sang trạng thái thù địch với <{0}>!'
	when 'SP_ConsortiaAlly_Add.Msg3' then N'<{0}> Thoát liên minh, trung lập!'
	when 'SP_ConsortiaAlly_Add.Msg4' then N' Cùng <{0}> bỏ liên minh, trung lập!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg1' then N'Đã liên minh với <{0}>!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg2' then N'<{0}> và bạn liên minh thành công!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg3' then N'Đã nghị hòa với <{0}>!'
	when 'SP_ConsortiaApplyAlly_Pass.Msg4' then N'<{0}> đã nghị hòa với guild bạn!'
	when 'SP_Mail_Delete.Msg1' then N'Thư trả về:   '
	when 'SP_Mail_Delete.Msg2' then N'Thư bạn gửi cho <{0}> bị đối phương từ chối hay vượt quá thời gian cho phép nên bị trả về!'
	when 'SP_Mail_PaymentCancel.Msg1' then N'hư trả về:    '
	when 'SP_Mail_PaymentCancel.Msg2' then N'Thư bạn gửi cho <{0}> bị đối phương từ chối hay vượt quá thời gian cho phép nên bị trả về!'
	when 'SP_Mail_Scan.Sender' then N'Trung tâm bán đấu giá'
	when 'SP_Mail_Scan.Title' then N'Bán đấu giá thành công!'
	when 'SP_Mail_Scan.Content' then N'Bán đấu giá thành công!'
	when 'SP_Mail_Scan.Msg1' then N'Thư trả về:    '
	when 'SP_Mail_Scan.Msg2' then N'Thư bạn gửi cho <{0}> bị đối phương từ chối hay vượt quá thời gian cho phép nên bị trả về!'
	when 'SP_Mail_Update.Msg1' then N'Thư trả tiền:    '
	when 'SP_Mail_Update.Msg2' then N'Bạn gửi cho <{0}> {1} đã được thanh toán, số tiền là {2} điểm khoán!'
	when 'SP_Consortia_Riches_Add.Msg1' then N' Member {0} tặng {1} điểm tài sản!'
	when 'SP_Mail_Update.Msg3' then N'đính kèm:1、xu{0}'
	when 'SP_Admin_SendAllItem.Sender' then N' Quản lý '
	else @TranslationID
	end

 return @translated
end























GO
/****** Object:  Table [dbo].[Marry_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marry_Info](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[IsPublishEquip] [bit] NOT NULL,
	[Introduction] [nvarchar](120) NULL,
	[RegistTime] [datetime] NOT NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_Marry_Info] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Users_Detail]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Users_Detail](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[Password] [nvarchar](200) NULL,
	[NickName] [nvarchar](50) NULL,
	[Date] [datetime] NOT NULL,
	[IsConsortia] [bit] NOT NULL,
	[ConsortiaID] [int] NOT NULL,
	[Sex] [bit] NOT NULL,
	[Win] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[Escape] [int] NOT NULL,
	[GP] [int] NOT NULL,
	[Honor] [nvarchar](50) NULL,
	[Gold] [int] NOT NULL,
	[Money] [int] NOT NULL,
	[Style] [nvarchar](200) NOT NULL,
	[Colors] [nvarchar](200) NOT NULL,
	[Hide] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[State] [int] NOT NULL,
	[IsFirst] [int] NOT NULL,
	[Repute] [int] NOT NULL,
	[LastDate] [datetime] NULL,
	[ChargeDate] [datetime] NULL,
	[ExpendDate] [datetime] NULL,
	[ActiveIP] [nvarchar](50) NULL,
	[ForbidDate] [datetime] NOT NULL,
	[Skin] [nvarchar](50) NOT NULL,
	[Offer] [int] NOT NULL,
	[IsExist] [bit] NOT NULL,
	[ReputeOffer] [int] NOT NULL,
	[LastDateSecond] [datetime] NULL,
	[LastDateThird] [datetime] NULL,
	[LoginCount] [int] NOT NULL,
	[OnlineTime] [int] NOT NULL,
	[AntiAddiction] [int] NOT NULL,
	[AntiDate] [datetime] NULL,
	[RichesOffer] [int] NOT NULL,
	[RichesRob] [int] NOT NULL,
	[LastDayGP] [int] NOT NULL,
	[AddDayGP] [int] NOT NULL,
	[LastWeekGP] [int] NOT NULL,
	[AddWeekGP] [int] NOT NULL,
	[LastDayOffer] [int] NOT NULL,
	[AddDayOffer] [int] NOT NULL,
	[LastWeekOffer] [int] NOT NULL,
	[AddWeekOffer] [int] NOT NULL,
	[CheckCount] [int] NOT NULL,
	[Site] [nvarchar](200) NULL,
	[IsMarried] [bit] NOT NULL,
	[SpouseID] [int] NOT NULL,
	[SpouseName] [nvarchar](50) NULL,
	[MarryInfoID] [int] NOT NULL,
	[DayLoginCount] [int] NOT NULL,
	[ForbidReason] [nvarchar](1000) NULL,
	[IsCreatedMarryRoom] [bit] NOT NULL,
	[PasswordTwo] [nvarchar](200) NULL,
	[SelfMarryRoomID] [int] NOT NULL,
	[IsGotRing] [bit] NOT NULL,
	[ServerName] [nvarchar](50) NULL,
	[Rename] [bit] NOT NULL,
	[Nimbus] [int] NOT NULL,
	[LastAward] [datetime] NOT NULL,
	[GiftToken] [int] NOT NULL,
	[QuestSite] [varbinary](200) NOT NULL,
	[PvePermission] [nvarchar](50) NULL,
	[FightPower] [int] NOT NULL,
	[AnswerSite] [int] NOT NULL,
	[LastAuncherAward] [datetime] NOT NULL,
 CONSTRAINT [PK_Sys_Users_Detail_1] PRIMARY KEY CLUSTERED
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Users_Order]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Users_Order](
	[UserID] [int] NOT NULL,
	[Repute] [int] NOT NULL,
	[ReputeOffer] [int] NOT NULL,
 CONSTRAINT [PK_Sys_Users_Order] PRIMARY KEY CLUSTERED
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Sys_Marry_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE VIEW [dbo].[V_Sys_Marry_Info]
AS
SELECT dbo.Marry_Info.ID, dbo.Marry_Info.UserID, dbo.Marry_Info.IsPublishEquip,
      dbo.Marry_Info.Introduction, dbo.Marry_Info.IsExist,
      ISNULL(dbo.Sys_Users_Detail.NickName, '') AS NickName,
      dbo.Sys_Users_Detail.IsConsortia, dbo.Sys_Users_Detail.ConsortiaID,
      dbo.Sys_Users_Detail.Sex, dbo.Sys_Users_Detail.Win, dbo.Sys_Users_Detail.Total,
      dbo.Sys_Users_Detail.[Escape], dbo.Sys_Users_Detail.GP,
      ISNULL(dbo.Sys_Users_Detail.Honor, '') AS Honor, dbo.Sys_Users_Detail.Style,
      dbo.Sys_Users_Detail.Colors, dbo.Sys_Users_Detail.Hide,
      dbo.Sys_Users_Detail.Grade, dbo.Sys_Users_Detail.State, ISNULL(c.Repute, 0)
      AS Repute, dbo.Sys_Users_Detail.Skin, dbo.Sys_Users_Detail.Offer,
      dbo.Sys_Users_Detail.IsMarried, '' AS ConsortiaName,
      dbo.Sys_Users_Detail.IsExist AS UserExist, '' AS DutyName,
      dbo.Sys_Users_Detail.Nimbus, dbo.Sys_Users_Detail.FightPower
FROM dbo.Marry_Info LEFT OUTER JOIN
      dbo.Sys_Users_Detail WITH (NOLOCK) ON
      dbo.Marry_Info.UserID = dbo.Sys_Users_Detail.UserID LEFT OUTER JOIN
      dbo.Sys_Users_Order c ON dbo.Sys_Users_Detail.UserID = c.UserID
WHERE (dbo.Marry_Info.IsExist = 1)

GO
/****** Object:  Table [dbo].[Consortia_Apply_Users]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia_Apply_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConsortiaID] [int] NOT NULL,
	[ConsortiaName] [nvarchar](200) NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[ApplyDate] [datetime] NOT NULL,
	[Remark] [nvarchar](200) NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_Consortia_Apply] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Consortia_Apply_Users]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Consortia_Apply_Users]
AS
SELECT dbo.Consortia_Apply_Users.*, B.Grade AS Grade, B.Win AS Win, B.Total AS Total,
      B.Repute AS Repute, B.FightPower AS FightPower
FROM dbo.Consortia_Apply_Users INNER JOIN
      dbo.Sys_Users_Detail B ON B.UserID = dbo.Consortia_Apply_Users.UserID
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[AuctionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Category] [int] NOT NULL,
	[AuctioneerID] [int] NOT NULL,
	[AuctioneerName] [nvarchar](50) NOT NULL,
	[ItemID] [int] NOT NULL,
	[PayType] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Rise] [int] NOT NULL,
	[Mouthful] [int] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[ValidDate] [int] NOT NULL,
	[BuyerID] [int] NOT NULL,
	[BuyerName] [nvarchar](50) NOT NULL,
	[IsExist] [bit] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Random] [int] NOT NULL,
 CONSTRAINT [PK_Auction] PRIMARY KEY CLUSTERED
(
	[AuctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Auction_Scan]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Auction_Scan]
AS
SELECT dbo.Auction.*, DATEADD(hh, ValidDate, BeginDate) AS dd
FROM dbo.Auction
WHERE (DATEADD(mi, Random, BeginDate) < GETDATE())
GO
/****** Object:  Table [dbo].[Charge_Money]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Charge_Money](
	[ChargeID] [varchar](50) NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Money] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[CanUse] [bit] NOT NULL,
	[PayWay] [nvarchar](200) NOT NULL,
	[NeedMoney] [decimal](10, 2) NOT NULL,
	[IP] [nvarchar](50) NULL,
	[NickName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Charge_Money] PRIMARY KEY CLUSTERED
(
	[ChargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Charge_Money]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[V_Charge_Money]
AS
SELECT dbo.Charge_Money.PayWay, dbo.Charge_Money.Money,
      dbo.Sys_Users_Detail.Sex, dbo.Charge_Money.[Date]
FROM dbo.Charge_Money INNER JOIN
      dbo.Sys_Users_Detail ON
      dbo.Charge_Money.UserName = dbo.Sys_Users_Detail.UserName



GO
/****** Object:  Table [dbo].[Consortia]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia](
	[ConsortiaID] [int] IDENTITY(1,1) NOT NULL,
	[ConsortiaName] [nvarchar](200) NOT NULL,
	[Honor] [int] NOT NULL,
	[CreatorID] [int] NOT NULL,
	[CreatorName] [nvarchar](200) NOT NULL,
	[ChairmanID] [int] NOT NULL,
	[ChairmanName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Placard] [nvarchar](1000) NULL,
	[Level] [int] NOT NULL,
	[MaxCount] [int] NOT NULL,
	[CelebCount] [int] NOT NULL,
	[BuildDate] [datetime] NOT NULL,
	[Repute] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[IP] [nvarchar](50) NOT NULL,
	[Port] [int] NOT NULL,
	[IsExist] [bit] NOT NULL,
	[Riches] [int] NOT NULL,
	[DeductDate] [datetime] NOT NULL,
	[WarnDate] [datetime] NOT NULL,
	[LastDayRiches] [int] NOT NULL,
	[AddDayRiches] [int] NOT NULL,
	[LastWeekRiches] [int] NOT NULL,
	[AddWeekRiches] [int] NOT NULL,
	[LastDayHonor] [int] NOT NULL,
	[AddDayHonor] [int] NOT NULL,
	[LastWeekHonor] [int] NOT NULL,
	[AddWeekHonor] [int] NOT NULL,
	[OpenApply] [bit] NOT NULL,
	[StoreLevel] [int] NOT NULL,
	[SmithLevel] [int] NOT NULL,
	[ShopLevel] [int] NOT NULL,
	[Rename] [bit] NOT NULL,
	[KickDate] [datetime] NOT NULL,
	[KickCount] [int] NOT NULL,
	[FightPower] [int] NOT NULL,
 CONSTRAINT [PK_Consortia] PRIMARY KEY CLUSTERED
(
	[ConsortiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Consortia]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Consortia]
AS
SELECT dbo.Consortia.*,   CASE WHEN Consortia.Repute = 0 THEN 9999999 ELSE Consortia.Repute END AS ReputeSort
FROM dbo.Consortia

GO
/****** Object:  View [dbo].[V_Auction]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_Auction]
AS
SELECT *, DATEADD(hh, ValidDate, BeginDate) AS dd
FROM dbo.Auction


GO
/****** Object:  Table [dbo].[Consortia_Users]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConsortiaID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[RatifierID] [int] NULL,
	[RatifierName] [nvarchar](200) NULL,
	[DutyID] [int] NOT NULL,
	[Remark] [nvarchar](2000) NULL,
	[IsBanChat] [bit] NOT NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_Consortia_Users] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Users_Fight]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Users_Fight](
	[UserID] [int] NOT NULL,
	[Attack] [int] NOT NULL,
	[Defence] [int] NOT NULL,
	[Luck] [int] NOT NULL,
	[Agility] [int] NOT NULL,
	[Delay] [int] NOT NULL,
	[Honor] [nvarchar](200) NULL,
	[Map] [nvarchar](50) NULL,
	[Directory] [nvarchar](50) NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_Sys_Users_Fight_1] PRIMARY KEY CLUSTERED
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consortia_Duty]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia_Duty](
	[DutyID] [int] IDENTITY(1,1) NOT NULL,
	[ConsortiaID] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[DutyName] [nvarchar](200) NOT NULL,
	[Right] [int] NOT NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_Consortia_Right] PRIMARY KEY CLUSTERED
(
	[DutyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Celeb_Users]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Celeb_Users]
AS
SELECT dbo.Sys_Users_Detail.UserID, dbo.Sys_Users_Detail.NickName,
      dbo.Sys_Users_Detail.Sex, dbo.Sys_Users_Fight.Attack,
      dbo.Sys_Users_Fight.Defence, dbo.Sys_Users_Fight.Luck,
      dbo.Sys_Users_Fight.Agility, dbo.Sys_Users_Detail.Gold,
      dbo.Sys_Users_Detail.Money, dbo.Sys_Users_Detail.Style,
      dbo.Sys_Users_Detail.Colors, dbo.Sys_Users_Detail.Grade,
      dbo.Sys_Users_Detail.GP, dbo.Sys_Users_Detail.ConsortiaID,
      dbo.Sys_Users_Detail.State, dbo.Sys_Users_Detail.Hide,
      dbo.Sys_Users_Detail.Repute, dbo.Sys_Users_Detail.UserName,
      ISNULL(dbo.Consortia.ConsortiaName, '') AS ConsortiaName,
      dbo.Sys_Users_Detail.IsExist, dbo.Sys_Users_Detail.IsFirst,
      dbo.Sys_Users_Detail.Password, dbo.Sys_Users_Detail.Offer,
      dbo.Sys_Users_Detail.Win, dbo.Sys_Users_Detail.Total,
      dbo.Sys_Users_Detail.[Escape], dbo.Sys_Users_Detail.Skin,
      dbo.Sys_Users_Detail.IsConsortia, ISNULL(dbo.Consortia_Users.IsBanChat, 0)
      AS IsBanChat, dbo.Sys_Users_Detail.ReputeOffer, ISNULL(dbo.Consortia.Repute, 0)
      AS ConsortiaRepute, ISNULL(dbo.Consortia.[Level], 0) AS ConsortiaLevel,
      ISNULL(dbo.Consortia.Honor, 0) AS ConsortiaHonor,
      dbo.Sys_Users_Detail.AntiAddiction, dbo.Sys_Users_Detail.RichesOffer,
      dbo.Sys_Users_Detail.RichesRob, ISNULL(dbo.Consortia_Duty.DutyName, '')
      AS DutyName, ISNULL(dbo.Consortia_Duty.[Level], 0) AS DutyLevel,
      ISNULL(dbo.Consortia_Duty.[Right], 0) AS [Right],
      ISNULL(dbo.Consortia.ChairmanName, '') AS ChairmanName,
      dbo.Sys_Users_Detail.GP - dbo.Sys_Users_Detail.LastDayGP AS AddDayGP,
      dbo.Sys_Users_Detail.GP - dbo.Sys_Users_Detail.LastWeekGP AS AddWeekGP,
      dbo.Sys_Users_Detail.Offer - dbo.Sys_Users_Detail.LastDayOffer AS AddDayOffer,
      dbo.Sys_Users_Detail.Offer - dbo.Sys_Users_Detail.LastWeekOffer AS AddWeekOffer
FROM dbo.Sys_Users_Detail LEFT OUTER JOIN
      dbo.Sys_Users_Fight ON
      dbo.Sys_Users_Detail.UserID = dbo.Sys_Users_Fight.UserID LEFT OUTER JOIN
      dbo.Consortia ON
      dbo.Sys_Users_Detail.ConsortiaID = dbo.Consortia.ConsortiaID LEFT OUTER JOIN
      dbo.Consortia_Users ON
      dbo.Sys_Users_Detail.UserID = dbo.Consortia_Users.UserID LEFT OUTER JOIN
      dbo.Consortia_Duty ON dbo.Consortia_Users.DutyID = dbo.Consortia_Duty.DutyID

GO
/****** Object:  Table [dbo].[Consortia_Ally]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia_Ally](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Consortia1ID] [int] NOT NULL,
	[Consortia2ID] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[ValidDate] [int] NOT NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_Consortia_Ally] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Consortia_Ally]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Consortia_Ally]
AS
SELECT dbo.Consortia_Ally.*, a.ConsortiaName AS ConsortiaName1, a.[Count] AS Count1,
      a.Repute AS Repute1, b.ConsortiaName AS ConsortiaName2, b.[Count] AS Count2,
      b.Repute AS Repute2, a.[Level] AS Level1, b.[Level] AS Level2, a.Honor AS Honor1,
      b.Honor AS Honor2, a.ChairmanName AS ChairmanName1,
      b.ChairmanName AS ChairmanName2, a.Description AS Description1,
      b.Description AS Description2, a.Riches AS Riches1, b.Riches AS Riches2
FROM dbo.Consortia_Ally LEFT OUTER JOIN
      dbo.Consortia a ON
      dbo.Consortia_Ally.Consortia1ID = a.ConsortiaID LEFT OUTER JOIN
      dbo.Consortia b ON dbo.Consortia_Ally.Consortia2ID = b.ConsortiaID

GO
/****** Object:  Table [dbo].[Consortia_Apply_Ally]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia_Apply_Ally](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Consortia1ID] [int] NOT NULL,
	[Consortia2ID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Remark] [nvarchar](200) NULL,
	[IsExist] [bit] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_Consortia_Apply_Ally] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Consortia_Apply_Ally]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Consortia_Apply_Ally]
AS
SELECT dbo.Consortia_Apply_Ally.*, dbo.Consortia.ConsortiaName AS ConsortiaName,
      dbo.Consortia.Repute AS Repute, dbo.Consortia.ChairmanName AS ChairmanName,
      dbo.Consortia.[Count] AS [Count], dbo.Consortia.CelebCount AS CelebCount,
      dbo.Consortia.Honor AS Honor, dbo.Consortia.[Level] AS [Level],
      dbo.Consortia.Description AS Description
FROM dbo.Consortia_Apply_Ally LEFT OUTER JOIN
      dbo.Consortia ON dbo.Consortia_Apply_Ally.Consortia1ID = dbo.Consortia.ConsortiaID

GO
/****** Object:  Table [dbo].[Consortia_Invite_Users]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia_Invite_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConsortiaID] [int] NOT NULL,
	[ConsortiaName] [nvarchar](200) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[InviteID] [int] NOT NULL,
	[InviteName] [nvarchar](200) NOT NULL,
	[InviteDate] [datetime] NOT NULL,
	[Remark] [nvarchar](200) NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_Consortia_Invite] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Consortia_Invite]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[V_Consortia_Invite]
AS
SELECT dbo.Consortia_Invite_Users.*, dbo.Consortia.ChairmanName AS ChairmanName,
      dbo.Consortia.MaxCount AS MaxCount, dbo.Consortia.CelebCount AS CelebCount,
      dbo.Consortia.Honor AS Honor, dbo.Consortia.Repute AS Repute,
      dbo.Consortia.[Count] AS [Count]
FROM dbo.Consortia_Invite_Users LEFT OUTER JOIN
      dbo.Consortia ON
      dbo.Consortia_Invite_Users.ConsortiaID = dbo.Consortia.ConsortiaID



GO
/****** Object:  View [dbo].[V_Consortia_Users]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Consortia_Users]
AS
SELECT dbo.Consortia_Users.*, dbo.Sys_Users_Detail.Grade AS Grade,
      dbo.Sys_Users_Detail.GP AS GP, dbo.Sys_Users_Detail.Repute AS Repute,
      dbo.Sys_Users_Detail.State AS State, dbo.Sys_Users_Detail.Offer AS Offer,
      dbo.Consortia_Duty.[Level] AS [Level], dbo.Consortia_Duty.DutyName AS DutyName,
      dbo.Consortia_Duty.[Right] AS [Right], dbo.Sys_Users_Detail.Colors AS Colors,
      dbo.Sys_Users_Detail.Style AS Style, dbo.Sys_Users_Detail.Hide AS Hide,
      dbo.Sys_Users_Detail.Skin AS Skin, dbo.Sys_Users_Detail.LastDate AS LastDate,
      dbo.Sys_Users_Detail.Sex AS Sex, dbo.Sys_Users_Detail.Win AS Win,
      dbo.Sys_Users_Detail.Total AS Total, dbo.Sys_Users_Detail.[Escape] AS [Escape],
      dbo.Sys_Users_Detail.RichesOffer AS RichesOffer,
      dbo.Sys_Users_Detail.RichesRob AS RichesRob,
      dbo.Sys_Users_Detail.UserName AS LoginName,
      dbo.Sys_Users_Detail.Nimbus AS Nimbus,
      dbo.Sys_Users_Detail.FightPower AS FightPower


FROM dbo.Consortia_Users LEFT OUTER JOIN
      dbo.Sys_Users_Detail ON
      dbo.Consortia_Users.UserID = dbo.Sys_Users_Detail.UserID LEFT OUTER JOIN
      dbo.Consortia_Duty ON dbo.Consortia_Users.DutyID = dbo.Consortia_Duty.DutyID



GO
/****** Object:  Table [dbo].[Sys_Users_Password]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Users_Password](
	[UserID] [int] NOT NULL,
	[PasswordQuestion1] [nvarchar](50) NULL,
	[PasswordAnswer1] [nvarchar](50) NULL,
	[PasswordQuestion2] [nvarchar](50) NULL,
	[PasswordAnswer2] [nvarchar](50) NULL,
	[LastFindDate] [datetime] NULL,
	[FailedPasswordAttemptCount] [int] NULL,
 CONSTRAINT [PK_Sys_Users_Password] PRIMARY KEY CLUSTERED
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Sys_Users_Detail]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Sys_Users_Detail]
AS
SELECT dbo.Sys_Users_Detail.UserID, dbo.Sys_Users_Detail.NickName,
      dbo.Sys_Users_Detail.Sex, dbo.Sys_Users_Fight.Attack,
      dbo.Sys_Users_Fight.Defence, dbo.Sys_Users_Fight.Luck,
      dbo.Sys_Users_Fight.Agility, dbo.Sys_Users_Detail.Gold,
      dbo.Sys_Users_Detail.Money, dbo.Sys_Users_Detail.Style,
      dbo.Sys_Users_Detail.Colors, dbo.Sys_Users_Detail.Grade,
      dbo.Sys_Users_Detail.GP, dbo.Sys_Users_Detail.ConsortiaID,
      dbo.Sys_Users_Detail.State, dbo.Sys_Users_Detail.Hide,
      ISNULL(dbo.Sys_Users_Order.Repute, 0) AS Repute,
      dbo.Sys_Users_Detail.UserName, ISNULL(dbo.Consortia.ConsortiaName, '')
      AS ConsortiaName, dbo.Sys_Users_Detail.IsExist, dbo.Sys_Users_Detail.IsFirst,
      dbo.Sys_Users_Detail.Password, dbo.Sys_Users_Detail.Offer,
      dbo.Sys_Users_Detail.Win, dbo.Sys_Users_Detail.Total,
      dbo.Sys_Users_Detail.[Escape], dbo.Sys_Users_Detail.Skin,
      dbo.Sys_Users_Detail.IsConsortia, ISNULL(dbo.Consortia_Users.IsBanChat, 0)
      AS IsBanChat, ISNULL(dbo.Sys_Users_Order.ReputeOffer, 0) AS ReputeOffer,
      ISNULL(dbo.Consortia.Repute, 0) AS ConsortiaRepute, ISNULL(dbo.Consortia.[Level],
      0) AS ConsortiaLevel, ISNULL(dbo.Consortia.Honor, 0) AS ConsortiaHonor,
      dbo.Sys_Users_Detail.AntiAddiction, dbo.Sys_Users_Detail.RichesOffer,
      dbo.Sys_Users_Detail.RichesRob, ISNULL(dbo.Consortia_Duty.DutyName, '')
      AS DutyName, ISNULL(dbo.Consortia_Duty.[Level], 0) AS DutyLevel,
      ISNULL(dbo.Consortia_Duty.[Right], 0) AS [Right],
      ISNULL(dbo.Consortia.ChairmanName, '') AS ChairmanName,
      dbo.Sys_Users_Detail.AddDayGP, dbo.Sys_Users_Detail.AddWeekGP,
      dbo.Sys_Users_Detail.AddDayOffer, dbo.Sys_Users_Detail.AddWeekOffer,
      ISNULL(dbo.Consortia.LastDayRiches, 0) AS ConsortiaRiches,
      dbo.Sys_Users_Detail.LastDayOffer, dbo.Sys_Users_Detail.LastDayGP,
      dbo.Sys_Users_Detail.CheckCount, ISNULL(dbo.Consortia.StoreLevel, 0)
      AS StoreLevel, ISNULL(dbo.Consortia.ShopLevel, 0) AS ShopLevel,
      ISNULL(dbo.Consortia.SmithLevel, 0) AS SmithLevel,
      dbo.Sys_Users_Detail.ForbidDate, dbo.Sys_Users_Detail.IsMarried,
      ISNULL(dbo.Sys_Users_Detail.SpouseID, 0) AS SpouseID,
      ISNULL(dbo.Sys_Users_Detail.SpouseName, '') AS SpouseName,
      dbo.Sys_Users_Detail.MarryInfoID, dbo.Sys_Users_Detail.IsCreatedMarryRoom,
      dbo.Sys_Users_Detail.DayLoginCount, dbo.Sys_Users_Detail.PasswordTwo,
      dbo.Sys_Users_Detail.SelfMarryRoomID, dbo.Sys_Users_Detail.IsGotRing,
      ISNULL(dbo.Consortia.Rename, 0) AS ConsortiaRename,
      ISNULL(dbo.Sys_Users_Detail.Rename, 0) AS Rename,
      dbo.Sys_Users_Detail.Nimbus, dbo.Sys_Users_Detail.LastAward,
      dbo.Sys_Users_Detail.GiftToken, dbo.Sys_Users_Detail.QuestSite,
      dbo.Sys_Users_Detail.PvePermission, dbo.Sys_Users_Detail.FightPower,
      dbo.Sys_Users_Password.PasswordQuestion1,
      dbo.Sys_Users_Password.PasswordQuestion2,
      ISNULL(dbo.Sys_Users_Password.LastFindDate, '2000-01-01') AS LastFindDate,
      ISNULL(dbo.Sys_Users_Password.FailedPasswordAttemptCount, 0)
      AS FailedPasswordAttemptCount, dbo.Sys_Users_Detail.AnswerSite,
      dbo.Sys_Users_Detail.LastAuncherAward
FROM dbo.Sys_Users_Detail LEFT OUTER JOIN
      dbo.Sys_Users_Fight ON
      dbo.Sys_Users_Detail.UserID = dbo.Sys_Users_Fight.UserID LEFT OUTER JOIN
      dbo.Consortia ON
      dbo.Sys_Users_Detail.ConsortiaID = dbo.Consortia.ConsortiaID LEFT OUTER JOIN
      dbo.Consortia_Users ON
      dbo.Sys_Users_Detail.UserID = dbo.Consortia_Users.UserID LEFT OUTER JOIN
      dbo.Consortia_Duty ON
      dbo.Consortia_Users.DutyID = dbo.Consortia_Duty.DutyID LEFT OUTER JOIN
      dbo.Sys_Users_Password ON
      dbo.Sys_Users_Password.UserID = dbo.Sys_Users_Detail.UserID LEFT OUTER JOIN
      dbo.Sys_Users_Order ON
      dbo.Sys_Users_Detail.UserID = dbo.Sys_Users_Order.UserID
GO
/****** Object:  Table [dbo].[Sys_Users_Friends]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Users_Friends](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FriendID] [int] NOT NULL,
	[AddDate] [datetime] NULL,
	[Remark] [nvarchar](200) NULL,
	[IsExist] [bit] NOT NULL,
	[Relation] [int] NOT NULL,
 CONSTRAINT [PK_User_Friends] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Sys_Users_Friends]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Sys_Users_Friends]
AS
SELECT dbo.Sys_Users_Friends.*, dbo.Sys_Users_Detail.NickName,
      dbo.Sys_Users_Detail.Style, dbo.Sys_Users_Detail.Sex,
      dbo.Sys_Users_Detail.Colors, dbo.Sys_Users_Detail.Grade,
      dbo.Sys_Users_Detail.Hide, dbo.Sys_Users_Detail.State,
      dbo.Sys_Users_Detail.Offer, dbo.Sys_Users_Detail.Total,
      dbo.Sys_Users_Detail.[Escape], dbo.Sys_Users_Detail.Win,
      ISNULL(dbo.Consortia.ConsortiaName, '') AS ConsortiaName,
      dbo.Sys_Users_Detail.Repute, dbo.Sys_Users_Detail.UserName,
      ISNULL(dbo.Consortia_Duty.DutyName, '') AS DutyName,
       dbo.Sys_Users_Detail.Nimbus,
       dbo.Sys_Users_Detail.FightPower
FROM dbo.Sys_Users_Friends LEFT OUTER JOIN
      dbo.Sys_Users_Detail ON
      dbo.Sys_Users_Friends.FriendID = dbo.Sys_Users_Detail.UserID LEFT OUTER JOIN
      dbo.Consortia ON dbo.Sys_Users_Detail.ConsortiaID = dbo.Consortia.ConsortiaID  LEFT OUTER JOIN
      dbo.Consortia_Users ON
      dbo.Sys_Users_Detail.UserID = dbo.Consortia_Users.UserID LEFT OUTER JOIN
      dbo.Consortia_Duty ON dbo.Consortia_Users.DutyID = dbo.Consortia_Duty.DutyID
--LEFT OUTER JOIN
      --dbo.Consortia_Duty ON dbo.Consortia_Users.DutyID = dbo.Consortia_Duty.DutyID
GO
/****** Object:  Table [dbo].[AASInfo]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AASInfo](
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IDNumber] [nvarchar](50) NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_AASInfo] PRIMARY KEY CLUSTERED
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Active]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Active](
	[ActiveID] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Content] [nvarchar](2000) NULL,
	[AwardContent] [nvarchar](2000) NULL,
	[HasKey] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsOnly] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[ActionTimeContent] [nvarchar](50) NULL,
 CONSTRAINT [PK_Active] PRIMARY KEY CLUSTERED
(
	[ActiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Active_Award]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Active_Award](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActiveID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ValidDate] [int] NOT NULL,
	[StrengthenLevel] [int] NOT NULL,
	[AttackCompose] [int] NOT NULL,
	[DefendCompose] [int] NOT NULL,
	[LuckCompose] [int] NOT NULL,
	[AgilityCompose] [int] NOT NULL,
	[Gold] [int] NOT NULL,
	[Money] [int] NOT NULL,
	[Sex] [int] NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_Active_Award] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Active_Number]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Active_Number](
	[AwardID] [nvarchar](50) NOT NULL,
	[ActiveID] [int] NOT NULL,
	[PullDown] [bit] NOT NULL,
	[GetDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_Active_Number] PRIMARY KEY CLUSTERED
(
	[AwardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bag_Init]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bag_Init](
	[ID] [int] NOT NULL,
	[Sex] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ValidDate] [int] NOT NULL,
	[StrengthenLevel] [int] NOT NULL,
	[AttackCompose] [int] NOT NULL,
	[DefendCompose] [int] NOT NULL,
	[LuckCompose] [int] NOT NULL,
	[AgilityCompose] [int] NOT NULL,
	[IsBinds] [bit] NOT NULL,
	[BagType] [int] NOT NULL,
	[place] [int] NOT NULL,
 CONSTRAINT [PK_Bag_Init] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ball]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ball](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Power] [float] NOT NULL,
	[Radii] [int] NOT NULL,
	[FlyingPartical] [nvarchar](200) NULL,
	[BombPartical] [nvarchar](200) NULL,
	[IsSpin] [bit] NOT NULL,
	[Mass] [int] NOT NULL,
	[SpinVA] [float] NOT NULL,
	[SpinV] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Wind] [int] NOT NULL,
	[DragIndex] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[Shake] [bit] NOT NULL,
	[ShootSound] [nvarchar](50) NULL,
	[BombSound] [nvarchar](50) NULL,
	[Delay] [int] NOT NULL,
	[ActionType] [int] NOT NULL,
	[HasTunnel] [bit] NOT NULL,
 CONSTRAINT [PK_Ball] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consortia_Equip_Control]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia_Equip_Control](
	[ConsortiaID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[Riches] [int] NOT NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_Consortia_Equip_Control] PRIMARY KEY CLUSTERED
(
	[ConsortiaID] ASC,
	[Type] ASC,
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consortia_Event]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia_Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConsortiaID] [int] NOT NULL,
	[Remark] [nvarchar](1000) NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsExist] [bit] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Consortia_Event] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consortia_Level]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consortia_Level](
	[Level] [int] NOT NULL,
	[Riches] [int] NOT NULL,
	[Deduct] [int] NOT NULL,
	[NeedGold] [int] NOT NULL,
	[NeedItem] [int] NOT NULL,
	[Reward] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[StoreRiches] [int] NOT NULL,
	[SmithRiches] [int] NOT NULL,
	[ShopRiches] [int] NOT NULL,
	[KickMax] [int] NOT NULL,
 CONSTRAINT [PK_Consortia_Level] PRIMARY KEY CLUSTERED
(
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Daily_Award]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Award](
	[ID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ValidDate] [int] NOT NULL,
	[IsBinds] [bit] NOT NULL,
	[Sex] [int] NOT NULL,
	[Remark] [nvarchar](200) NULL,
	[CountRemark] [nvarchar](100) NULL,
	[GetWay] [int] NOT NULL,
 CONSTRAINT [PK_Daily_Award] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drop_Condiction]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drop_Condiction](
	[DropID] [int] NOT NULL,
	[CondictionType] [int] NOT NULL,
	[Para1] [nvarchar](500) NOT NULL,
	[Para2] [nvarchar](500) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drop_Item]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drop_Item](
	[Id] [int] NOT NULL,
	[DropId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ValueDate] [int] NOT NULL,
	[IsBind] [bit] NOT NULL,
	[Random] [int] NOT NULL,
	[BeginData] [int] NOT NULL,
	[EndData] [int] NOT NULL,
	[IsTips] [bit] NOT NULL,
	[IsLogs] [bit] NOT NULL,
 CONSTRAINT [PK_Drop_Item] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fight_Rate]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fight_Rate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [int] NOT NULL,
	[Rate] [int] NOT NULL,
	[BeginDay] [datetime] NOT NULL,
	[EndDay] [datetime] NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[BoyTemplateID] [int] NOT NULL,
	[GirlTemplateID] [int] NOT NULL,
	[SelfCue] [nvarchar](200) NULL,
	[EnemyCue] [nvarchar](200) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Fight_Change_Rate] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fight_Record]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fight_Record](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlayBegin] [datetime] NOT NULL,
	[PlayEnd] [datetime] NOT NULL,
	[ChangeTeam] [int] NOT NULL,
	[TeamA] [nvarchar](50) NULL,
	[TeamB] [nvarchar](50) NULL,
	[MapID] [int] NOT NULL,
	[RoomType] [int] NOT NULL,
	[FightName] [nvarchar](50) NULL,
	[WinTeam] [int] NOT NULL,
 CONSTRAINT [PK_Fight_Record] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fusion]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fusion](
	[FusionID] [int] NOT NULL,
	[Item1] [int] NOT NULL,
	[Item2] [int] NOT NULL,
	[Item3] [int] NOT NULL,
	[Item4] [int] NOT NULL,
	[Item5] [int] NOT NULL,
	[Item6] [int] NOT NULL,
	[Item7] [int] NOT NULL,
	[Item8] [int] NOT NULL,
	[Item9] [int] NOT NULL,
	[Item10] [int] NOT NULL,
	[Reward1] [int] NOT NULL,
	[Random1] [int] NOT NULL,
	[Reward2] [int] NOT NULL,
	[Random2] [int] NOT NULL,
	[Reward3] [int] NOT NULL,
	[Random3] [int] NOT NULL,
	[Leave] [int] NOT NULL,
 CONSTRAINT [PK_Fusion] PRIMARY KEY CLUSTERED
(
	[FusionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Map]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Map](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](2000) NULL,
	[ForegroundWidth] [int] NOT NULL,
	[ForegroundHeight] [int] NOT NULL,
	[BackroundWidht] [int] NOT NULL,
	[BackroundHeight] [int] NOT NULL,
	[DeadWidth] [int] NOT NULL,
	[DeadHeight] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[DragIndex] [int] NOT NULL,
	[ForePic] [nvarchar](200) NULL,
	[BackPic] [nvarchar](200) NULL,
	[DeadPic] [nvarchar](200) NULL,
	[Pic] [nvarchar](200) NULL,
	[Remark] [nvarchar](50) NULL,
	[BackMusic] [nvarchar](200) NULL,
	[PosX] [nvarchar](200) NULL,
	[Type] [int] NOT NULL,
	[PosX1] [nvarchar](200) NULL,
 CONSTRAINT [PK_Game_Map] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_Fusion]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Fusion](
	[FusionID] [int] NOT NULL,
	[Item1] [int] NOT NULL,
	[Item2] [int] NOT NULL,
	[Item3] [int] NOT NULL,
	[Item4] [int] NOT NULL,
	[Formula] [int] NOT NULL,
	[Reward] [int] NOT NULL,
 CONSTRAINT [PK_Item_Fusion] PRIMARY KEY CLUSTERED
(
	[FusionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_Keys_History]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Keys_History](
	[ItemKeyId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_Record]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Record](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AgentsID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[Timer] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Operation] [int] NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[ItemID] [int] NOT NULL,
	[BeginProperty] [nvarchar](200) NOT NULL,
	[EndProperty] [nvarchar](200) NOT NULL,
	[Result] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_Refinery_Strengthen]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Refinery_Strengthen](
	[StrengthenLevel] [int] NULL,
	[Rock] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_Strengthen]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Strengthen](
	[StrengthenLevel] [int] NOT NULL,
	[Rock] [int] NOT NULL,
	[Random] [int] NOT NULL,
 CONSTRAINT [PK_Item_Strengthen] PRIMARY KEY CLUSTERED
(
	[StrengthenLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_Strengthen_Goods]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Strengthen_Goods](
	[ID] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[CurrentEquip] [int] NOT NULL,
	[GainEquip] [int] NOT NULL,
	[OrginEquip] [int] NOT NULL,
 CONSTRAINT [PK_Item_Strengthen_Goods] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Map_Server]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Map_Server](
	[ServerID] [int] NOT NULL,
	[OpenMap] [nvarchar](1000) NOT NULL,
	[IsSpecial] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Map_Week]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Map_Week](
	[WeekID] [int] NOT NULL,
	[OpenMap] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Map_Week] PRIMARY KEY CLUSTERED
(
	[WeekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marry_Apply]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marry_Apply](
	[UserID] [int] NOT NULL,
	[ApplyUserID] [int] NOT NULL,
	[ApplyUserName] [nvarchar](50) NOT NULL,
	[ApplyType] [int] NOT NULL,
	[LoveProclamation] [nvarchar](300) NULL,
	[ApplyResult] [bit] NULL,
	[isExist] [bit] NOT NULL,
	[isDeal] [bit] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ApplyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Marry_Apply] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marry_Room_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marry_Room_Info](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[PlayerName] [nvarchar](50) NULL,
	[GroomID] [int] NOT NULL,
	[GroomName] [nvarchar](50) NULL,
	[BrideID] [int] NOT NULL,
	[BrideName] [nvarchar](50) NULL,
	[Pwd] [nvarchar](15) NOT NULL,
	[AvailTime] [int] NOT NULL,
	[MaxCount] [int] NOT NULL,
	[GuestInvite] [bit] NOT NULL,
	[MapIndex] [int] NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[BreakTime] [datetime] NOT NULL,
	[RoomIntroduction] [nvarchar](300) NULL,
	[ServerID] [int] NOT NULL,
	[IsHymeneal] [bit] NOT NULL,
	[isExist] [bit] NOT NULL,
	[IsGunsaluteUsed] [bit] NOT NULL,
 CONSTRAINT [PK_Marry_Room_Info] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mission_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mission_Info](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TotalCount] [int] NOT NULL,
	[TotalTurn] [int] NOT NULL,
	[Script] [nvarchar](100) NULL,
	[Success] [nvarchar](100) NULL,
	[Failure] [nvarchar](100) NULL,
	[Description] [nvarchar](1000) NULL,
	[IncrementDelay] [int] NULL,
	[Delay] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Param1] [int] NULL,
	[Param2] [int] NULL,
 CONSTRAINT [PK_Mission_Info] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPC_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPC_Info](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Level] [int] NOT NULL,
	[Camp] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[X] [int] NULL,
	[Y] [int] NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Blood] [int] NOT NULL,
	[MoveMin] [int] NULL,
	[MoveMax] [int] NULL,
	[BaseDamage] [int] NULL,
	[BaseGuard] [int] NULL,
	[Defence] [int] NULL,
	[Agility] [int] NULL,
	[Lucky] [int] NULL,
	[Attack] [int] NULL,
	[ModelID] [nvarchar](1000) NOT NULL,
	[ResourcesPath] [nvarchar](1000) NOT NULL,
	[DropRate] [nvarchar](50) NULL,
	[Experience] [int] NOT NULL,
	[Delay] [int] NOT NULL,
	[Immunity] [int] NOT NULL,
	[Alert] [int] NULL,
	[Range] [int] NULL,
	[Preserve] [int] NULL,
	[Script] [nvarchar](50) NULL,
	[FireX] [int] NOT NULL,
	[FireY] [int] NOT NULL,
	[DropId] [int] NOT NULL,
 CONSTRAINT [PK_NPC_Info] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pve_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pve_Info](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [int] NULL,
	[LevelLimits] [int] NULL,
	[SimpleTemplateIds] [nvarchar](1024) NULL,
	[NormalTemplateIds] [nvarchar](1024) NULL,
	[HardTemplateIds] [nvarchar](1024) NULL,
	[TerrorTemplateIds] [nvarchar](1024) NULL,
	[Pic] [nvarchar](100) NULL,
	[Description] [nvarchar](1024) NULL,
	[SimpleGameScript] [nvarchar](100) NULL,
	[NormalGameScript] [nvarchar](100) NULL,
	[HardGameScript] [nvarchar](100) NULL,
	[TerrorGameScript] [nvarchar](100) NULL,
	[Ordering] [int] NOT NULL,
	[AdviceTips] [nvarchar](100) NULL,
 CONSTRAINT [PK_PveInfo] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quest]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quest](
	[ID] [int] NOT NULL,
	[QuestID] [int] NOT NULL,
	[Title] [nvarchar](300) NULL,
	[Detail] [nvarchar](1500) NULL,
	[Objective] [nvarchar](50) NULL,
	[NeedMinLevel] [int] NOT NULL,
	[NeedMaxLevel] [int] NOT NULL,
	[PreQuestID] [nvarchar](40) NOT NULL,
	[NextQuestID] [nvarchar](40) NOT NULL,
	[IsOther] [int] NOT NULL,
	[CanRepeat] [bit] NOT NULL,
	[RepeatInterval] [int] NOT NULL,
	[RepeatMax] [int] NOT NULL,
	[RewardGP] [int] NOT NULL,
	[RewardGold] [int] NOT NULL,
	[RewardGiftToken] [int] NOT NULL,
	[RewardOffer] [int] NOT NULL,
	[RewardRiches] [int] NOT NULL,
	[RewardBuffID] [int] NOT NULL,
	[RewardBuffDate] [int] NOT NULL,
	[RewardMoney] [int] NOT NULL,
	[Rands] [numeric](18, 2) NOT NULL,
	[RandDouble] [int] NOT NULL,
	[TimeMode] [bit] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quest_Condiction]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quest_Condiction](
	[QuestID] [int] NOT NULL,
	[CondictionID] [int] NOT NULL,
	[CondictionType] [int] NOT NULL,
	[CondictionTitle] [nvarchar](200) NOT NULL,
	[Para1] [int] NOT NULL,
	[Para2] [int] NOT NULL,
 CONSTRAINT [PK_Quest_Condiction] PRIMARY KEY CLUSTERED
(
	[QuestID] ASC,
	[CondictionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quest_Goods]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quest_Goods](
	[QuestID] [int] NOT NULL,
	[RewardItemID] [int] NOT NULL,
	[IsSelect] [bit] NOT NULL,
	[RewardItemValid] [int] NOT NULL,
	[RewardItemCount] [int] NOT NULL,
	[StrengthenLevel] [int] NOT NULL,
	[AttackCompose] [int] NOT NULL,
	[DefendCompose] [int] NOT NULL,
	[AgilityCompose] [int] NOT NULL,
	[LuckCompose] [int] NOT NULL,
	[IsCount] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestData]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestData](
	[UserID] [int] NOT NULL,
	[QuestID] [int] NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[CompletedDate] [datetime] NULL,
	[Condition1] [int] NOT NULL,
	[Condition2] [int] NOT NULL,
	[Condition3] [int] NOT NULL,
	[Condition4] [int] NOT NULL,
	[IsExist] [bit] NOT NULL,
	[RepeatFinish] [int] NOT NULL,
	[RandDobule] [int] NOT NULL,
 CONSTRAINT [PK_QuestData] PRIMARY KEY NONCLUSTERED
(
	[UserID] ASC,
	[QuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[ServerID] [int] NOT NULL,
	[Rate] [decimal](6, 2) NOT NULL,
	[BeginDay] [datetime] NOT NULL,
	[EndDay] [datetime] NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Type] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rename_Consortia]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rename_Consortia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConsortiaID] [int] NOT NULL,
	[ConsortiaName] [nvarchar](200) NOT NULL,
	[NickName] [nvarchar](200) NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_Rename_Consortia] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rename_Nick]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rename_Nick](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[NickName] [nvarchar](200) NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsExist] [bit] NOT NULL,
	[OldNickName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Rename_Nick] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Server_Config]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Server_Config](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_Server_Config] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Server_List]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Server_List](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IP] [nvarchar](50) NULL,
	[Port] [int] NULL,
	[State] [int] NOT NULL,
	[Online] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[Room] [int] NOT NULL,
	[Remark] [nvarchar](200) NULL,
	[RSA] [nvarchar](1000) NULL,
	[MustLevel] [int] NOT NULL,
	[LowestLevel] [int] NOT NULL,
	[NewerServer] [bit] NOT NULL,
 CONSTRAINT [PK_Server_List] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] NOT NULL,
	[ShopID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[BuyType] [int] NOT NULL,
	[Sort] [int] NOT NULL,
	[IsBind] [int] NOT NULL,
	[IsVouch] [int] NOT NULL,
	[Label] [int] NOT NULL,
	[Beat] [numeric](18, 2) NOT NULL,
	[AUnit] [int] NOT NULL,
	[APrice1] [int] NOT NULL,
	[AValue1] [int] NOT NULL,
	[APrice2] [int] NOT NULL,
	[AValue2] [int] NOT NULL,
	[APrice3] [int] NOT NULL,
	[AValue3] [int] NOT NULL,
	[BUnit] [int] NOT NULL,
	[BPrice1] [int] NOT NULL,
	[BValue1] [int] NOT NULL,
	[BPrice2] [int] NOT NULL,
	[BValue2] [int] NOT NULL,
	[BPrice3] [int] NOT NULL,
	[BValue3] [int] NOT NULL,
	[CUnit] [int] NOT NULL,
	[CPrice1] [int] NOT NULL,
	[CValue1] [int] NOT NULL,
	[CPrice2] [int] NOT NULL,
	[CValue2] [int] NOT NULL,
	[CPrice3] [int] NOT NULL,
	[CValue3] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop_Goods]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop_Goods](
	[TemplateID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Remark] [nvarchar](200) NULL,
	[CategoryID] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Attack] [int] NOT NULL,
	[Defence] [int] NOT NULL,
	[Agility] [int] NOT NULL,
	[Luck] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[Quality] [int] NOT NULL,
	[Pic] [nvarchar](200) NULL,
	[MaxCount] [int] NOT NULL,
	[NeedSex] [int] NOT NULL,
	[NeedLevel] [int] NOT NULL,
	[CanStrengthen] [bit] NOT NULL,
	[CanCompose] [bit] NOT NULL,
	[CanDrop] [bit] NOT NULL,
	[CanEquip] [bit] NOT NULL,
	[CanUse] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[Script] [nvarchar](200) NULL,
	[Data] [nvarchar](1000) NULL,
	[Colors] [nvarchar](1000) NULL,
	[Property1] [int] NOT NULL,
	[Property2] [int] NOT NULL,
	[Property3] [int] NOT NULL,
	[Property4] [int] NOT NULL,
	[Property5] [int] NOT NULL,
	[Property6] [int] NOT NULL,
	[Property7] [int] NOT NULL,
	[Property8] [int] NOT NULL,
	[Valid] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[AddTime] [datetime] NULL,
	[BindType] [int] NOT NULL,
	[FusionType] [int] NOT NULL,
	[FusionRate] [int] NOT NULL,
	[FusionNeedRate] [int] NOT NULL,
	[Hole] [nvarchar](50) NULL,
	[RefineryLevel] [int] NOT NULL,
 CONSTRAINT [PK_Goods_Shop] PRIMARY KEY CLUSTERED
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop_Goods_Box]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop_Goods_Box](
	[Id] [int] NOT NULL,
	[DataId] [int] NOT NULL,
	[TemplateId] [int] NOT NULL,
	[IsSelect] [bit] NOT NULL,
	[IsBind] [bit] NOT NULL,
	[ItemValid] [int] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[StrengthenLevel] [int] NOT NULL,
	[AttackCompose] [int] NOT NULL,
	[DefendCompose] [int] NOT NULL,
	[AgilityCompose] [int] NOT NULL,
	[LuckCompose] [int] NOT NULL,
	[Random] [int] NOT NULL,
	[IsTips] [bit] NOT NULL,
	[IsLogs] [bit] NOT NULL,
 CONSTRAINT [PK_Shop_Goods_Box] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop_Goods_Categorys]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop_Goods_Categorys](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Place] [int] NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_TABLE1] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Users_Goods]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Users_Goods](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BagType] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Place] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[IsJudge] [bit] NOT NULL,
	[Color] [nvarchar](50) NULL,
	[IsExist] [bit] NOT NULL,
	[StrengthenLevel] [int] NOT NULL,
	[AttackCompose] [int] NOT NULL,
	[DefendCompose] [int] NOT NULL,
	[LuckCompose] [int] NOT NULL,
	[AgilityCompose] [int] NOT NULL,
	[Skin] [nvarchar](50) NOT NULL,
	[IsBinds] [bit] NOT NULL,
	[IsUsed] [bit] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[ValidDate] [int] NOT NULL,
	[RemoveDate] [datetime] NOT NULL,
	[RemoveType] [int] NOT NULL,
	[Hole1] [int] NOT NULL,
	[Hole2] [int] NOT NULL,
	[Hole3] [int] NOT NULL,
	[Hole4] [int] NOT NULL,
	[Hole5] [int] NOT NULL,
	[Hole6] [int] NOT NULL,
	[StrengthenRefineryLevel] [int] NOT NULL,
 CONSTRAINT [PK_Sys_Users_Goods] PRIMARY KEY CLUSTERED
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Users_Reincarnation]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Users_Reincarnation](
	[UserID] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Buff]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Buff](
	[UserID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[ValidDate] [int] NOT NULL,
	[Data] [nvarchar](200) NULL,
	[IsExist] [bit] NOT NULL,
 CONSTRAINT [PK_User_Buff] PRIMARY KEY CLUSTERED
(
	[UserID] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Messages]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Messages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NOT NULL,
	[Sender] [nvarchar](50) NULL,
	[ReceiverID] [int] NOT NULL,
	[Receiver] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[Content] [nvarchar](2000) NULL,
	[SendTime] [datetime] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[IsDelR] [bit] NOT NULL,
	[IfDelS] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[Annex1] [nvarchar](50) NULL,
	[Annex2] [nvarchar](50) NULL,
	[Gold] [int] NOT NULL,
	[Money] [int] NOT NULL,
	[IsExist] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[Remark] [nvarchar](200) NULL,
	[ValidDate] [int] NOT NULL,
	[Annex1Name] [nvarchar](50) NULL,
	[Annex2Name] [nvarchar](50) NULL,
	[SendDate] [datetime] NOT NULL,
	[Annex3] [nvarchar](50) NULL,
	[Annex4] [nvarchar](50) NULL,
	[Annex5] [nvarchar](50) NULL,
	[Annex3Name] [nvarchar](50) NULL,
	[Annex4Name] [nvarchar](50) NULL,
	[Annex5Name] [nvarchar](50) NULL,
	[AnnexRemark] [nvarchar](200) NULL,
	[GiftToken] [int] NOT NULL,
 CONSTRAINT [PK_User_Messages] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Charge_Money]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Charge_Money] ON [dbo].[Charge_Money]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Consortia]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia] ON [dbo].[Consortia]
(
	[ConsortiaName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Ally]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Ally] ON [dbo].[Consortia_Ally]
(
	[Consortia1ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Ally_1]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Ally_1] ON [dbo].[Consortia_Ally]
(
	[Consortia2ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Apply_Ally]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Apply_Ally] ON [dbo].[Consortia_Apply_Ally]
(
	[Consortia1ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Apply_Ally_1]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Apply_Ally_1] ON [dbo].[Consortia_Apply_Ally]
(
	[Consortia2ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Apply_Users]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Apply_Users] ON [dbo].[Consortia_Apply_Users]
(
	[ConsortiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Apply_Users_1]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Apply_Users_1] ON [dbo].[Consortia_Apply_Users]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Duty]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Duty] ON [dbo].[Consortia_Duty]
(
	[ConsortiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Event]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Event] ON [dbo].[Consortia_Event]
(
	[ConsortiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Invite_Users]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Invite_Users] ON [dbo].[Consortia_Invite_Users]
(
	[ConsortiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Invite_Users_1]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Invite_Users_1] ON [dbo].[Consortia_Invite_Users]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Users]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Users] ON [dbo].[Consortia_Users]
(
	[ConsortiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Consortia_Users_1]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Consortia_Users_1] ON [dbo].[Consortia_Users]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Rename_Consortia]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Rename_Consortia] ON [dbo].[Rename_Consortia]
(
	[ConsortiaName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Rename_Nick]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Rename_Nick] ON [dbo].[Rename_Nick]
(
	[NickName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_Users_Detail_2]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_Users_Detail_2] ON [dbo].[Sys_Users_Detail]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sys_Users_Detail_NickName]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_Users_Detail_NickName] ON [dbo].[Sys_Users_Detail]
(
	[NickName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sys_Users_Detail_UserName]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_Users_Detail_UserName] ON [dbo].[Sys_Users_Detail]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_Users_Friends]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_Users_Friends] ON [dbo].[Sys_Users_Friends]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_Users_Friends_1]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_Users_Friends_1] ON [dbo].[Sys_Users_Friends]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_Users_Goods]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_Users_Goods] ON [dbo].[Sys_Users_Goods]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Messages]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_User_Messages] ON [dbo].[User_Messages]
(
	[ReceiverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Messages_1]    Script Date: 2022/5/24 14:05:20 ******/
CREATE NONCLUSTERED INDEX [IX_User_Messages_1] ON [dbo].[User_Messages]
(
	[SenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
-- TODO 没有完成，默认值部分
ALTER TABLE [dbo].[Active] ADD  CONSTRAINT [DF_Active_HasKey]  DEFAULT (0) FOR [HasKey]
GO
ALTER TABLE [dbo].[Active] ADD  CONSTRAINT [DF_Active_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Active] ADD  CONSTRAINT [DF_Active_IsOnly]  DEFAULT (0) FOR [IsOnly]
GO
ALTER TABLE [dbo].[Active] ADD  CONSTRAINT [DF_Active_Type]  DEFAULT (0) FOR [Type]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_Count]  DEFAULT (1) FOR [Count]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_ValidDate]  DEFAULT (0) FOR [ValidDate]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_StrengthenLevel]  DEFAULT (0) FOR [StrengthenLevel]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_AttackCompose]  DEFAULT (0) FOR [AttackCompose]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_DefendCompose]  DEFAULT (0) FOR [DefendCompose]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_LuckCompose]  DEFAULT (0) FOR [LuckCompose]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_AgilityCompose]  DEFAULT (0) FOR [AgilityCompose]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_Gold]  DEFAULT (0) FOR [Gold]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_Money]  DEFAULT (0) FOR [Money]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_Sex]  DEFAULT (0) FOR [Sex]
GO
ALTER TABLE [dbo].[Active_Award] ADD  CONSTRAINT [DF_Active_Award_Mark]  DEFAULT (0) FOR [Mark]
GO
ALTER TABLE [dbo].[Active_Number] ADD  CONSTRAINT [DF_Active_Number_PullDown]  DEFAULT (0) FOR [PullDown]
GO
ALTER TABLE [dbo].[Active_Number] ADD  CONSTRAINT [DF_Active_Number_GetDate]  DEFAULT (getdate()) FOR [GetDate]
GO
ALTER TABLE [dbo].[Active_Number] ADD  CONSTRAINT [DF_Active_Number_UserID]  DEFAULT (0) FOR [UserID]
GO
ALTER TABLE [dbo].[Active_Number] ADD  CONSTRAINT [DF_Active_Number_Mark]  DEFAULT (0) FOR [Mark]
GO
ALTER TABLE [dbo].[Auction] ADD  CONSTRAINT [DF_Auction_TemplateID]  DEFAULT (0) FOR [TemplateID]
GO
ALTER TABLE [dbo].[Auction] ADD  CONSTRAINT [DF_Auction_Random]  DEFAULT (0) FOR [Random]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_Sex]  DEFAULT (2) FOR [Sex]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_Count]  DEFAULT (1) FOR [Count]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_ValidDate]  DEFAULT (0) FOR [ValidDate]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_StrengthenLevel]  DEFAULT (0) FOR [StrengthenLevel]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_AttackCompose]  DEFAULT (0) FOR [AttackCompose]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_DefendCompose]  DEFAULT (0) FOR [DefendCompose]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_LuckCompose]  DEFAULT (0) FOR [LuckCompose]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_AgilityCompose]  DEFAULT (0) FOR [AgilityCompose]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_IsBinds]  DEFAULT (0) FOR [IsBinds]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_BagType]  DEFAULT ((-1)) FOR [BagType]
GO
ALTER TABLE [dbo].[Bag_Init] ADD  CONSTRAINT [DF_Bag_Init_place]  DEFAULT ((-1)) FOR [place]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_Power]  DEFAULT (1) FOR [Power]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_Radii]  DEFAULT (100) FOR [Radii]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_IsSpin]  DEFAULT (0) FOR [IsSpin]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_Mass]  DEFAULT (0) FOR [Mass]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_SpinVA]  DEFAULT (1) FOR [SpinVA]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_SpinV]  DEFAULT (1000) FOR [SpinV]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_Amount]  DEFAULT (1) FOR [Amount]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_Wind]  DEFAULT (1) FOR [Wind]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_DragIndex]  DEFAULT (1) FOR [DragIndex]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_weight]  DEFAULT (1) FOR [Weight]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_Shake]  DEFAULT (0) FOR [Shake]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_Delay]  DEFAULT (0) FOR [Delay]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_ActionType]  DEFAULT (0) FOR [ActionType]
GO
ALTER TABLE [dbo].[Ball] ADD  CONSTRAINT [DF_Ball_HasTunnel]  DEFAULT (1) FOR [HasTunnel]
GO
ALTER TABLE [dbo].[Charge_Money] ADD  CONSTRAINT [DF_Charge_Money_PayWay]  DEFAULT (0) FOR [PayWay]
GO
ALTER TABLE [dbo].[Charge_Money] ADD  CONSTRAINT [DF_Charge_Money_NeedMoney]  DEFAULT (0) FOR [NeedMoney]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_Repute]  DEFAULT (999999999) FOR [Repute]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_Count]  DEFAULT (0) FOR [Count]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_Riches]  DEFAULT (0) FOR [Riches]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_DeductDate]  DEFAULT (getdate()) FOR [DeductDate]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_WarnDate]  DEFAULT (getdate()) FOR [WarnDate]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_LastDayRiches]  DEFAULT (0) FOR [LastDayRiches]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_LastAddRiches]  DEFAULT (0) FOR [AddDayRiches]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_LastWeekRiches]  DEFAULT (0) FOR [LastWeekRiches]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_AddWeekRiches]  DEFAULT (0) FOR [AddWeekRiches]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_LastDayHonor]  DEFAULT (0) FOR [LastDayHonor]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_AddDayHonor]  DEFAULT (0) FOR [AddDayHonor]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_LastWeekHonor]  DEFAULT (0) FOR [LastWeekHonor]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_AddWeekHonor]  DEFAULT (0) FOR [AddWeekHonor]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_OpenApply]  DEFAULT (1) FOR [OpenApply]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_StoreLevel]  DEFAULT (0) FOR [StoreLevel]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_SmithLevel]  DEFAULT (0) FOR [SmithLevel]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_ShopLevel]  DEFAULT (0) FOR [ShopLevel]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_Rename]  DEFAULT (0) FOR [Rename]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_KickDate]  DEFAULT (2009 - 1 - 1) FOR [KickDate]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_KickCount]  DEFAULT (0) FOR [KickCount]
GO
ALTER TABLE [dbo].[Consortia] ADD  CONSTRAINT [DF_Consortia_FightPower]  DEFAULT (0) FOR [FightPower]
GO
ALTER TABLE [dbo].[Consortia_Ally] ADD  CONSTRAINT [DF_Consortia_Ally_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Consortia_Apply_Ally] ADD  CONSTRAINT [DF_Consortia_Apply_Ally_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Consortia_Apply_Ally] ADD  CONSTRAINT [DF_Consortia_Apply_Ally_State]  DEFAULT (0) FOR [State]
GO
ALTER TABLE [dbo].[Consortia_Duty] ADD  CONSTRAINT [DF_Consortia_Duty_Right]  DEFAULT (0) FOR [Right]
GO
ALTER TABLE [dbo].[Consortia_Event] ADD  CONSTRAINT [DF_Consortia_Event_Type]  DEFAULT (0) FOR [Type]
GO
ALTER TABLE [dbo].[Consortia_Level] ADD  CONSTRAINT [DF_Consortia_Level_StoreRiches]  DEFAULT (100) FOR [StoreRiches]
GO
ALTER TABLE [dbo].[Consortia_Level] ADD  CONSTRAINT [DF_Consortia_Level_SmithRiches]  DEFAULT (100) FOR [SmithRiches]
GO
ALTER TABLE [dbo].[Consortia_Level] ADD  CONSTRAINT [DF_Consortia_Level_ShopRiches]  DEFAULT (100) FOR [ShopRiches]
GO
ALTER TABLE [dbo].[Consortia_Level] ADD  CONSTRAINT [DF_Consortia_Level_KickCount]  DEFAULT (10) FOR [KickMax]
GO
ALTER TABLE [dbo].[Consortia_Users] ADD  CONSTRAINT [DF_Consortia_Users_IsBanChat]  DEFAULT (0) FOR [IsBanChat]
GO
ALTER TABLE [dbo].[Daily_Award] ADD  CONSTRAINT [DF_Daily_Award_Sex]  DEFAULT (0) FOR [Sex]
GO
ALTER TABLE [dbo].[Daily_Award] ADD  CONSTRAINT [DF_Daily_Award_GetWay]  DEFAULT (0) FOR [GetWay]
GO
ALTER TABLE [dbo].[Drop_Item] ADD  CONSTRAINT [DF_Drop_Item_Id]  DEFAULT (0) FOR [Id]
GO
ALTER TABLE [dbo].[Drop_Item] ADD  CONSTRAINT [DF_Drop_Item_DropId]  DEFAULT (0) FOR [DropId]
GO
ALTER TABLE [dbo].[Drop_Item] ADD  CONSTRAINT [DF_Drop_Item_ItemId]  DEFAULT (0) FOR [ItemId]
GO
ALTER TABLE [dbo].[Drop_Item] ADD  CONSTRAINT [DF_Drop_Item_ValueDate]  DEFAULT (0) FOR [ValueDate]
GO
ALTER TABLE [dbo].[Drop_Item] ADD  CONSTRAINT [DF_Drop_Item_Random]  DEFAULT (0) FOR [Random]
GO
ALTER TABLE [dbo].[Drop_Item] ADD  CONSTRAINT [DF_Drop_Item_BeginData]  DEFAULT (0) FOR [BeginData]
GO
ALTER TABLE [dbo].[Drop_Item] ADD  CONSTRAINT [DF_Drop_Item_EndData]  DEFAULT (0) FOR [EndData]
GO
ALTER TABLE [dbo].[Drop_Item] ADD  CONSTRAINT [DF_Drop_Item_IsTips]  DEFAULT (0) FOR [IsTips]
GO
ALTER TABLE [dbo].[Drop_Item] ADD  CONSTRAINT [DF_Drop_Item_IsLogs]  DEFAULT (0) FOR [IsLogs]
GO
ALTER TABLE [dbo].[Fight_Rate] ADD  CONSTRAINT [DF_Fight_Change_Rate_ServerID]  DEFAULT (0) FOR [ServerID]
GO
ALTER TABLE [dbo].[Fight_Rate] ADD  CONSTRAINT [DF_Fight_Change_Rate_Rate]  DEFAULT (0) FOR [Rate]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item1]  DEFAULT (0) FOR [Item1]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item2]  DEFAULT (0) FOR [Item2]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item3]  DEFAULT (0) FOR [Item3]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item4]  DEFAULT (0) FOR [Item4]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item5]  DEFAULT (0) FOR [Item5]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item6]  DEFAULT (0) FOR [Item6]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item7]  DEFAULT (0) FOR [Item7]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item8]  DEFAULT (0) FOR [Item8]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item9]  DEFAULT (0) FOR [Item9]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Item10]  DEFAULT (0) FOR [Item10]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Reward1]  DEFAULT (0) FOR [Reward1]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Random1]  DEFAULT (0) FOR [Random1]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Reward2]  DEFAULT (0) FOR [Reward2]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Random2]  DEFAULT (0) FOR [Random2]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Reward3]  DEFAULT (0) FOR [Reward3]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Random3]  DEFAULT (0) FOR [Random3]
GO
ALTER TABLE [dbo].[Fusion] ADD  CONSTRAINT [DF_Fusion_Leave]  DEFAULT (0) FOR [Leave]
GO
ALTER TABLE [dbo].[Game_Map] ADD  CONSTRAINT [DF_Game_Map_ForegroundWidth]  DEFAULT (0) FOR [ForegroundWidth]
GO
ALTER TABLE [dbo].[Game_Map] ADD  CONSTRAINT [DF_Game_Map_ForegroundHeight]  DEFAULT (0) FOR [ForegroundHeight]
GO
ALTER TABLE [dbo].[Game_Map] ADD  CONSTRAINT [DF_Game_Map_BackroundWidht]  DEFAULT (0) FOR [BackroundWidht]
GO
ALTER TABLE [dbo].[Game_Map] ADD  CONSTRAINT [DF_Game_Map_BackroundHeight]  DEFAULT (0) FOR [BackroundHeight]
GO
ALTER TABLE [dbo].[Game_Map] ADD  CONSTRAINT [DF_Game_Map_DeadWidth]  DEFAULT (0) FOR [DeadWidth]
GO
ALTER TABLE [dbo].[Game_Map] ADD  CONSTRAINT [DF_Game_Map_DeadHeight]  DEFAULT (0) FOR [DeadHeight]
GO
ALTER TABLE [dbo].[Game_Map] ADD  CONSTRAINT [DF_Game_Map_Weight]  DEFAULT (0) FOR [Weight]
GO
ALTER TABLE [dbo].[Game_Map] ADD  CONSTRAINT [DF_Game_Map_Wind]  DEFAULT (0) FOR [DragIndex]
GO
ALTER TABLE [dbo].[Game_Map] ADD  CONSTRAINT [DF_Game_Map_type]  DEFAULT (1) FOR [Type]
GO
ALTER TABLE [dbo].[Item_Fusion] ADD  CONSTRAINT [DF_Item_Fusion_Item1]  DEFAULT (0) FOR [Item1]
GO
ALTER TABLE [dbo].[Item_Fusion] ADD  CONSTRAINT [DF_Item_Fusion_Item2]  DEFAULT (0) FOR [Item2]
GO
ALTER TABLE [dbo].[Item_Fusion] ADD  CONSTRAINT [DF_Item_Fusion_Item3]  DEFAULT (0) FOR [Item3]
GO
ALTER TABLE [dbo].[Item_Fusion] ADD  CONSTRAINT [DF_Item_Fusion_Item4]  DEFAULT (0) FOR [Item4]
GO
ALTER TABLE [dbo].[Item_Fusion] ADD  CONSTRAINT [DF_Item_Fusion_Formula]  DEFAULT (0) FOR [Formula]
GO
ALTER TABLE [dbo].[Item_Fusion] ADD  CONSTRAINT [DF_Item_Fusion_Reward]  DEFAULT (0) FOR [Reward]
GO
ALTER TABLE [dbo].[Item_Strengthen_Goods] ADD  CONSTRAINT [DF_Item_Strengthen_Goods_OrginEquip]  DEFAULT (7015) FOR [OrginEquip]
GO
ALTER TABLE [dbo].[Marry_Apply] ADD  CONSTRAINT [DF_Marry_Apply_isExist]  DEFAULT (1) FOR [isExist]
GO
ALTER TABLE [dbo].[Marry_Apply] ADD  CONSTRAINT [DF_Marry_Apply_isDeal]  DEFAULT (0) FOR [isDeal]
GO
ALTER TABLE [dbo].[Marry_Apply] ADD  DEFAULT (getdate()) FOR [ApplyDate]
GO
ALTER TABLE [dbo].[Marry_Info] ADD  CONSTRAINT [DF_Marry_Info_IsExist]  DEFAULT (1) FOR [IsExist]
GO
ALTER TABLE [dbo].[Marry_Room_Info] ADD  CONSTRAINT [DF_Marry_Room_Info_isExist]  DEFAULT (1) FOR [isExist]
GO
ALTER TABLE [dbo].[Marry_Room_Info] ADD  CONSTRAINT [DF_Marry_Room_Info_IsGunsaluteUsed]  DEFAULT (0) FOR [IsGunsaluteUsed]
GO
ALTER TABLE [dbo].[NPC_Info] ADD  CONSTRAINT [DF_NPC_Info_FireX]  DEFAULT (0) FOR [FireX]
GO
ALTER TABLE [dbo].[NPC_Info] ADD  CONSTRAINT [DF_NPC_Info_FireY]  DEFAULT (0) FOR [FireY]
GO
ALTER TABLE [dbo].[NPC_Info] ADD  CONSTRAINT [DF_NPC_Info_DropId]  DEFAULT (0) FOR [DropId]
GO
ALTER TABLE [dbo].[Pve_Info] ADD  CONSTRAINT [DF_Pve_Info_Ordering]  DEFAULT (0) FOR [Ordering]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_NeedMinLevel]  DEFAULT (0) FOR [NeedMinLevel]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_NeedMaxLevel]  DEFAULT (0) FOR [NeedMaxLevel]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_IsOthre]  DEFAULT (0) FOR [IsOther]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_CanRepeat]  DEFAULT (0) FOR [CanRepeat]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RepeatInterval]  DEFAULT (0) FOR [RepeatInterval]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RepeatMax]  DEFAULT (0) FOR [RepeatMax]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RewardGP]  DEFAULT (0) FOR [RewardGP]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RewardGold]  DEFAULT (0) FOR [RewardGold]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RewardGiftToken]  DEFAULT (0) FOR [RewardGiftToken]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RewardOffer]  DEFAULT (0) FOR [RewardOffer]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RewardRiches]  DEFAULT (0) FOR [RewardRiches]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RewardBuffID]  DEFAULT (0) FOR [RewardBuffID]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RewardBuffDate]  DEFAULT (0) FOR [RewardBuffDate]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RewardMoney]  DEFAULT (0) FOR [RewardMoney]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_Rands]  DEFAULT (1) FOR [Rands]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_RandDouble]  DEFAULT (1) FOR [RandDouble]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_TimeMode]  DEFAULT (1) FOR [TimeMode]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Quest] ADD  CONSTRAINT [DF_Quest_EndDate]  DEFAULT (getdate()) FOR [EndDate]
GO
ALTER TABLE [dbo].[Quest_Condiction] ADD  CONSTRAINT [DF_Quest_Condiction_Para1]  DEFAULT (0) FOR [Para1]
GO
ALTER TABLE [dbo].[Quest_Condiction] ADD  CONSTRAINT [DF_Quest_Condiction_Para2]  DEFAULT (0) FOR [Para2]
GO
ALTER TABLE [dbo].[Quest_Goods] ADD  CONSTRAINT [DF_Quest_Goods_RewardItemID]  DEFAULT (0) FOR [RewardItemID]
GO
ALTER TABLE [dbo].[Quest_Goods] ADD  CONSTRAINT [DF_Quest_Goods_IsSelect]  DEFAULT (0) FOR [IsSelect]
GO
ALTER TABLE [dbo].[Quest_Goods] ADD  CONSTRAINT [DF_Quest_Goods_RewardItemCount]  DEFAULT (0) FOR [RewardItemCount]
GO
ALTER TABLE [dbo].[Quest_Goods] ADD  CONSTRAINT [DF_Quest_Goods_StrengthenLevel]  DEFAULT (0) FOR [StrengthenLevel]
GO
ALTER TABLE [dbo].[Quest_Goods] ADD  CONSTRAINT [DF_Quest_Goods_AttackCompose]  DEFAULT (0) FOR [AttackCompose]
GO
ALTER TABLE [dbo].[Quest_Goods] ADD  CONSTRAINT [DF_Quest_Goods_DefendCompose]  DEFAULT (0) FOR [DefendCompose]
GO
ALTER TABLE [dbo].[Quest_Goods] ADD  CONSTRAINT [DF_Quest_Goods_AgilityCompose]  DEFAULT (0) FOR [AgilityCompose]
GO
ALTER TABLE [dbo].[Quest_Goods] ADD  CONSTRAINT [DF_Quest_Goods_LuckCompose]  DEFAULT (0) FOR [LuckCompose]
GO
ALTER TABLE [dbo].[Quest_Goods] ADD  CONSTRAINT [DF_Quest_Goods_IsCount]  DEFAULT (0) FOR [IsCount]
GO
ALTER TABLE [dbo].[QuestData] ADD  CONSTRAINT [DF_QuestData_Condition1]  DEFAULT (0) FOR [Condition1]
GO
ALTER TABLE [dbo].[QuestData] ADD  CONSTRAINT [DF_QuestData_Condition2]  DEFAULT (0) FOR [Condition2]
GO
ALTER TABLE [dbo].[QuestData] ADD  CONSTRAINT [DF_QuestData_Condition3]  DEFAULT (0) FOR [Condition3]
GO
ALTER TABLE [dbo].[QuestData] ADD  CONSTRAINT [DF_QuestData_Condition4]  DEFAULT (0) FOR [Condition4]
GO
ALTER TABLE [dbo].[QuestData] ADD  CONSTRAINT [DF_QuestData_IsExist]  DEFAULT (1) FOR [IsExist]
GO
ALTER TABLE [dbo].[QuestData] ADD  CONSTRAINT [DF_QuestData_RepeatFinish]  DEFAULT (0) FOR [RepeatFinish]
GO
ALTER TABLE [dbo].[QuestData] ADD  CONSTRAINT [DF_QuestData_RandDobule]  DEFAULT (1) FOR [RandDobule]
GO
ALTER TABLE [dbo].[Rate] ADD  CONSTRAINT [DF_Experience_Rate_Type]  DEFAULT (0) FOR [Type]
GO
ALTER TABLE [dbo].[Server_List] ADD  CONSTRAINT [DF_Server_List_Port]  DEFAULT (0) FOR [Port]
GO
ALTER TABLE [dbo].[Server_List] ADD  CONSTRAINT [DF_Server_List_State]  DEFAULT (0) FOR [State]
GO
ALTER TABLE [dbo].[Server_List] ADD  CONSTRAINT [DF_Server_List_Online]  DEFAULT (0) FOR [Online]
GO
ALTER TABLE [dbo].[Server_List] ADD  CONSTRAINT [DF_Server_List_Total]  DEFAULT (1000) FOR [Total]
GO
ALTER TABLE [dbo].[Server_List] ADD  CONSTRAINT [DF_Server_List_Room]  DEFAULT (200) FOR [Room]
GO
ALTER TABLE [dbo].[Server_List] ADD  CONSTRAINT [DF_Server_List_MustLevel]  DEFAULT (0) FOR [MustLevel]
GO
ALTER TABLE [dbo].[Server_List] ADD  CONSTRAINT [DF__Server_Li__Lowes__55167929]  DEFAULT (0) FOR [LowestLevel]
GO
ALTER TABLE [dbo].[Server_List] ADD  CONSTRAINT [DF_Server_List_NewerServer]  DEFAULT (0) FOR [NewerServer]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_TogetherType]  DEFAULT (0) FOR [GroupID]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_BuyType]  DEFAULT (0) FOR [BuyType]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_Sort]  DEFAULT (0) FOR [Sort]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_IsBind]  DEFAULT (0) FOR [IsBind]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_IsVouch]  DEFAULT (0) FOR [IsVouch]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_Label]  DEFAULT (1) FOR [Label]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_Beat]  DEFAULT (1) FOR [Beat]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_AUnit]  DEFAULT (1) FOR [AUnit]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_APrice1]  DEFAULT ((-1)) FOR [APrice1]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_AValue1]  DEFAULT (0) FOR [AValue1]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_APrice2]  DEFAULT ((-1)) FOR [APrice2]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_AValue2]  DEFAULT (0) FOR [AValue2]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_APrice3]  DEFAULT ((-1)) FOR [APrice3]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_AValue3]  DEFAULT (0) FOR [AValue3]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_BUnit]  DEFAULT (1) FOR [BUnit]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_BPrice1]  DEFAULT ((-1)) FOR [BPrice1]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_BValue1]  DEFAULT (0) FOR [BValue1]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_BPrice2]  DEFAULT ((-1)) FOR [BPrice2]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_BValue2]  DEFAULT (0) FOR [BValue2]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_BPrice3]  DEFAULT ((-1)) FOR [BPrice3]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_BValue3]  DEFAULT (0) FOR [BValue3]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_CUnit]  DEFAULT (1) FOR [CUnit]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_CPrice1]  DEFAULT ((-1)) FOR [CPrice1]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_CValue1]  DEFAULT (0) FOR [CValue1]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_CPrice2]  DEFAULT ((-1)) FOR [CPrice2]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_CValue2]  DEFAULT (0) FOR [CValue2]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_CPrice3]  DEFAULT ((-1)) FOR [CPrice3]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_CValue3]  DEFAULT (0) FOR [CValue3]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Goods_Shop_Attack]  DEFAULT (10) FOR [Attack]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Goods_Shop_Recovery]  DEFAULT (10) FOR [Defence]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Goods_Shop_Celerity]  DEFAULT (10) FOR [Agility]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Goods_Shop_Energy]  DEFAULT (10) FOR [Luck]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Goods_Shop_Grade]  DEFAULT (10) FOR [Level]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Tone]  DEFAULT (1) FOR [Quality]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_LimitCount]  DEFAULT (1) FOR [MaxCount]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Sex]  DEFAULT (2) FOR [NeedSex]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_NeedLevel]  DEFAULT (0) FOR [NeedLevel]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_CanStrengthen]  DEFAULT (1) FOR [CanStrengthen]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_CanCompound]  DEFAULT (1) FOR [CanCompose]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_IsDrop]  DEFAULT (1) FOR [CanDrop]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_IsEquip]  DEFAULT (1) FOR [CanEquip]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_IsUse]  DEFAULT (1) FOR [CanUse]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_IsDelete]  DEFAULT (1) FOR [CanDelete]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Property1]  DEFAULT (0) FOR [Property1]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Property2]  DEFAULT (0) FOR [Property2]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Property3]  DEFAULT (0) FOR [Property3]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Property4]  DEFAULT (0) FOR [Property4]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Property5]  DEFAULT (0) FOR [Property5]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Property6]  DEFAULT (0) FOR [Property6]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Property7]  DEFAULT (0) FOR [Property7]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Property8]  DEFAULT (0) FOR [Property8]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Valid]  DEFAULT (1) FOR [Valid]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Count]  DEFAULT (0) FOR [Count]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Goods_Shop_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_BindType]  DEFAULT (0) FOR [BindType]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_FusionType]  DEFAULT (0) FOR [FusionType]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_FusionRate]  DEFAULT (0) FOR [FusionRate]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_FusionNeedRate]  DEFAULT (0) FOR [FusionNeedRate]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_Hole]  DEFAULT (N'3,1|6,2|0,-1|0,-1|0,-1|0,-1') FOR [Hole]
GO
ALTER TABLE [dbo].[Shop_Goods] ADD  CONSTRAINT [DF_Shop_Goods_RefineryLevel]  DEFAULT (0) FOR [RefineryLevel]
GO
ALTER TABLE [dbo].[Shop_Goods_Box] ADD  CONSTRAINT [DF_Shop_Goods_Box_IsTips]  DEFAULT (0) FOR [IsTips]
GO
ALTER TABLE [dbo].[Shop_Goods_Box] ADD  CONSTRAINT [DF_Shop_Goods_Box_IsLogs]  DEFAULT (0) FOR [IsLogs]
GO
ALTER TABLE [dbo].[Shop_Goods_Categorys] ADD  CONSTRAINT [DF_Shop_Goods_Categorys_Place]  DEFAULT (0) FOR [Place]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_IsConsortia]  DEFAULT ((0)) FOR [IsConsortia]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_ConsortiaID]  DEFAULT ((0)) FOR [ConsortiaID]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Sex]  DEFAULT ((1)) FOR [Sex]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Win]  DEFAULT ((0)) FOR [Win]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Escape]  DEFAULT ((0)) FOR [Escape]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_GP]  DEFAULT ((0)) FOR [GP]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Gold]  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Money]  DEFAULT ((0)) FOR [Money]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Stype]  DEFAULT (N',,,,,,') FOR [Style]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Colors]  DEFAULT (N',,,,,,') FOR [Colors]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Hide]  DEFAULT ((1111111111)) FOR [Hide]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Grade]  DEFAULT ((1)) FOR [Grade]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_State]  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Repute]  DEFAULT ((0)) FOR [Repute]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_ForbidDate]  DEFAULT (getdate()) FOR [ForbidDate]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Skin]  DEFAULT ('') FOR [Skin]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Offer]  DEFAULT ((0)) FOR [Offer]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_IsExist]  DEFAULT ((1)) FOR [IsExist]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_ReputeOffer]  DEFAULT ((0)) FOR [ReputeOffer]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_LoginCount]  DEFAULT ((0)) FOR [LoginCount]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_OnlineTime]  DEFAULT ((0)) FOR [OnlineTime]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_AntiAddiction]  DEFAULT ((0)) FOR [AntiAddiction]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_RichesOffer]  DEFAULT ((0)) FOR [RichesOffer]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_RichesRob]  DEFAULT ((0)) FOR [RichesRob]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_LastDayGP]  DEFAULT ((0)) FOR [LastDayGP]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_AddDayGP]  DEFAULT ((0)) FOR [AddDayGP]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_LastWeekGP]  DEFAULT ((0)) FOR [LastWeekGP]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_AddWeekGP]  DEFAULT ((0)) FOR [AddWeekGP]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_LastDayOffer]  DEFAULT ((0)) FOR [LastDayOffer]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_AddDayOffer]  DEFAULT ((0)) FOR [AddDayOffer]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_LastWeekOffer]  DEFAULT ((0)) FOR [LastWeekOffer]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_AddWeekOffer]  DEFAULT ((0)) FOR [AddWeekOffer]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_CheckCount]  DEFAULT ((0)) FOR [CheckCount]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_IsMarried]  DEFAULT ((0)) FOR [IsMarried]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_SpouseID]  DEFAULT ((0)) FOR [SpouseID]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_MarryInfoID]  DEFAULT ((0)) FOR [MarryInfoID]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_DayLoginCount]  DEFAULT ((0)) FOR [DayLoginCount]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_IsCreatedMarryRoom]  DEFAULT ((0)) FOR [IsCreatedMarryRoom]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_SelfMarryRoomID]  DEFAULT ((0)) FOR [SelfMarryRoomID]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_IsGotRing]  DEFAULT ((0)) FOR [IsGotRing]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Rename]  DEFAULT ((0)) FOR [Rename]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_Nimbus_1]  DEFAULT ((0)) FOR [Nimbus]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_LastAward]  DEFAULT (((2009)-(1))-(1)) FOR [LastAward]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_GiftToken]  DEFAULT ((0)) FOR [GiftToken]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_QuestSite]  DEFAULT (0x) FOR [QuestSite]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_FightPower]  DEFAULT ((0)) FOR [FightPower]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_AnswerSite]  DEFAULT ((0)) FOR [AnswerSite]
GO
ALTER TABLE [dbo].[Sys_Users_Detail] ADD  CONSTRAINT [DF_Sys_Users_Detail_LastAuncherAward]  DEFAULT (((2009)-(1))-(1)) FOR [LastAuncherAward]
GO
ALTER TABLE [dbo].[Sys_Users_Fight] ADD  CONSTRAINT [DF_Sys_Users_Fight_Attck]  DEFAULT (0) FOR [Attack]
GO
ALTER TABLE [dbo].[Sys_Users_Fight] ADD  CONSTRAINT [DF_Sys_Users_Fight_Recovery]  DEFAULT (0) FOR [Defence]
GO
ALTER TABLE [dbo].[Sys_Users_Fight] ADD  CONSTRAINT [DF_Sys_Users_Fight_Luck]  DEFAULT (0) FOR [Luck]
GO
ALTER TABLE [dbo].[Sys_Users_Fight] ADD  CONSTRAINT [DF_Sys_Users_Fight_Celerity]  DEFAULT (0) FOR [Agility]
GO
ALTER TABLE [dbo].[Sys_Users_Fight] ADD  CONSTRAINT [DF_Sys_Users_Fight_Delay]  DEFAULT (0) FOR [Delay]
GO
ALTER TABLE [dbo].[Sys_Users_Fight] ADD  CONSTRAINT [DF_Sys_Users_Fight_IsExist]  DEFAULT (1) FOR [IsExist]
GO
ALTER TABLE [dbo].[Sys_Users_Friends] ADD  CONSTRAINT [DF_Sys_Users_Friends_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[Sys_Users_Friends] ADD  CONSTRAINT [DF_Sys_Users_Friends_IsExist]  DEFAULT (1) FOR [IsExist]
GO
ALTER TABLE [dbo].[Sys_Users_Friends] ADD  CONSTRAINT [DF_Sys_Users_Friends_Relation]  DEFAULT (0) FOR [Relation]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_UserID]  DEFAULT (0) FOR [UserID]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_PageType]  DEFAULT (0) FOR [BagType]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_GoodsID]  DEFAULT (0) FOR [TemplateID]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_Place]  DEFAULT (100) FOR [Place]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_Count]  DEFAULT (1) FOR [Count]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_IsJudge]  DEFAULT (1) FOR [IsJudge]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_IsExist]  DEFAULT (1) FOR [IsExist]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_StrengthenLevel]  DEFAULT (0) FOR [StrengthenLevel]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_AttackCompose]  DEFAULT (0) FOR [AttackCompose]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_DefendCompose]  DEFAULT (0) FOR [DefendCompose]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_LcukCompose]  DEFAULT (0) FOR [LuckCompose]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_AgilityCompose]  DEFAULT (0) FOR [AgilityCompose]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_Skin]  DEFAULT ('') FOR [Skin]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_IsBinds]  DEFAULT (0) FOR [IsBinds]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_IsUsed]  DEFAULT (0) FOR [IsUsed]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_BeginDate]  DEFAULT (2008 - 10 - 11) FOR [BeginDate]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_ValidDate]  DEFAULT (10) FOR [ValidDate]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_RemoveTime]  DEFAULT (getdate()) FOR [RemoveDate]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_RemoveType]  DEFAULT (0) FOR [RemoveType]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_Hole1]  DEFAULT ((-1)) FOR [Hole1]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_Hole2]  DEFAULT ((-1)) FOR [Hole2]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_Hole3]  DEFAULT ((-1)) FOR [Hole3]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_Hole4]  DEFAULT ((-1)) FOR [Hole4]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_Hole5]  DEFAULT ((-1)) FOR [Hole5]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_Hole6]  DEFAULT ((-1)) FOR [Hole6]
GO
ALTER TABLE [dbo].[Sys_Users_Goods] ADD  CONSTRAINT [DF_Sys_Users_Goods_RefineryLevel]  DEFAULT (0) FOR [StrengthenRefineryLevel]
GO
ALTER TABLE [dbo].[Sys_Users_Order] ADD  CONSTRAINT [DF_Sys_User_Order_Repute]  DEFAULT (0) FOR [Repute]
GO
ALTER TABLE [dbo].[Sys_Users_Order] ADD  CONSTRAINT [DF_Sys_User_Order_ReputeOffer]  DEFAULT (0) FOR [ReputeOffer]
GO
ALTER TABLE [dbo].[Sys_Users_Password] ADD  CONSTRAINT [DF_Sys_Users_Password_FailedPasswordAttemptCount]  DEFAULT (5) FOR [FailedPasswordAttemptCount]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF_User_Messages_SenderID]  DEFAULT (0) FOR [SenderID]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF_User_Messages_ReceiverID]  DEFAULT (0) FOR [ReceiverID]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF__User_Mess__SendT__1ABEEF0B]  DEFAULT (getdate()) FOR [SendTime]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF__User_Mess__isRea__1BB31344]  DEFAULT (0) FOR [IsRead]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF__User_Mess__isDel__1CA7377D]  DEFAULT (0) FOR [IsDelR]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF__User_Mess__ifDel__1D9B5BB6]  DEFAULT (0) FOR [IfDelS]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF__User_Mess__isDel__1E8F7FEF]  DEFAULT (0) FOR [IsDelete]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF_User_Messages_Gold]  DEFAULT (0) FOR [Gold]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF_User_Messages_Money]  DEFAULT (0) FOR [Money]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF_User_Messages_IsExist]  DEFAULT (1) FOR [IsExist]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF_User_Messages_Type]  DEFAULT (0) FOR [Type]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF_User_Messages_ValidDate]  DEFAULT (240) FOR [ValidDate]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF_User_Messages_SendDate]  DEFAULT (getdate()) FOR [SendDate]
GO
ALTER TABLE [dbo].[User_Messages] ADD  CONSTRAINT [DF_User_Messages_GiftToken]  DEFAULT (0) FOR [GiftToken]
GO
/****** Object:  StoredProcedure [dbo].[SP_Active_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<显示活动表:全部记录表>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Active_All]
AS
  Select * From Active order by ActiveId desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Active_PullDown]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户领取活动中物品>
-- Remark:HasKey 0为不能领取，1为激活码领取，2为特定用户ID领取，3为所有用户ID领取
-- =============================================
CREATE Procedure [dbo].[SP_Active_PullDown]
@ActiveID int,
@AwardID Nvarchar(200),
@UserID int
as

--第一步:判断当前活动与激活码是否有效
Declare  @StartDate DateTime
Declare  @EndDate DateTime
Declare  @HasKey Int
Select @StartDate=StartDate,@EndDate=EndDate,@HasKey=HasKey From  Active Where ActiveID=@ActiveID
If Datediff(s,@StartDate,Getdate()) < 0
   Begin
     Return 7
   End
If Datediff(s,@EndDate,Getdate()) > 0
   Begin
     Return 8
   End
Declare @PullDown Bit
Declare @Mark Int
set @Mark=0
If @HasKey=1                              /*HasKey验证*/
   Begin
      Select @ActiveID=Isnull(ActiveID,0),@PullDown=Isnull(PullDown,0),@Mark=Mark From  Active_Number Where ActiveID=@ActiveID and AwardID =@AwardID
      If @ActiveID=0 or @PullDown is null /*验证AwardID*/
         Begin
           Return 4
         End
      If @PullDown=1
         Begin
           Return 5
         End
      Declare @CanGet bit
      Select @CanGet=Isnull(IsOnly,0) From Active Where IsOnly=1 And ActiveID In (Select ActiveID From Active_Number Where UserID=@UserID and ActiveID=@ActiveID)
      If @CanGet=1                         /*验证唯一*/
         Begin
           Return 6
         End
   End
Else If @HasKey=2
   Begin
    -- Set @AwardID = @ActiveID + '-2-' + @UserID
     Set @AwardID = cast(@ActiveID as nvarchar(20)) + '-2-' + cast(@UserID as nvarchar(20))
     Select @ActiveID=IsNull(ActiveID,0),@PullDown=IsNull(PullDown,0),@Mark=Mark From  Active_Number Where ActiveID=@ActiveID And AwardID =@AwardID
     If @ActiveID=0 or @PullDown Is Null /*验证AwardID*/
        Begin
          Return 10
     End
     If @PullDown=1
        Begin
          Return 6
        End
   End
Else If @HasKey=3
   Begin
     Set @AwardID = cast(@ActiveID as nvarchar(20)) + '-3-' + cast(@UserID as nvarchar(20))
     --验证AwardID
     Select @PullDown=IsNull(PullDown,0),@Mark=IsNull(Mark,0) From  Active_Number Where ActiveID=@ActiveID and AwardID =@AwardID
     If @PullDown<>0 or @PullDown Is Not Null
     Begin
       Return 6
     End
   End
Else
   Begin
     Return 1
   End

--第二步：验证用户
Declare @temp Int
Declare @maxCount Int
Declare @NickName NVarchar(50)
Declare @sex Int
Set @NickName=''
Select @NickName=NickName,@sex=(Case sex When 0 Then 2 Else 1 End) From  Sys_Users_Detail Where UserID = @UserID
If @NickName = '' or @NickName Is Null
   Begin
     Return 2
   End

--第三步：验证物品
If object_id('tempdb..#Award') Is Not Null
Drop Table #Award
Create Table #Award
(
  id Int Identity(1,1),
  TemplateID Int Not Null,
  [Count] Int Not Null,
  ValidDate Int Not Null,
  StrengthenLevel Int Not Null,
  AttackCompose Int Not Null,
  DefendCompose Int Not Null,
  LuckCompose Int Not Null,
  AgilityCompose Int Not Null,
  Gold Int Not Null,
  [Money] Int Not Null
)

Insert Into #Award Select ItemID,[Count],ValidDate,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,Gold,[Money] From Active_Award Where ActiveID=@ActiveID And (Sex=@sex Or Sex=0) And Mark=@Mark
If @@error<>0
   Begin
     Return 7
   End

Declare @Index Int
Declare @ItemCount Int
Set @Index = 1
Select @ItemCount=count(*) From  #Award

--第四步：用户领引物品，以邮件的方式发送给用户
Declare @ItemID Int      /*定义物品属性*/
Declare @TemplateID Int
Declare @Place Int
Declare @Count Int
Declare @IsJudge Bit
Declare @Color Nvarchar(100)
Declare @IsExist Bit
Declare @StrengthenLevel Int
Declare @AttackCompose Int
Declare @DefendCompose Int
Declare @LuckCompose   Int
Declare @AgilityCompose Int
Declare @IsBinds Bit
Declare @BeginDate DateTime
Declare @ValidDate Int
Declare @BagType   Int
Set @ItemID = 0
Set @TemplateID =0
Set @Place =-1
Set @Count =1
Set @IsJudge =1
Set @Color =''
Set @IsExist =1
Set @StrengthenLevel =0
Set @AttackCompose =0
Set @DefendCompose =0
Set @LuckCompose =0
Set @AgilityCompose =0
Set @IsBinds =1
Set @BeginDate =GetDate()
Set @ValidDate =0
Set @BagType =0
Declare @SenderID Int    /*定义邮箱格式*/
Declare @Sender Nvarchar(100)
Declare @ReceiverID Int
Declare @Receiver Nvarchar(100)
Declare @Title Nvarchar(1000)
Declare @Content Nvarchar(4000)
Declare @SendTime DateTime
Declare @IsRead Bit
Declare @IsDelR Bit
Declare @IfDelS Bit
Declare @IsDelete Bit
Declare @Annex1 Nvarchar(100)
Declare @Annex2 Nvarchar(100)
Declare @Gold Int
Declare @Money Int
Declare @Remark Nvarchar(200)
Declare @Annex3 Nvarchar(100)
Declare @Annex4 Nvarchar(100)
Declare @Annex5 Nvarchar(100)
Declare @AnnexIndex Int
Set @SenderID =0
Set @Sender = Dbo.GetTranslation('SP_Active_PullDown.Sender')--'系统管理员'
Set @ReceiverID = @UserID
Set @Receiver = @NickName
Set @Title = Dbo.GetTranslation('SP_Active_PullDown.Title')--'您获得活动奖品!'
Set @Content = Dbo.GetTranslation('SP_Active_PullDown.Content')--'您获得活动奖品!'
Set @SendTime  = GetDate()
Set @IsRead  = 0
Set @IsDelR = 0
Set @IfDelS = 0
Set @IsDelete =0
Set @Annex1 =''
Set @Annex2 =''
Set @Gold =0
Set @Money =0
Set @Annex3 =''
Set @Annex4 =''
Set @Annex5 =''
Set @AnnexIndex=0
Set xact_abort On
    Begin Tran
      While @Index<=@ItemCount
         Begin
           Select @TemplateID=TemplateID,@Count=[Count],@ValidDate=ValidDate,@StrengthenLevel=StrengthenLevel,@AttackCompose=AttackCompose,@DefendCompose=DefendCompose,@LuckCompose=LuckCompose,@AgilityCompose=AgilityCompose,@Gold=@Gold+Gold,@Money=@Money+[Money] From #Award Where [id]=@Index
           Set @temp =0
           Select @temp=isnull(TemplateID,0),@maxCount=isnull(MaxCount,1) from Shop_Goods where TemplateID = @TemplateID
           If @temp = 0 and @TemplateID<>0
              Begin
                Rollback Tran
                Return 3
              End
           If @TemplateID <>0
              Begin
                Declare @getCount Int
                While @Count > 0
                   Begin
                     Set @AnnexIndex = @AnnexIndex+1
                     If @Count > @maxCount
                        Begin
                          Set @getCount = @maxCount
                        End
                     Else
                        Begin
                          Set @getCount = @Count
                        End
                     Set @Count = @Count-@getCount
                     Insert Into Sys_Users_Goods( UserID, BagType,TemplateID, Place, Count, IsJudge, Color, IsExist, StrengthenLevel, AttackCompose, DefendCompose, LuckCompose, AgilityCompose, IsBinds, BeginDate, ValidDate,IsUsed)
							Values( 0, @BagType,@TemplateID, @Place, @getCount, @IsJudge, @Color, @IsExist, @StrengthenLevel, @AttackCompose, @DefendCompose, @LuckCompose, @AgilityCompose, @IsBinds, @BeginDate, @ValidDate,0)
					 Select @@identity As 'identity'
                     Set @ItemID=@@identity
					 If @@error<>0
                        Begin
                          Rollback Tran
                          Return @@error
                        End
					 If @AnnexIndex=1
						Begin
						  Set @Annex1=Cast(@ItemID As NVarchar(20))
						End
					 If @AnnexIndex=2
						Begin
						  Set @Annex2=Cast(@ItemID As NVarchar(20))
						End
					 If @AnnexIndex=3
						Begin
						  Set @Annex3=Cast(@ItemID As NVarchar(20))
						End
					 If @AnnexIndex=4
						Begin
						  Set @Annex4=Cast(@ItemID As NVarchar(20))
						End
					 If @AnnexIndex=5
						Begin
						  Set @Annex5=Cast(@ItemID As Nvarchar(20))
						  Set @Remark = 'Gold:0,Money:0,Annex1:'+@Annex1+',Annex2:'+@Annex2+',Annex3:'+@Annex3+',Annex4:'+@Annex4+',Annex5:'+@Annex5
                          Insert Into User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5)
								 Values( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, 0, 0, @IsExist,52,@Remark,@Annex3,@Annex4,@Annex5)
					      If @@error<>0
							 Begin
							   Rollback Tran
							   Return @@error
							 End
						  Set @AnnexIndex=0
						  Set @Annex1 =''
						  Set @Annex2 =''
						  Set @Annex3 =''
						  Set @Annex4 =''
						  Set @Annex5 =''
						End
              End
         end
      Set @index = @index+1
    End

If @AnnexIndex<>0 Or  @Gold>0 Or @Money>0
   Begin
     If @AnnexIndex=4
		Begin
		Set @Remark = 'Gold:0,Money:'+Cast(@Money As Nvarchar(20))+',Annex1:,Annex2:,Annex3:,Annex4:,Annex5:'
		Insert Into User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5)
			   Values( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, '', '', '', @Money, @IsExist,52,@Remark,'','','')
	If @@error<>0
		Begin
		  Rollback tran
		  Return @@error
		End
    Set @Money=0
  End
  Set @Remark = 'Gold:'+cast(@Gold as Nvarchar(20))+',Money:'+cast(@Money as Nvarchar(20))+',Annex1:'+@Annex1+',Annex2:'+@Annex2+',Annex3:'+@Annex3+',Annex4:'+@Annex4+',Annex5:'+@Annex5
  Insert Into User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5)
         Values( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, @Gold, @Money, @IsExist,52,@Remark,@Annex3,@Annex4,@Annex5)
  If @@error<>0
   	 Begin
       Rollback Tran
	   Return @@error
	 End
  End

  If @HasKey <> 3
	 Begin
       Update Active_Number Set PullDown=1,[GetDate]=getdate(),UserID=@UserID Where AwardID = @AwardID
       If @@error<>0
		  Begin
			Rollback Tran
			Return @@error
		  End
	   End
	Else
	  Begin
		Insert Into Active_Number(AwardID,ActiveID,PullDown,[GetDate],UserID,Mark)
			   Values(@AwardID,@ActiveID,1,Getdate(),@UserID,0)
		If @@error<>0
		   Begin
			 Rollback Tran
			 Return @@error
		   End
      End
  Commit Tran
  Set xact_abort Off
  Return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Active_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<读取一条活动记录>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Active_Single]
@ID int
AS
 select * from Active where ActiveID =@ID



GO
/****** Object:  StoredProcedure [dbo].[SP_Admin_ForbidUser]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<帐号封停>
-- =============================================
CREATE Procedure [dbo].[SP_Admin_ForbidUser]
@UserName Nvarchar(50),
@NickName Nvarchar(50),
@UserID int output,
@ForbidDate datetime,
@IsExist bit,
@ForbidReason Nvarchar(1000)
as

if @UserName<>''
begin
   select @UserID=isnull(UserID,0) from Sys_Users_Detail where UserName = @UserName
end

if @NickName<>''
begin
   select @UserID=isnull(UserID,0) from Sys_Users_Detail where NickName = @NickName
end

if @UserID<>0
begin
   select @UserID=isnull(UserID,0) from Sys_Users_Detail where  UserID = @UserID
end

update Sys_Users_Detail set IsExist = @IsExist,ForbidDate = @ForbidDate,ForbidReason = @ForbidReason  where UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[SP_Admin_Redeem]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<删档后奖励物品:已废>
-- =============================================
CREATE Procedure [dbo].[SP_Admin_Redeem]
as

set xact_abort on
begin tran

--装备
insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
select UserID,0,case when sex=1 then  7001 else 7002 end,11,1,1,'',1,0,0,0,0,0,1,getdate(),0 from Sys_Users_Detail where IsFirst = 0

if @@error<>0
begin
  rollback tran
  select @@error
end

insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
select UserID,0,case when sex=1 then  3101 else 3201 end,12,1,1,'',1,0,0,0,0,0,1,getdate(),0 from Sys_Users_Detail where IsFirst = 0

if @@error<>0
begin
  rollback tran
  select @@error
end

insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
select UserID,0,case when sex=1 then  6101 else 6201 end,13,1,1,'',1,0,0,0,0,0,1,getdate(),0 from Sys_Users_Detail where IsFirst = 0

if @@error<>0
begin
  rollback tran
  select @@error
end

insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
select UserID,0,case when sex=1 then  5101 else 5201 end,14,1,1,'',1,0,0,0,0,0,1,getdate(),0 from Sys_Users_Detail where IsFirst = 0

if @@error<>0
begin
  rollback tran
  select @@error
end

--道具
insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
select UserID,1,10001,1,10,1,'',1,0,0,0,0,0,1,getdate(),0 from Sys_Users_Detail where IsFirst = 0

if @@error<>0
begin
  rollback tran
  select @@error
end

insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
select UserID,1,10003,2,10,1,'',1,0,0,0,0,0,1,getdate(),0 from Sys_Users_Detail where IsFirst = 0

if @@error<>0
begin
  rollback tran
  select @@error
end


insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
select UserID,1,10005,3,10,1,'',1,0,0,0,0,0,1,getdate(),0 from Sys_Users_Detail where IsFirst = 0

if @@error<>0
begin
  rollback tran
  select @@error
end


insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
select UserID,1,10008,0,20,1,'',1,0,0,0,0,0,1,getdate(),0 from Sys_Users_Detail where IsFirst = 0

if @@error<>0
begin
  rollback tran
  select @@error
end


commit tran
set xact_abort off

select '0'

GO
/****** Object:  StoredProcedure [dbo].[SP_Admin_SendAllItem]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken，Xiaov>
-- ALTER  date: <2009-10-22>
-- Description:	<后台赠送物品：新版GM后台使用>
-- =============================================
CREATE  Procedure [dbo].[SP_Admin_SendAllItem]
 @Title nvarchar(1000),
 @Content nvarchar(2000),
 @UserID int,
 @Gold int,
 @Money int,
 @GiftToken int,
 @Param nvarchar(2000)
As

/*第一步：设置User信息*/
Declare @NickName varchar(50)
Set @NickName=''
Select @NickName=NickName from  Sys_Users_Detail where UserID = @UserID
If @NickName = ''
   Begin
     Return 2
   End

/*第二步：设置物品信息*/
Declare @temp int
Declare @maxCount int
Declare @ItemID int
Declare @TemplateID int
Declare @Place int
Declare @Count int
Declare @IsJudge bit
Declare @Color nvarchar(100)
Declare @IsExist bit
Declare @StrengthenLevel int
Declare @AttackCompose int
Declare @DefendCompose int
Declare @LuckCompose int
Declare @AgilityCompose int
Declare @IsBinds bit
Declare @BeginDate DateTime
Declare @ValidDate int
Declare @BagType int
Set @BeginDate=getdate()
Set @Place=-1
Set @IsJudge =1
Set @Color=''
Set @IsExist=1
Set @BagType=-1

/*第三步:设置邮件信息*/
Declare @SenderID int
Declare @Sender nvarchar(100)
Declare @ReceiverID int
Declare @Receiver nvarchar(100)
Declare @SendTime DateTime
Declare @IsRead bit
Declare @IsDelR bit
Declare @IfDelS bit
Declare @IsDelete bit
Declare @Annex1 nvarchar(100)
Declare @Annex2 nvarchar(100)
Declare @Remark nvarchar(200)
Declare @Annex3 nvarchar(100)
Declare @Annex4 nvarchar(100)
Declare @Annex5 nvarchar(100)
Declare @AnnexIndex int
Set @SenderID =0
Set @Sender = dbo.GetTranslation('SP_Active_PullDown.Sender')--'系统管理员'
Set @ReceiverID = @UserID
Set @Receiver = @NickName
Set @SendTime  = getdate()
Set @IsRead  = 0
Set @IsDelR = 0
Set @IfDelS = 0
Set @IsDelete =0
Set @Annex1 =''
Set @Annex2 =''
Set @Annex3 =''
Set @Annex4 =''
Set @Annex5 =''
Set @AnnexIndex=0
Declare @locationItem int
Declare @startItem int
Declare @values nvarchar(200)
Declare @locationValue int
Declare @startValue int
Declare @value nvarchar(200)
Declare @indexValue int
Set @Param=ltrim(rtrim(@Param))
Set @startItem=1


/*第四步：循环发邮件*/
Set Xact_Abort On
Begin Tran
If len(@Param)>0
  Begin
    Set @Param=@Param+'|'
    Set @locationItem=charindex('|',@Param)
    while @locationItem<>0
          Begin
            Set @values=substring(@Param,@startItem,@locationItem-@startItem)
            Set @startItem=@locationItem+1
            Set @indexValue=0

            --templateID,count,validDate,StrengthenLevel,AttackCompose,DefendCompose,AgilityCompose,LuckCompose,isBinds
            Set @values=ltrim(rtrim(@values))
            Set @values = @values+','
            Set @locationValue=charindex(',',@values)

            Set @ItemID =0
            Set @TemplateID =0
            Set @Count =0
            Set @StrengthenLevel =0
            Set @AttackCompose =0
            Set @DefendCompose =0
            Set @LuckCompose =0
            Set @AgilityCompose =0
            Set @IsBinds =1
            Set @ValidDate =1

            Set @startValue=1
            While @locationValue<>0
                  Begin
                    Set @indexValue = @indexValue+1
                    Set @value=substring(@values,@startValue,@locationValue-@startValue)
                    Set @startValue=@locationValue+1

                    If @indexValue=1
                       Begin
                         Set @TemplateID=@value
                       End
                    Else If @indexValue=2
                       Begin
                         Set @Count=@value
                       End
                    Else If @indexValue=3
                       Begin
                         set @ValidDate=@value
                       End
                    Else If @indexValue=4
                       Begin
                         Set @StrengthenLevel=@value
                       End
                    Else If @indexValue=5
                       Begin
                         Set @AttackCompose=@value
                       End
                    Else If @indexValue=6
                       Begin
                         Set @DefendCompose=@value
                       End
                    Else If @indexValue=7
                       Begin
                         Set @AgilityCompose=@value
                       End
                    Else If @indexValue=8
                       Begin
                         Set @LuckCompose=@value
                       End
                    Else If @indexValue=9
                       Begin
                         Set @IsBinds=@value
                       End
    	            Set @locationValue=charindex(',',@values,@startValue)
                  End

            --数量拆分
            Set @temp = 0
            Select @temp=isnull(TemplateID,0),@maxCount=isnull(MaxCount,1) from Shop_Goods where TemplateID = @TemplateID
            If @temp = 0
               Begin
                 Set @TemplateID = 0
               End
            If @TemplateID <>0
               Begin
                 declare @getCount int
                 While @Count > 0
                       Begin
                         If @Count > @maxCount
                            Begin
                              Set @getCount = @maxCount
                            End
                         Else
                            Begin
                              Set @getCount = @Count
                            End
                         Set @Count = @Count-@getCount
                         Set @AnnexIndex = @AnnexIndex+1
                         Insert Into Sys_Users_Goods( UserID, BagType,TemplateID, Place, Count, IsJudge, Color, IsExist, StrengthenLevel, AttackCompose, DefendCompose, LuckCompose, AgilityCompose, IsBinds, BeginDate, ValidDate)
                                Values( 0, @BagType,@TemplateID, @Place, @getCount, @IsJudge, @Color, @IsExist, @StrengthenLevel, @AttackCompose, @DefendCompose, @LuckCompose, @AgilityCompose, @IsBinds, @BeginDate, @ValidDate)
                         Select @@identity as 'identity'
                         Set @ItemID=@@identity
                         If @@error<>0
                            Begin
                              Rollback tran
                              Return @@error
                            End
                         If @AnnexIndex=1
                            Begin
                              Set @Annex1=cast(@ItemID as varchar(20))
                            End
                         If @AnnexIndex=2
                            Begin
                              Set @Annex2=cast(@ItemID as varchar(20))
                            End
                         If @AnnexIndex=3
                            Begin
                              Set @Annex3=cast(@ItemID as varchar(20))
                            End
                         If @AnnexIndex=4
                            Begin
                              Set @Annex4=cast(@ItemID as varchar(20))
                            End
                         If @AnnexIndex=5
                            Begin
                              Set @Annex5=cast(@ItemID as varchar(20))
                              Set @Remark = 'Gold:0,Money:0,Annex1:'+@Annex1+',Annex2:'+@Annex2+',Annex3:'+@Annex3+',Annex4:'+@Annex4+',Annex5:'+@Annex5+',GiftToken:0'
                              Insert Into User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5,GiftToken)
                                     Values( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, 0, 0, @IsExist,51,@Remark,@Annex3,@Annex4,@Annex5,0)
                              If @@error<>0
                                 Begin
                                   Rollback Tran
                                   Return @@error
                                 End
                              Set @AnnexIndex=0
                              Set @Annex1 =''
                              Set @Annex2 =''
                              Set @Annex3 =''
                              Set @Annex4 =''
                              Set @Annex5 =''
                            End
                       End
               End
               Set @locationItem=charindex('|',@Param,@startItem)
          End
  End

/*第五步：发最后一封邮件*/
If  (@AnnexIndex<>0) And (len(@Param) <> 0 )
    Begin
     Set @Remark = 'Gold:0,Money:0,Annex1:'+@Annex1+',Annex2:'+@Annex2+',Annex3:'+@Annex3+',Annex4:'+@Annex4+',Annex5:'+@Annex5+',GiftToken:0'
     Insert Into User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5,GiftToken)
            Values( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, 0,0, @IsExist,51,@Remark,@Annex3,@Annex4,@Annex5,0)
     If @@error<>0
        Begin
          Rollback tran
          Return @@error
        End
    End

If(@Gold>0 or @Money>0 or @GiftToken>0)
  Begin
    Set @Remark = 'Gold:'+cast(@Gold as varchar(20))+',Money:'+cast(@Money as varchar(20))+',Annex1:,Annex2:,Annex3:,Annex4:,Annex5:,GiftToken:'+cast(@GiftToken as varchar(20))
    Insert Into User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5,GiftToken)
           VALUES( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, '', '', @Gold, @Money, @IsExist,51,@Remark,'','','',@GiftToken)
    If @@error<>0
       Begin
         Rollback tran
         Return @@error
       End
  End


Commit Tran
Set xact_abort off

/*
If @AnnexIndex<>0 or  @Gold>0 or @Money>0 or @GiftToken>0
   Begin
     If @AnnexIndex=4 and @Gold>0 and @Money>0 and @GiftToken>0
        Begin
          return
          Set @Remark = 'Gold:0,Money:'+cast(@Money as varchar(20))+',Annex1:,Annex2:,Annex3:,Annex4:,Annex5:'
          print @Remark

          INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5)
                 VALUES( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, '', '', 0, @Money, @IsExist,51,@Remark,'','','')
          If @@error<>0
             Begin
               Rollback tran
               Return @@error
             End
          Set @Money=0
          Set @GiftToken=0
        End
     Set @Remark = 'Gold:'+cast(@Gold as varchar(20))+',Money:'+cast(@Money as varchar(20))+',Annex1:'+@Annex1+',Annex2:'+@Annex2+',Annex3:'+@Annex3+',Annex4:'+@Annex4+',Annex5:'+@Annex5+',GiftToken'+@GiftToken
     Insert Into User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5,GiftToken)
            Values( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, @Gold, @Money, @IsExist,51,@Remark,@Annex3,@Annex4,@Annex5,@GiftToken)
     print '3'
     If @@error<>0
        Begin
          Rollback tran
          Return @@error
        End
   End
   Else If len(@Param) = 0
        Begin
          Set @Remark = 'Gold:0,Money:0,Annex1:,Annex2:,Annex3:,Annex4:,Annex5:,GiftToken:0'
          Insert Into User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5)
                 Values( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, 0, 0, @IsExist,51,@Remark,@Annex3,@Annex4,@Annex5)
          If @@error<>0
             Begin
               Rollback tran
               Return @@error
             End
        End
Commit Tran
Set xact_abort off
Return 0
*/


GO
/****** Object:  StoredProcedure [dbo].[SP_Admin_SendMail]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<后台赠送物品：GM后台使用带礼卷功能>
-- =============================================
CREATE  Procedure [dbo].[SP_Admin_SendMail]
 @Title Nvarchar(1000),
 @Content Nvarchar(2000),
 @UserID Int,
 @Gold Int,
 @Money Int,
 @GiftToken Int,
 @Param Nvarchar(2000)
as
/*第一步：定义变量*/
DECLARE @SenderID INT           --发送者id
DECLARE @Sender  NVARCHAR(50)   --发送者名称
DECLARE @ReceiverID INT         --收件人id
DECLARE @Titles NVARCHAR(500)    --标题
DECLARE @Contents NVARCHAR(2000)
DECLARE @SendTime datetime

/*

	[SendTime] [datetime] NOT NULL ,
	[IsRead] [bit] NOT NULL ,
	[IsDelR] [bit] NOT NULL ,
	[IfDelS] [bit] NOT NULL ,
	[IsDelete] [bit] NOT NULL ,
	[Annex1] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Annex2] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Gold] [int] NOT NULL ,
	[Money] [int] NOT NULL ,
	[IsExist] [bit] NOT NULL ,
	[Type] [int] NOT NULL ,
	[Remark] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ValidDate] [int] NOT NULL ,
	[Annex1Name] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Annex2Name] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SendDate] [datetime] NOT NULL ,
	[Annex3] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Annex4] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Annex5] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Annex3Name] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Annex4Name] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Annex5Name] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[AnnexRemark] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[GiftToken] [int] NOT NULL
*/
GO
/****** Object:  StoredProcedure [dbo].[SP_Admin_SendUserItem]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<后台用的物品赠送:旧版已废>
-- =============================================
CREATE Procedure [dbo].[SP_Admin_SendUserItem]
--物品
 @ItemID int,
 @UserID int,
 @TemplateID int,
 @Place int,
 @Count int,
 @IsJudge bit,
 @Color nvarchar(100),
 @IsExist bit,
 @StrengthenLevel int,
 @AttackCompose int,
 @DefendCompose int,
 @LuckCompose int,
 @AgilityCompose int,
 @IsBinds bit,
 @BeginDate DateTime,
 @ValidDate int,
 @BagType int,
--信箱
 @ID int output,
 @SenderID int,
 @Sender nvarchar(100),
 @ReceiverID int,
 @Receiver nvarchar(100),
 @Title nvarchar(1000),
 @Content nvarchar(4000),
 @SendTime DateTime,
 @IsRead bit,
 @IsDelR bit,
 @IfDelS bit,
 @IsDelete bit,
 @Annex1 nvarchar(100),
 @Annex2 nvarchar(100),
 @Gold int,
 @Money int
--共用 @IsExist bit
AS

declare @temp int
declare @maxCount int
declare @NickName varchar(50)
declare @Remark nvarchar(200)

set @NickName=''
select @NickName=NickName from  Sys_Users_Detail where UserID = @ReceiverID
if @NickName = ''
begin
  return 2
end

set @temp = 0
select @temp=isnull(TemplateID,0),@maxCount=isnull(MaxCount,1) from Shop_Goods where TemplateID = @TemplateID
if @temp = 0
begin
  set @TemplateID = 0
end

set xact_abort on
begin tran

if @TemplateID <>0
begin
declare @getCount int
 while @Count > 0
 begin

   if @Count > @maxCount
   begin
     set @getCount = @maxCount
   end
   else
   begin
     set @getCount = @Count
   end
   set @Count = @Count-@getCount

   INSERT INTO Sys_Users_Goods( UserID, BagType,TemplateID, Place, Count, IsJudge, Color, IsExist, StrengthenLevel, AttackCompose, DefendCompose, LuckCompose, AgilityCompose, IsBinds, BeginDate, ValidDate)
   VALUES( 0, @BagType,@TemplateID, -1, @getCount, @IsJudge, @Color, @IsExist, @StrengthenLevel, @AttackCompose, @DefendCompose, @LuckCompose, @AgilityCompose, @IsBinds, @BeginDate, @ValidDate)
   select @@identity as 'identity'
   set @ItemID=@@identity

  if @@error<>0
    begin
      rollback tran
      return @@error
   end

  set @Remark = 'Gold:0,Money:0,Annex1:'+cast(@ItemID as varchar(20))+',Annex2:'+@Annex2
  INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark)
     VALUES( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @ItemID, @Annex2, 0, 0, @IsExist,51,@Remark)

  if @@error<>0
  begin
    rollback tran
    return @@error
  end
 end
end
if @Gold <>0  or  @Money<>0
begin

 set @Remark = 'Gold:'+cast(@Gold as varchar(20))+',Money:'+cast(@Money as varchar(20))+',Annex1:'+@Annex1+',Annex2:'+@Annex2
 INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark)
     VALUES( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, @Gold, @Money, @IsExist,51,@Remark)

  if @@error<>0
  begin
    rollback tran
    return @@error
  end

end

if @TemplateID = 0 and @Gold =0  and  @Money=0
begin

 set @Remark = 'Gold:'+cast(@Gold as varchar(20))+',Money:'+cast(@Money as varchar(20))+',Annex1:'+@Annex1+',Annex2:'+@Annex2
 INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark)
     VALUES( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, @Gold, @Money, @IsExist,51,@Remark)

  if @@error<>0
  begin
    rollback tran
    return @@error
  end

end

commit tran
set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Admin_SendUserMoney]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<后台用的物品赠送:旧版，已废>
-- =============================================
CREATE Procedure [dbo].[SP_Admin_SendUserMoney]
--信箱
 @ID int output,
 @SenderID int,
 @Sender nvarchar(100),
 @ReceiverID int,
 @Receiver nvarchar(100),
 @Title nvarchar(1000),
 @Content nvarchar(4000),
 @SendTime DateTime,
 @IsRead bit,
 @IsDelR bit,
 @IfDelS bit,
 @IsDelete bit,
 @Annex1 nvarchar(100),
 @Annex2 nvarchar(100),
 @Gold int,
 @Money int,
 @IsExist bit
AS
declare @NickName varchar(50)
declare @Remark nvarchar(200)

set @NickName=''
select @NickName=NickName from  Sys_Users_Detail where UserID = @ReceiverID
if @NickName = ''
begin
  return 2
end


set xact_abort on
begin tran

 set @Remark = 'Gold:'+cast(@Gold as varchar(20))+',Money:'+cast(@Money as varchar(20))+',Annex1:'+@Annex1+'Annex2:'+@Annex2
 INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark)
     VALUES( @SenderID, @Sender, @ReceiverID, @NickName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, @Gold, @Money, @IsExist,51,@Remark)

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ASSInfo_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<防沉迷-身份验证:播入身份证>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ASSInfo_Add]
@UserID int,
@Name nvarchar(20),
@IDNumber nvarchar(20),
@State int
AS

declare @Count int

select @Count = IsNull(count(*),0) from AASInfo  where UserID = @UserID

if @Count <> 0
begin
    return 1
end

set xact_abort on
begin tran
insert into AASInfo(UserID,[Name],IDNumber,State) values(@UserID,@Name,@IDNumber,@State)
if @@error <>0
begin
    rollback tran
    return @@error
end

commit tran
set xact_abort off
return 0

GO
/****** Object:  StoredProcedure [dbo].[SP_ASSInfo_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<防沉迷：身份信息>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ASSInfo_All]
AS
    begin
	select * from AASInfo
    end
GO
/****** Object:  StoredProcedure [dbo].[SP_ASSInfo_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<防沉迷：查询一条用户身份信息>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ASSInfo_Single]
@UserID int
 AS
select * from AASInfo where  UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[SP_Auction_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<拍卖行：用户发布一个商品信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Auction_Add]
 @AuctionID int output,
 @AuctioneerID int,
 @AuctioneerName nvarchar(100),
 @BeginDate DateTime,
 @BuyerID int,
 @BuyerName nvarchar(100),
 @IsExist bit,
 @ItemID int,
 @Mouthful int,
 @PayType int,
 @Price int,
 @Rise int,
 @ValidDate int,
 @TemplateID int,
 @Name nvarchar(200),
 @Category int,
 @Random int
AS
    Set @ValidDate=1+@ValidDate
     INSERT INTO Auction( AuctioneerID,[Name],Category,AuctioneerName, BeginDate, BuyerID, BuyerName, IsExist, ItemID, Mouthful, PayType, Price, Rise, ValidDate,TemplateID,Random)
     VALUES( @AuctioneerID,@Name,@Category,@AuctioneerName, @BeginDate, @BuyerID, @BuyerName, @IsExist, @ItemID, @Mouthful, @PayType, @Price, @Rise, @ValidDate, @TemplateID,0)
     select @@identity as 'identity'
     set @AuctionID=@@identity
GO
/****** Object:  StoredProcedure [dbo].[SP_Auction_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<拍卖行：用户取消拍卖>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Auction_Delete]
 @AuctionID int,
 @UserID int

AS

declare @AuctioneerID int
declare @AuctioneerName nvarchar(100)
declare @BuyerID int
declare @BuyerName nvarchar(100)
declare @ItemID int
declare @PayType int
declare @Price int


--信箱
declare @SenderID int
declare @Sender nvarchar(100)
declare @ReceiverID int
declare @Receiver nvarchar(100)
declare @Title nvarchar(1000)
declare @Content nvarchar(4000)
declare @SendTime DateTime
declare @IsRead bit
declare @IsDelR bit
declare @IfDelS bit
declare @IsDelete bit
declare @Annex1 nvarchar(100)
declare @Annex2 nvarchar(100)
declare @Gold int
declare @Money int
declare @Remark nvarchar(200)

set @SenderID =0
set @Sender = dbo.GetTranslation('SP_Auction_Delete.Sender')--'弹弹堂拍卖中心'
set @ReceiverID = ''
set @Receiver = ''
set @Title = dbo.GetTranslation('SP_Auction_Delete.Title')--'撤消拍卖!'
set @Content = dbo.GetTranslation('SP_Auction_Delete.Content')--'撤消拍卖!'
set @SendTime  = getdate()
set @IsRead  = 0
set @IsDelR = 0
set @IfDelS = 0
set @IsDelete =0
set @Annex1 =''
set @Annex2 =''
set @Gold =0
set @Money =0

select @AuctionID=AuctionID,@AuctioneerID=AuctioneerID,@AuctioneerName=AuctioneerName,@BuyerID=BuyerID,@BuyerName=BuyerName,@ItemID=ItemID,@Price=Price,@PayType=PayType
from Auction where AuctionID=@AuctionID and IsExist = 1 and AuctioneerID = @UserID

if @AuctioneerID is null
begin
  return 1
end

if @BuyerID<>0
begin
  return 2
end

set xact_abort on
begin tran

  update Auction set IsExist=0 where AuctionID=@AuctionID

  if @@error<>0 or @@ROWCOUNT =0
    begin
      rollback tran
      return 3
   end
     set @Remark = 'Gold:0,Money:0,Annex1:'+cast(@ItemID as varchar(20))+',Annex2:'+@Annex2
        INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, [Money], IsExist,Type,Remark)
     VALUES( @SenderID, @Sender, @AuctioneerID, @AuctioneerName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @ItemID, @Annex2, 0, 0, 1,3,@Remark)

     if @@error<>0
       begin
        rollback tran
        return 4
       end

commit tran
set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Auction_Scan]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<拍卖行：拍卖到期返回物品到相应玩家>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_Auction_Scan]
 @NoticeUserID nvarchar(4000) output

AS
set @NoticeUserID=''
declare @AuctionID int
declare @AuctioneerID int
declare @AuctioneerName nvarchar(100)
declare @BuyerID int
declare @BuyerName nvarchar(100)
declare @ItemID int
declare @PayType int
declare @Price int
declare @Name nvarchar(200)


--信箱
declare @SenderID int
declare @Sender nvarchar(100)
declare @ReceiverID int
declare @Receiver nvarchar(100)
declare @Title nvarchar(1000)
declare @Content nvarchar(4000)
declare @SendTime DateTime
declare @IsRead bit
declare @IsDelR bit
declare @IfDelS bit
declare @IsDelete bit
declare @Annex1 nvarchar(100)
declare @Annex2 nvarchar(100)
declare @Gold int
declare @Money int
declare @Remark nvarchar(200)
declare @Type int


set @SenderID =0
set @Sender = dbo.GetTranslation('SP_Auction_Scan.Sender')--'弹弹堂拍卖中心'
set @ReceiverID = 0
set @Receiver = ''
set @Title = dbo.GetTranslation('SP_Auction_Scan.Title')--'拍卖成功!'
set @Content = dbo.GetTranslation('SP_Auction_Scan.Content')--'拍卖成功!'
set @SendTime  = getdate()
set @IsRead  = 0
set @IsDelR = 0
set @IfDelS = 0
set @IsDelete =0
set @Annex1 =''
set @Annex2 =''
set @Gold =0
set @Money =0
declare @flat decimal(18,2)   --定义扣税
declare @NewPrice int	      --扣税后的价格

Set @flat=0.10                --设置扣税
Select @flat=IsNull(Value,0.10) From Server_Config Where Name='Cess'
if object_id('tempdb..#Auction') is not null
drop table #Auction

create table #Auction
(
id int identity(1,1),
AuctionID int not null,
AuctioneerID int not null,
AuctioneerName nvarchar(200) not null,
BuyerID int not null,
BuyerName nvarchar(200) not null,
ItemID int not null,
Price int not null,
PayType int not null,
[Name] nvarchar(200)
)

insert into #Auction select AuctionID,AuctioneerID,AuctioneerName,BuyerID,BuyerName,ItemID,Price,PayType,[Name] from Auction with(nolock) where IsExist=1 and datediff(hh,BeginDate,getdate())>ValidDate

declare @Index int
declare @ItemCount int
set @Index = 1
select @ItemCount=count(*) from  #Auction

set xact_abort on

while @Index<=@ItemCount
begin
   select @AuctionID=AuctionID,@AuctioneerID=AuctioneerID,@AuctioneerName=AuctioneerName,@BuyerID=BuyerID,@BuyerName=BuyerName,@ItemID=ItemID,@Price=Price,@PayType=PayType,@Name=[Name]
   from #Auction where [id]=@Index

  set @Index = @Index+1
  begin tran
  update Auction set IsExist=0 where AuctionID=@AuctionID

  if @@error<>0 or @@ROWCOUNT =0
    begin
      rollback tran
      CONTINUE
   end

    if @BuyerID=0
      begin
        set @BuyerID=@AuctioneerID
        set @BuyerName=@AuctioneerName
        set @Title= dbo.GetTranslation('SP_Auction_Scan.Msg1')+@Name+'!!'--'拍卖过期:    '+@Name+'!!'
        set @Content= dbo.GetTranslation('SP_Auction_Scan.Msg2')--'您所拍卖的  '+@Name+'  超过保管时间!!'
        set @Content = REPLACE(@Content,'{0}',@Name)
        set @Type=3
      end
    else
     begin

        set @Title= dbo.GetTranslation('SP_Auction_Scan.Msg3')+@Name+'!!'--'竞标成功:    '+@Name+'!!'
        set @Content= dbo.GetTranslation('SP_Auction_Scan.Msg4')----'您成功竞标<'+@AuctioneerName+'>拍卖的  '+@Name+'  ，支付'+cast(@Price as varchar(20))+'点卷!'
        set @Content = REPLACE(@Content,'{0}',@AuctioneerName)
        set @Content = REPLACE(@Content,'{1}',@Name)
        set @Content = REPLACE(@Content,'{2}',cast(@Price as varchar(20)))
        set @Type=4
     end
     set @Remark = 'Gold:0,Money:0,Annex1:'+cast(@ItemID as varchar(20))+',Annex2:'+@Annex2

        INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, [Money], IsExist,Type,Remark)
     VALUES( @SenderID, @Sender, @BuyerID, @BuyerName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @ItemID, @Annex2, 0, 0, 1,@Type,@Remark)

     if @@error<>0
       begin
        rollback tran
        CONTINUE
       end

     set @NoticeUserID = @NoticeUserID + cast(@BuyerID as nvarchar(50)) + ','

   if @AuctioneerID<>@BuyerID
    begin

      if @PayType = 0
       begin
         set @Money = 0
         set @Gold = @Price
       end
      else
       begin
         set @Money = @Price
         set @Gold = 0
       end
        set @NewPrice=@Money-round(@flat*@Money,0)
        set @Title= dbo.GetTranslation('SP_Auction_Scan.Msg5')+@Name+'!!'--'拍卖成功:    '+@Name+'!!'
        If @flat>0
           Begin
            set @Content= dbo.GetTranslation('SP_Auction_Scan.Msg6')--'您所拍卖的  '+@Name+'  被<'+@BuyerName+'>购买，一共获得'+cast(@Price as varchar(20))+'点券!!'
            set @Content = REPLACE(@Content,'{3}',cast(@Money-@NewPrice as varchar(20)))
           End
        Else
           Begin
            set @Content= dbo.GetTranslation('SP_Auction_Scan.Msg7')--'您所拍卖的  '+@Name+'  被<'+@BuyerName+'>购买，一共获得'+cast(@Price as varchar(20))+'点券!!'
           End
        set @Content = REPLACE(@Content,'{0}',@Name)
        set @Content = REPLACE(@Content,'{1}',@BuyerName)
        set @Content = REPLACE(@Content,'{2}',cast(@Money as varchar(20)))
        set @Content = REPLACE(@Content,'{4}',cast(@NewPrice as varchar(20)))
        set @Remark = 'Gold:'+cast(@Gold as varchar(20))+',Money:'+cast(@NewPrice as varchar(20))+',Annex1:'+@Annex1+',Annex2:'+@Annex2
        set @Type=2

        INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, [Money], IsExist,Type,Remark)
     VALUES( @SenderID, @Sender, @AuctioneerID, @AuctioneerName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, @Gold, @NewPrice, 1,@Type,@Remark)

     if @@error<>0
       begin
        rollback tran
        CONTINUE
       end

     set @NoticeUserID = @NoticeUserID +  cast(@AuctioneerID as nvarchar(50)) + ','

    end

  commit tran
end
set xact_abort off

if len(@NoticeUserID)>0
begin
 set @NoticeUserID = substring(@NoticeUserID,1,len(@NoticeUserID)-1)
end
--set @NoticeUserID='100,200'

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Auction_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<拍卖行：读取一条拍卖商品信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Auction_Single]
 @AuctionID int
AS

   begin
     select * from Auction WHERE AuctionID=@AuctionID and IsExist = 1
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Auction_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<拍卖行：更新拍卖信息>
-- =============================================
CREATE    PROCEDURE [dbo].[SP_Auction_Update]
 @AuctionID int,
 @AuctioneerID int,
 @AuctioneerName nvarchar(100),
 @BeginDate DateTime,
 @BuyerID int,
 @BuyerName nvarchar(100),
 @IsExist bit,
 @ItemID int,
 @Mouthful int,
 @PayType int,
 @Price int,
 @Rise int,
 @ValidDate int,
 @Name nvarchar(200),
 @Category int

AS

declare @OldBuyerID int
declare @OldBuyerName nvarchar(100)
declare @OldPrice int
declare @flat decimal(18,2)   --定义扣税
declare @NewPrice int	      --扣税后的价格
Set @flat=0.10                --设置扣税
Select @flat=IsNull(Value,0.10) From Server_Config Where Name='Cess'
--信箱
declare @SenderID int
declare @Sender nvarchar(100)
declare @ReceiverID int
declare @Receiver nvarchar(100)
declare @Title nvarchar(1000)
declare @Content nvarchar(4000)
declare @SendTime DateTime
declare @IsRead bit
declare @IsDelR bit
declare @IfDelS bit
declare @IsDelete bit
declare @Annex1 nvarchar(100)
declare @Annex2 nvarchar(100)
declare @Gold int
declare @Money int
declare @Remark nvarchar(200)

set @SenderID =0
set @Sender = dbo.GetTranslation('SP_Auction_Update.Sender')--'弹弹堂拍卖中心'
set @ReceiverID = @OldBuyerID
set @Receiver = @OldBuyerName
set @Title = dbo.GetTranslation('SP_Auction_Update.Title')--'拍卖返回!'
set @Content = dbo.GetTranslation('SP_Auction_Update.Content')--'拍卖返回!'
set @SendTime  = getdate()
set @IsRead  = 0
set @IsDelR = 0
set @IfDelS = 0
set @IsDelete =0
set @Annex1 =''
set @Annex2 =''
set @Gold =0
set @Money =0

select @OldBuyerID= BuyerID,@OldBuyerName=BuyerName,@OldPrice=Price from Auction where AuctionID=@AuctionID and IsExist=1 and (DATEADD(mi, Random, BeginDate) < GETDATE())

if @OldBuyerID is null
 begin
   return 1
 end

if @PayType = 0
 begin
   set @Gold = @OldPrice
 end
else
 begin
   set @Money = @OldPrice
 end

set xact_abort on
begin tran

  update Auction set BuyerID=@BuyerID,BuyerName=@BuyerName,IsExist=@IsExist,Price=@Price where AuctionID=@AuctionID and IsExist=1

  if @@error<>0 or @@ROWCOUNT =0
    begin
      rollback tran
      return 2
   end

 if @OldBuyerID<>0
   begin

    set @Title = dbo.GetTranslation('SP_Auction_Update.Msg1') + @Name +'!'--'竞标失败:    ' + @Name +'!'
    set @Content = dbo.GetTranslation('SP_Auction_Update.Msg2')--'您竞标的  '+ @Name + '  价格被 <'+@BuyerName+'> 超出，返回' + cast(@Money as varchar(20))  +'点券!'
    set @Content = REPLACE(@Content,'{0}',@Name)
    set @Content = REPLACE(@Content,'{1}',@BuyerName)
    set @Content = REPLACE(@Content,'{2}',cast(@Money as varchar(20)))
    set @Remark = 'Gold:'+cast(@Gold as varchar(20))+',Money:'+cast(@Money as varchar(20))+',Annex1:'+@Annex1+',Annex2:'+@Annex2

    INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark)
       VALUES( @SenderID, @Sender, @OldBuyerID, @OldBuyerName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, @Gold, @Money, 1,5,@Remark)

   if @@error<>0
      begin
        rollback tran
        return 3
      end
   end



  if @Price >= @Mouthful and @Mouthful<>0
    begin

    set @Title = dbo.GetTranslation('SP_Auction_Update.Msg3') + @Name +'!'--'竞标成功:    ' + @Name +'!'
    set @Content = dbo.GetTranslation('SP_Auction_Update.Msg4') --'您成功竞标<'+@AuctioneerName+'>拍卖的  '+ @Name + '  ,支付' + cast(@Price as varchar(20))  +'点券!'
    set @Content = REPLACE(@Content,'{0}',@AuctioneerName)
    set @Content = REPLACE(@Content,'{1}',@Name)
    set @Content = REPLACE(@Content,'{2}',cast(@Price as varchar(20)))
    set @Remark = 'Gold:0,Money:0,Annex1:'+cast(@ItemID as varchar(20))+',Annex2:'+@Annex2
    INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark)
           VALUES( @SenderID, @Sender, @BuyerID, @BuyerName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @ItemID, @Annex2, 0, 0, 1,4,@Remark)

     if @@error<>0
       begin
        rollback tran
        return 4
       end

    if @PayType = 0
     begin
       set @Money = 0
       set @Gold = @Price
     end
    else
     begin
       set @Money = @Price
       set @Gold = 0
     end
    set @NewPrice=@Price-round(@flat*@Price,0)
    set @Title = dbo.GetTranslation('SP_Auction_Update.Msg5') + @Name +'!'--'拍卖成功:    ' + @Name +'!'
    If @flat>0
    Begin
        set @Content = dbo.GetTranslation('SP_Auction_Update.Msg6')--'您所拍卖的  '+ @Name + '  被 <'+@BuyerName+'> 购买,一共获得' + cast(@Price as varchar(20))  +'点券!'
        set @Content = REPLACE(@Content,'{3}',cast(@Price-@NewPrice as varchar(20)))
    End
    Else
    Begin
        set @Content = dbo.GetTranslation('SP_Auction_Update.Msg7')--'您所拍卖的  '+ @Name + '  被 <'+@BuyerName+'> 购买,一共获得' + cast(@Price as varchar(20))  +'点券!'
    End

    set @Content = REPLACE(@Content,'{0}',@Name)
    set @Content = REPLACE(@Content,'{1}',@BuyerName)
    set @Content = REPLACE(@Content,'{2}',cast(@Price as varchar(20)))
    set @Content = REPLACE(@Content,'{4}',cast(@NewPrice as varchar(20)))
    set @Remark = 'Gold:'+cast(@Gold as varchar(20))+',Money:'+cast(@NewPrice as varchar(20))+',Annex1:'+@Annex1+',Annex2:'+@Annex2

        INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark)
     VALUES( @SenderID, @Sender, @AuctioneerID, @AuctioneerName, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, @Gold, @NewPrice, 1,2,@Remark)

     if @@error<>0
       begin
        rollback tran
        return 5
       end

    end

commit tran
set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_AutoOut_Access]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		小危
-- ALTER  date: 2009-06-18
-- Description:	自动导出成指定一天的Access文件
-- =============================================
CREATE  PROCEDURE [dbo].[SP_AutoOut_Access]
  @CurrentDate DateTime
AS
Begin

/*第一步：定义初始数据*/
Declare @ApplicationId int                --定义当前游戏类型
Declare @SubId Int                        --定义当前代理商
Select Top 1 @ApplicationId=ApplicationId,@SubId=SubId from Db_Count.dbo.Count_Application_Sub
Declare @Op_Date DateTime                 --自动指定一天时间
--Set @Op_Date=DateAdd(Day,-1,Getdate())  --手动指定一天如“DateAdd(Day,-1,Getdate())”表示昨天的数据
Set @Op_Date=@CurrentDate
Declare @FilePath Varchar(200)  --定义当前日志保存位置
Set @FilePath='D:\GameLog\access'
Declare @FileName Varchar(200)  --定义今天的文件
Set @FileName= Cast(@ApplicationId As Varchar(20))+'_'+Cast(@SubId As Varchar(20))+'_'+Convert(varchar(10),@Op_Date,112)+'_'+'dbcount.mdb'
Declare @FileAll Varchar(200)   --定义当前文件完整路径
Set @FileAll=@FilePath+'\'+@FileName
Declare @Op Varchar(200)        --定义操作方式
Set @Op='copy '+@FilePath+'\dbcount.mdb ' +@FileAll
Exec master..xp_cmdshell  @Op   --先Copy一个新文件

/*第二步：向Access插入数据*/
Declare  @SqlString Varchar(4000)
--加入的用户资料(近三天)
Set @SqlString='
insert into   OPENROWSET(''Microsoft.Jet.OLEDB.4.0'', '''+@FileAll+''';''admin'';'''', Old_UserInfo)
       (ApplicationId, SubId,UserID, UserName, NickName, Date, IsConsortia, ConsortiaID, Sex, Win, Total, GP, Honor, Gold, Money, Grade, State, IsFirst, Repute,
        LastDate, ChargeDate, ExpendDate, ActiveIP, ForbidDate, LastDateSecond, LastDateThird, LoginCount, OnlineTime)
SELECT  '+Cast(@ApplicationId As  Varchar(10))+','+Cast(@SubId As  Varchar(10))+', UserID, left(UserName,50), NickName, Date, IsConsortia, ConsortiaID, Sex, Win, Total, GP, Honor, Gold, Money, Grade, State, IsFirst, Repute,
        LastDate, ChargeDate, ExpendDate, ActiveIP, ForbidDate, LastDateSecond, LastDateThird, LoginCount, OnlineTime
FROM    Sys_Users_Detail with(nolock)
        Where  Convert(Char(10), date,120)='''+Convert(Char(10),@Op_Date,120)+''' Or Convert(Char(10), lastdate,120)='''+Convert(Char(10),@Op_Date,120)+''' Or Convert(Char(10), LastDateSecond,120)='''+Convert(Char(10),@Op_Date,120)+'''  Or Convert(Char(10), LastDateThird,120)='''+Convert(Char(10),@Op_Date,120)+''' '
Exec (@SqlString)





--加入用户充值信息
Set @SqlString='
insert into   OPENROWSET(''Microsoft.Jet.OLEDB.4.0'', '''+@FileAll+''';''admin'';'''', Old_PayMent)
       (ApplicationId,SubId, ChargeID, UserName, Money, Date, CanUse, PayWay, NeedMoney, IP)
SELECT  '+Cast(@ApplicationId As  Varchar(10))+','+Cast(@SubId As  Varchar(10))+', ChargeID, UserName, Money, Date, CanUse, PayWay, NeedMoney, IP
FROM    Charge_Money with(nolock)
        Where Convert(Char(10),date,120)='''+Convert(Char(10),@Op_Date,120)+''''
Exec (@SqlString)
End

GO
/****** Object:  StoredProcedure [dbo].[SP_Ball_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<字弹信息：显示全部记录>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Ball_All]
AS
 select *  from Ball
GO
/****** Object:  StoredProcedure [dbo].[SP_Charge_Money_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户充值:给用户充值>
-- =============================================
CREATE  Procedure [dbo].[SP_Charge_Money_Add]
@ChargeID varchar(50),
@UserName Nvarchar(200),
@Money int,
@Date Nvarchar(50),
@PayWay Nvarchar(200),
@NeedMoney decimal(9,2),
@UserID int output,
@IP nvarchar(50),
@NickName nvarchar(200)
as

if @NickName is null or @NickName=''
begin
    select @UserID=isnull(UserID,0),@NickName=NickName from Sys_Users_Detail where UserName=@UserName
end
else
begin
    select @UserID=isnull(UserID,0) from Sys_Users_Detail where UserName=@UserName and NickName=@NickName
    IF(@Userid=0)
      BEGIN
         SELECT @UserID=ISNULL(userID,0) FROM Rename_Nick WHERE UserName=@UserName AND NickName=@NickName
      END
end

if @UserID = 0
begin
  return 2
end

declare @count int
select @count=count(*) from Charge_Money where ChargeID=@ChargeID

if @count > 0
begin
  return 4
end

set xact_abort on
begin tran

insert into Charge_Money(ChargeID,UserName,[Money],[Date],CanUse,PayWay,NeedMoney,IP,NickName)
values(@ChargeID,@UserName,@Money,@Date,1,@PayWay,@NeedMoney,@IP,@NickName)

if @@Error <> 0
begin
 rollback tran
 return 1
end

update Sys_Users_Detail set ChargeDate = getdate() where UserID=@UserID

if @@Error <> 0
begin
 rollback tran
 return 1
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Charge_Money_UserId_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<XiaoV>
-- ALTER  date: <2009-10-22>
-- Description:	<用户充值:给用户充值>
-- =============================================
CREATE  Procedure [dbo].[SP_Charge_Money_UserId_Add]
@ChargeID varchar(50),
@UserName Nvarchar(200),
@Money int,
@Date Nvarchar(50),
@PayWay Nvarchar(200),
@NeedMoney decimal(9,2),
@UserID int output,
@IP nvarchar(50),
@SourceUserID int
as
Declare @NickName Nvarchar(200)
Select @UserID=isnull(UserID,0),@NickName=NickName from Sys_Users_Detail where UserName=@UserName And Userid=@SourceUserID
if @UserID = 0
begin
  return 2
end

declare @count int
select @count=count(*) from Charge_Money where ChargeID=@ChargeID
if @count > 0
begin
  return 4
end

set xact_abort on
begin tran

insert into Charge_Money(ChargeID,UserName,[Money],[Date],CanUse,PayWay,NeedMoney,IP,NickName)
       values(@ChargeID,@UserName,@Money,@Date,1,@PayWay,@NeedMoney,@IP,@NickName)

if @@Error <> 0
begin
 rollback tran
 return 1
end

update Sys_Users_Detail set ChargeDate = getdate() where UserID=@UserID

if @@Error <> 0
begin
 rollback tran
 return 1
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Charge_Record]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<充值信息：已废>
-- =============================================
CREATE Procedure [dbo].[SP_Charge_Record]
@Date datetime,
@Second int
as
select PayWay as 'PayWay',sum([money]) as 'money',
sum(case when sex=1 then 1 else 0 end) as 'TotalBoy',
sum(case when sex=1 then 0 else 1 end) as 'TotalGirl',
sum(case when sex=1 then [money] else 0 end) as 'BoyTotalPay',
sum(case when sex=1 then 0 else [money] end) as 'GirlTotalPay'
from V_Charge_Money where datediff(ss,[Date],@Date)<@Second and [Date]<=@Date group by PayWay

GO
/****** Object:  StoredProcedure [dbo].[SP_Charge_To_User]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<充值信息：将订单充值信息转入玩家帐号中>
-- =============================================
CREATE Procedure [dbo].[SP_Charge_To_User]
@UserName Nvarchar(200),
@money int out,
@NickName nvarchar(200)
as

select @money= isnull(sum(Money),0) from Charge_Money
where UserName = @UserName and CanUse=1 and (NickName=@NickName or NickName is null or NickName='')

if @money=0
begin
  return 0
end

set xact_abort on
begin tran

update Charge_Money set CanUse=0 where  UserName = @UserName and CanUse=1 and (NickName=@NickName or NickName is null or NickName='')

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Sys_Users_Detail set Money=Money + @money where UserName = @UserName and NickName=@NickName

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ClearAllMarryInfo]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Eric>
-- ALTER  date: <2009-10-22>
-- Description:	<清除结婚信息：已废>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ClearAllMarryInfo] AS
delete Marry_Room_Info
delete Marry_Info
update sys_users_detail set IsCreatedMarryRoom = 0,SpouseID=0,SpouseName='',IsMarried=0,MarryInfoID=0,SelfMarryRoomID=0,IsGotRing=0
GO
/****** Object:  StoredProcedure [dbo].[SP_ClearMarryInfo]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Eric>
-- ALTER  date: <2009-10-22>
-- Description:	<清除结婚信息：已废>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ClearMarryInfo]
@name nvarchar(50)
AS
delete Marry_Room_Info where GroomName=@name or BrideName=@name
update sys_users_detail set IsCreatedMarryRoom = 0,SpouseID=0,SpouseName='',IsMarried=0,SelfMarryRoomID=0,IsGotRing=0 where nickname=@name
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Eric>
-- ALTER  date: <2009-10-22>
-- Description:	<公会组织：创建一个公会>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Add]
 @ConsortiaID int output,
 @BuildDate DateTime,
 @CelebCount int,
 @ChairmanID int,
 @ChairmanName nvarchar(100),
 @ConsortiaName nvarchar(100),
 @CreatorID int,
 @CreatorName nvarchar(100),
 @Description nvarchar(1000),
 @Honor int,
 @IP nvarchar(100),
 @IsExist bit,
 @Level int,
 @MaxCount int,
 @Placard nvarchar(1000),
 @Port int,
 @Repute int,
 @Count int,
 @Riches int,
 @tempDutyLevel int output,
 @tempDutyName varchar(200) output,
 @tempRight int output

AS

declare @Same int
select @Same=count(*) from Consortia where ConsortiaName=@ConsortiaName and IsExist=1

if @same<>0
begin
  return 2
end

declare @ID int
declare @temp bit
select @ID=[ID],@temp=IsExist from Consortia_Users where UserID=@CreatorID
if @temp=1
begin
  return 3
end

 set @tempDutyLevel=1
 set @tempDutyName = dbo.GetTranslation('SP_Consortia_Add.Duty1')
 set @tempRight=4095

set xact_abort on
begin tran

insert into Consortia( BuildDate,CelebCount,ChairmanID,ChairmanName, ConsortiaName, CreatorID, CreatorName, [Description], Honor, IP, IsExist, [Level], MaxCount, Placard,Port,Repute,[Count],Riches)
values( @BuildDate,@CelebCount,@ChairmanID,@ChairmanName, @ConsortiaName, @CreatorID, @CreatorName, @Description, @Honor, @IP, @IsExist, @Level, @MaxCount, @Placard,@Port,@Repute,@Count,@Riches)
select @@identity as 'identity'
set @ConsortiaID=@@identity

if @@error<>0
begin
  rollback tran
  return 1
end

declare @DutyID int
insert into Consortia_Duty(ConsortiaID,[Level],DutyName,[Right],IsExist)
values(@ConsortiaID,1,dbo.GetTranslation('SP_Consortia_Add.Duty1'),4095,1)
select @@identity as 'identity'
set @DutyID=@@identity

if @@error<>0
begin
  rollback tran
  return 1
end

insert into Consortia_Duty(ConsortiaID,[Level],DutyName,[Right],IsExist)
values(@ConsortiaID,2,dbo.GetTranslation('SP_Consortia_Add.Duty2'),6191,1)

if @@error<>0
begin
  rollback tran
  return 1
end

insert into Consortia_Duty(ConsortiaID,[Level],DutyName,[Right],IsExist)
values(@ConsortiaID,3,dbo.GetTranslation('SP_Consortia_Add.Duty3'),4103,1)

if @@error<>0
begin
  rollback tran
  return 1
end

insert into Consortia_Duty(ConsortiaID,[Level],DutyName,[Right],IsExist)
values(@ConsortiaID,4,dbo.GetTranslation('SP_Consortia_Add.Duty4'),4096,1)

if @@error<>0
begin
  rollback tran
  return 1
end

insert into Consortia_Duty(ConsortiaID,[Level],DutyName,[Right],IsExist)
values(@ConsortiaID,5,dbo.GetTranslation('SP_Consortia_Add.Duty5'),4096,1)

if @@error<>0
begin
  rollback tran
  return 1
end

if @ID is null or @ID=0
begin

insert into Consortia_Users(ConsortiaID,UserID,UserName,RatifierID,RatifierName,DutyID,Remark,IsExist,IsBanChat)
values(@ConsortiaID,@CreatorID,@CreatorName,@CreatorID,@CreatorName,@DutyID,'',1,0)

if @@error<>0
begin
  rollback tran
  return 1
end

end
else
begin

update Consortia_Users set ConsortiaID=@ConsortiaID,RatifierID=@CreatorID,RatifierName=@CreatorName,DutyID=@DutyID,Remark='',IsExist=1,IsBanChat=0
where [ID]=@ID

if @@error<>0
begin
  rollback tran
  return 1
end

end

--insert into Consortia_Ally( Consortia1ID,Consortia2ID,State,Date,ValidDate,IsExist)
--select @ConsortiaID,ConsortiaID,0,getdate(),0,1 from Consortia where ConsortiaID<>@ConsortiaID and IsExist=1

--if @@error<>0
--begin
--  rollback tran
--  return @@error
--end

Update Sys_Users_Detail set ConsortiaID = @ConsortiaID,IsConsortia=1 where  UserID=@CreatorID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Eric>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：显示已存在公会>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_All]
 AS
   begin
     select * from Consortia where IsExist=1
   end



GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Ally_Neutral]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<会会组织：查找公会关系>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Ally_Neutral]
@ConsortiaID int
as
select Consortia1ID,Consortia2ID,State from Consortia_Ally
where IsExist=1  and (Consortia1ID =@ConsortiaID  or Consortia2ID = @ConsortiaID ) and state<>0
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_AllyByState]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会关系(中立、同盟、敌对)申请>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_AllyByState]
@ConsortiaID int,
@State int
 AS
   begin
     select Consortia2ID from Consortia_Apply_Ally where IsExist=1 and Consortia1ID=@ConsortiaID and State=@State
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Apply_State]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：是否开放公会申请>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Apply_State]
 @ConsortiaID int,
 @UserID int,
 @State bit
AS

update Consortia set OpenApply=@State where ConsortiaID=@ConsortiaID and ChairmanID=@UserID and IsExist=1

if @@ROWCOUNT=0
begin
  return 2
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：解散一个公会>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_Consortia_Delete]
 @ConsortiaID int,
 @UserID int
AS

declare @Count INT
select @Count=count(*) from Consortia where ConsortiaID=@ConsortiaID and ChairmanID=@UserID and IsExist=1
if @Count is null or @Count=0
begin
  return 2
end

/*四级以上公会不允许解散*/
SELECT @Count=ISNULL(COUNT(*),0) FROM dbo.Consortia WHERE  ConsortiaID=@ConsortiaID AND Level>=4
IF(@Count=1)
BEGIN
  RETURN 3
END



set xact_abort on
begin tran

Update Consortia_Equip_Control set IsExist = 0 where  ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia set IsExist = 0 where  ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Apply_Users set IsExist = 0 where  ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Invite_Users set IsExist = 0 where  ConsortiaID=@ConsortiaID   and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Apply_Ally set IsExist = 0 where  (Consortia1ID=@ConsortiaID or Consortia2ID=@ConsortiaID) and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Duty set IsExist = 0 where  ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Users set IsExist = 0 where  ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Ally set IsExist = 0 where  (Consortia1ID=@ConsortiaID or Consortia2ID=@ConsortiaID) and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Event set IsExist = 0 where  ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Sys_Users_Detail set ConsortiaID = 0,RichesOffer=0,RichesRob=0 where  ConsortiaID=@ConsortiaID

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0

GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Equip_Control_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会财富控制权限>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Equip_Control_Add]
 @ConsortiaID int,
 @Level int,
 @Type int,
 @Riches int,
 @UserID int
AS

declare  @count int
select @count= count(*) from Consortia where ConsortiaID=@ConsortiaID and ChairmanID=@UserID and IsExist=1

if @count is null or @count=0
begin
  return 2
end

declare  @temp int
select @temp = count(*) from Consortia_Equip_Control where ConsortiaID=@ConsortiaID and [Level]=@Level and Type=@Type
if @temp=0
   begin
     INSERT INTO Consortia_Equip_Control(ConsortiaID, [Level],Type, Riches,IsExist)
     VALUES(@ConsortiaID, @Level,@Type, @Riches,1)
 end
 else
   begin
     UPDATE Consortia_Equip_Control Set  Riches=@Riches, IsExist=1 WHERE ConsortiaID=@ConsortiaID and [Level]=@Level and Type=@Type
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Equip_Control_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：显示一条公会相关(铁匠铺、商城)等级财富信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Equip_Control_Single]
 @ConsortiaID int,
 @Level int,
 @Type int

AS


select * from Consortia_Equip_Control where ConsortiaID=@ConsortiaID and [Level]=@Level and Type=@Type



GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Fight]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会战后的财富计算>
-- =============================================
CREATE  Procedure [dbo].[SP_Consortia_Fight]
@ConsortiaWin int,
@ConsortiaLose int,
@PlayerCount int,
@Riches int output,
@State int,
@TotalKillHealth int,
@RichesRate numeric(6,2)
as

if @PlayerCount<1
begin
	return 6
end

declare @WinLevel int
declare @LoseLevel int
declare @WinRiches int
declare @LoseRiches int

select @WinLevel=[Level],@WinRiches=Riches from Consortia where ConsortiaID=@ConsortiaWin and IsExist=1

if @WinLevel is null
begin
	return 7
end

if @WinLevel<3
begin
	return 1
end

select @LoseLevel=[Level],@LoseRiches=Riches from Consortia where ConsortiaID=@ConsortiaLose and IsExist=1

if @LoseLevel is null
begin
	return 8
end

if @LoseLevel<3
begin
	return 2
end

--if @LoseRiches<1
--begin
--	return 3
--end

declare @modulus int
if @State=2
begin
	set @modulus=2
end
else
begin
	set @modulus=1
end

--中立公会=（20+（对方公会等级-3）*4）*对方参战人数
--敌对公会=（40+（对方公会等级-3）*8）*对方参战人数

--set @Riches = (@LoseLevel -2)*20*@modulus*@PlayerCount
--set @Riches = 10*@modulus*@PlayerCount
--set @Riches = (20+(@LoseLevel-3)*4) *@PlayerCount*@modulus

--if @LoseRiches<@Riches
--begin
--	set @Riches = @LoseRiches
--end

--中立公会=|（对方参战人数+|队伍总伤害/2000|）/2|
--敌对公会=对方参战人数+|队伍总伤害/2000|
set @Riches = (@PlayerCount + @TotalKillHealth/2000)*@modulus/2*@RichesRate


set xact_abort on
begin tran

update  Consortia set Riches=Riches+@Riches,WarnDate=getdate()  where ConsortiaID=@ConsortiaWin

if @@Error <> 0
begin
 rollback tran
 return 4
end

--update  Consortia set Riches=Riches-@Riches,WarnDate=getdate()  where ConsortiaID=@ConsortiaLose

--if @@Error <> 0
--begin
-- rollback tran
-- return 5
--end

commit tran
set xact_abort off

select @Riches
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Level_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会升级标准>
-- =============================================
CREATE Procedure [dbo].[SP_Consortia_Level_All]
as

 select * from Consortia_Level


GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Riches_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：捐献公会财富>
-- =============================================
CREATE Procedure [dbo].[SP_Consortia_Riches_Add]
@ConsortiaID int,
@Riches int output,
@Type int,
@UserName Nvarchar(100)
as

declare @OrdRiches int
select @OrdRiches=Riches from Consortia where ConsortiaID=@ConsortiaID and IsExist=1

if @OrdRiches is null
begin
	return  2
end

if @Riches<0 and @OrdRiches<-@Riches
begin
	set @Riches = -@OrdRiches
end

set xact_abort on
begin tran

update  Consortia set Riches=Riches+@Riches,WarnDate=getdate()  where ConsortiaID=@ConsortiaID

if @@error <> 0
begin
  rollback tran
  return 3
end

declare @Remark1 nvarchar(100)

if @Type=5
begin
  set @Remark1=dbo.GetTranslation('SP_Consortia_Riches_Add.Msg1')
set @Remark1 = REPLACE(@Remark1,'{0}',@UserName)
set @Remark1 = REPLACE(@Remark1,'{1}',@Riches)
insert into Consortia_Event(ConsortiaID,Remark,[Date],IsExist,Type)
values(@ConsortiaID,@Remark1,getdate(),1,@Type)


if @@error<>0
begin
  rollback tran
  return 4
end

end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Scan]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会每周扣除财富，将不足财富公会清除>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Scan]
 @NoticeID nvarchar(4000) output

AS
set @NoticeID=''
set xact_abort on
begin tran

update Consortia set @NoticeID =@NoticeID + cast(ConsortiaID as varchar(20)) + ',',IsExist=0  where datediff(dd, WarnDate,getdate())>14 and IsExist=1

if @@error <> 0
begin
  rollback tran
  return 1
end

if len(@NoticeID)>0
begin
 set @NoticeID = substring(@NoticeID,1,len(@NoticeID)-1)

declare @ConsortiaIDs nvarchar(4000)
declare @s nvarchar(4000)
set @ConsortiaIDs = ' (' + @NoticeID + ') '

/*
set @s = 'Update Consortia set IsExist = 0 where  ConsortiaID in ' + @ConsortiaIDs + ' and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end*/

set @s = 'Update Consortia_Equip_Control set IsExist = 0 where  ConsortiaID in ' + @ConsortiaIDs + ' and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end

set @s = 'Update Consortia_Apply_Users set IsExist = 0 where  ConsortiaID in ' + @ConsortiaIDs + ' and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end

set @s = 'Update Consortia_Invite_Users set IsExist = 0 where  ConsortiaID in  ' +@ConsortiaIDs   + ' and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end

set @s = 'Update Consortia_Apply_Ally set IsExist = 0 where  (Consortia1ID in ' +@ConsortiaIDs + ' or Consortia2ID in ' +@ConsortiaIDs+ ' ) and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end

set @s = 'Update Consortia_Duty set IsExist = 0 where  ConsortiaID in ' + @ConsortiaIDs+ ' and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end

set @s = 'Update Consortia_Users set IsExist = 0 where  ConsortiaID in ' + @ConsortiaIDs + ' and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end

set @s = 'Update Consortia_Ally set IsExist = 0 where  (Consortia1ID in ' +@ConsortiaIDs + ' or Consortia2ID in ' + @ConsortiaIDs + ' ) and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end

set @s = 'Update Consortia_Event set IsExist = 0 where  ConsortiaID in ' + @ConsortiaIDs+ ' and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end

set @s = 'Update Sys_Users_Detail set ConsortiaID = 0,RichesOffer=0,RichesRob=0 where  ConsortiaID in ' +@ConsortiaIDs+ '  and IsExist=1'
exec(@s)

if @@error<>0
begin
  rollback tran
  return @@error
end

end

update Consortia set DeductDate=getdate(),WarnDate=(case when a.Riches>0 then getdate() else a.WarnDate end), Riches=Riches - (select (case when a.Riches>b.Deduct then  Deduct else a.Riches end) from Consortia_Level b where b.[Level]=a.[Level])
  from Consortia a where datediff(dd, DeductDate,getdate())>7 and IsExist=1

if @@error <> 0
begin
  rollback tran
  return 2
end

commit tran
set xact_abort off

/*
if len(@NoticeID)>0
begin
 set @NoticeID = substring(@NoticeID,1,len(@NoticeID)-1)
end*/

select @NoticeID

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Shop_UpGrade]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会商城升级>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Shop_UpGrade]
 @ConsortiaID int,
 @UserID int
AS

declare @Level int
declare @Riches int
declare @ShopLevel int
select @Level=[Level],@Riches=Riches,@ShopLevel=ShopLevel from Consortia where ConsortiaID=@ConsortiaID and ChairmanID=@UserID and IsExist=1

if @Level is null or @Level=0
begin
  return 2
end

if @Level/2<=@ShopLevel
begin
  return 3
end


set @ShopLevel=@ShopLevel+1

declare @ShopRiches int
select @ShopRiches=ShopRiches from Consortia_Level where [Level]=@ShopLevel

if @ShopRiches is null or @ShopRiches=0
begin
  return 4
end

if @Riches<@ShopRiches
begin
  return 5
end

--set @Riches=@Riches+@Reward-@NeedRiches

Update Consortia set ShopLevel=ShopLevel+1,Riches=@Riches-@ShopRiches where ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  return @@error
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：读到一条有效公会信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Single]
 @ID int
AS

   begin
     select * from Consortia WHERE ConsortiaID=@ID and IsExist = 1
   end

GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Smith_UpGrade]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会铁匠铺升级>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Smith_UpGrade]
 @ConsortiaID int,
 @UserID int
AS

declare @Level int
declare @Riches int
declare @SmithLevel int
select @Level=[Level],@Riches=Riches,@SmithLevel=SmithLevel from Consortia where ConsortiaID=@ConsortiaID and ChairmanID=@UserID and IsExist=1

if @Level is null or @Level=0
begin
  return 2
end

if @Level<=@SmithLevel
begin
  return 3
end


set @SmithLevel=@SmithLevel+1

declare @SmithRiches int
select @SmithRiches=SmithRiches from Consortia_Level where [Level]=@SmithLevel

if @SmithRiches is null or @SmithRiches=0
begin
  return 4
end

if @Riches<@SmithRiches
begin
  return 5
end

--set @Riches=@Riches+@Reward-@NeedRiches

Update Consortia set SmithLevel=SmithLevel+1,Riches=@Riches-@SmithRiches where ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  return @@error
end

return 0


GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_Store_UpGrade]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会保管箱升级>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_Store_UpGrade]
 @ConsortiaID int,
 @UserID int
AS

declare @Level int
declare @Riches int
declare @StoreLevel int
select @Level=[Level],@Riches=Riches,@StoreLevel=StoreLevel from Consortia where ConsortiaID=@ConsortiaID and ChairmanID=@UserID and IsExist=1

if @Level is null or @Level=0
begin
  return 2
end

if @Level<=@StoreLevel
begin
  return 3
end


set @StoreLevel=@StoreLevel+1

declare @StoreRiches int
select @StoreRiches=StoreRiches from Consortia_Level where [Level]=@StoreLevel

if @StoreRiches is null or @StoreRiches=0
begin
  return 4
end

if @Riches<@StoreRiches
begin
  return 5
end

--set @Riches=@Riches+@Reward-@NeedRiches

Update Consortia set StoreLevel=StoreLevel+1,Riches=@Riches-@StoreRiches where ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  return @@error
end

return 0

GO
/****** Object:  StoredProcedure [dbo].[SP_Consortia_UpGrade]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会升级>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Consortia_UpGrade]
 @ConsortiaID int,
 @UserID int
AS

declare @Level int
declare @Riches int
select @Level=[Level],@Riches=Riches from Consortia where ConsortiaID=@ConsortiaID and ChairmanID=@UserID and IsExist=1

if @Level is null or @Level=0
begin
  return 2
end

set @Level=@Level+1

declare @NeedRiches int
declare @Count int
declare @Reward int
select @NeedRiches=Riches,@Count=[Count],@Reward=Reward from Consortia_Level where [Level]=@Level

if @Count is null or @Count=0
begin
  return 3
end

if @Riches<@NeedRiches
begin
  return 4
end

set @Riches=@Riches+@Reward-@NeedRiches

Update Consortia set [Level]=@Level,MaxCount=@Count,Riches=@Riches where ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  return @@error
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaAlly_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：新建公会关系>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaAlly_Add]
 @ID int output,
 @Consortia1ID int,
 @Consortia2ID int,
 @State int,
 @Date datetime,
 @ValidDate int,
 @IsExist bit,
 @UserID int
AS

declare @Right int
select @Right=[Right] from V_Consortia_Users where ConsortiaID=@Consortia1ID and UserID=@UserID and IsExist=1

if @Right is null or (@Right&64)=0
begin
  return 2
end

declare @AllyID int
declare @OldState int
select @AllyID=[ID],@OldState=State from Consortia_Ally where (Consortia2ID=@Consortia1ID and Consortia1ID=@Consortia2ID) or (Consortia2ID=@Consortia2ID and Consortia1ID=@Consortia1ID)

if  @State=1
begin
  return 4
end

if  @State=0 and @OldState=2
begin
  return 4
end


declare @Consortia1Name nvarchar(200)
declare @Consortia2Name nvarchar(200)

select @Consortia1Name=ConsortiaName from Consortia where ConsortiaID=@Consortia1ID and IsExist=1
if @Consortia1Name is null or @Consortia1Name=''
begin
  return 3
end

select @Consortia2Name=ConsortiaName from Consortia where ConsortiaID=@Consortia2ID and IsExist=1
if @Consortia2Name is null or @Consortia2Name=''
begin
  return 3
end

set xact_abort on
begin tran

Update Consortia_Apply_Ally set IsExist = 0 where Consortia2ID=@Consortia1ID and Consortia1ID=@Consortia2ID and IsExist = 1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Apply_Ally set IsExist = 0 where Consortia2ID=@Consortia2ID and Consortia1ID=@Consortia1ID and IsExist = 1

if @@error<>0
begin
  rollback tran
  return @@error
end


if @AllyID is null or @AllyID=0
begin
  insert into Consortia_Ally(Consortia1ID,Consortia2ID,State,[Date],ValidDate,IsExist)
  values(@Consortia1ID,@Consortia2ID,@State,@Date,@ValidDate,@IsExist)

if @@error<>0
begin
  rollback tran
  return @@error
end

end
else
begin
  update Consortia_Ally set IsExist=@IsExist,State=@State,[Date]=@Date,ValidDate= @ValidDate where [ID]=@AllyID

if @@error<>0
begin
  rollback tran
  return @@error
end

end

declare @Remark1 nvarchar(100)
declare @Remark2 nvarchar(100)
declare @Remark3 nvarchar(100)
declare @Remark4 nvarchar(100)
declare @Type int
if @State=2
begin
/*  set @Remark1='<'
  set @Remark2='> 向你们宣战，成为敌对状态!'
  set @Remark3='你们向 <'
  set @Remark4='> 宣战，成为敌对状态!'*/
  set @Remark1=dbo.GetTranslation('SP_ConsortiaAlly_Add.Msg1')--'<{0}> 向你们宣战，成为敌对状态!'
  set @Remark3=dbo.GetTranslation('SP_ConsortiaAlly_Add.Msg2')--'你们向 <{0}> 宣战，成为敌对状态!'
  set @Type=1
end
else
begin
  --set @Remark='公会与你们中立!'
 /* set @Remark1='<'
  set @Remark2='> 与你们解除盟约，相互中立!'
  set @Remark3='你们与 <'
  set @Remark4='> 解除盟约，相互中立!'*/
  set @Remark1=dbo.GetTranslation('SP_ConsortiaAlly_Add.Msg3')--'<{0}> 与你们解除盟约，相互中立!'
  set @Remark3=dbo.GetTranslation('SP_ConsortiaAlly_Add.Msg4')--'你们与 <{0}> 解除盟约，相互中立!'
  set @Type=4
end

/*insert into Consortia_Event(ConsortiaID,Remark,[Date],IsExist)
values(@Consortia1ID,@Remark3 + @Consortia2Name + @Remark4,getdate(),1)*/
set @Remark3 = REPLACE(@Remark3,'{0}',@Consortia2Name)
insert into Consortia_Event(ConsortiaID,Remark,[Date],IsExist,Type)
values(@Consortia1ID,@Remark3,getdate(),1,@Type)

if @@error<>0
begin
  rollback tran
  return @@error
end

--insert into Consortia_Event(ConsortiaID,Remark,[Date],IsExist)
--values(@Consortia2ID,@Consortia1Name + '公会与你们宣战!',getdate(),1)
set @Remark1 = REPLACE(@Remark1,'{0}',@Consortia1Name)
insert into Consortia_Event(ConsortiaID,Remark,[Date],IsExist,Type)
values(@Consortia2ID,@Remark1,getdate(),1,@Type)

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off


return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaAlly_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：显示全部公会同盟关系>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaAlly_All]
 AS
   begin
     select * from Consortia_Ally where IsExist=1
   end


GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaApplyAlly_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：申请公会关系建立>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaApplyAlly_Add]
 @ID int output,
 @Consortia1ID int,
 @Consortia2ID int,
 @Date datetime,
 @Remark nvarchar(100),
 @IsExist bit,
 @UserID int,
 @State int
AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@Consortia1ID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&64)=0
begin
  return 2
end

declare @Count int
select @Count=Count(*) from Consortia where ConsortiaID=@Consortia2ID

if @Count is null or @Count=0
begin
  return 3
end

select @Count=Count(*) from Consortia_Ally where ((Consortia2ID=@Consortia1ID and Consortia1ID=@Consortia2ID) or (Consortia2ID=@Consortia2ID and Consortia1ID=@Consortia1ID)) and State=@State and IsExist=1

if @Count=1
begin
  return 4
end

select @ID=[ID] from Consortia_Apply_Ally where Consortia1ID=@Consortia1ID and Consortia2ID=@Consortia2ID


if @ID is null or @ID=0
begin
  insert into Consortia_Apply_Ally(Consortia1ID,Consortia2ID,[Date],Remark,IsExist,State)
  values(@Consortia1ID,@Consortia2ID,@Date,@Remark,@IsExist,@State)
  select @@identity as 'identity'
  set @ID=@@identity

  if @@error<>0
  begin
    return @@error
  end
end
else
begin
  update Consortia_Apply_Ally set [Date]=@Date,Remark=@Remark,IsExist=1,State=@State where Consortia1ID=@Consortia1ID and Consortia2ID=@Consortia2ID

  if @@error<>0
  begin
    return @@error
  end
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaApplyAlly_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：清除公会关系>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaApplyAlly_Delete]
 @ID int,
 @UserID int,
 @ConsortiaID int
AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&64)=0
begin
  return 2
end

Update Consortia_Apply_Ally set IsExist = 0 where [ID]=@ID and Consortia2ID=@ConsortiaID

if @@error<>0
begin
  return @@error
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaApplyAlly_Pass]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会关系(中立、同盟、敌对)申请通过>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaApplyAlly_Pass]
 @ID int,
 @UserID int,
 @ConsortiaID int,
 @tempID int output,
 @State int output
AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&64)=0
begin
  return 2
end

--declare @tempID int
select @tempID=Consortia1ID,@State=State from  Consortia_Apply_Ally where [ID]=@ID and Consortia2ID=@ConsortiaID and IsExist=1

if @tempID is null or @tempID=0
begin
  return 3
end

declare @AllyID int
select @AllyID=[ID] from Consortia_Ally where ((Consortia2ID=@ConsortiaID and Consortia1ID=@tempID) or (Consortia2ID=@tempID and Consortia1ID=@ConsortiaID))

--if @AllyID is null or @AllyID=0
--begin
  --return 4
--end

declare @Consortia1Name nvarchar(200)
declare @Consortia2Name nvarchar(200)

select @Consortia1Name=ConsortiaName from Consortia where ConsortiaID=@ConsortiaID and IsExist=1
if @Consortia1Name is null or @Consortia1Name=''
begin
  return 5
end

select @Consortia2Name=ConsortiaName from Consortia where ConsortiaID=@tempID and IsExist=1
if @Consortia2Name is null or @Consortia2Name=''
begin
  return 5
end

set xact_abort on
begin tran

Update Consortia_Apply_Ally set IsExist = 0 where Consortia2ID=@ConsortiaID and Consortia1ID=@tempID and IsExist = 1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Apply_Ally set IsExist = 0 where Consortia2ID=@tempID and Consortia1ID=@ConsortiaID and IsExist = 1

if @@error<>0
begin
  rollback tran
  return @@error
end

if @AllyID is null or @AllyID=0
begin
  insert into Consortia_Ally(Consortia1ID,Consortia2ID,State,[Date],ValidDate,IsExist)
  values(@ConsortiaID,@tempID,@State,getdate(),0,1)

if @@error<>0
begin
  rollback tran
  return @@error
end

end
else
begin
  update Consortia_Ally set IsExist=1,State=@State,[Date]=getdate() where [ID]=@AllyID

if @@error<>0
begin
  rollback tran
  return @@error
end
end

declare @Remark1 nvarchar(100)
declare @Remark2 nvarchar(100)
declare @Remark3 nvarchar(100)
declare @Remark4 nvarchar(100)
declare @Type int
if @State=1
begin
 /* set @Remark1='你们与 <'
  set @Remark2='> 成功结盟!'
  set @Remark3='<'
  set @Remark4='> 与你们成功结盟!'*/
  set @Remark1=dbo.GetTranslation('SP_ConsortiaApplyAlly_Pass.Msg1')--'你们与 <{0}> 成功结盟!'
  set @Remark3=dbo.GetTranslation('SP_ConsortiaApplyAlly_Pass.Msg2')--'<{0}> 与你们成功结盟!'
  set @Type=3
end
else
begin
  --set @Remark='公会与你们中立!'
  /*set @Remark1='你们与 <'
  set @Remark2='> 议和成功，相互中立!'
  set @Remark3='<'
  set @Remark4='> 与你们议和成功，相互中立!'*/
  set @Remark1=dbo.GetTranslation('SP_ConsortiaApplyAlly_Pass.Msg3')--'你们与 <{0}> 议和成功，相互中立!'
  set @Remark3=dbo.GetTranslation('SP_ConsortiaApplyAlly_Pass.Msg4')--'<{0}> 与你们议和成功，相互中立!'
  set @Type=2
end

/*insert into Consortia_Event(ConsortiaID,Remark,[Date],IsExist)
values(@ConsortiaID,@Remark3 + @Consortia2Name + @Remark4,getdate(),1)*/
set @Remark3 = REPLACE(@Remark3,'{0}',@Consortia2Name)
insert into Consortia_Event(ConsortiaID,Remark,[Date],IsExist,Type)
values(@ConsortiaID,@Remark3,getdate(),1,@Type)

if @@error<>0
begin
  rollback tran
  return @@error
end

/*insert into Consortia_Event(ConsortiaID,Remark,[Date],IsExist)
values(@tempID,@Remark1 + @Consortia1Name + @Remark2,getdate(),1)*/
set @Remark1 = REPLACE(@Remark1,'{0}',@Consortia1Name)
insert into Consortia_Event(ConsortiaID,Remark,[Date],IsExist,Type)
values(@tempID,@Remark1,getdate(),1,@Type)

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaApplyUser_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：用户申请加入公会>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaApplyUser_Add]
 @ID int output,
 @ApplyDate DateTime,
 @ConsortiaID int,
 @ConsortiaName nvarchar(100),
 @IsExist bit,
 @Remark nvarchar(100),
 @UserID int,
 @UserName nvarchar(100)
AS
/*
if @ConsortiaID=0
begin
  update Consortia_Apply_Users set IsExist=0 where UserID=@UserID and IsExist=1
  return 0
end

select @ConsortiaName=ConsortiaName from Consortia where ConsortiaID=@ConsortiaID

if @ConsortiaName is null or @ConsortiaName=''
begin
  return 2
end*/

declare @Count int
declare @MaxCount int
select @ConsortiaName=ConsortiaName,@Count=[Count],@MaxCount=MaxCount from Consortia where @ConsortiaID=ConsortiaID and IsExist=1

if @ConsortiaName is null or @ConsortiaName=''
begin
  return 2
end

if @Count is null or @Count+1>@MaxCount
begin
  return 6
end

--declare @Count int
select @Count=count(*) from Consortia_Apply_Users where UserID=@UserID and @ConsortiaID=ConsortiaID

if @Count=0
begin
  insert into Consortia_Apply_Users(ConsortiaID,ConsortiaName,UserID,UserName,ApplyDate,Remark,IsExist)
  values(@ConsortiaID,@ConsortiaName,@UserID,@UserName,@ApplyDate,@Remark,@IsExist)
  select @@identity as 'identity'
  set @ID=@@identity

  if @@error<>0
  begin
    return @@error
  end
end
else
begin
  update Consortia_Apply_Users set ConsortiaID=@ConsortiaID,ConsortiaName=@ConsortiaName,ApplyDate=@ApplyDate,Remark=@Remark,IsExist=1 where UserID=@UserID and @ConsortiaID=ConsortiaID

  if @@error<>0
  begin
    return @@error
  end
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaApplyUser_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：删除用户申请信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaApplyUser_Delete]
 @ID int,
 @UserID int,
 @ConsortiaID int
AS

if @ConsortiaID<>0
begin

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&1)=0
begin
  return 2
end

Update Consortia_Apply_Users set IsExist = 0 where [ID]=@ID and ConsortiaID=@ConsortiaID

if @@error<>0
begin
  return @@error
end

end
else
begin

declare @tempID int
select @tempID=UserID from Consortia_Apply_Users where  [ID]=@ID and IsExist=1

if @tempID is null or @tempID<>@UserID
begin
  return 3
end

Update Consortia_Apply_Users set IsExist = 0 where [ID]=@ID

if @@error<>0
begin
  return @@error
end

end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaApplyUser_Pass]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：用户申请通过操作>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaApplyUser_Pass]
 @ID int,
 @UserID int,
 @UserName nvarchar(100),
 @ConsortiaID int,
 @tempID int output,
 @tempName nvarchar(100) output,
 @tempDutyID int output,
 @tempDutyName nvarchar(100) output,
 @tempOffer int output,
 @tempRichesOffer int output,
 @tempRichesRob int output,
 @tempLastDate datetime output,
 @tempWin int output,
 @tempTotal int output,
 @tempEscape int output,
 @tempGrade int output,
 @tempLevel int output,
 @tempCUID int output,
 @tempState int output,
 @tempSex int output,
 @tempDutyRight int output,
 @tempConsortiaRepute int output,
 @tempLoginName  nvarchar(100) output

AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&1)=0
begin
  return 2
end

--declare @tempID int
--declare @tempName nvarchar(100)
declare @DutyID int

select @tempID=UserID,@tempName=UserName from  Consortia_Apply_Users where [ID]=@ID and ConsortiaID=@ConsortiaID and IsExist=1

if @tempID is null or @tempID=0
begin
  return 3
end

declare @Count int
declare @MaxCount int
select @Count=[Count],@MaxCount=MaxCount,@tempConsortiaRepute=Repute from Consortia where @ConsortiaID=ConsortiaID and IsExist=1

if @Count is null or @Count+1>@MaxCount
begin
  return 6
end


select @DutyID=DutyID,@tempDutyID=DutyID,@tempDutyName=DutyName,@tempLevel=[Level],@tempDutyRight=[Right] from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1 and [Level] in (select Max([Level]) from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1)

if @DutyID is null or @DutyID=0
begin
  return 4
end

declare @orderID int
declare @temp bit
select @orderID=[ID],@temp=IsExist from Consortia_Users where UserID=@tempID
if @temp=1
begin
  return 5
end

set xact_abort on
begin tran

Update Consortia_Apply_Users set IsExist = 0 where UserID=@tempID and IsExist = 1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Invite_Users set IsExist = 0 where UserID=@tempID and IsExist = 1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia set [Count] = [Count]+1 where ConsortiaID=@ConsortiaID

if @@error<>0
begin
  rollback tran
  return @@error
end

if @orderID is null or @orderID=0
begin

insert into Consortia_Users(ConsortiaID,UserID,UserName,RatifierID,RatifierName,DutyID,Remark,IsExist,IsBanChat)
values(@ConsortiaID,@tempID,@tempName,@UserID,@UserName,@DutyID,'',1,0)

if @@error<>0
begin
  rollback tran
  return @@error
end

     select @@identity as 'identity'
     set @tempCUID=@@identity

end
else
begin

update Consortia_Users set ConsortiaID=@ConsortiaID,RatifierID=@UserID,RatifierName=@UserName,DutyID=@DutyID,Remark='',IsExist=1,IsBanChat=0
where [ID]=@orderID

if @@error<>0
begin
  rollback tran
  return @@error
end

set @tempCUID=@orderID

end

Update Sys_Users_Detail set ConsortiaID = @ConsortiaID,IsConsortia=1,@tempOffer=Offer,@tempRichesOffer=RichesOffer,@tempRichesRob=RichesRob,
@tempLastDate=LastDate,@tempWin=Win,@tempTotal=Total,@tempEscape=[Escape],@tempGrade=[Grade],@tempState=State,@tempSex=Sex,@tempLoginName=UserName
 where  UserID=@tempID

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaChangeChairman]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：转让会长>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaChangeChairman]
 @NickName nvarchar(200),
 @ConsortiaID int,
 @UserID int,
 @tempUserID int output,
 @tempUserName Nvarchar(200) output,
 @tempDutyLevel int output,
 @tempDutyName Nvarchar(200) output,
 @tempRight int output
AS
declare @Count int
declare @ID int
select @Count=count(*) from Consortia where ConsortiaID=@ConsortiaID and ChairmanID=@UserID and IsExist=1

if @Count is null or @Count=0
begin
  return 2
end


declare @IsExist  bit

select  @IsExist = IsExist from Sys_Users_Detail where  NickName=@NickName

 if @IsExist is null or @IsExist=0
begin
  return 1
end

declare @Grade int
select @Grade=isnull(Grade, 0) from Sys_Users_Detail where NickName=@NickName and IsExist=1

if @Grade is null or @Grade<5
begin
  return 2
end

declare @CurrentLevel int
declare @CurrentID int
declare @CurrentName nvarchar(200)
declare @Duty int
declare @MaxDuty int

select @CurrentLevel=[Level],@CurrentID=UserID,@CurrentName=UserName,@ID=[ID],@tempUserID=UserID,@tempUserName=UserName from V_Consortia_Users where UserName=@NickName and ConsortiaID=@ConsortiaID and IsExist=1
if @CurrentLevel is null or @CurrentLevel=1
begin
  return 3
end

select @Duty=DutyID from Consortia_Duty where [Level]=1 and ConsortiaID=@ConsortiaID and IsExist=1
if @Duty is null
begin
  return 4
end

select @MaxDuty=DutyID,@tempDutyLevel=[Level],@tempDutyName=DutyName,@tempRight=[Right] from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1 and [Level] in (select Max([Level]) from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1)

  if @MaxDuty is null
  begin
    return 5
  end

set xact_abort on
begin tran

Update Consortia set ChairmanID = @CurrentID,ChairmanName = @CurrentName  where  ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Users set DutyID=@MaxDuty where  DutyID=@Duty and ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Users set DutyID=@Duty where  [ID]=@ID and ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaDescription_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会公告信息更新>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaDescription_Update]
 @ConsortiaID int,
 @UserID int,
 @Description nvarchar(2000)
AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&16)=0
begin
  return 2
end

Update Consortia set [Description] = @Description where ConsortiaID=@ConsortiaID

if @@error<>0
begin
  return @@error
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaDuty_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：添加公会新职责(暂未用)>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaDuty_Add]
 @DutyID int output,
 @ConsortiaID int,
 @DutyName nvarchar(100),
 @Level int,
 @UserID int,
 @Right int
AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&128)=0
begin
  return 2
end

select @Level=isnull(Max([Level]),0) from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1

if @Level>9 or @Level is null or @Level=0
begin
  return 3
end

set xact_abort on
begin tran

update Consortia_Duty set [Level] = [Level]+1 where [Level]=@Level and ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

insert into Consortia_Duty(ConsortiaID,DutyName,[Right],[Level])
values(@ConsortiaID,@DutyName,@Right,@Level)

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off


return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaDuty_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：删除一个公会职责(暂未用)>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaDuty_Delete]
 @UserID int,
 @ConsortiaID int,
 @DutyID int
AS

declare @CurrentLevel int
declare @MaxLevel int
declare @MaxDuty int
declare @tempIsManageDuty bit

select @CurrentLevel=[Level] from Consortia_Duty where DutyID=@DutyID and ConsortiaID=@ConsortiaID and IsExist=1
if @CurrentLevel is null or @CurrentLevel=1
begin
  return 3
end

--select @tempIsManageDuty=IsManageDuty from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1
--if @tempIsManageDuty is null or @tempIsManageDuty=0
--begin
--  return 2
--end

select @MaxDuty=DutyID,@MaxLevel=[Level] from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1 and [Level] in (select Max([Level]) from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1)

if @MaxLevel is null or @MaxLevel=@CurrentLevel
begin
  return 3
end

set xact_abort on
begin tran

Update Consortia_Duty set IsExist = 0 where  DutyID=@DutyID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Duty set [Level] = [Level]-1 where ConsortiaID=@ConsortiaID and [Level]>@CurrentLevel and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Users set DutyID = @MaxDuty where  DutyID=@DutyID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0

GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaDuty_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会职责改名>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaDuty_Update]
 @DutyID int output,
 @ConsortiaID int,
 @DutyName nvarchar(100) output,
 @Level int output,
 @UserID int,
 @UpdateType int,
 @Right int output
AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&64)=0
begin
  return 2
end


if @UpdateType=1
begin


select @Level=isnull(Max([Level]),0) from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1

if @Level>9 or @Level is null or @Level=0
begin
  return 5
end

set xact_abort on
begin tran

update Consortia_Duty set [Level] = [Level]+1 where [Level]=@Level and ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

insert into Consortia_Duty(ConsortiaID,DutyName,[Level],[Right])
values(@ConsortiaID,@DutyName,@Level,@Right)
set @DutyID=@@identity

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off
/*
update Consortia_Duty set DutyName=@DutyName where  ConsortiaID=@ConsortiaID and DutyID=@DutyID and IsExist=1

if @@error<>0
begin
  return @@error
end*/

end

if @UpdateType=2
begin

  select @Level=isnull([Level],0) from Consortia_Duty where ConsortiaID=@ConsortiaID and DutyID=@DutyID and IsExist=1

  if @Level = 1
  begin

    update Consortia_Duty set DutyName=@DutyName,@Right=[Right],@Level=[Level]
     where  ConsortiaID=@ConsortiaID and DutyID=@DutyID and IsExist=1

    if @@error<>0
    begin
      return @@error
    end

  end
  else
  begin

    update Consortia_Duty set DutyName=@DutyName,@Right=[Right],@Level=[Level]
     where  ConsortiaID=@ConsortiaID and DutyID=@DutyID and IsExist=1

    if @@error<>0
    begin
      return @@error
    end

  end

end

declare @CurrentLevel int
declare @MaxLevel int

if @UpdateType=3
begin

select @CurrentLevel = [Level] from Consortia_Duty where ConsortiaID=@ConsortiaID and DutyID=@DutyID and IsExist=1
if @CurrentLevel is null or  @CurrentLevel<3
begin
  return 3
end

select @MaxLevel=max([Level]) from Consortia_Duty where ConsortiaID=@ConsortiaID and IsExist=1
if @MaxLevel is null or  @MaxLevel=@CurrentLevel
begin
  return 4
end

set xact_abort on
begin tran

update Consortia_Duty set [Level]=@CurrentLevel where  ConsortiaID=@ConsortiaID and [Level]=@CurrentLevel-1 and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

update Consortia_Duty set [Level]=[Level]-1 where  ConsortiaID=@ConsortiaID and DutyID=@DutyID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

end



if @UpdateType=4
begin

select @CurrentLevel = [Level] from Consortia_Duty where ConsortiaID=@ConsortiaID and DutyID=@DutyID and IsExist=1
if @CurrentLevel is null or  @CurrentLevel=1
begin
  return 3
end

select @MaxLevel=max([Level]) from Consortia_Duty where ConsortiaID=@ConsortiaID and IsExist=1
if @MaxLevel is null or  @MaxLevel<@CurrentLevel+2
begin
  return 4
end

set xact_abort on
begin tran

update Consortia_Duty set [Level]=@CurrentLevel where  ConsortiaID=@ConsortiaID and [Level]=@CurrentLevel+1 and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

update Consortia_Duty set [Level]=[Level]+1 where  ConsortiaID=@ConsortiaID and DutyID=@DutyID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

end


return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaInviteUser_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会邀请用户入会>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaInviteUser_Add]
 @ID int output,
 @ConsortiaID int,
 @ConsortiaName nvarchar(100),
 @InviteDate datetime,
 @InviteID int,
 @InviteName nvarchar(100),
 @IsExist bit,
 @Remark nvarchar(100),
 @UserID int out,
 @UserName nvarchar(100)
AS

declare @tempID int

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@InviteID and IsExist=1

if @tempRight is null or (@tempRight&2)=0
begin
  return 2
end

declare @tempConsortiaID int
select @UserID=UserID,@tempConsortiaID=ConsortiaID from Sys_Users_Detail where NickName=@UserName and IsExist=1

if @UserID is null or @UserID=0
begin
  return 4
end

if @tempConsortiaID <>0
begin
  return 5
end

select @ConsortiaName=ConsortiaName from Consortia where ConsortiaID=@ConsortiaID and IsExist=1

if @ConsortiaName is null or @ConsortiaName=''
begin
  return 3
end

declare @Count int
declare @MaxCount int
select @Count=[Count],@MaxCount=MaxCount from Consortia where @ConsortiaID=ConsortiaID and IsExist=1

if @Count is null or @Count+1>@MaxCount
begin
  return 6
end

--declare @Count int
--select @Count=count(*) from Consortia_Invite_Users where UserID=@UserID and ConsortiaID=@ConsortiaID

select @ID=[ID] from Consortia_Invite_Users where UserID=@UserID and ConsortiaID=@ConsortiaID

if @ID=0 or @ID is null
begin
  insert into Consortia_Invite_Users(ConsortiaID,ConsortiaName,InviteDate,InviteID,InviteName,IsExist,Remark,UserID,UserName)
  values(@ConsortiaID,@ConsortiaName,@InviteDate,@InviteID,@InviteName,@IsExist,@Remark,@UserID,@UserName)
  select @@identity as 'identity'
  set @ID=@@identity

  if @@error<>0
  begin
    return @@error
  end
end
else
begin
  update Consortia_Invite_Users set InviteDate=@InviteDate,InviteID=@InviteID,InviteName=@InviteName,Remark=@Remark,IsExist=1 where [ID]=@ID --UserID=@UserID and ConsortiaID=@ConsortiaID

  if @@error<>0
  begin
    return @@error
  end
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaInviteUser_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：删除公会邀请用户信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaInviteUser_Delete]
 @ID int,
 @UserID int
AS

Update Consortia_Invite_Users set IsExist = 0 where [ID]=@ID and UserID=@UserID and IsExist=1

if @@error<>0
begin
  return @@error
end

return 0


GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaInviteUser_Pass]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：用户通过公会邀请>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaInviteUser_Pass]
 @ID int,
 @UserID int,
 @UserName nvarchar(100),
 @ConsortiaID int output,
 @ConsortiaName nvarchar(100) output,
 @tempName nvarchar(100) output,
 @tempDutyID int output,
 @tempDutyName nvarchar(100) output,
 @tempOffer int output,
 @tempRichesOffer int output,
 @tempRichesRob int output,
 @tempLastDate datetime output,
 @tempWin int output,
 @tempTotal int output,
 @tempEscape int output,
 @tempID int output,
 @tempGrade int output,
 @tempLevel int output,
 @tempCUID int output,
 @tempState int output,
 @tempSex int output,
 @tempRight int output,
 @tempConsortiaRepute int output
AS

--declare @tempID int
--declare @tempName nvarchar(100)
declare @DutyID int
--declare @ConsortiaID int

select @tempID=InviteID,@tempName=InviteName,@ConsortiaID=ConsortiaID,@ConsortiaName=ConsortiaName from  Consortia_Invite_Users where [ID]=@ID and UserID=@UserID and IsExist=1

if @tempID is null or @tempID=0
begin
  return 3
end

declare @Count int
declare @MaxCount int
select @Count=[Count],@MaxCount=MaxCount,@tempConsortiaRepute=Repute from Consortia where @ConsortiaID=ConsortiaID and IsExist=1

if @Count is null or @Count+1>@MaxCount
begin
  return 6
end

select @DutyID=DutyID,@tempDutyID=DutyID,@tempDutyName=DutyName,@tempLevel=[Level],@tempRight=[Right] from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1 and [Level] in (select Max([Level]) from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1)

if @DutyID is null or @DutyID=0
begin
  return 4
end

declare @orderID int
declare @temp bit
select @orderID=[ID],@temp=IsExist from Consortia_Users where UserID=@UserID
if @temp=1
begin
  return 5
end

set xact_abort on
begin tran

Update Consortia_Apply_Users set IsExist = 0 where UserID=@UserID and IsExist = 1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Invite_Users set IsExist = 0 where  UserID=@UserID and IsExist = 1

if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia set [Count] = [Count]+1 where ConsortiaID=@ConsortiaID

if @@error<>0
begin
  rollback tran
  return @@error
end

if @orderID is null or @orderID=0
begin

insert into Consortia_Users(ConsortiaID,UserID,UserName,RatifierID,RatifierName,DutyID,Remark,IsExist,IsBanChat)
values(@ConsortiaID,@UserID,@UserName,@tempID,@tempName,@DutyID,'',1,0)

if @@error<>0
begin
  rollback tran
  return @@error
end

     select @@identity as 'identity'
     set @tempCUID=@@identity

end
else
begin

update Consortia_Users set ConsortiaID=@ConsortiaID,RatifierID=@tempID,RatifierName=@tempName,DutyID=@DutyID,Remark='',IsExist=1,IsBanChat=0
where [ID]=@orderID

if @@error<>0
begin
  rollback tran
  return @@error
end

set @tempCUID=@orderID

end

Update Sys_Users_Detail set ConsortiaID = @ConsortiaID,IsConsortia=1,@tempOffer=Offer,@tempRichesOffer=RichesOffer,@tempRichesRob=RichesRob,
@tempLastDate=LastDate,@tempWin=Win,@tempTotal=Total,@tempEscape=[Escape],@tempGrade=[Grade],@tempState=State,@tempSex=Sex
 where  UserID=@UserID and IsExist=1

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaIsBanChat_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：公会对用户禁言>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaIsBanChat_Update]
 @ID int,
 @ConsortiaID int,
 @UserID int,
 @IsBanChat int,
 @tempID int output,
 @tempName nvarchar(100) output
AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&4)=0
begin
  return 2
end


select @tempID=UserID,@tempName=UserName from Consortia_Users where ConsortiaID=@ConsortiaID and [UserID]= @ID  and IsExist=1

if @tempID is null or @tempID=0
begin
  return 2
end


Update Consortia_Users set IsBanChat = @IsBanChat where ConsortiaID=@ConsortiaID and [UserID]= @ID  and IsExist=1

if @@error<>0
begin
  return @@error
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaPlacard_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：更新公会宣言>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaPlacard_Update]
 @ConsortiaID int,
 @UserID int,
 @Placard nvarchar(2000)
AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&8)=0
begin
  return 2
end

Update Consortia set [Placard] = @Placard where ConsortiaID=@ConsortiaID

if @@error<>0
begin
  return @@error
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaUser_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：踢出公会中的一个用户>
-- =============================================
CREATE    PROCEDURE [dbo].[SP_ConsortiaUser_Delete]
 @UserID int,
 @KickUserID int,
 @ConsortiaID int,
 @NickName Nvarchar(200) output
AS

set @NickName=''
declare @Level int
declare @tempRight INT
/*踢人时间*/
DECLARE @KickDate DATETIME
/*已踢人数量*/
DECLARE @KickCount INT
/*踢人上限*/
DECLARE @KickMax INT
select @tempRight=[Right],@Level=[Level]  from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null
begin
  return 2
end

if @UserID<>@KickUserID and (@tempRight&32)=0
begin
  return 2
end

if @UserID=@KickUserID and @Level=1
begin
  return 3
end

declare @count int
select @count=count(*) from Consortia where ChairmanID=@KickUserID and ConsortiaID=@ConsortiaID and IsExist=1
if @count>0
begin
  return 4
end

/*每天已踢出人数@KickCount=KickCount*/
SELECT TOP 1 @KickDate=KickDate,@KickMax=KickMax, @KickCount=KickCount FROM dbo.Consortia A
       LEFT OUTER JOIN dbo.Consortia_Level B
            ON A.Level=b.Level
            WHERE ConsortiaID=@ConsortiaID and IsExist=1


IF(@UserID!=@KickUserID)
  BEGIN
    IF (@KickDate=Convert(VarChar(10),GETDATE(),120) AND @KickCount>0) OR (@KickDate!=Convert(VarChar(10),GETDATE(),120))
       BEGIN
          IF(@KickDate!=Convert(VarChar(10),GETDATE(),120))
            SET @KickCount=@KickMax
          SET @KickDate=CONVERT(VARCHAR(10),Getdate(),120)
          SET @KickCount=@KickCount-1
       END
    ELSE
         RETURN 5   /*每日踢人已达上限*/
  END

set xact_abort on
begin tran

Update Consortia set [Count] = [Count]-1,KickDate=@KickDate,KickCount=@KickCount where ConsortiaID=@ConsortiaID


if @@error<>0
begin
  rollback tran
  return @@error
end

Update Consortia_Users set IsExist = 0 where  UserID=@KickUserID and ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0 or @@ROWCOUNT=0
begin
  rollback tran
  return @@error
end

--Update Sys_Users_Detail set @NickName=NickName,ConsortiaID = 0,RichesOffer=0,RichesRob=0 where  UserID=@KickUserID and ConsortiaID=@ConsortiaID and IsExist=1
Update Sys_Users_Detail set @NickName=NickName,ConsortiaID = 0,RichesOffer=0,RichesRob=0 where  UserID=@KickUserID and ConsortiaID=@ConsortiaID

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaUserGrade_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：更新用户职务>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaUserGrade_Update]
 @ID int,
 @ConsortiaID int,
 @UserID int,
 @UpGrade bit,
 @tempUserName Nvarchar(100) output,
 @tempDutyLevel int output,
 @tempDutyName Nvarchar(100) output,
 @tempRight int output

AS

declare @tempRight1 int
select @tempRight1=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight1 is null or (@tempRight1&2048)=0
begin
  return 2
end

declare @CurrentLevel int
declare @MaxLevel int
declare @Duty int

select @CurrentLevel=[Level],@tempUserName=UserName from V_Consortia_Users where [UserID]=@ID and ConsortiaID=@ConsortiaID and IsExist=1
if @CurrentLevel is null or @CurrentLevel=1
begin
  return 3
end

if @UpGrade=1
begin

  if @CurrentLevel=2
  begin
    return 4
  end

  set @CurrentLevel=@CurrentLevel-1

  /*select @Duty from Consortia_Duty where [Level]=@CurrentLevel-1 and ConsortiaID=@ConsortiaID and IsExist=1

  if @Duty is null
  begin
    return 5
  end*/

end
else
begin

  select @MaxLevel=[Level] from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1 and [Level] in (select Max([Level]) from Consortia_Duty where  ConsortiaID=@ConsortiaID and IsExist=1)

  if @MaxLevel is null or @MaxLevel=@CurrentLevel or @MaxLevel<@CurrentLevel
  begin
    return 5
  end

  set @CurrentLevel=@CurrentLevel+1

end

select @Duty=DutyID,@tempDutyLevel=[Level],@tempDutyName=DutyName,@tempRight=[Right] from Consortia_Duty where [Level]=@CurrentLevel and ConsortiaID=@ConsortiaID and IsExist=1

if @Duty is null
begin
  return 6
end

Update Consortia_Users set DutyID = @Duty where [UserID]=@ID and ConsortiaID=@ConsortiaID and IsExist=1

if @@error<>0
begin
  return @@error
end


return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsortiaUserRemark_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：添加公会中的用户备注信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ConsortiaUserRemark_Update]
 @ID int,
 @ConsortiaID int,
 @UserID int,
 @Remark nvarchar(2000)
AS

declare @tempRight int
select @tempRight=[Right] from V_Consortia_Users where ConsortiaID=@ConsortiaID and UserID=@UserID and IsExist=1

if @tempRight is null or (@tempRight&0)=0
begin
  return 2
end

Update Consortia_Users set Remark = @Remark where ConsortiaID=@ConsortiaID and [ID]= @ID  and IsExist=1

if @@error<>0
begin
  return @@error
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomPage]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<分页存储过程>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_CustomPage]
@QueryStr nvarchar(4000), --表名、视图名、查询语句
@QueryWhere nvarchar(4000), --查询条件
@PageSize int=10, --每页的大小(行数)
@PageCurrent int=1, --要显示的页
@FdShow nvarchar (4000)='', --要显示的字段列表,如果查询结果有标识字段,需要指定此值,且不包含标识字段
@FdOrder nvarchar (1000)='', --排序字段列表
@FdKey nvarchar(250)='', --强制指定主键
@TotalRow int output --总记录行数
as
declare @FdName nvarchar(250) --表中的主键或表、临时表中的标识列名
,@Id1 varchar(20),@Id2 varchar(20) --开始和结束的记录号
,@Id3 varchar(20) --预选的记录数
,@Obj_ID int --对象ID
,@TotalPage int --总页数
,@FdOrder_desc nvarchar(1000)  --'反'排序字段列表
,@FdOrder_desc1 nvarchar(1000) --'反'排序字段列表(临时)
,@FdOrder_desc2 nvarchar(1000) --'反'排序字段列表(临时)

If( (dbo.FiltSql(@QueryStr)=0)or(dbo.FiltSql(@QueryWhere)=0) or (dbo.FiltSql(@FdShow)=0) or  (dbo.FiltSql(@FdKey)=0) )
Begin
   Return
End


--表中有复合主键的处理
declare @strfd nvarchar(2000) --复合主键列表
,@strjoin nvarchar(4000) --连接字段
,@strwhere nvarchar(2000) --查询条件
--格式化初始参数
select @Obj_ID=object_id(@QueryStr)
,@FdShow=case isnull(@FdShow,'') when '' then ' *' else ' '+@FdShow end
,@FdOrder=case isnull(@FdOrder,'') when '' then '' else ' order by '+@FdOrder end
,@QueryWhere=case isnull(@QueryWhere,'') when '' then '1=1' else @QueryWhere end
select @FdOrder_desc1 = replace(@FdOrder, ' DESC', '^')
,@FdOrder_desc2 = replace(@FdOrder_desc1, ',', ' DESC,') + ' DESC'
,@FdOrder_desc = replace(@FdOrder_desc2, '^ DESC', '')
select @FdOrder = replace(@FdOrder, '^^', ',')
,@FdOrder_desc = replace(@FdOrder_desc, '^^', ',')
if left(@QueryStr,1)='('
  select @QueryStr=' '+@QueryStr
else
  select @QueryStr=case when @Obj_ID is not null then ' '+@QueryStr else ' ('+@QueryStr+') cp_a' end
--计算总行数和总页数
declare @temp1 nvarchar(4000)
select @temp1=N'select @temp2=count(*) from '+@QueryStr+' where '+@QueryWhere
exec sp_executesql @temp1, N' @temp2 int output ', @TotalRow output
if @TotalRow > 0
  set @TotalPage = (@TotalRow + @PageSize - 1) / @PageSize
else
  set @TotalPage = 1
if @PageCurrent > @TotalPage set @PageCurrent = @TotalPage
--如果显示第一页，可以直接用top来完成
if @PageCurrent=1
begin
  select @Id1=cast(@PageSize as varchar(20))
  exec('select top '+@Id1+@FdShow+' from '+@QueryStr+' where '+@QueryWhere+@FdOrder)
  return
end
--强制指定主键
if @FdKey<>''
begin
  select @Id1=cast(@PageSize as varchar(20))
  ,@Id2=cast((@PageCurrent-1)*@PageSize as varchar(20))
  ,@Id3=cast(@PageCurrent*@PageSize as varchar(20))
  select @FdName=@FdKey
  goto lbuseidentity
end
--如果是表,则检查表中是否有标识列或主键
if @Obj_ID is not null and objectproperty(@Obj_ID,'IsTable')=1
begin
  select @Id1=cast(@PageSize as varchar(20))
  ,@Id2=cast((@PageCurrent-1)*@PageSize as varchar(20))
  ,@Id3=cast(@PageCurrent*@PageSize as varchar(20))
  select @FdName=name from syscolumns where id=@Obj_ID and status=0x80
  if @@rowcount=0 --如果表中无标识列,则检查表中是否有主键
  begin
    if not exists(select 1 from sysobjects where parent_obj=@Obj_ID and xtype='PK')
      goto lbusetemp --如果表中无主键,则用临时表处理
    select @FdName=name from syscolumns where id=@Obj_ID and colid in(
      select colid from sysindexkeys where @Obj_ID=id and indid in(
         select indid from sysindexes where @Obj_ID=id and name in(
           select name from sysobjects where xtype='PK' and parent_obj=@Obj_ID
    )))
    if @@rowcount>1 --检查表中的主键是否为复合主键
    begin
      select @strfd='',@strjoin='',@strwhere=''
      select @strfd=@strfd+',['+name+']'
      ,@strjoin=@strjoin+' and a.['+name+']=b.['+name+']'
      ,@strwhere=@strwhere+' and b.['+name+'] is null'
      from syscolumns where id=@Obj_ID and colid in(
        select colid from sysindexkeys where @Obj_ID=id and indid in(
          select indid from sysindexes where @Obj_ID=id and name in(
            select name from sysobjects where xtype='PK' and parent_obj=@Obj_ID
        )))
      select @strfd=substring(@strfd,2,2000)
      ,@strjoin=substring(@strjoin,5,4000)
      ,@strwhere=substring(@strwhere,5,4000)
      goto lbusepk
    end
  end
end
else
goto lbusetemp
/*--使用标识列或主键为单一字段的处理方法--*/
lbuseidentity:
if (@PageCurrent >= @TotalPage) and (@TotalRow % @PageSize > 0)
  select @Id1 = @TotalRow % @PageSize
exec('select * from
(select top '+@Id1+@FdShow+' from '+@QueryStr+' where '+@FdName+' in (
  select top '+@Id3+' '+@FdName+' from '+@QueryStr+' where '+@QueryWhere+@FdOrder
  +')'+@FdOrder_desc
+') cp_v5' + @FdOrder
)
return
/*--表中有复合主键的处理方法--*/
lbusepk:
exec('select '+@FdShow+' from(select top '+@Id1+' a.* from
(select top 100 percent * from '+@QueryStr+' where '+@QueryWhere+@FdOrder+') a
left join (select top '+@Id2+' '+@strfd+'
from '+@QueryStr+' where '+@QueryWhere+@FdOrder+') b on '+@strjoin+'
where '+@strwhere+') a'
)
return
/*--用临时表处理的方法--*/
lbusetemp:
select @FdName='[ID_'+cast(newid() as varchar(40))+']'
,@Id1=cast(@PageSize*(@PageCurrent-1) as varchar(20))
,@Id2=cast(@PageSize*@PageCurrent-1 as varchar(20))
,@Id3=cast(@PageSize*@PageCurrent as varchar(20))
exec('select '+@FdName+'=identity(int,0,1),*
into #tb from (select top '+@Id3+' '+@FdShow+' from '+@QueryStr+' where '+@QueryWhere+@FdOrder+') cp_tb
select '+@FdShow+' from #tb where '+@FdName+' between '
+@Id1+' and '+@Id2
)


GO
/****** Object:  StoredProcedure [dbo].[SP_CustomPage_Test]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<分页存储过程>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_CustomPage_Test]
@QueryStr nvarchar(4000), --表名、视图名、查询语句
@QueryWhere nvarchar(4000), --查询条件
@PageSize int=10, --每页的大小(行数)
@PageCurrent int=1, --要显示的页
@FdShow nvarchar (4000)='', --要显示的字段列表,如果查询结果有标识字段,需要指定此值,且不包含标识字段
@FdOrder nvarchar (1000)='', --排序字段列表
@FdKey nvarchar(250)='', --强制指定主键
@TotalRow int output --总记录行数
as
declare @FdName nvarchar(250) --表中的主键或表、临时表中的标识列名
,@Id1 varchar(20),@Id2 varchar(20) --开始和结束的记录号
,@Id3 varchar(20) --预选的记录数
,@Obj_ID int --对象ID
,@TotalPage int --总页数
,@FdOrder_desc nvarchar(1000)  --'反'排序字段列表
,@FdOrder_desc1 nvarchar(1000) --'反'排序字段列表(临时)
,@FdOrder_desc2 nvarchar(1000) --'反'排序字段列表(临时)

If( (dbo.FiltSql(@QueryStr)=0)or(dbo.FiltSql(@QueryWhere)=0) or (dbo.FiltSql(@FdShow)=0) or  (dbo.FiltSql(@FdKey)=0) )
Begin
   Return
End


--表中有复合主键的处理
declare @strfd nvarchar(2000) --复合主键列表
,@strjoin nvarchar(4000) --连接字段
,@strwhere nvarchar(2000) --查询条件
--格式化初始参数
select @Obj_ID=object_id(@QueryStr)
,@FdShow=case isnull(@FdShow,'') when '' then ' *' else ' '+@FdShow end
,@FdOrder=case isnull(@FdOrder,'') when '' then '' else ' order by '+@FdOrder end
,@QueryWhere=case isnull(@QueryWhere,'') when '' then '1=1' else @QueryWhere end
select @FdOrder_desc1 = replace(@FdOrder, ' DESC', '^')
,@FdOrder_desc2 = replace(@FdOrder_desc1, ',', ' DESC,') + ' DESC'
,@FdOrder_desc = replace(@FdOrder_desc2, '^ DESC', '')
select @FdOrder = replace(@FdOrder, '^^', ',')
,@FdOrder_desc = replace(@FdOrder_desc, '^^', ',')
if left(@QueryStr,1)='('
  select @QueryStr=' '+@QueryStr
else
  select @QueryStr=case when @Obj_ID is not null then ' '+@QueryStr else ' ('+@QueryStr+') cp_a' end
--计算总行数和总页数
declare @temp1 nvarchar(4000)
select @temp1=N'select @temp2=count(*) from '+@QueryStr+' where '+@QueryWhere
exec sp_executesql @temp1, N' @temp2 int output ', @TotalRow output
if @TotalRow > 0
  set @TotalPage = (@TotalRow + @PageSize - 1) / @PageSize
else
  set @TotalPage = 1
if @PageCurrent > @TotalPage set @PageCurrent = @TotalPage
--如果显示第一页，可以直接用top来完成
if @PageCurrent=1
begin
  select @Id1=cast(@PageSize as varchar(20))
  exec('select top '+@Id1+@FdShow+' from '+@QueryStr+' where '+@QueryWhere+@FdOrder)
  return
end
--强制指定主键
if @FdKey<>''
begin
  select @Id1=cast(@PageSize as varchar(20))
  ,@Id2=cast((@PageCurrent-1)*@PageSize as varchar(20))
  ,@Id3=cast(@PageCurrent*@PageSize as varchar(20))
  select @FdName=@FdKey
  goto lbuseidentity
end
--如果是表,则检查表中是否有标识列或主键
if @Obj_ID is not null and objectproperty(@Obj_ID,'IsTable')=1
begin
  select @Id1=cast(@PageSize as varchar(20))
  ,@Id2=cast((@PageCurrent-1)*@PageSize as varchar(20))
  ,@Id3=cast(@PageCurrent*@PageSize as varchar(20))
  select @FdName=name from syscolumns where id=@Obj_ID and status=0x80
  if @@rowcount=0 --如果表中无标识列,则检查表中是否有主键
  begin
    if not exists(select 1 from sysobjects where parent_obj=@Obj_ID and xtype='PK')
      goto lbusetemp --如果表中无主键,则用临时表处理
    select @FdName=name from syscolumns where id=@Obj_ID and colid in(
      select colid from sysindexkeys where @Obj_ID=id and indid in(
         select indid from sysindexes where @Obj_ID=id and name in(
           select name from sysobjects where xtype='PK' and parent_obj=@Obj_ID
    )))
    if @@rowcount>1 --检查表中的主键是否为复合主键
    begin
      select @strfd='',@strjoin='',@strwhere=''
      select @strfd=@strfd+',['+name+']'
      ,@strjoin=@strjoin+' and a.['+name+']=b.['+name+']'
      ,@strwhere=@strwhere+' and b.['+name+'] is null'
      from syscolumns where id=@Obj_ID and colid in(
        select colid from sysindexkeys where @Obj_ID=id and indid in(
          select indid from sysindexes where @Obj_ID=id and name in(
            select name from sysobjects where xtype='PK' and parent_obj=@Obj_ID
        )))
      select @strfd=substring(@strfd,2,2000)
      ,@strjoin=substring(@strjoin,5,4000)
      ,@strwhere=substring(@strwhere,5,4000)
      goto lbusepk
    end
  end
end
else
goto lbusetemp
/*--使用标识列或主键为单一字段的处理方法--*/
lbuseidentity:
if (@PageCurrent >= @TotalPage) and (@TotalRow % @PageSize > 0)
  select @Id1 = @TotalRow % @PageSize
exec('select * from
(select top '+@Id1+@FdShow+' from '+@QueryStr+' where '+@FdName+' in (
  select top '+@Id3+' '+@FdName+' from '+@QueryStr+' where '+@QueryWhere+@FdOrder
  +')'+@FdOrder_desc
+') cp_v5' + @FdOrder
)
return
/*--表中有复合主键的处理方法--*/
lbusepk:
exec('select '+@FdShow+' from(select top '+@Id1+' a.* from
(select top 100 percent * from '+@QueryStr+' where '+@QueryWhere+@FdOrder+') a
left join (select top '+@Id2+' '+@strfd+'
from '+@QueryStr+' where '+@QueryWhere+@FdOrder+') b on '+@strjoin+'
where '+@strwhere+') a'
)
return
/*--用临时表处理的方法--*/
lbusetemp:
select @FdName='[ID_'+cast(newid() as varchar(40))+']'
,@Id1=cast(@PageSize*(@PageCurrent-1) as varchar(20))
,@Id2=cast(@PageSize*@PageCurrent-1 as varchar(20))
,@Id3=cast(@PageSize*@PageCurrent as varchar(20))
exec('select '+@FdName+'=identity(int,0,1),*
into #tb from (select top '+@Id3+' '+@FdShow+' from '+@QueryStr+' where '+@QueryWhere+@FdOrder+') cp_tb
select '+@FdShow+' from #tb where '+@FdName+' between '
+@Id1+' and '+@Id2
)


GO
/****** Object:  StoredProcedure [dbo].[SP_Daily_Award_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<日常奖励>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Daily_Award_All]
AS
 select *  from Daily_Award

GO
/****** Object:  StoredProcedure [dbo].[SP_Dispose_Marry_Room_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<结婚房间:将过期的结婚房间清除>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Dispose_Marry_Room_Info]
@ID int
AS

set xact_abort on
begin tran

update Marry_Room_Info set isExist=0 where ID=@ID
if @@error<>0
begin
  rollback tran
  return @@error
end

declare @GroomID int
declare @BrideID int
select  @GroomID=GroomID,@BrideID=BrideID from Marry_Room_Info  where ID=@ID

update sys_users_detail set IsCreatedMarryRoom=0, SelfMarryRoomID=0 where UserID=@GroomID or UserID=@BrideID
if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Drop_Condiction_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		<Xiaov>
-- ALTER  date: <2009-11-19>
-- Description:	<任务信息：掉落条件表>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Drop_Condiction_All]
 AS
   begin
     select * from Drop_Condiction
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Drop_Item_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		<Xiaov>
-- ALTER  date: <2009-11-19>
-- Description:	<掉落信息：掉落物品表>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_Drop_Item_All]
 AS
   begin
     select * from Drop_Item
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Drop_Item_NewRegister]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Andy>
-- ALTER  date: <2010-02-25>
-- Description:	<显示掉落物品表:掉落物品表>
-- =============================================
Create  PROCEDURE [dbo].[SP_Drop_Item_NewRegister]
AS
 Select b.* From Drop_Condiction a  left join  Drop_Item b  On a.DropID=b.DropId
        Where a.CondictionType=10   order by b.DropId desc
GO
/****** Object:  StoredProcedure [dbo].[Sp_Fetch_List]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		小危
-- ALTER  date: 2009-06-18
-- Description:	分页存储过程
-- =============================================
CREATE  PROCEDURE [dbo].[Sp_Fetch_List](
  @page_num                INT,
  @row_in_page             Bigint,
  @order_column            NVARCHAR(100),
  @row_total               Bigint  OUTPUT,
  @comb_condition          NVARCHAR(1000),
  @tablename      nvarchar(200)
)
AS
BEGIN

If( (dbo.FiltSql(@comb_condition)=0)or(dbo.FiltSql(@order_column)=0) or (dbo.FiltSql(@tablename)=0))
Begin
   Return
End

    SET NOCOUNT ON
    DECLARE
      @jcc_status             INT,
      @sql                  NVARCHAR(4000),
      @row_ahead        INT

  SET @jcc_status = 0

  SET @row_ahead = (@page_num-1) * @row_in_page
SET @sql='SELECT TOP '+ cast(@row_in_page as Nvarchar(255)) +  ' * FROM ( '
SET @sql = @sql + 'SELECT   *
FROM  '+@tablename+'
 ) as A where 1=1'
IF LEN(@comb_condition)>0
        SET @sql = @sql + ' AND (' + @comb_condition  + ')'
SET @sql = @sql + 'and ID not in ( select ID from ('
SET @sql = @sql + 'SELECT TOP ' + cast(@row_ahead as Nvarchar(255)) + ' * From ('
SET @sql = @sql + 'SELECT   *
FROM '+@tablename+'
 ) as A where 1=1'
    IF LEN(@comb_condition)>0
        SET @sql = @sql + ' AND ( ' + @comb_condition  + ' )'
    IF LEN(@order_column)>0
        BEGIN
            SET @sql = @sql + ' ORDER BY ' + @order_column    + ' ) AS B )'
        END
    ELSE
        BEGIN
            SET @sql = @sql + ' ) AS B )'
        END
    IF LEN(@order_column)>0
        BEGIN
            SET @sql = @sql + ' ORDER BY ' + @order_column
        END
 print @sql
    EXEC (@sql)
    SET @sql= N'SELECT @row_total=COUNT(*) FROM ('
SET @sql = @sql + 'SELECT  *
FROM '+@tablename+'
 ) as A where 1=1'
IF LEN(@comb_condition)>0
        SET @sql = @sql + ' AND (' + @comb_condition  + ')'
print @sql
    EXEC sp_executesql @sql,N'@row_total INT OUT',@row_total OUT
    IF @@ERROR != 0
    BEGIN
        SELECT @jcc_status = -98
    END
exit_bk:
-- exit with MS SQL Server error
  IF @jcc_status = -98
    BEGIN
      RAISERROR ('MS SQL Server error, please contact your system administrator.',16,1)WITH NOWAIT
      RETURN (@jcc_status)
    END
-- normal exit
  RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Fight_Rate]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<变装:获取当前服务器中变装设置>
-- =============================================
CREATE procedure [dbo].[SP_Fight_Rate]
@serverId int
as
begin
 select * from Fight_Rate where ServerID = @serverId
end

GO
/****** Object:  StoredProcedure [dbo].[SP_Fight_Record_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<变装战斗:完成一场变装战斗记录操作>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Fight_Record_Add]
 @PlayBegin datetime,
 @PlayEnd datetime,
 @ChangeTeam int,
 @TeamA nvarchar(200),
 @TeamB nvarchar(200),
 @MapID int,
 @RoomType int,
 @FightName nvarchar(50),
 @WinTeam int
AS

     INSERT INTO Fight_Record( PlayBegin, PlayEnd,ChangeTeam, TeamA, TeamB, MapID, RoomType, FightName,WinTeam)
     VALUES( @PlayBegin, @PlayEnd,@ChangeTeam, @TeamA, @TeamB, @MapID, @RoomType, @FightName,@WinTeam)
GO
/****** Object:  StoredProcedure [dbo].[SP_Fusion_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<炼化表:显示全部炼化>
-- =============================================
CREATE Procedure [dbo].[SP_Fusion_All]
as
select * from Item_Fusion
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_GameScript]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Peter>
-- ALTER  date: <2009-11-23>
-- Description:	<炼化表:根据地图Id,难度等级获取GameScript>
-- =============================================
CREATE Procedure [dbo].[SP_Get_GameScript]
  @Id int,
  @ScriptType nvarchar(20)
as
exec ('select ' + @ScriptType + ' from Pve_Info where ID = '+ @Id)

GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Marry_Apply]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<结婚信息:更新结婚关系>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Marry_Apply]
@UserID int
AS

select * from Marry_Apply where UserID = @UserID and IsExist = 1

--update Marry_Apply set IsExist = 0 where  UserID = @UserID and ApplyType <> 1 and IsExist = 1
update Marry_Apply set IsExist = 0 where  UserID = @UserID and IsExist = 1 and ApplyType<>1
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Marry_Room_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<结婚信息:加载将要进行的结婚房间>
-- =============================================

CREATE PROCEDURE [dbo].[SP_Get_Marry_Room_Info]  AS
begin
    select * from Marry_Room_Info where IsExist = 1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Marry_Room_Info_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<结婚信处:读取一条结婚房间信息>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Marry_Room_Info_Single]
@ID int
AS
begin
    select * from Marry_Room_Info where ID=@ID and IsExist = 1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPayState]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--========================================================
--<watson>
--<依据订单号获取订单信息>
--<2010-01-25>
--========================================================
CREATE proc [dbo].[SP_GetPayState]
@chargeId varchar(200)
as
begin
   select top 1 * from db_tank.dbo.charge_money where chargeid=@chargeId
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Count_FightInfo]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Justin>
-- ALTER  date: <2008-11-28>
-- Description:	<战斗记录:结束战斗后，插入一条战斗信息>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Insert_Count_FightInfo]
		@ApplicationId			int,
		@SubId					int,
		@ServerId				int,
		@BeginTime				datetime,
		@EndTime				datetime,
		@UserCount				int,
		@MapId					int,
		@Money					int,
		@Gold					int,
		@Users					varchar(50)
AS
BEGIN
	insert into Db_Count..Count_FightInfo(ApplicationId,SubId,LineId,PlayBegin,PlayEnd,UserCount,MapId,PlayPoint,PlayGold,Users)
	values(@ApplicationId,@SubId,@ServerId,@BeginTime,@EndTime,@UserCount,@MapId,@Money,@Gold,@Users)
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Count_Register]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Justin
-- Create date: 2008.11.26
-- Description:	插入用户注册统计信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Insert_Count_Register]
	@ApplicationId		int,
	@SubId				int,
	@RegDate			datetime,
	@UserId				int,
	@Sex				bit,
	@Ip					bigint
AS
BEGIN
	insert into Db_Count..Count_Register(ApplicationId,SubId,RegDateTime,UserId,Sex,UserIp)
	values(@ApplicationId,@SubId,@RegDate,@UserId,@Sex,@Ip)
END




GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Count_Server]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Justin
-- Create date: 2008.11.26
-- Description:	记录服务器人数
-- =============================================
CREATE PROCEDURE [dbo].[SP_Insert_Count_Server]
		@ApplicationId				int,
		@SubId						int,
		@ServerId					int,
		@UserCount					int,
		@GameCount					int,
		@DateTime					datetime
AS
BEGIN
	INSERT INTO Db_Count..Count_Application_Server
           ([ApplicationId]
           ,[SubId]
           ,[LineId]
           ,[UserCount]
           ,[GameCount]
           ,[DateTime])
     VALUES
           (@ApplicationId,@SubId,@ServerId,@UserCount,@GameCount,@DateTime)
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Count_Shop]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Justin
-- Create date: 2008.11.26
-- Description:	插入用户购买物品信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Insert_Count_Shop]
	@ApplicatonId			int,
	@SubId					int,
	@UserId					int,
	@Money					int,
	@Gold					int,
	@DateTime				datetime,
	@Goods					nvarchar(200),
	@GoodsType					nvarchar(200)
AS
BEGIN
	insert into Db_Count..Count_Shop(ApplicationId,SubId,UserId,[Money],[Gold],EnterTime,GoodId,GoodsType)
	values(@ApplicatonId,@SubId,@UserId,@Money,@Gold,@DateTime,@Goods,@GoodsType)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Count_SystemPay]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Eric
-- Create date: 2009.09.15
-- Description:	插入非商品花费点劵信息
-- =============================================
CREATE PROCEDURE [dbo].[SP_Insert_Count_SystemPay]
	@ApplicatonId			int,
	@SubId					int,
	@ConsumerId					int,
	@Money					int,
	@Gold					int,
	@ConsumerType					int,
	@SubConsumerType					int,
	@DateTime				datetime
AS
BEGIN
	insert into Db_Count..Count_SystemPay(ApplicationId,SubId,PayUserId,Point,[Gold],MastType,SonType,PayTime)
	values(@ApplicatonId,@SubId,@ConsumerId,@Money,@Gold,@ConsumerType,@SubConsumerType,@DateTime)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Marry_Apply]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<公会信息：加入一条用户申请结婚信息>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Insert_Marry_Apply]
@UserID int,
@ApplyUserID int,
@ApplyUserName nvarchar(50),
@ApplyType int,
@ApplyResult bit,
@LoveProclamation nvarchar(300)

AS

insert into Marry_Apply(UserID,ApplyUserID,ApplyUserName,ApplyType,ApplyResult,LoveProclamation) values(@UserID,@ApplyUserID,@ApplyUserName,@ApplyType,@ApplyResult,@LoveProclamation)
if(@@error <> 0)
begin
  return 1
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Marry_Notice]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


-- 描述：对申请消息应答
--功能： 1、申请结婚【插入结婚申请信息】
--             2、应答信息【将以前的消息设为已过期，发出通知给对方】
--             3、发出离婚【插入离婚信息】
CREATE   PROCEDURE [dbo].[SP_Insert_Marry_Notice]
@UserID int,
@ApplyUserID int,
@ApplyUserName nvarchar(50),
@ApplyType int,
@ApplyResult bit,
@LoveProclamation nvarchar(300),
@AnswerId int,
@ouototal int=0 output
AS
--1:定义变量
Declare @Counts int
Declare @tempUserName nvarchar(50)
SET @ouototal=0
--2:-结婚应答
If(@ApplyType=2)
  Begin
     Update Marry_Apply  Set isDeal=1,isExist=0   Where  ApplyType=1 And isDeal=0 And  ApplyUserID = @UserID And UserID=@ApplyUserID And Id=@AnswerId   --将邀请信息设为已过期
     --判断双方是否结婚了
     Select @Counts=Count(0) From sys_users_detail  Where  (UserID=@UserID Or UserID=@ApplyUserID) And IsMarried=0
     If(@Counts!=2)
       BEGIN
          IF(@ApplyResult = 0)
            Begin
              Insert Into Marry_Apply(UserID,ApplyUserID,ApplyUserName,ApplyType,ApplyResult,LoveProclamation,isDeal,isExist) Values(@UserID,@ApplyUserID,@ApplyUserName,@ApplyType,@ApplyResult,@LoveProclamation,0,1)
              Select @@identity As 'identity'
              Set @ouototal=@@identity
            End
         Return 1
       End
     If(@ApplyResult = 1)
       Begin
           Update Sys_Users_Detail Set IsMarried=1,SpouseID=@ApplyUserID,SpouseName=@ApplyUserName Where UserID=@UserID
           Select @tempUserName=NickName From Sys_Users_Detail Where UserID=@UserID
           Update Sys_Users_Detail Set IsMarried=1,SpouseID=@UserID,SpouseName=@tempUserName Where UserID=@ApplyUserID
       End
  End

--3:离婚信息
If(@ApplyType=3)
  Begin
    Select @Counts=Count(0) From sys_users_detail  Where  (UserID=@UserID Or UserID=@ApplyUserID) And IsMarried=1
    If(@Counts!=2)
       Begin
          Return 1
       End
    Update Sys_Users_Detail set IsMarried=0,SpouseID=0,SpouseName='',IsGotRing=0,IsCreatedMarryRoom=0,SelfMarryRoomID=0  where UserID=@UserID or UserID=@ApplyUserID
  End

--最后:插入沟通信息
Insert Into Marry_Apply(UserID,ApplyUserID,ApplyUserName,ApplyType,ApplyResult,LoveProclamation,isDeal,isExist) Values(@UserID,@ApplyUserID,@ApplyUserName,@ApplyType,@ApplyResult,@LoveProclamation,0,1)
Select @@identity As 'identity'
Set @ouototal=@@identity
Return 0



/*
declare @Counts int

if(@ApplyType=2)             --2:-结婚应答
begin
  Select @Counts=Count(0) From sys_users_detail  Where  (UserID=@UserID Or UserID=@ApplyUserID) And IsMarried=0
  if(@Counts!=2)
  begin
    return 1
  end
end

if(@ApplyType=3)              --3:离婚
begin
  Select @Counts=Count(0) From sys_users_detail  Where  (UserID=@UserID Or UserID=@ApplyUserID) And IsMarried=1
  if(@Counts!=2)
    begin
      return 1
    end
end

set xact_abort on
begin tran
                                       --1:邀请结婚
insert into Marry_Apply(UserID,ApplyUserID,ApplyUserName,ApplyType,ApplyResult,LoveProclamation,isDeal,isExist) values(@UserID,@ApplyUserID,@ApplyUserName,@ApplyType,@ApplyResult,@LoveProclamation,0,1)
select @@identity as 'identity'
set @ouototal=@@identity

if @@error<>0
begin
  rollback tran
  return @@error
end

if(@ApplyType = 2)
begin
  declare @ID int
  set @ID = 0
  select top 1 @ID=IsNull([ID],0) from Marry_Apply where  ApplyType=1 and isDeal=0 and  ApplyUserID = @UserID and UserID=@ApplyUserID

  if(@ID = 0)
  begin
     return 1
  end
  else
  begin
     update Marry_Apply set isDeal=1 where [ID]=@ID
     if @@error<>0
     begin
        rollback tran
        return @@error
     end
  end


  if(@ApplyResult = 1)
  begin
	update sys_users_detail set IsMarried=1,SpouseID=@ApplyUserID,SpouseName=@ApplyUserName where UserID=@UserID
	if @@error<>0
	begin
	  rollback tran
	  return @@error
	end

	declare @tempUserName nvarchar(50)
    	select @tempUserName=NickName from sys_users_detail where UserID=@UserID
    	update sys_users_detail set IsMarried=1,SpouseID=@UserID,SpouseName=@tempUserName where UserID=@ApplyUserID
	if @@error<>0
	begin
	  rollback tran
	  return @@error
	end
  end
end
else if(@ApplyType = 3)
begin
  	update sys_users_detail set IsMarried=0,SpouseID=0,SpouseName='',IsGotRing=0,IsCreatedMarryRoom=0,SelfMarryRoomID=0  where UserID=@UserID or UserID=@ApplyUserID
	if @@error<>0
	begin
	  rollback tran
	  return @@error
	end
end

commit tran
set xact_abort off
return 0*/
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Marry_Room_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<结婚信息：创建一个结婚房间>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Insert_Marry_Room_Info]
@ID int output,
@Name nvarchar(50),
@PlayerID int,
@PlayerName nvarchar(50),
@GroomID int,
@GroomName nvarchar(50),
@BrideID int,
@BrideName nvarchar(50),
@Pwd nvarchar(15),
@AvailTime int,
@MaxCount int,
@GuestInvite bit,
@MapIndex int,
@BeginTime datetime,
@BreakTime datetime,
@RoomIntroduction nvarchar(300),
@ServerID int,
@IsHymeneal bit,
@IsGunsaluteUsed bit

AS


declare @count int
select @count=count(*) from Marry_Room_Info where GroomID=@GroomID and BrideID=@BrideID and IsExist=1

if @count >0
begin
    return 1
end


set xact_abort on
begin tran

insert into Marry_Room_Info([Name],PlayerID,PlayerName,GroomID,GroomName,BrideID,BrideName,Pwd,AvailTime,MaxCount,GuestInvite,MapIndex,BeginTime,BreakTime,RoomIntroduction,ServerID,IsHymeneal,IsGunsaluteUsed,isExist)
values(@Name,@PlayerID,@PlayerName,@GroomID,@GroomName,@BrideID,@BrideName,@Pwd,@AvailTime,@MaxCount,@GuestInvite,@MapIndex,@BeginTime,@BreakTime,@RoomIntroduction,@ServerID,@IsHymeneal,@IsGunsaluteUsed,1)

if @@error<>0
begin
  rollback tran
  return @@error
end

select @@identity as 'identity'
set @ID=@@identity

update sys_users_detail set IsCreatedMarryRoom=1, SelfMarryRoomID=@ID where UserID=@GroomID or UserID=@BrideID
if @@error<>0
begin
  rollback tran
  return @@error
end


commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertChargeRecord]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--======================================================
--<watson>
--<记录百度玩吧订单信息>
--<2010-01-25>
--======================================================
CREATE  proc [dbo].[SP_InsertChargeRecord]
@type int,
@order_id varchar(800),
@wanba_oid varchar(800),
@amount varchar(800),
@currency varchar(800),
@result int,
@ddtResult int,
@dateTimes datetime,
@userName varchar(800),
@nickName varchar(800)
as
begin
declare @res int
set @res=0
   if(@type=0)
   	begin
   	insert db_count.dbo.Count_ChargeRecord(OrderId,WanbaOId,Amount,Currency,WanbaResult,DDTResult,DateTimes,UserName,NickName) values
		(@order_id,@wanba_oid,@amount,@currency,@result,@ddtResult,@dateTimes,@userName,@nickName)
   	set @res=@@ROWCOUNT
	end
   if(@type=1)
	begin
	update db_count.dbo.Count_ChargeRecord set DDTResult=@ddtResult
	set @res=@@ROWCOUNT
	end
return @res
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Item_Record]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<铁匠铺：记录强化、合成、熔炼结果>
-- =============================================
CREATE Procedure [dbo].[SP_Item_Record]
@AgentsID int,
@ServerID int,
@Timer  datetime,
@UserID int,
@UserName nvarchar(50),
@Operation int ,
@ItemName nvarchar(50),
@ItemID int ,
@BeginProperty nvarchar(200),
@EndProperty  nvarchar(200),
@Result int

as

begin

insert into Item_Record  (AgentsID, ServerID, Timer,UserID,UserName,Operation,ItemName, ItemID,BeginProperty,EndProperty ,Result)
 values(   @AgentsID, @ServerID, @Timer,@UserID,@UserName,@Operation,@ItemName, @ItemID,@BeginProperty,@EndProperty ,@Result )

end


GO
/****** Object:  StoredProcedure [dbo].[SP_Item_Refinery_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


-- =============================================
-- Author:		<jacken>
-- ALTER  date: <2009-10-22>
-- Description:	<铁匠铺：炼化公式>
-- =============================================
CREATE Procedure [dbo].[SP_Item_Refinery_All]
as
 select * from Item_Refinery
GO
/****** Object:  StoredProcedure [dbo].[SP_Item_Refinery_Strengthen_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<jacken>
-- ALTER  date: <2009-10-22>
-- Description:	<铁匠铺：炼化后强化概率标准>
-- =============================================
CREATE Procedure [dbo].[SP_Item_Refinery_Strengthen_All]
as
 select * from Item_Refinery_Strengthen
GO
/****** Object:  StoredProcedure [dbo].[SP_Item_Strengthen_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<铁匠铺：强化概率标准>
-- =============================================
CREATE Procedure [dbo].[SP_Item_Strengthen_All]
as
 select * from Item_Strengthen

GO
/****** Object:  StoredProcedure [dbo].[SP_Item_StrengthenGoodsInfo_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<jacken>
-- ALTER  date: <2009-12-21>
-- Description:	<铁匠铺：强化转换物品表>
-- =============================================
CREATE Procedure [dbo].[SP_Item_StrengthenGoodsInfo_All]
as
 select * from Item_Strengthen_Goods


GO
/****** Object:  StoredProcedure [dbo].[SP_Items_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<商店信息：物品模板信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Items_All]
AS
 select * from Shop_Goods


GO
/****** Object:  StoredProcedure [dbo].[SP_Items_Category_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<商店信息：物品类别>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Items_Category_All]
AS
 select * from Shop_Goods_Categorys


GO
/****** Object:  StoredProcedure [dbo].[SP_Items_Category_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<商店信息：单个类别下的全部商品>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Items_Category_Single]
@CategoryID int
AS
 select * from Shop_Goods where CategoryID = @CategoryID



GO
/****** Object:  StoredProcedure [dbo].[SP_Items_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<商店信息：获取一条商品信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Items_Single]
@ID int
AS
 select * from Shop_Goods where TemplateID=@ID
GO
/****** Object:  StoredProcedure [dbo].[SP_ItemsBox_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


-- =============================================
-- Author:		<XiaoV>
-- ALTER  date: <2010-01-11>
-- Description:	<商店信息：物品箱子数据>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_ItemsBox_All]
AS
 select * from Shop_Goods_Box
GO
/****** Object:  StoredProcedure [dbo].[Sp_LogServer]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_LogServer]
@EnterTime DateTime,
@Online int,
@Reg int
AS

if Not Exists(Select EnterTime From Db_Count.dbo.Log_Server where EnterTime=@EnterTime)
   Insert Into Db_Count.dbo.Log_Server(ApplicationId,SubId,EnterTime,OnLine,Reg)
          Select 1,1,@EnterTime,@Online,@Reg

GO
/****** Object:  StoredProcedure [dbo].[SP_Mail_BySenderID]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：显示当前用户最近21条已发送邮件>
-- =============================================
CREATE Procedure [dbo].[SP_Mail_BySenderID]
@UserID int
as

select top 21 * from User_Messages
where SenderID=@UserID and datediff(hh,SendTime,getdate())<240 and Type in (1,6,10,101) order by SendDate desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Mail_ByUserID]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：当前用户全部的有效邮件>
-- =============================================
CREATE Procedure [dbo].[SP_Mail_ByUserID]
@UserID int
as

select * from User_Messages
where IsExist=1 and ReceiverID=@UserID  and datediff(hh,SendTime,getdate())<ValidDate
GO
/****** Object:  StoredProcedure [dbo].[SP_Mail_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：删除一条用户邮件>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Mail_Delete]
 @ID int,
 @UserID int,
 @SenderID int output
 AS

set @SenderID=0
declare @Annex1 int
declare @Annex2 int
declare @Type int
--declare @SenderID int
declare @Sender nvarchar(100)
declare @ReceiverID int
declare @Receiver nvarchar(100)
declare @Title nvarchar(200)
declare @Money int
declare @Annex3 int
declare @Annex4 int
declare @Annex5 int

select @SenderID=SenderID,@Sender=Sender,@ReceiverID=ReceiverID,@Receiver=Receiver,@Title=Title,@Money=[money],@Annex1=isnull(Annex1,0),@Annex2=isnull(Annex2,0),@Type=Type ,@Annex3=isnull(Annex3,0),@Annex4=isnull(Annex4,0),@Annex5=isnull(Annex5,0)
from User_Messages where ID=@ID and ReceiverID=@UserID and IsExist=1

if @Type is null or @Type=0
begin
   return 3
end

set xact_abort on
begin tran

if @Type<100 or @Money=0
begin

set @SenderID=0
update Sys_Users_Goods set IsExist=0,RemoveDate=getdate(),RemoveType=11 where ItemID in (@Annex1, @Annex2, @Annex3, @Annex4, @Annex5)

if @@error <> 0
begin
  rollback tran
  return 1
end

end
else
begin

  declare @NewTitle nvarchar(200)
  declare @NewContent nvarchar(200)
  declare @Remark nvarchar(200)
  set @NewTitle = dbo.GetTranslation('SP_Mail_Delete.Msg1')+@Title--'退回信函:    '+@Title
  set @NewContent =dbo.GetTranslation('SP_Mail_Delete.Msg2')--'您寄往<'+ @Receiver +'>的邮件由于 对方拒绝接收或超过邮件保留期而被退回!'
  set @NewContent = REPLACE(@NewContent,'{0}',@Receiver)
  set @Remark = 'Gold:0,Money:0,Annex1:'+cast(@Annex1 as nvarchar(20))+',Annex2:'+cast(@Annex2 as nvarchar(20))+',Annex3:'+cast(@Annex3 as nvarchar(20))+',Annex4:'+cast(@Annex4 as nvarchar(20))+',Annex5:'+cast(@Annex5 as nvarchar(20))
  INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,Annex3,Annex4,Annex5)
       VALUES( @ReceiverID, @Receiver, @SenderID, @Sender, @NewTitle, @NewContent, getdate(), 0, 0, 0, 0, @Annex1, @Annex2, 0, 0, 1,7, @Remark,@Annex3, @Annex4, @Annex5)

if @@error <> 0
begin
  rollback tran
  return 1
end

end


update User_Messages set IsExist = 0,SendTime = getdate() where ID=@ID and ReceiverID=@UserID

if @@error <> 0
begin
  rollback tran
  return 2
end

commit tran
set xact_abort off

return 0

GO
/****** Object:  StoredProcedure [dbo].[SP_Mail_PaymentCancel]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：取消付费邮件>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Mail_PaymentCancel]
 @userID int,
 @mailID int,
 @SenderID int out
AS

--declare @SenderID int
declare @Sender nvarchar(100)
declare @ReceiverID int
declare @Receiver nvarchar(100)
declare @Title nvarchar(1000)
declare @Annex1 nvarchar(100)
declare @Annex2 nvarchar(100)
declare @Type int
declare @Remark nvarchar(200)
declare @money int
declare @Annex3 nvarchar(100)
declare @Annex4 nvarchar(100)
declare @Annex5 nvarchar(100)

select @SenderID=SenderID,@Sender=Sender,@ReceiverID=ReceiverID,@Receiver=Receiver,@Title=Title,@Annex1=Annex1,@Annex2=Annex2,@Type=Type,@money=[money],@Annex3=Annex3,@Annex4=Annex4,@Annex5=Annex5
from User_Messages where [ID]=@mailID and ReceiverID=@userID and IsExist=1

if @Type is null or @Type<100
begin
  return 2
end

if @money = 0
begin
  return 3
end

set xact_abort on
begin tran

  declare @NewTitle nvarchar(200)
  declare @NewContent nvarchar(200)
  set @NewTitle = dbo.GetTranslation('SP_Mail_PaymentCancel.Msg1')+@Title--'退回信函:    '+@Title
  set @NewContent =dbo.GetTranslation('SP_Mail_PaymentCancel.Msg2')--'您寄往<'+ @Receiver +'>的邮件由于对方拒绝接收或超过邮件保留期而被退回!'
  set @NewContent = REPLACE(@NewContent,'{0}',@Receiver)
  set @Remark = 'Gold:0,Money:0,Annex1:'+@Annex1+',Annex2:'+@Annex2+',Annex3:'+@Annex3+',Annex4:'+@Annex4+',Annex5:'+@Annex5
  INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark, Annex3, Annex4, Annex5)
       VALUES( @ReceiverID, @Receiver, @SenderID, @Sender, @NewTitle, @NewContent, getdate(), 0, 0, 0, 0, @Annex1, @Annex2, 0, 0, 1,7,@Remark, @Annex3, @Annex4, @Annex5)

  if @@error <>0
  begin
    rollback tran
    return @@error
  end




UPDATE User_Messages Set Annex1='', Annex2='', Annex3='', Annex4='', Annex5='',IsExist=0 where ID=@mailID and ReceiverID=@userID

if @@error <>0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Mail_Scan]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：旧版扫描付费邮件，将过期的付费邮件返回给相应的用户，以邮件的方式返回>
-- =============================================
CREATE    PROCEDURE [dbo].[SP_Mail_Scan]
 @NoticeUserID nvarchar(4000) output

AS
Set @NoticeUserID=''
Declare @AuctionID Int
Declare @AuctioneerID Int
Declare @AuctioneerName Nvarchar(100)
Declare @BuyerID Int
Declare @BuyerName Nvarchar(100)
Declare @ItemID Int
Declare @PayType Int
Declare @Price Int
Declare @Name Nvarchar(200)


--定义邮件字段
Declare @MailID Int
Declare @SenderID Int
Declare @Sender Nvarchar(100)
Declare @ReceiverID Int
Declare @Receiver Nvarchar(100)
Declare @Title Nvarchar(1000)
Declare @Content Nvarchar(4000)
Declare @SendTime DateTime
Declare @IsRead Bit
Declare @IsDelR Bit
Declare @IfDelS Bit
Declare @IsDelete Bit
Declare @Annex1 Nvarchar(100)
Declare @Annex2 Nvarchar(100)
Declare @Gold Int
Declare @Money Int
Declare @Remark Nvarchar(200)
Declare @Annex3 Nvarchar(100)
Declare @Annex4 Nvarchar(100)
Declare @Annex5 Nvarchar(100)


Set @SenderID =0
Set @Sender =dbo.GetTranslation('SP_Mail_Scan.Sender')  --
Set @ReceiverID = ''
Set @Receiver = ''
Set @Title =dbo.GetTranslation('SP_Mail_Scan.Title')--'閹峰秴宕犻幋鎰!'
Set @Content =dbo.GetTranslation('SP_Mail_Scan.Content')--'閹峰秴宕犻幋鎰!'
Set @SendTime  = getdate()
Set @IsRead  = 0
Set @IsDelR = 0
Set @IfDelS = 0
Set @IsDelete =0
Set @Annex1 =''
Set @Annex2 =''
Set @Gold =0
Set @Money =0
Set @Annex3 =''
Set @Annex4 =''
Set @Annex5 =''

If object_id('tempdb..#PayMail') Is Not null
Drop Table #PayMail

Create Table #PayMail
(
id Int Identity(1,1),
MailID Int Not Null,
SenderID Int Not Null,
Sender Nvarchar(200) Not null,
ReceiverID Int not null,
Receiver Nvarchar(200) not null,
Title Nvarchar(1000) not null,
Annex1 Nvarchar(100) not null,
Annex2 Nvarchar(100) not null,
Annex3 Nvarchar(100) not null,
Annex4 Nvarchar(100) not null,
Annex5 Nvarchar(100) not null,
)

insert into #PayMail select [ID],SenderID,Sender,ReceiverID,Receiver,Title,isnull(Annex1,''),isnull(Annex2,''),isnull(Annex3,''),isnull(Annex4,''),isnull(Annex5,'') from User_Messages with(nolock)
where IsExist=1 and Type>100 and datediff(hh,SendTime,getdate())>ValidDate and [Money]>0

  declare @NewTitle nvarchar(200)
  declare @NewContent nvarchar(200)
  set @NewTitle = dbo.GetTranslation('SP_Mail_Scan.Msg1')--'闁偓閸ョ偘淇婇崙?    '+@Title
  set @NewContent =dbo.GetTranslation('SP_Mail_Scan.Msg2')--'閹劌鐦庡鈧?'+ @Receiver +'>閻ㄥ嫰鍋栨禒鍓佹暠娴滃骸顕弬瑙勫珕缂佹繃甯撮弨鑸靛灗鐡掑懓绻冮柇顔绘娣囨繄鏆€閺堢喕鈧矁顫﹂柅鈧崶?'

set xact_abort on
  begin tran

INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark, Annex3, Annex4, Annex5)
      select ReceiverID,Receiver,SenderID,Sender,@NewTitle+Title,REPLACE(@NewContent,'{0}',Receiver),getdate(), 0, 0, 0, 0,Annex1,Annex2,0,0,1,7,'Gold:0,Money:0,Annex1:'+Annex1+',Annex2:'+Annex2+',Annex3:'+Annex3+',Annex4:'+Annex4+',Annex5:'+Annex5,Annex3,Annex4,Annex5
 	from #PayMail

  if @@error<>0 or @@ROWCOUNT =0
    begin
      rollback tran
      return 1
   end

  update User_Messages set IsExist=0,@NoticeUserID = @NoticeUserID + cast(SenderID as nvarchar(50)) + ',' from User_Messages where [ID] in (select MailID from #PayMail)

  if @@error<>0 or @@ROWCOUNT =0
    begin
      rollback tran
      return 1
   end

  commit tran
set xact_abort off

if len(@NoticeUserID)>0
begin
 set @NoticeUserID = substring(@NoticeUserID,1,len(@NoticeUserID)-1)
end
--set @NoticeUserID='100,200'

return 0



GO
/****** Object:  StoredProcedure [dbo].[SP_Mail_ScanTwo]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：新版扫描用户付费邮件>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Mail_ScanTwo]
 @NoticeUserID nvarchar(4000) output

AS
set @NoticeUserID=''
declare @AuctionID int
declare @AuctioneerID int
declare @AuctioneerName nvarchar(100)
declare @BuyerID int
declare @BuyerName nvarchar(100)
declare @ItemID int
declare @PayType int
declare @Price int
declare @Name nvarchar(200)


--娣囷紕顔?
declare @MailID int
declare @SenderID int
declare @Sender nvarchar(100)
declare @ReceiverID int
declare @Receiver nvarchar(100)
declare @Title nvarchar(1000)
declare @Content nvarchar(4000)
declare @SendTime DateTime
declare @IsRead bit
declare @IsDelR bit
declare @IfDelS bit
declare @IsDelete bit
declare @Annex1 nvarchar(100)
declare @Annex2 nvarchar(100)
declare @Gold int
declare @Money int
declare @Remark nvarchar(200)
declare @Annex3 nvarchar(100)
declare @Annex4 nvarchar(100)
declare @Annex5 nvarchar(100)


set @SenderID =0
set @Sender =dbo.GetTranslation('SP_Mail_Scan.Sender')--'瀵懓鑴婇崼鍌涘閸楁牔鑵戣箛?
set @ReceiverID = ''
set @Receiver = ''
set @Title =dbo.GetTranslation('SP_Mail_Scan.Title')--'閹峰秴宕犻幋鎰!'
set @Content =dbo.GetTranslation('SP_Mail_Scan.Content')--'閹峰秴宕犻幋鎰!'
set @SendTime  = getdate()
set @IsRead  = 0
set @IsDelR = 0
set @IfDelS = 0
set @IsDelete =0
set @Annex1 =''
set @Annex2 =''
set @Gold =0
set @Money =0
set @Annex3 =''
set @Annex4 =''
set @Annex5 =''

if object_id('tempdb..#PayMail') is not null
drop table #PayMail 

create table #PayMail 
( 
id int identity(1,1), 
MailID int not null,
SenderID int not null,
Sender nvarchar(200) not null,
ReceiverID int not null,
Receiver nvarchar(200) not null,
Title nvarchar(1000) not null,
Annex1 nvarchar(100) not null,
Annex2 nvarchar(100) not null,
Annex3 nvarchar(100) not null,
Annex4 nvarchar(100) not null,
Annex5 nvarchar(100) not null,
) 

insert into #PayMail select [ID],SenderID,Sender,ReceiverID,Receiver,Title,isnull(Annex1,''),isnull(Annex2,''),isnull(Annex3,''),isnull(Annex4,''),isnull(Annex5,'') from User_Messages 
where IsExist=1 and Type>100 and datediff(hh,SendTime,getdate())>ValidDate and [Money]>0

  declare @NewTitle nvarchar(200)
  declare @NewContent nvarchar(200)
  set @NewTitle = dbo.GetTranslation('SP_Mail_Scan.Msg1')--'闁偓閸ョ偘淇婇崙?    '+@Title
  set @NewContent =dbo.GetTranslation('SP_Mail_Scan.Msg2')--'閹劌鐦庡鈧?'+ @Receiver +'>閻ㄥ嫰鍋栨禒鍓佹暠娴滃骸顕弬瑙勫珕缂佹繃甯撮弨鑸靛灗鐡掑懓绻冮柇顔绘娣囨繄鏆€閺堢喕鈧矁顫﹂柅鈧崶?'
 
set xact_abort on 
  begin tran

INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark, Annex3, Annex4, Annex5) 
      select ReceiverID,Receiver,SenderID,Sender,@NewTitle,REPLACE(@NewContent,'{0}',Receiver),getdate(), 0, 0, 0, 0,Annex1,Annex2,0,0,1,7,'Gold:0,Money:0,Annex1:'+Annex1+',Annex2:'+Annex2+',Annex3:'+Annex3+',Annex4:'+Annex4+',Annex5:'+Annex5,Annex3,Annex4,Annex5
 	from #PayMail

  if @@error<>0 or @@ROWCOUNT =0
    begin
      rollback tran
      return 1 
   end

  update User_Messages set IsExist=0,@NoticeUserID = @NoticeUserID + cast(SenderID as nvarchar(50)) + ',' from User_Messages where [ID] in (select MailID from #PayMail)

  if @@error<>0 or @@ROWCOUNT =0
    begin
      rollback tran
      return 1 
   end

  commit tran
set xact_abort off

if len(@NoticeUserID)>0
begin
 set @NoticeUserID = substring(@NoticeUserID,1,len(@NoticeUserID)-1)
end
--set @NoticeUserID='100,200'

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Mail_Send]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：用户发送一封邮件>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Mail_Send]   
 @ID int output, 
 @SenderID int, 
 @Sender nvarchar(100), 
 @ReceiverID int, 
 @Receiver nvarchar(100), 
 @Title nvarchar(1000), 
 @Content nvarchar(4000), 
 @SendTime DateTime, 
 @IsRead bit, 
 @IsDelR bit, 
 @IfDelS bit, 
 @IsDelete bit, 
 @Annex1 nvarchar(100), 
 @Annex2 nvarchar(100), 
 @Gold int, 
 @Money int, 
 @IsExist bit,
 @Type int,
 @Annex1Name nvarchar(100), 
 @Annex2Name nvarchar(100),
 @Annex3 nvarchar(100), 
 @Annex4 nvarchar(100), 
 @Annex5 nvarchar(100), 
 @Annex3Name nvarchar(100), 
 @Annex4Name nvarchar(100),
 @Annex5Name nvarchar(100),
 @ValidDate int,
 @AnnexRemark nvarchar(200),
 @GiftToken int = 0
AS  

   begin 
     
     --declare @ValidDate int 
     declare @Remark nvarchar(100)
     set @Remark = 'Gold:'+cast(@Gold as varchar(20))+',Money:'+cast(@Money as varchar(20))+',Annex1:'+@Annex1+',Annex2:'+@Annex2+',Annex3:'+@Annex3+',Annex4:'+@Annex4+',Annex5:'+@Annex5+',GiftToken:'+cast(@GiftToken as varchar(20))
     if @Type>100 
       begin
          set @ValidDate=@ValidDate
       end
      else
       begin
         set @ValidDate=10*24
       end


     INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,ValidDate,Annex1Name,Annex2Name,Annex3,Annex4,Annex5,Annex3Name,Annex4Name,Annex5Name,AnnexRemark,GiftToken) 
     VALUES( @SenderID, @Sender, @ReceiverID, @Receiver, @Title, @Content, @SendTime, @IsRead, @IsDelR, @IfDelS, @IsDelete, @Annex1, @Annex2, @Gold, @Money, @IsExist,@Type,@Remark,@ValidDate,@Annex1Name,@Annex2Name,@Annex3,@Annex4,@Annex5,@Annex3Name,@Annex4Name,@Annex5Name,@AnnexRemark,@GiftToken)
     select @@identity as 'identity'
     set @ID=@@identity    
 end
GO
/****** Object:  StoredProcedure [dbo].[SP_Mail_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：显示一条邮件>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Mail_Single]   
 @ID int, 
 @UserID int
AS  

   begin 
     select * from User_Messages WHERE ID=@ID and ReceiverID = @UserID and IsExist = 1 --and type<100
     --应临时取消付费邮件select * from User_Messages WHERE ID=@ID and ReceiverID = @UserID and IsExist = 1
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Mail_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：用户查阅邮件后，取出相关的附件>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_Mail_Update]   
 @ID int, 
 @SenderID int, 
 @Sender nvarchar(100), 
 @ReceiverID int, 
 @Receiver nvarchar(100), 
 @Title nvarchar(1000), 
 @Content nvarchar(4000), 
 @SendTime DateTime, 
 @IsRead bit, 
 @IsDelR bit, 
 @IfDelS bit, 
 @IsDelete bit, 
 @Annex1 nvarchar(100), 
 @Annex2 nvarchar(100), 
 @Gold int, 
 @Money int, 
 @IsExist bit,
 @Type int,
 @OldMoney int,
 @ValidDate int,
 @Annex1Name nvarchar(100), 
 @Annex2Name nvarchar(100),
 @Annex3 nvarchar(100), 
 @Annex4 nvarchar(100), 
 @Annex5 nvarchar(100), 
 @Annex3Name nvarchar(100), 
 @Annex4Name nvarchar(100),
 @Annex5Name nvarchar(100),
 @GiftToken  int = 0
AS  

set xact_abort on 
begin tran


if @Type>100 and @Money<>@OldMoney
begin
  set @ValidDate=72
  declare @Remark nvarchar(200)
  declare @NewTitle nvarchar(200)
  declare @NewContent nvarchar(200)
  declare @AnnexRemark nvarchar(200)
  set @NewTitle = dbo.GetTranslation('SP_Mail_Update.Msg1')+@Title--'付款信函:    '+@Title
  --付款信函内容改为"你寄往<对方玩家>的<物品>已经付费，付费金额为<数量>点券"
  if @Annex2Name is not null and @Annex2Name<>''
    begin
	if @Annex1Name is not null and @Annex1Name<>''
	begin
	 set @Annex1Name=@Annex1Name + ','
	end
       set @Annex1Name = @Annex1Name +@Annex2Name
    end
  if @Annex3Name is not null and @Annex3Name<>''
    begin
	if @Annex1Name is not null and @Annex1Name<>''
	begin
	 set @Annex1Name=@Annex1Name + ','
	end
       set @Annex1Name = @Annex1Name + @Annex3Name
    end
  if @Annex4Name is not null and @Annex4Name<>''
    begin
	if @Annex1Name is not null and @Annex1Name<>''
	begin
	 set @Annex1Name=@Annex1Name + ','
	end
       set @Annex1Name = @Annex1Name +@Annex4Name
    end
  if @Annex5Name is not null and @Annex5Name<>''
    begin
	if @Annex1Name is not null and @Annex1Name<>''
	begin
	 set @Annex1Name=@Annex1Name + ','
	end
       set @Annex1Name = @Annex1Name +@Annex5Name
    end

  set @NewContent =dbo.GetTranslation('SP_Mail_Update.Msg2')--'您寄往<'+ @Receiver +'>的  '+ @Annex1Name +'  已经付费，付款金额为'+cast(@OldMoney as varchar(20))+'点券!'
  set @NewContent = REPLACE(@NewContent,'{0}',@Receiver)
  set @NewContent = REPLACE(@NewContent,'{1}',@Annex1Name)
  set @NewContent = REPLACE(@NewContent,'{2}',cast(@OldMoney as varchar(20)))
  set @Remark = 'Gold:0,Money:'+cast(@OldMoney as varchar(20))+',Annex1:,Annex2:,Annex3:,Annex4:,Annex5:GiftToken:0'
  set @AnnexRemark =dbo.GetTranslation('SP_Mail_Update.Msg3')--'附件为：1、点券{0}'
  set @AnnexRemark = REPLACE(@AnnexRemark,'{0}',cast(@OldMoney as varchar(20)))
  INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,AnnexRemark) 
       VALUES( @ReceiverID, @Receiver, @SenderID, @Sender, @NewTitle, @NewContent, getdate(), 0, 0, 0, 0, '', '', 0, @OldMoney, 1,6,@Remark,@AnnexRemark)

  if @@error <>0
  begin 
    rollback tran
    return @@error
  end

end


UPDATE User_Messages Set SenderID=@SenderID, Sender=@Sender, ReceiverID=@ReceiverID, Receiver=@Receiver, Title=@Title, Content=@Content, SendTime=@SendTime, IsRead=@IsRead, IsDelR=@IsDelR, IfDelS=@IfDelS, IsDelete=@IsDelete, Annex1=@Annex1, Annex2=@Annex2, Gold=@Gold, Money=@Money, IsExist=@IsExist ,ValidDate=@ValidDate, Annex3=@Annex3, Annex4=@Annex4, Annex5=@Annex5,GiftToken=@GiftToken
where ID=@ID and ReceiverID=@ReceiverID

if @@error <>0
begin 
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Maps_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<地图信息：读取全部地图>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Maps_All]
AS  
 select *  from Game_Map order by ID desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Maps_Award_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<战斗信息：翻牌奖励配置>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Maps_Award_All]
AS  
 select * from Map_Award



GO
/****** Object:  StoredProcedure [dbo].[SP_Maps_Goods_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<战斗信息：地图物品掉落配置>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Maps_Goods_All]
AS  
 select * from Map_Goods

GO
/****** Object:  StoredProcedure [dbo].[SP_Maps_Props_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<战斗信息：纯道具掉落，指右下角三个道具框>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Maps_Props_All]
AS  
 select * from Map_Props


GO
/****** Object:  StoredProcedure [dbo].[SP_Maps_Quest_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<战斗信息：任务物品掉落配置>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Maps_Quest_All]
AS  
 select * from Map_Quest_Goods
GO
/****** Object:  StoredProcedure [dbo].[SP_Maps_Server_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<战斗信息：随机地图加载>
-- =============================================
CREATE Procedure [dbo].[SP_Maps_Server_All]
as
select * from Map_Server


GO
/****** Object:  StoredProcedure [dbo].[SP_Maps_Week_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<战斗信息：随机地图加载周配置>
-- =============================================
CREATE Procedure [dbo].[SP_Maps_Week_All]
as
select * from Map_Week

GO
/****** Object:  StoredProcedure [dbo].[SP_MarryInfo_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<结婚信息：插入结婚信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_MarryInfo_Add]   
 @ID int output, 
 @UserID int, 
 @IsPublishEquip bit, 
 @Introduction nvarchar(120),
 @RegistTime datetime

AS  
     INSERT INTO Marry_Info( UserID,IsPublishEquip,Introduction,RegistTime) 
     VALUES( @UserID,@IsPublishEquip,@Introduction,@RegistTime)
     select @@identity as 'identity'
     set @ID=@@identity
GO
/****** Object:  StoredProcedure [dbo].[SP_MarryInfo_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<结婚信息：删除一个用户的结婚信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_MarryInfo_Delete]
 @ID int,
 @UserID int

AS  

set xact_abort on 
begin tran

  update Marry_Info set IsExist=0 where ID=@ID and UserID=@UserID
 
  if @@error<>0 or @@ROWCOUNT =0
    begin
      rollback tran
      return 1 
   end
commit tran
set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_MarryInfo_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<交友信息：显示一条交友信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_MarryInfo_Single]   
 @ID int
AS  

   begin 
     select * from Marry_Info WHERE ID=@ID and IsExist = 1
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_MarryInfo_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<交友信息：更新一条交友信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_MarryInfo_Update] 
 @ID int, 
 @UserID int, 
 @IsPublishEquip bit, 
 @Introduction nvarchar(120),
 @RegistTime datetime

AS  

set xact_abort on 
begin tran

  update Marry_Info set IsPublishEquip=@IsPublishEquip,Introduction=@Introduction,RegistTime=@RegistTime  where ID=@ID and IsExist=1
 
  if @@error<>0 or @@ROWCOUNT =0
    begin
      rollback tran
      return 1
   end

commit tran
set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Mission_Info_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


-- =============================================
-- Author:		<Peter>
-- ALTER  date: <2009-11-27>
-- Description:	<Mission Info>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Mission_Info_All]
AS  
    SELECT * FROM Mission_Info
GO
/****** Object:  StoredProcedure [dbo].[SP_NPC_Info_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<jacken>
-- ALTER  date: <2009-11-11>
-- Description:	<NPC信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_NPC_Info_All]
AS  
 select *  from NPC_Info
GO
/****** Object:  StoredProcedure [dbo].[SP_PayState]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:<Watson>
-- ALTER  date: <2009-11-25>
-- Description:	<订单查询：1存在，0不存在>
-- =============================================
CREATE Procedure [dbo].[SP_PayState]
@chargeId varchar(50)
as
begin
select count(*) as state from db_tank.dbo.charge_money where chargeId=@chargeId
end
GO
/****** Object:  StoredProcedure [dbo].[SP_PveInfos_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Peter>
-- ALTER  date: <2009-11-23>
-- Description:	<地图信息：读取全部Npc>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_PveInfos_All]
AS  
 select *  from Pve_Info ORDER BY Type, Ordering
GO
/****** Object:  StoredProcedure [dbo].[SP_Quest_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<任务信息：任务模板>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Quest_All]
 AS  
   begin 
     select * from Quest
   end

GO
/****** Object:  StoredProcedure [dbo].[SP_Quest_Condiction_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		<Xiaov>
-- ALTER  date: <2009-11-19>
-- Description:	<任务信息：任务条件表>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Quest_Condiction_All]
 AS  
   begin 
     select * from Quest_Condiction
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Quest_Goods_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		<Xiaov>
-- ALTER  date: <2009-11-19>
-- Description:	<任务信息：任务奖励表>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_Quest_Goods_All]
 AS  
   begin 
     select * from Quest_Goods
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Quest_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<任务信息：加载一条任务信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Quest_Single]
@QuestId int
 AS  
   begin 
     select * from Quest where QuestId=@QuestId
   end

GO
/****** Object:  StoredProcedure [dbo].[SP_QuestData_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<任务信息：用户接受一条任务>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_QuestData_Add]   
 @UserId int, 
 @QuestId int, 
 @CompletedDate DateTime,
 @IsComplete bit, 
 @Condition1 int, 
 @Condition2 int, 
 @Condition3 int, 
 @Condition4 int, 
 @IsExist bit,
 @RepeatFinish int,
 @RandDobule int
as
declare  @temp int
select @temp = count(*) from QuestData where UserId=@UserId and QuestId=@QuestId
if @temp=0 
   begin 

     INSERT INTO QuestData(UserId, QuestId,CompletedDate,IsComplete,Condition1,Condition2,Condition3,Condition4,IsExist,RepeatFinish,RandDobule) 
     VALUES(@UserId, @QuestId,@CompletedDate,@IsComplete,@Condition1,@Condition2,@Condition3,@Condition4,@IsExist,@RepeatFinish,@RandDobule) 
 end 
 else
   begin 
     UPDATE QuestData Set CompletedDate= @CompletedDate,IsComplete=@IsComplete,Condition1=@Condition1,Condition2=@Condition2,Condition3=@Condition3,Condition4=@Condition4,IsExist=@IsExist,RepeatFinish=@RepeatFinish,RandDobule=@RandDobule  WHERE UserId=@UserId and QuestId=@QuestId
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_QuestData_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <2009-10-11>
-- Description:	<获取当前玩家的系统中存在的任务>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_QuestData_All]
 @UserID int
AS  
Begin
     select * from QuestData  where UserID = @UserID and IsExist = 1
End
GO
/****** Object:  StoredProcedure [dbo].[SP_QuestData_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<任务信息：更新用户任务数据>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_QuestData_Update]
 @UserId int, 
 @QuestId int, 
 @ConditionCount int, 
 @IsComplete bit, 
 @CompletedDate DateTime
as
   begin 
   Select 1
--     UPDATE QuestData Set  ConditionCount=@ConditionCount, IsComplete=@IsComplete, CompletedDate=@CompletedDate WHERE UserId=@UserId and QuestId=@QuestId
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Rate]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<服务器信息：功勋、财富、经验倍率配置>
-- =============================================
CREATE  procedure [dbo].[SP_Rate]
@serverId int
as
begin
 select * from Rate where ServerID = @serverId
end


GO
/****** Object:  StoredProcedure [dbo].[SP_Rate_WithType]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<服务器信息：读取一种倍率>
-- =============================================
CREATE procedure [dbo].[SP_Rate_WithType]
@serverId int,
@type int
as

begin
 select * from Rate where ServerID = @serverId and Type = @type
end


GO
/****** Object:  StoredProcedure [dbo].[Sp_Renames_Batch]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
















-- =============================================
-- Author:		<XiaoV>
-- Create date: <2009-09-25>
-- Description:	<用户提交后批量修改用户名与公会>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Renames_Batch]

AS
BEGIN

Declare  @Db_A NVarchar(100)  
Set  @Db_A='Db_Tank'
/*第一步修改用户昵称*/
  /*第一：将需要变更昵称的用户列出来*/
  Create Table #Temp_User(UserId Int,NickName nvarchar(50))    
  Exec('Insert Into  #Temp_User
   SELECT B.UserID,B.NickName FROM ( SELECT UserName,MAX(ID) ID FROM '+@Db_A+'.dbo.Rename_Nick 
         WHERE IsExist=1  GROUP BY UserName )A
               LEFT OUTER JOIN '+@Db_A+'.dbo.Rename_Nick B
                    ON A.ID=B.ID')
  Print '1'

  /*第二：更新Consortia的CreatorName、ChairmanName*/  
  Exec('Update A Set A.CreatorName=B.NickName From '+@Db_A+'.dbo.Consortia A ,#Temp_User B
         Where A.CreatorID=B.UserId')
  
  Exec('Update A Set A.ChairmanName=B.NickName From '+@Db_A+'.dbo.Consortia A,#Temp_User B
         Where A.ChairmanID=B.UserId')
  Print '2'

  /*第三：更新Consortia_Apply_Users的UserName*/
  Exec('Update A Set A.UserName=B.NickName From '+@Db_A+'.dbo.Consortia_Apply_Users A ,#Temp_User B
         Where A.UserID=B.UserId')
  Print '3' 

  /*第四：更新Consortia_Invite_Users的UserName、InviteName*/      
  Exec('Update A Set A.UserName=B.NickName From '+@Db_A+'.dbo.Consortia_Invite_Users A,#Temp_User B
         Where A.UserID=B.UserId')

  Exec('Update A Set A.InviteName=B.NickName From '+@Db_A+'.dbo.Consortia_Invite_Users A,#Temp_User B
         Where A.InviteID=B.UserId')
  Print '4'

  /*第五：更新Consortia_Users的UserName	RatifierName*/  
  Exec('Update A Set A.UserName=B.NickName From '+@Db_A+'.dbo.Consortia_Users A ,#Temp_User B 
         Where A.UserID=B.UserId')

  Exec('Update A Set A.RatifierName=B.NickName From '+@Db_A+'.dbo.Consortia_Users A,#Temp_User B
         Where A.RatifierID=B.UserId')
  Print '5'

  /*第六：Marry_Apply的ApplyUserName*/
  Exec('Update A Set A.ApplyUserName=B.NickName From '+@Db_A+'.dbo.Marry_Apply A,#Temp_User B
         Where A.ApplyUserID=B.UserId')
  Print '6'  

  /*第七：Marry_Room_Info的PlayerName、GroomName、BrideName*/
  Exec('Update A Set A.PlayerName=B.NickName From '+@Db_A+'.dbo.Marry_Room_Info A,#Temp_User B
         Where A.PlayerID=B.UserId')

  Exec('Update A Set A.GroomName=B.NickName From '+@Db_A+'.dbo.Marry_Room_Info A,#Temp_User B
         Where A.GroomID=B.UserId')
  

  Exec('Update A Set A.BrideName=B.NickName From '+@Db_A+'.dbo.Marry_Room_Info A,#Temp_User B
         Where A.BrideID=B.UserId')
 
  Print '7'

  /*第八:User_Messages的Receiver、Sender*/
  Exec('Update A Set A.Receiver=B.NickName From '+@Db_A+'.dbo.User_Messages A,#Temp_User B
         Where A.ReceiverID=B.UserId')
  
  Exec('Update A Set A.Sender=B.NickName From '+@Db_A+'.dbo.User_Messages A,#Temp_User B
         Where A.SenderID=B.UserId')
  Print '8'

  /*第九：更新更新Sys_Users_Detail的SpouseName*/
  Exec('Update A Set A.SpouseName=B.NickName From '+@Db_A+'.dbo.Sys_Users_Detail A,#Temp_User B
        Where A.SpouseID=B.UserId')

  Exec('Update A Set A.NickName=B.NickName From '+@Db_A+'.dbo.Sys_Users_Detail A,#Temp_User B
        Where A.UserId=B.UserId')
  Print '9'

  /*第十:更新Auction的AuctioneerName、BuyerName*/
  Exec('Update A Set A.AuctioneerName=B.NickName From '+@Db_A+'.dbo.Auction A,#Temp_User B
        Where A.AuctioneerID=B.UserId')
  Print '10'

  Exec('Update A Set A.BuyerName=B.NickName From '+@Db_A+'.dbo.Auction A,#Temp_User B
        Where A.BuyerID=B.UserId')
  Print '11'

 
  /*第十：清除批处理数据*/
  Exec('Update  '+@Db_A+'.dbo.Rename_Nick Set IsExist=0  Where IsExist=1')
  Drop Table #Temp_User

/*第二步：修改工会昵称*/
  Create Table #Temp_Consortia(ConsortiaID Int,ConsortiaName nvarchar(200))    
  Exec('Insert Into #Temp_Consortia
  Select ConsortiaID,ConsortiaName From  '+@Db_A+'.dbo.Rename_Consortia  Where  IsExist=1')

  Print '12'

  /*第一：Consortia_Apply_Users的ConsortiaName*/
  Exec('Update A Set A.ConsortiaName=B.ConsortiaName From '+@Db_A+'.dbo.Consortia_Apply_Users A,#Temp_Consortia B
         Where A.ConsortiaID=B.ConsortiaID')
  Print '13'
  
  /*第二：Consortia_Invite_Users的ConsortiaName*/
  Exec('Update A Set A.ConsortiaName=B.ConsortiaName From '+@Db_A+'.dbo.Consortia_Invite_Users A,#Temp_Consortia B
         Where A.ConsortiaID=B.ConsortiaID')
  Print '14'
   
  /*第三：Consortia的ConsortiaName*/
  Exec('Update A Set A.ConsortiaName=B.ConsortiaName From '+@Db_A+'.dbo.Consortia A,#Temp_Consortia B
         Where A.ConsortiaID=B.ConsortiaID')
  Print '15'

  /*清除批处理数据*/
  Exec('Update  '+@Db_A+'.dbo.Rename_Consortia Set IsExist=0  Where IsExist=1')
  Drop Table #Temp_Consortia
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ReturnItem]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<邮件信息：已废>
-- =============================================
CREATE Procedure [dbo].[SP_ReturnItem]
as

set xact_abort on 
begin tran

     INSERT INTO User_Messages( SenderID, Sender, ReceiverID, Receiver, Title, Content, SendTime, IsRead, IsDelR, IfDelS, IsDelete, Annex1, Annex2, Gold, Money, IsExist,Type,Remark,ValidDate,Annex1Name,Annex2Name,Annex3,Annex4,Annex5,Annex3Name,Annex4Name,Annex5Name,AnnexRemark) 
 select  0, '系统管理员', UserID, '', '物品返回', '物品返回', getdate(), 0, 0, 0, 0, ItemID, '', 0, 0, 1,51,'Gold:0,Money:0,Annex1:'+cast(ItemID as nvarchar(20))+',Annex2:,Annex3:,Annex4:,Annex5:',10,'','','','','','','','','' from Sys_users_Goods where BagType=0 and place>=80

  if @@error<>0
  begin  
    rollback tran
    return @@error
  end

Update Sys_users_Goods set place=-1 where BagType=0 and place>=80

  if @@error<>0
  begin  
    rollback tran
    return @@error
  end

select 'finish'

commit tran
set xact_abort off


return 0

GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Marry_Prop]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<结婚信息：查询用户结婚信息>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Select_Marry_Prop]
@UserID int
AS
begin
  select IsMarried,SpouseID,SpouseName,MarryInfoID,IsCreatedMarryRoom,SelfMarryRoomID,IsGotRing  from sys_users_detail where UserID=@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Server_Config]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<服务器信息：服务器配置信息>
-- =============================================
CREATE Procedure [dbo].[SP_Server_Config]
as
select * from Server_Config


GO
/****** Object:  StoredProcedure [dbo].[SP_Server_Config_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Justin>
-- ALTER  date: <2010-1-8>
-- Description:	根据Key获取服务器配置
-- =============================================
CREATE Procedure [dbo].[SP_Server_Config_Single]
	@Key nvarchar(50)
AS
BEGIN
	select * from Server_Config where Name = @Key
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Server_Config_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Justin>
-- ALTER  date: <2010-1-11>
-- Description:	<更新一条服务器配置信息>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_Server_Config_Update]   
 @Key nvarchar(50), 
 @Value nvarchar(2000)
AS  
BEGIN 
     Declare @Counts Int 
     Declare @Maxs Int
     Select @Counts= IsNull(Count(*),0)  From Server_Config Where Name=@Key
     Select @Maxs=IsNull(Max(id),0)+1 From Server_Config

     If @Counts=1
         Update Server_Config Set Value=@Value Where  Name=@Key
     Else
         Insert Into Server_Config(Id,Name,Value) Values(@Maxs,@Key,@Value)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Server_Equip]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE [dbo].[SP_Server_Equip]
as
select value from Server_config 
where [Name]='Equip'
GO
/****** Object:  StoredProcedure [dbo].[SP_Service_List]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<服务器信息：全部频道>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Service_List]  
AS  

   begin 
     select * from Server_List
   end

GO
/****** Object:  StoredProcedure [dbo].[SP_Service_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_Service_Single]  
 @ID int
AS  

   begin 
     select * from Server_List WHERE ID=@ID 
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Service_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<服务器信息：更新一条服务器信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Service_Update]   
 @ID int, 
 @State int, 
 @Online int
 AS  
   begin 
     UPDATE Server_List Set State=@State, Online=@Online WHERE ID=@ID
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Shop_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<商店信息：商店全部商品>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Shop_All]
AS  
 select *  from Shop order by sort desc
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_BackUpData]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<备份数据库>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Sys_BackUpData] AS 
declare @filename nvarchar(100)--文件名 
set @filename='D:\DataBackUp\'+convert(varchar(10),getdate(),120)+'DB_Tank'+'.dat' --文件路径及文件名 
print @filename BACKUP DATABASE [Db_Tank] TO DISK = @filename WITH INIT , NOUNLOAD , NAME = N'XX数据备份', NOSKIP , STATS = 10, NOFORMAT
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Clear_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<过期信息：清楚已删除数据>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Clear_All]
as

exec SP_Sys_Clear_Messages

exec SP_Sys_Clear_Friends

exec SP_Sys_Clear_Items

exec SP_Sys_Clear_Auction

exec SP_Sys_Clear_Consortia

exec SP_Consortia_Scan ''

exec SP_Auction_Scan ''

exec SP_Mail_Scan ''

exec SP_Sys_Clear_State

exec Sp_Sys_DataBaseSet

exec Sp_Sys_QuestData
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Clear_Auction]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<过期信息：清除拍卖行删除记录>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Clear_Auction]
as
delete Auction where IsExist=0


GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Clear_Consortia]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<过期信息：清除公会删除记录>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Clear_Consortia]
as
delete Consortia_Apply_Users where IsExist=0
delete Consortia_Invite_Users where IsExist=0
delete Consortia_Ally where IsExist=0 or state=0
delete Consortia_Duty where IsExist=0
delete Consortia where IsExist=0
delete Consortia_Event where IsExist=0
delete Consortia_Users where IsExist=0
delete Consortia_Apply_Ally where IsExist=0

delete Consortia_Equip_Control where IsExist=0
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Clear_Friends]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<过期信息：清除好友删除记录>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Clear_Friends]
as
delete Sys_Users_Friends where IsExist=0

GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Clear_Items]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<过期信息：清除用户删除记录>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Clear_Items]
as
delete Sys_Users_Goods where IsExist = 0

GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Clear_Messages]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<过期信息：清除用户删除邮件>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Clear_Messages]
as
declare @date datetime
set @date=dateadd(day,-20,getdate())
select @date

--set xact_abort on 
--begin tran 

--delete Sys_Users_Goods where ItemID in (select cast(Annex1 as int) from User_Messages where dateadd(day,21,SendTime)<getdate() and (Type<100 or [Money]=0))
delete Sys_Users_Goods where ItemID in (select cast(Annex1 as int) from User_Messages where SendTime<@date  and (Type<100 or [Money]=0))

--if @@error <>0
--begin 
--  rollback tran
--  return @@error
--end

--delete Sys_Users_Goods where ItemID in (select cast(Annex2 as int) from User_Messages where dateadd(day,21,SendTime)<getdate() and (Type<100 or [Money]=0))
delete Sys_Users_Goods where ItemID in (select cast(Annex2 as int) from User_Messages where SendTime<@date and (Type<100 or [Money]=0))

--if(@@error <>0)
--begin 
--  rollback tran
--  return @@error
--end

--delete User_Messages where dateadd(day,21,SendTime)<getdate()
delete User_Messages where SendTime<@date

--if @@error<>0
--begin
--  rollback tran
--  return @@error
--end

--commit tran
--set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Clear_State]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<过期信息：清除服务器信息>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Clear_State]
as
update Server_List set state=1,Online=0
update Sys_Users_Detail set state=0




GO
/****** Object:  StoredProcedure [dbo].[Sp_Sys_DataBaseSet]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sp_Sys_DataBaseSet] AS
/*1. 不要使用自动收缩, 自动收缩会定期收容数据文件的空闲空间,则处理需要的时候却要扩大数据文件,这两者相反的处理,是冲突的*/
ALTER DATABASE Db_Tank SET AUTO_SHRINK OFF

/*2. 如果你不进行事务日志备份, 也不需要利用事务日志做处理,则可以将数据库恢复模型设置为SIMPLE, 减少日志记录, 减轻磁盘I/O压力*/
ALTER DATABASE Db_Tank SET RECOVERY SIMPLE

/*3. 设置更小的文件增长步骤,以减少每次数据文件分配空间所需要的时间*/
ALTER DATABASE Db_Tank 
MODIFY FILE(
NAME='Db_Tank_Data',
FILEGROWTH=500 MB)  --不要使用百分比, 不然数据文件大了的话,这个百分比的结果就很大

ALTER DATABASE Db_Tank 
MODIFY FILE(
NAME='Db_Tank_Log',
FILEGROWTH=300 MB)  --不要使用百分比, 不然数据文件大了的话,这个百分比的结果就很大

/*4. 如果通过上述处理还无法解决问题,则应该考虑你的磁盘I/O性能不行,考虑提高硬件配置. */

/*5为数据文件预先分配足够大的空间,避免数据处理时分配空间*/
--暂不使用
--ALTER DATABASE MyDataBase 
--MODIFY FILE(
--NAME='MyDataBase_Date',
--SIZE=500 GB)  -- 预设数据文件大小为500GB
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Insert_TestID]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：自动注册帐号>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Insert_TestID]
@startID int,
@endID int
as

declare @temp varchar(50)

while @startID <= @endID
begin

set @temp = 'test' + cast(@startID as varchar(20))
exec SP_Users_Active @startID,0,0,0,0,10000000,10000000,',,,,,,',',,,,,,',1111111111,1,1,0,0,@temp,@temp,1,'','',''

exec SP_Users_Register @temp,@temp,@temp,7001,3101,6101,5101,7002,3201,6201,5201,'','','','',1

set @startID = @startID + 1

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Sys_QuestData]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		<Xaiov>
-- ALTER  date: <2010-02-25>
-- Description:	<清除用户任务过期数据>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Sys_QuestData] AS
Delete FROM QuestData where isexist=0
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Truncate_UserAllInfo]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<过期信息：开服清除所有数据>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Truncate_UserAllInfo]
as
truncate table Sys_Users_Detail
truncate table Sys_Users_Fight
truncate table Sys_Users_Goods
truncate table User_Messages
truncate table QuestData
truncate table Sys_Users_Friends
truncate table Charge_Money
truncate table User_Buff

truncate table Auction
truncate table AASInfo
 

truncate table Consortia_Apply_Users
truncate table Consortia_Invite_Users
truncate table Consortia_Ally
truncate table Consortia_Duty
truncate table Consortia
truncate table Consortia_Event
truncate table Consortia_Users
truncate table Consortia_Apply_Ally
truncate table Consortia_Equip_Control

truncate table Marry_Apply
truncate table Marry_Info
truncate table Marry_Room_Info
truncate table Fight_Record

truncate table Rename_Consortia
truncate table Rename_Nick
truncate table Sys_Users_Order
truncate table Sys_Users_Password
truncate table User_Buff

--设置数据库属性
exec Sp_Sys_DataBaseSet
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_BestEquip]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<更新信息：获取最好装配的信息>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Sys_Update_BestEquip]
as
select  Sys_Users_Detail.UserName,Sys_Users_Detail.NickName,Sys_Users_Detail.Grade,Sys_Users_Detail.Sex,Sys_Users_Detail.GP,Shop_Goods.Name,Sys_Users_Goods.Strengthenlevel,Sys_Users_Goods.RemoveDate
 from Sys_Users_Goods 
left join Sys_Users_Detail on
Sys_Users_Goods.UserID=Sys_Users_Detail.UserID
left Join Shop_Goods on
Sys_Users_Goods.TemplateID=Shop_Goods.TemplateID
where Sys_Users_Goods.UserID>0 and Sys_Users_Goods.TemplateID in(7015,7016,7017,7018,7019,7020,7021,7022,7023)
and CONVERT(varchar(20),dateadd(dd,1,RemoveDate),101)=CONVERT(varchar(20),getdate(),101)
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_Consortia_DayList]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<更新信息：更新公会日排行功能>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Update_Consortia_DayList]
as 
update Consortia set AddDayRiches=Riches +isnull((select sum(Riches) from Consortia_Level  with (nolock) where Level<=a.Level),0)  +isnull((select sum(StoreRiches) from Consortia_Level  with (nolock) where Level<=a.StoreLevel),0) +isnull((select sum(SmithRiches) from Consortia_Level with (nolock) where Level<=a.SmithLevel),0) +isnull((select sum(ShopRiches) from Consortia_Level  with (nolock) where Level<=a.ShopLevel),0) -LastDayRiches,
 LastDayRiches=Riches + isnull((select sum(Riches) from Consortia_Level with (nolock) where Level<=a.Level),0)  +isnull((select sum(StoreRiches) from Consortia_Level with (nolock) where Level<=a.StoreLevel),0) +isnull((select sum(SmithRiches) from Consortia_Level with (nolock) where Level<=a.SmithLevel),0) +isnull((select sum(ShopRiches) from Consortia_Level with (nolock) where Level<=a.ShopLevel),0) ,
 AddWeekRiches=Riches +isnull((select sum(Riches) from Consortia_Level with (nolock) where Level<=a.Level),0)  +isnull((select sum(StoreRiches) from Consortia_Level with (nolock) where Level<=a.StoreLevel),0) +isnull((select sum(SmithRiches) from Consortia_Level with (nolock) where Level<=a.SmithLevel),0) +isnull((select sum(ShopRiches) from Consortia_Level  with (nolock) where Level<=a.ShopLevel),0) -LastWeekRiches,
 AddDayHonor = Honor-LastDayHonor, AddWeekHonor = Honor-LastWeekHonor,
 LastDayHonor = Honor
from Consortia  a with (nolock) where IsExist=1
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_Consortia_FightPower]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<jacken>
-- ALTER  date: <2010-02-02>
-- Description:	<更新信息：更新公会战斗力排行榜>
-- =============================================
CREATE  Procedure [dbo].[SP_Sys_Update_Consortia_FightPower]
as 
update  Consortia set FightPower = isnull(A.FightPower,0) from Consortia
left join (select consortiaID,sum(FightPower) as FightPower from Db_Tank_Copy.dbo.Sys_Users_Detail with(nolock) where ConsortiaID<>0 group by ConsortiaID) as A on 
Consortia.ConsortiaID = A.consortiaID where Consortia.IsExist=1
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_Consortia_Honor]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<更新信息：更新公会功勋排行榜>
-- =============================================
CREATE  Procedure [dbo].[SP_Sys_Update_Consortia_Honor]
as 
update  Consortia set Honor = isnull(A.offer,0) from Consortia
left join (select consortiaID,sum(offer) as offer from Db_Tank_Copy.dbo.Sys_Users_Detail with(nolock) where ConsortiaID<>0 group by ConsortiaID) as A on 
Consortia.ConsortiaID = A.consortiaID where Consortia.IsExist=1

GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_Consortia_List]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<更新信息：更新公会排行>
-- =============================================
CREATE    Procedure [dbo].[SP_Sys_Update_Consortia_List]
as 

select LastDayRiches,ConsortiaID * 1 as ConsortiaID,SId = identity(int,1,1) into #TempC
from Db_Tank_Copy.dbo.Consortia 
where IsExist<>0
order by LastDayRiches desc

update Consortia with(rowlock)
set Repute = #TempC.SId 
from #TempC 
where Consortia.ConsortiaID=#TempC.ConsortiaID

drop table #TempC



GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_Consortia_WeekList]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<更新信息：更新公会周排行>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Update_Consortia_WeekList]
as 
update Consortia set LastWeekRiches=Riches + isnull((select sum(Riches) from Consortia_Level with (nolock) where Level<=a.Level),0)  +isnull((select sum(StoreRiches) from Consortia_Level with(nolock) where Level<=a.StoreLevel),0) +isnull((select sum(SmithRiches) from Consortia_Level with(nolock) where Level<=a.SmithLevel),0) +isnull((select sum(ShopRiches) from Consortia_Level  with (nolock) where Level<=a.ShopLevel),0) ,
 LastWeekHonor = Honor
from Consortia a
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_OfferList]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<更新信息：更新用户的功勋排行>
-- =============================================
CREATE     Procedure [dbo].[SP_Sys_Update_OfferList]
as 
--1、从Copy库中读取用户Offer值
  Select UserId * 1 as UserId,SId = identity(int,1,1) into #TempD
         From Db_Tank_Copy.dbo.Sys_Users_Detail with(nolock)
              Order by ReputeOffer desc


--2、插入新注册的用户
  INSERT INTO Sys_Users_Order(UserId)
  SELECT  UserId FROM  #TempD
          WHERE  Not EXISTS (SELECT Userid FROM Sys_Users_Order A WHERE #TempD.UserId=A.Userid)


--3、更新Offer值
/*
  Update Sys_Users_Detail with(rowlock) Set ReputeOffer= #TempD.SId 
         From #TempD 
              Where Sys_Users_Detail.UserId=#TempD.UserId
*/
  Update Sys_Users_Order with(rowlock) Set ReputeOffer= #TempD.SId 
         From #TempD 
              Where Sys_Users_Order.UserId=#TempD.UserId


--4、清除临时表
  Drop table #TempD



GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_Users_DayList]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<更新信息：更新用户日排行>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Update_Users_DayList]
as 
update Sys_Users_Detail set AddDayGP=a.GP-a.LastDayGP,LastDayGP=a.GP,AddWeekGP=a.GP-a.LastWeekGP,
AddDayOffer=a.Offer-a.LastDayOffer,LastDayOffer=a.offer,AddWeekOffer=a.offer-a.LastWeekOffer
from Sys_Users_Detail a with(nolock) where IsExist=1
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_Users_List]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<更新信息：更新用户排名>
-- =============================================
CREATE      Procedure [dbo].[SP_Sys_Update_Users_List]
as 

--1、从Copy库中读取用户GP值
  Select GP,UserId * 1 as UserId,SId = identity(int,1,1) into #TempB
         From Db_Tank_Copy.dbo.Sys_Users_Detail with(nolock)
              Order by GP desc

--2、插入新注册的用户
  INSERT INTO Sys_Users_Order(UserId)
  SELECT  UserId FROM  #TempB
         WHERE  Not EXISTS (SELECT Userid FROM Sys_Users_Order A WHERE #TempB.UserId=A.Userid)
      

--3、更新GP排名信息
/*(旧的更新用户信息表)
update Sys_Users_Detail with(rowlock)
set Repute = #TempB.SId 
from #TempB 
where Sys_Users_Detail.UserId=#TempB.UserId
*/
  Update Sys_Users_Order with(rowlock)
       Set Repute = #TempB.SId 
       From #TempB 
           Where Sys_Users_Order.UserId=#TempB.UserId

--4、清除临时表
  Drop Table #TempB
GO
/****** Object:  StoredProcedure [dbo].[SP_Sys_Update_Users_WeekList]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<更新信息：更新用户周排名>
-- =============================================
CREATE Procedure [dbo].[SP_Sys_Update_Users_WeekList]
as 

update Sys_Users_Detail set LastWeekGP=a.GP, LastWeekOffer = a.Offer
from Sys_Users_Detail  a  with(nolock)
GO
/****** Object:  StoredProcedure [dbo].[SP_Tank_Count_Active]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<记录数据：导入激活用户>
-- =============================================
CREATE Procedure [dbo].[SP_Tank_Count_Active]
@AppID int,
@SubID int
as
--declare @MaxID int
--select @MaxID=isnull(Max(UserID),0) from Count_Register

declare @MaxDate datetime
select @MaxDate=isnull(Max(RegDateTime),0) from Db_Count..Count_Register

insert into Db_Count..Count_Register(ApplicationId,SubID,RegDateTime,UserID,Sex,UserIP,UserName,UserOther) 
select @AppID,@SubID,[Date],UserID,Sex,cast(Db_Count.dbo.f_IP2Int(ActiveIP) as bigint),UserName,NickName from Db_Tank..Sys_Users_Detail where [Date]>@MaxDate


GO
/****** Object:  StoredProcedure [dbo].[SP_Tank_Count_Charge]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Tank_Count_Charge]
@AppID int,
@SubID int,
@LineID int
as
--declare @MaxID int
--select @MaxID=isnull(Max(OrderID),0) from Count_Money

declare @MaxDate datetime
select @MaxDate=isnull(Max(BuyDateTime),0) from Db_Count..Count_Money

insert into Db_Count..Count_Money(ApplicationId,SubID,LineID,UserId,PayWay,Point,NeedMoney,BuyDateTime,OrderID) 
select @AppID,@SubID,@LineID,UserName,PayWay,[Money],NeedMoney,[Date],ChargeID from Db_Tank..Charge_Money where [Date]>@MaxDate
GO
/****** Object:  StoredProcedure [dbo].[SP_Tank_Count_Login]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<记录数据：导入登陆用户>
-- =============================================
CREATE Procedure [dbo].[SP_Tank_Count_Login]
@AppID int,
@SubID int
as
declare @MaxDate datetime
select @MaxDate=isnull(Max(LoginDateTime),0) from Db_Count..Count_Login

insert into Db_Count..Count_Login(ApplicationId,SubID,ServerName,LoginDateTime,IsSex,OwnAddress,OwnNet,OnSite,UserID,IPAddress,LoginTime)
select @AppID,@SubID,'',LastDate,Sex,'','','',UserID,ActiveIP,1 from Db_Tank..Sys_Users_Detail where LastDate>@MaxDate




GO
/****** Object:  StoredProcedure [dbo].[SP_Update_GotRing_Prop]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<婚姻：获取结婚戒指>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Update_GotRing_Prop]
@GroomID int,
@BrideID int
AS

update sys_users_detail set IsGotRing=1 where UserID=@GroomID or UserID=@BrideID
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Marry_Apply]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<婚姻：清除结婚申请信息>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Update_Marry_Apply]
@UserID int,
@LoveProclamation nvarchar(50),
@isExist bit
 AS

update Marry_Apply set isExist=@isExist where UserID = @UserID and LoveProclamation = @LoveProclamation
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Marry_Room_Info]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<婚姻：更新结婚房间信息>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Update_Marry_Room_Info]  
@ID int,
@AvailTime int,
@BreakTime datetime,
@roomIntroduction nvarchar(300),
@isHymeneal bit,
@Name nvarchar(50),
@Pwd nvarchar(15),
@IsGunsaluteUsed bit

AS

update Marry_Room_Info set AvailTime = @AvailTime,BreakTime=@BreakTime,roomIntroduction=@roomIntroduction,isHymeneal=@isHymeneal,[Name]=@Name,Pwd=@Pwd,IsGunsaluteUsed=@IsGunsaluteUsed where [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Marry_Room_Info_Sever_Stop]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<结婚信息：更新结婚房间>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Update_Marry_Room_Info_Sever_Stop]  
AS

update Marry_Room_Info set BreakTime=getdate() where IsExist = 1
if @@error<>0
begin
  return @@error
end

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_User_Buff_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：插入用户buff(防踢、双倍经验、双倍功勋)信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_User_Buff_Add]   
 @UserId int, 
 @Type int, 
 @BeginDate DateTime, 
 @Data nvarchar(200), 
 @IsExist bit,
 @ValidDate int,
 @Value int
as
declare  @temp int
select @temp = count(*) from User_Buff where UserId=@UserId and Type=@Type
if @temp=0 
   begin 
     INSERT INTO User_Buff(UserId, Type, BeginDate, Data, IsExist,ValidDate,Value) 
     VALUES(@UserId, @Type, @BeginDate , @Data, @IsExist,@ValidDate,@Value) 
 end 
 else
   begin 
     UPDATE User_Buff Set  BeginDate=@BeginDate, Data=@Data, IsExist=@IsExist,ValidDate=@ValidDate,Value=@Value WHERE UserId=@UserId and Type=@Type
   end


GO
/****** Object:  StoredProcedure [dbo].[SP_User_Buff_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取当前用户的Buff>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_User_Buff_All]
 @UserID int
 AS  
   begin 
     select * from User_Buff  where UserID = @UserID and IsExist = 1
   end


GO
/****** Object:  StoredProcedure [dbo].[SP_UserInfo_Select]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[SP_UserInfo_Select]
@type int,
@username varchar(50),
@nickname varchar(50)
as
begin
   if(@type=1)
   begin 
	select a.*,b.Consortianame 
  	 from db_tank_copy.dbo.sys_users_detail a 
     	   left join db_tank_copy.dbo.Consortia b 
              on a.Consortiaid=b.Consortiaid where nickname=@nickname
   end
   if(@type=2)
   begin
	select a.*,b.Consortianame 
 	 from db_tank_copy.dbo.sys_users_detail a 
  	   left join db_tank_copy.dbo.Consortia b 
   	      on a.Consortiaid=b.Consortiaid where username=@username
   end
   if(@@error <> 0)
   begin
  	return 1
   end
   return 0
 end


GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Active]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：激活用户>
-- =============================================
CREATE Procedure [dbo].[SP_Users_Active]
@UserID int out,
@Attack int,
@Defence int,
@Luck int,
@Agility int,
@Gold int,
@Money int,
@Style Nvarchar(200),
@Colors Nvarchar(200),
@Hide int,
@Grade int,
@GP int,
@State int,
@ConsortiaID int,
@UserName Nvarchar(200),
@PassWord Nvarchar(200),
@Sex bit,
@ActiveIP Nvarchar(50),
@Skin Nvarchar(500),
@Site nvarchar(200)

as
declare @count int

select @count= isnull(count(*),0) from Sys_Users_Detail where UserName = @UserName

if @count <> 0
begin
  return 1
end

set xact_abort on
begin tran

insert into Sys_Users_Detail(UserName,[PassWord],NickName,[Date],IsConsortia,ConsortiaID,Sex,Win,Total,[Escape],GP,Honor,Gold,[Money],Style,Colors,Hide,Grade,State,IsFirst,Repute,ActiveIP,IsExist,Skin,Site)
values(@UserName,@PassWord,'',getdate(),0,0,@Sex,0,0,0,@GP,'',@Gold,@Money,@Style,@Colors,@Hide,@Grade,@State,0,0,@ActiveIP,1,@Skin,@Site)

if @@error <> 0
begin
  rollback tran
  return @@error
end

select @UserID = isnull(@@IDENTITY ,0)

if @UserID = 0 
begin
  rollback tran
  return 1
end

insert into Sys_Users_Fight(UserID,Attack,Defence,Luck,Agility,[Delay],Honor,Map,Directory,IsExist)
values(@UserID,@Attack,@Defence,@Luck,@Agility,0,'','','',1)

if @@error<>0
begin 
  rollback tran
  return @@error
end

commit tran
set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_BagByType]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：用户背包物品>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_BagByType]
 @UserID int,
 @BagType int
 AS  
   begin 
     select * from Sys_Users_Goods  
where UserID = @UserID and IsExist = 1 and place>=0 and BagType=@BagType
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_BestEquip]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取用户最好装备>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Users_BestEquip]
as
return
/*暂停
select  Sys_Users_Detail.UserName,Sys_Users_Detail.NickName,Sys_Users_Detail.Grade,Sys_Users_Detail.Sex,Sys_Users_Detail.GP,Shop_Goods.Name,Sys_Users_Goods.Strengthenlevel,Sys_Users_Goods.RemoveDate
 from Sys_Users_Goods 
left join Sys_Users_Detail on
Sys_Users_Goods.UserID=Sys_Users_Detail.UserID
left Join Shop_Goods on
Sys_Users_Goods.TemplateID=Shop_Goods.TemplateID
where Sys_Users_Goods.UserID>0 and Sys_Users_Goods.TemplateID in(7015,7016,7017,7018,7019,7020,7021,7022,7023)
and CONVERT(varchar(20),dateadd(dd,1,RemoveDate),101)=CONVERT(varchar(20),getdate(),101)*/
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_CheckByNickName]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取一条用户信息>
-- =============================================
CREATE   Procedure [dbo].[SP_Users_CheckByNickName]
@NickName Nvarchar(200)
as


select UserID from Sys_Users_Detail where NickName=@NickName and IsExist = 1
UNION All
SELECT UserID FROM Rename_Nick where NickName=@NickName
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Friends]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取用户好友>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Friends]
@UserID int
AS  
 select * from V_Sys_Users_Friends where UserID = @UserID and IsExist =1
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Friends_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：添加一条用户信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Friends_Add] 
 @ID int out, 
 @UserID int, 
 @FriendID int, 
 @AddDate DateTime, 
 @Remark nvarchar(400), 
 @IsExist bit,
 @Relation int
AS  
declare  @temp int
select @temp = count(*) from Sys_Users_Friends where UserID=@UserID and FriendID=@FriendID
if @temp=0 
   begin 
     INSERT INTO Sys_Users_Friends( UserID, FriendID, AddDate, Remark, IsExist,Relation) 
     VALUES( @UserID, @FriendID, @AddDate, @Remark, @IsExist,@Relation)
     select @@identity as 'identity'
     set @ID=@@identity    
 end
else
begin
 update Sys_Users_Friends set IsExist = 1,Remark=@Remark,AddDate=@AddDate,Relation=@Relation where UserID=@UserID and FriendID=@FriendID
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Friends_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取用户信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Friends_All]
 @UserID int
 AS  
   begin 
     select  FriendID,Relation from Sys_Users_Friends  
where UserID = @UserID and IsExist = 1
   end

GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Friends_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：删除一个好友>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Friends_Delete]
 @ID int,
 @UserID int
 AS  
   begin 
     update Sys_Users_Friends set IsExist = 0 where FriendID=@ID and UserID=@UserID
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Friends_Good]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<XiaoV>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取用户信息-好友信息，除去黑名单,主要提供给外网用>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Friends_Good]
@UserName Nvarchar(200) AS  
 Begin 
   /*第一步：获取当前用户的UserId*/
   Declare @UserId Int
   Set @UserId=0
   Select @UserId=IsNull(UserID,0) From Sys_Users_Detail Where UserName=@UserName
   
   /*第二步：获取当前用户的好友*/  
   If @UserId>0 
      Begin
        Select B.UserName From Sys_Users_Friends  A
               Left Outer Join Sys_Users_Detail B On A.FriendID=B.UserID
                    Where A.UserID = @UserId And A.IsExist = 1 And B.UserName!=''
      End    
 End
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_FriendsBbs]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<XiaoV>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取用户信息-好友信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_FriendsBbs]
@SearchUserName Nvarchar(4000) AS  
 Begin  
   /*第一步:将好友切割成一个临时表*/   
   Create Table #TempUser(UserName NVarchar(100))
   Insert Into #TempUser
           Select Value From dbo.split(@SearchUserName,',')
   

   /*第二步：获取好友的是否加入我们游戏中*/
   Select A.UserName,IsNull(B.UserId,0) As UserId,B.NickName From #TempUser  A
            Left Outer Join dbo.Sys_Users_Detail B
                 On A.UserName=B.UserName


   /*第三步:清除临时表*/
   Drop Table #TempUser
 End



GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Items_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：用户新增一个物品>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Items_Add]   
  @ItemID int output, 
 @UserID int, 
 @TemplateID int, 
 @Place int, 
 @Count int, 
 @IsJudge bit, 
 @Color nvarchar(100), 
 @IsExist bit, 
 @StrengthenLevel int, 
 @AttackCompose int, 
 @DefendCompose int, 
 @LuckCompose int, 
 @AgilityCompose int, 
 @IsBinds bit, 
 @BeginDate DateTime, 
 @ValidDate int,
 @BagType int,
 @Skin nvarchar(50),
 @IsUsed bit,
 @RemoveType int,
 @Hole1 int,
 @Hole2 int,
 @Hole3 int,
 @Hole4 int,
 @Hole5 int,
 @Hole6 int
AS  
declare  @temp int
select @temp = count(*) from Sys_Users_Goods where ItemID=@ItemID
if @temp=0 
 begin 
	/*if @Place>-1
	begin
		update Sys_Users_Goods set Place=-2 where UserID=@UserID and BagType=@BagType and Place=@Place and IsExist=1
	end*/

     INSERT INTO Sys_Users_Goods( UserID, BagType,TemplateID, Place, Count, IsJudge, Color, IsExist, StrengthenLevel, AttackCompose, DefendCompose, LuckCompose, AgilityCompose, IsBinds, BeginDate, ValidDate,Skin,IsUsed,RemoveType,Hole1,Hole2,Hole3,Hole4,Hole5,Hole6) 
     VALUES( @UserID, @BagType,@TemplateID, @Place, @Count, @IsJudge, @Color, @IsExist, @StrengthenLevel, @AttackCompose, @DefendCompose, @LuckCompose, @AgilityCompose, @IsBinds, @BeginDate, @ValidDate,@Skin,@IsUsed,@RemoveType,@Hole1,@Hole2,@Hole3,@Hole4,@Hole5,@Hole6)
     select @@identity as 'identity'
     set @ItemID=@@identity    
 end
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Items_All]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取当前用户全部有效物品>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Items_All]
 @UserID int
 AS  
   begin 
     select * from Sys_Users_Goods  
where UserID = @UserID and IsExist = 1 and place>=0
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Items_Delete]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：用户删除一个物品>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Items_Delete] 
 @ID int
 AS  
   begin 
     update Sys_Users_Goods set IsExist = 0 where ItemID=@ID
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Items_Equip]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：读取当前用户装备类>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Items_Equip]
 @UserID int
 AS  
   begin 
     select top 31 * from Sys_Users_Goods  
where UserID = @UserID and IsExist = 1 and place>=0 and Place<=30 and BagType=0
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Items_Single]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：读取一条物品>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Items_Single]
 @ID int
 AS  
   begin 
     select * from Sys_Users_Goods  
where ItemID = @ID and IsExist = 1
   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Items_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：更新人物物品信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Items_Update]   
  @ItemID int, 
 @UserID int, 
 @TemplateID int, 
 @Place int, 
 @Count int, 
 @IsJudge bit, 
 @Color nvarchar(100), 
 @IsExist bit, 
 @StrengthenLevel int, 
 @AttackCompose int, 
 @DefendCompose int, 
 @LuckCompose int, 
 @AgilityCompose int, 
 @IsBinds bit, 
 @BeginDate DateTime, 
 @ValidDate int,
 @BagType int,
 @Skin nvarchar(50),
 @IsUsed bit,
 @RemoveDate datetime,
 @RemoveType int,
 @Hole1 int,
 @Hole2 int,
 @Hole3 int,
 @Hole4 int,
 @Hole5 int,
 @Hole6 int
 AS    
   begin 
	/*if @Place>-1
	begin
		update Sys_Users_Goods set Place=-2 where UserID=@UserID and BagType=@BagType and Place=@Place and IsExist=1
	end*/

     UPDATE Sys_Users_Goods Set UserID=@UserID,BagType=@BagType, TemplateID=@TemplateID, Place=@Place, Count=@Count, IsJudge=@IsJudge, Color=@Color, IsExist=@IsExist, StrengthenLevel=@StrengthenLevel, AttackCompose=@AttackCompose, DefendCompose=@DefendCompose, LuckCompose=@LuckCompose, AgilityCompose=@AgilityCompose, IsBinds=@IsBinds, BeginDate=@BeginDate, ValidDate=@ValidDate,Skin=@Skin,IsUsed=@IsUsed,RemoveDate=@RemoveDate,RemoveType=@RemoveType,Hole1=@Hole1,Hole2=@Hole2,Hole3=@Hole3,Hole4=@Hole4,Hole5=@Hole5,Hole6=@Hole6 WHERE ItemID =@ItemID


   end
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_LastAuncherAward]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Peter>
-- ALTER  date: <2010-2-23>
-- Description:	<用户信息：更新用户登陆器最后领奖时间>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_LastAuncherAward] 
@UserID int
AS
Update Sys_Users_Detail Set LastAuncherAward=GetDate()  Where UserId=@UserId

GO
/****** Object:  StoredProcedure [dbo].[SP_Users_LastAward]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：更新用户最后领奖时间>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_LastAward] 
@UserID int
AS
Update Sys_Users_Detail Set LastAward=GetDate()  Where UserId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Login]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：用户登陆信息>
-- =============================================
CREATE Procedure [dbo].[SP_Users_Login]
@userName Nvarchar(200),
@passWord Nvarchar(200)
as
select * from V_Sys_Users_Detail
where UserName=@userName and [Password] = @passWord and IsExist = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_LoginList]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取一个登陆的用户信息>
-- =============================================
CREATE Procedure [dbo].[SP_Users_LoginList]
@userName Nvarchar(200)
as
select * from V_Sys_Users_Detail 
where UserName=@userName
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_LoginWeb]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：从Web页面登陆过来的验证>
-- =============================================
CREATE Procedure [dbo].[SP_Users_LoginWeb]
@UserName Nvarchar(200),
@PassWord Nvarchar(200),
@FirstValidate bit,
@NickName Nvarchar(200)

as
declare @forbidDate datetime
declare @isExist bit 
declare @lastDate datetime 
declare @lastDateSecond datetime
declare @lastDateThird datetime
declare @loginCount int
declare @isFirst int 
declare @DayLoginCount int
select @forbidDate=ForbidDate,@isExist=IsExist,@lastDate=LastDate,@loginCount=LoginCount,@lastDateSecond=LastDateSecond,@lastDateThird=LastDateThird,@isFirst=IsFirst,@DayLoginCount=DayLoginCount from Sys_Users_Detail where UserName =@UserName and NickName=@NickName

  if MONTH(@lastDate) = MONTH(getdate()) 
  begin
     if DAY(@lastDate)<>DAY(getdate())
        begin
    	set @loginCount = @loginCount+1
           set @DayLoginCount=0
       end
     else
       begin
	set @lastDate=@lastDateSecond
	set @lastDateSecond=@lastDateThird
       end
  end
  else
  begin
    set @loginCount = 1
    set @DayLoginCount=0
  end

if @isFirst=1
begin
   set @DayLoginCount=1
end

if @isFirst>0 --and @FirstValidate=1
begin
   set @isFirst=@isFirst+1
end

if @isExist = 0  
begin
  if datediff(ss,getdate(),@forbidDate)<0 
    begin
      update Sys_Users_Detail set [PassWord] =@PassWord,LastDate = getdate(),IsExist=1,LastDateSecond = @lastDate,LastDateThird = @lastDateSecond,LoginCount=@loginCount,IsFirst=@isFirst,DayLoginCount=@DayLoginCount where UserName =@UserName and NickName=@NickName
    end
end
else
begin
  update Sys_Users_Detail set [PassWord] =@PassWord,LastDate = getdate(),LastDateSecond = @lastDate,LastDateThird = @lastDateSecond,LoginCount=@loginCount,IsFirst=@isFirst,DayLoginCount=@DayLoginCount where UserName =@UserName and NickName=@NickName
end

if @@Error <> 0
begin
  return null
end


select * from V_Sys_Users_Detail
where UserName =@UserName and NickName=@NickName --and Sys_Users_Detail.IsExist = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Marry]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：更新用户结婚信息>
-- =============================================
CREATE Procedure [dbo].[SP_Users_Marry]
@UserID int,
@IsMarried bit,
@SpouseID int,
@SpouseName nvarchar(50),
@IsCreatedMarryRoom bit,
@SelfMarryRoomID int,
@IsGotRing bit

as

  update Sys_Users_Detail set IsMarried =@IsMarried,SpouseID=@SpouseID,SpouseName=@SpouseName,IsCreatedMarryRoom=@IsCreatedMarryRoom,
   SelfMarryRoomID=@SelfMarryRoomID,IsGotRing=@IsGotRing where UserID = @UserID


GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Password_Add]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:<XiaoV>
-- ALTER  date: <2010-1-11>
-- Description:	<更新一条服务器配置信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_Password_Add]   
@UserID INT,
@PasswordQuestion1 Nvarchar(50),
@PasswordAnswer1 Nvarchar(50),
@PasswordQuestion2 Nvarchar(50),
@PasswordAnswer2 Nvarchar(50),
@FailedPasswordAttemptCount Int
AS  
BEGIN 
  DECLARE @Counts int
  Select @Counts= IsNull(Count(*),0)  From Sys_Users_Password Where UserID=@UserID
  If @Counts=1
     Update Sys_Users_Password Set  PasswordQuestion1=@PasswordQuestion1 , PasswordAnswer1=@PasswordAnswer1,PasswordQuestion2=@PasswordQuestion2 , PasswordAnswer2=@PasswordAnswer2,LastFindDate=Convert(varchar(10),GetDate(),120) ,FailedPasswordAttemptCount=@FailedPasswordAttemptCount   Where  UserId=@UserID
  Else
     Insert Into Sys_Users_Password(UserID,PasswordQuestion1,PasswordAnswer1,PasswordQuestion2,PasswordAnswer2,LastFindDate,FailedPasswordAttemptCount)
            Values(@UserID,@PasswordQuestion1,@PasswordAnswer1,@PasswordQuestion2,@PasswordAnswer2,Convert(varchar(10),GetDate(),120),@FailedPasswordAttemptCount)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_PasswordInfo]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:<Jacken>
-- ALTER  date: <2010-1-13>
-- Description:	<获取二级密码信息>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Users_PasswordInfo]   
@UserID INT
AS  
BEGIN 

  Select *  From Sys_Users_Password Where UserID=@UserID
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Register]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：用户注册形象,旧版>
-- =============================================
CREATE Procedure [dbo].[SP_Users_Register]

@UserName varchar(200),
@PassWord varchar(200),
@NickName varchar(50),

@BArmID int,
@BHairID int,
@BFaceID int,
@BClothID int,
@GArmID int,
@GHairID int,
@GFaceID int,
@GClothID int,

@ArmColor varchar(50),
@HairColor varchar(50),
@FaceColor varchar(50),
@ClothColor varchar(50),
@Sex int

as
declare @ArmID int
declare @HairID int
declare @FaceID int
declare @ClothID int
declare @isFirst bit
declare @UserID int
declare @CategoryID int
declare @Attack int
declare @Defence int
declare @Agility int
declare @Luck int

declare @style varchar(1000)
declare @color varchar(1000)

declare @count int

select @count= isnull(count(*),0) from Sys_Users_Detail where NickName = @NickName

if @count <> 0
begin
  return 2
end

if @Sex=-1
  begin
    select @isFirst = IsFirst,@UserID=[UserID],@Sex=Sex from Sys_Users_Detail where UserName =@UserName and [PassWord] = @PassWord 
  end
else
  begin
    select @isFirst = IsFirst,@UserID=[UserID] from Sys_Users_Detail where UserName =@UserName and [PassWord] = @PassWord 
  end

if isnull(@isFirst,0)<>0
  return 3

if @Sex<>0
  begin
   set @ArmID = @BArmID
   set @HairID = @BHairID
   set @FaceID = @BFaceID
   set @ClothID = @BClothID
  end
else
  begin
   set @ArmID = @GArmID
   set @HairID = @GHairID
   set @FaceID = @GFaceID
   set @ClothID = @GClothID
  end

set @style =  ',,' + cast(@HairID as varchar(20))  + ',,' + cast(@ClothID as varchar(20))  + ',' + cast(@FaceID as varchar(20))  + ',' + cast(@ArmID as varchar(20)) 
set @color = ',,' + @HairColor + ',,' + @ClothColor + ',' + @FaceColor + ',' + @ArmColor

set xact_abort on
begin tran

select @Attack=Attack,@Defence=Defence,@Agility=Agility,@Luck=Luck,@CategoryID=CategoryID from Shop_Goods where TemplateID = @ArmID

if isnull(@CategoryID,0)=0
begin
  rollback tran
  return @@error
end

insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
values(@UserID,0,@ArmID,@CategoryID-1,1,1,@ArmColor,1,0,0,0,0,0,1,getdate(),0)

if @@error<>0
begin
  rollback tran
  return @@error
end

select @Attack=@Attack+Attack,@Defence=@Defence+Defence,@Agility=@Agility+Agility,@Luck=@Luck+Luck,@CategoryID=CategoryID from Shop_Goods where TemplateID = @HairID

if isnull(@CategoryID,0)=0
begin
  rollback tran
  return @@error
end

insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
values(@UserID,0,@HairID,@CategoryID-1,1,1,@HairColor,1,0,0,0,0,0,1,getdate(),15)

if @@error<>0
begin
  rollback tran
  return @@error
end

select @Attack=@Attack+Attack,@Defence=@Defence+Defence,@Agility=@Agility+Agility,@Luck=@Luck+Luck,@CategoryID=CategoryID from Shop_Goods where TemplateID = @FaceID

if isnull(@CategoryID,0)=0
begin
  rollback tran
  return @@error
end

insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
values(@UserID,0,@FaceID,@CategoryID-1,1,1,@FaceColor,1,0,0,0,0,0,1,getdate(),15)

if @@error<>0
begin
  rollback tran
  return @@error
end

select @Attack=@Attack+Attack,@Defence=@Defence+Defence,@Agility=@Agility+Agility,@Luck=@Luck+Luck,@CategoryID=CategoryID from Shop_Goods where TemplateID = @ClothID

if isnull(@CategoryID,0)=0
begin
  rollback tran
  return @@error
end

insert into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefendCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate)
values(@UserID,0,@ClothID,@CategoryID-1,1,1,@ClothColor,1,0,0,0,0,0,1,getdate(),15)

if @@error<>0
begin
  rollback tran
  return @@error
end

update Sys_Users_Detail set NickName = @NickName,IsFirst = 1,Style=@style,Colors=@color,Sex=@Sex  where UserID = @UserID

if @@error<>0
begin
  rollback tran
  return @@error
end

update Sys_Users_Fight set Attack =@Attack,Defence=@Defence,Agility=@Agility,Luck=@Luck  where UserID = @UserID

if @@error<>0
begin
  rollback tran
  return @@error
end

commit tran 
set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_RegisterNotValidate]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：注册用户形象，新版>
-- =============================================
CREATE    Procedure [dbo].[SP_Users_RegisterNotValidate]

@UserName Nvarchar(200),
@PassWord Nvarchar(200),
@NickName Nvarchar(50),

@BArmID Int,
@BHairID Int,
@BFaceID Int,
@BClothID Int,
@GArmID Int,
@GHairID Int,
@GFaceID Int,
@GClothID Int,

@ArmColor Nvarchar(50),
@HairColor Nvarchar(50),
@FaceColor Nvarchar(50),
@ClothColor Nvarchar(50),
@Sex Int,
@StyleDate Int

as

  --第一步：定义变量
  Declare @ArmID Int    --武器
  Declare @HairID Int   --头发
  Declare @FaceID Int   --眼睛
  Declare @ClothID Int  --衣服
  Declare @isFirst Int
  Declare @UserID Int
  Declare @CategoryID Int
  Declare @Attack Int
  Declare @Defence Int
  Declare @Agility Int
  Declare @Luck Int
  Declare @tempSex Int 
  Declare @style Nvarchar(1000)
  Declare @color Nvarchar(1000)
  Declare @nickIsExist Int

  --第二步：查找用户昵称是否注册
  Select @nickIsExist= isnull(count(*),0) From Sys_Users_Detail Where NickName = @NickName
  If @nickIsExist <> 0
  Begin
    Return 2
  End
  
  If @Sex=-1
     Begin
       Select @isFirst = IsFirst,@UserID=[UserID],@Sex=Sex From Sys_Users_Detail Where UserName =@UserName     
     End
  Else
     Begin
       Select @isFirst = IsFirst,@UserID=[UserID] From Sys_Users_Detail Where UserName =@UserName 
     End

  If isnull(@isFirst,1)>0
     Return 3

  --第三步：设置形象
  If @Sex<>0
     Begin
       Set @ArmID = @BArmID
       Set @HairID = @BHairID
       Set @FaceID = @BFaceID
       Set @ClothID = @BClothID
       Set @tempSex = 1
     End
  Else
     Begin
       Set @ArmID = @GArmID
       Set @HairID = @GHairID
       Set @FaceID = @GFaceID
       Set @ClothID = @GClothID
       Set @tempSex = 2
     End
    
  Set @style =  ',,' + cast(@HairID as Nvarchar(20))  + ',,' + cast(@ClothID as Nvarchar(20))  + ',' + cast(@FaceID as Nvarchar(20))  + ',' + cast(@ArmID as Nvarchar(20)) 
  Set @color = ',,' + @HairColor + ',,' + @ClothColor + ',' + @FaceColor + ',' + @ArmColor

  --第四步：设置相关物品属性
  Declare @TemplateID Int
  Declare @Count Int 
  Declare @ValidDate Int 
  Declare @StrengthenLevel Int 
  Declare @AttackCompose Int 
  Declare @DefEndCompose Int 
  Declare @LuckCompose Int 
  Declare @AgilityCompose Int 
  Declare @IsBinds bit 
  Declare @BagType Int 
  Declare @MaxCount Int 

  Set xact_abort on
  Begin tran
    If object_id('tempdb..#Bag') is not null
       Drop Table #Bag
    Create Table #Bag 
    ( 
       id Int identity(1,1), 
       TemplateID Int not null,
       [Count] Int not null,
       ValidDate Int not null,
       StrengthenLevel Int not null,
       AttackCompose Int not null,
       DefEndCompose Int not null,
       LuckCompose Int not null,
       AgilityCompose Int not null,
       IsBinds bit not null,
       BagType Int not null,
       MaxCount Int not null,
    ) 

   Insert Into #Bag
          Select Bag_Init.TemplateID,Bag_Init.[Count],Bag_Init.ValidDate,Bag_Init.StrengthenLevel,Bag_Init.AttackCompose,Bag_Init.DefEndCompose,Bag_Init.LuckCompose,Bag_Init.AgilityCompose,Bag_Init.IsBinds,
                 case Shop_Goods.CategoryID 
                      when 1 then 0  
                      when 2 then 0  
                      when 3 then 0  
                      when 4 then 0  
                      when 5 then 0  
                      when 6 then 0  
                      when 7 then 0  
                      when 8 then 0  
                      when 9 then 0  
                      when 10 then 1  
                      when 11 then 1  
                      when 12 then 2  
                      else -1 
                  End,Shop_Goods.MaxCount
                  From Bag_Init left join Shop_Goods on Bag_Init.TemplateID = Shop_Goods.TemplateID
                       Where sex=0 or sex=@tempSex and Shop_Goods.CategoryID is not null

   --Select * From #Bag
   Declare @Index Int
   Declare @ItemCount Int
   Declare @bag0 Int
   Declare @bag1 Int
   Declare @bag2 Int
   Declare @CurrentPlace Int
   Declare @getCount Int
   Set @Index = 1
   Select @ItemCount=count(*) From  #Bag
   Set @bag0=31
   Set @bag1=0
   Set @bag2=0
   
   --临时取消防踢卡<策划暂时取消>
   /*INSERT IntO User_Buff(UserId, Type, BeginDate, Data, IsExist,ValidDate,Value)     VALUES(@UserId, 11, getdate() , '', 1,30,0) 

   If @@error<>0
      Begin      
        Rollback Tran
        Return @@error
      End
   */
          
   --临时无限道具卡<策划暂时取消>
   /*INSERT IntO User_Buff(UserId, Type, BeginDate, Data, IsExist,ValidDate,Value)           VALUES(@UserId, 15, getdate() , '', 1,4320,0) 
   If @@error<>0
      Begin
        Rollback tran
        Return @@error
      End
   */
   
    --赠送武器
    Select @Attack=Attack,@Defence=Defence,@Agility=Agility,@Luck=Luck,@CategoryID=CategoryID From Shop_Goods Where TemplateID = @ArmID
    If isnull(@CategoryID,0)=0
       Begin       
         rollback tran
         Return @@error
       End
    If(@ArmID<>0)   
       Begin
         Insert Into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefEndCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate,IsUsed)
                Values(@UserID,0,@ArmID,@CategoryID-1,1,1,@ArmColor,1,0,0,0,0,0,1,getdate(),@StyleDate,1)
       End          
    If @@error<>0
       Begin
          Rollback tran
          Return @@error
       End

    --赠送头发<策划暂时取消>
    /*
    Select @Attack=@Attack+Attack,@Defence=@Defence+Defence,@Agility=@Agility+Agility,@Luck=@Luck+Luck,@CategoryID=CategoryID From Shop_Goods Where TemplateID = @HairID
    If isnull(@CategoryID,0)=0
       Begin
          Rollback tran
          Return @@error
       End
    If(@HairID<>0)   
      Begin
        insert Into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefEndCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate,IsUsed)
              values(@UserID,0,@HairID,@CategoryID-1,1,1,@HairColor,1,0,0,0,0,0,1,getdate(),@StyleDate,1)
      End
    If @@error<>0
       Begin
          rollback tran
          Return @@error
       End
    */   

     --赠送眼睛<策划暂时取消>
     /*Select @Attack=@Attack+Attack,@Defence=@Defence+Defence,@Agility=@Agility+Agility,@Luck=@Luck+Luck,@CategoryID=CategoryID From Shop_Goods Where TemplateID = @FaceID
     If isnull(@CategoryID,0)=0
        Begin
            Rollback tran
            Return @@error
        End
    If(@FaceID<>0)   
       Begin
         Insert Into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefEndCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate,IsUsed)
                Values(@UserID,0,@FaceID,@CategoryID-1,1,1,@FaceColor,1,0,0,0,0,0,1,getdate(),@StyleDate,1)
       End
    If @@error<>0
       Begin
         Rollback tran
         Return @@error
       End
     */

    --赠送衣服<策划暂时取消>
    /*Select @Attack=@Attack+Attack,@Defence=@Defence+Defence,@Agility=@Agility+Agility,@Luck=@Luck+Luck,@CategoryID=CategoryID From Shop_Goods Where TemplateID = @ClothID
    If isnull(@CategoryID,0)=0
       Begin
         Rollback tran
         Return @@error
       End    
    If(@ClothID<>0)    
       Begin
         Insert Into Sys_Users_Goods(UserID,BagType,TemplateID,Place,[Count],IsJudge,Color,IsExist,StrengthenLevel,AttackCompose,DefEndCompose,LuckCompose,AgilityCompose,IsBinds,BeginDate,ValidDate,IsUsed)
                Values(@UserID,0,@ClothID,@CategoryID-1,1,1,@ClothColor,1,0,0,0,0,0,1,getdate(),@StyleDate,1)
       End
    If @@error<>0
       Begin
         Rollback tran
         Return @@error
       End
    */ 


    While @Index<=@ItemCount
        Begin
           Select @TemplateID=TemplateID,@Count=[Count],@ValidDate=ValidDate,@StrengthenLevel=StrengthenLevel,@AttackCompose=AttackCompose,@DefEndCompose=DefEndCompose,@LuckCompose=LuckCompose,@AgilityCompose=AgilityCompose,@IsBinds=IsBinds,@BagType=BagType,@MaxCount=MaxCount
                  From #Bag Where [id]=@Index
           Set @Index = @Index+1
           While @Count > 0
                 Begin   
                   If @Count > @maxCount
                     Begin
                       Set @getCount = @maxCount
                     End
                   Else
                      Begin
                        Set @getCount = @Count
                      End
                   Set @Count = @Count-@getCount   
                   If @BagType=0 
                      Begin
                        Set @CurrentPlace=@bag0
                        Set @bag0=@bag0+1
                      End
                   Else
                     Begin
                       If @BagType=1 
                          Begin
                            Set @CurrentPlace=@bag1
                            Set @bag1=@bag1+1
                          End
                        Else
                          Begin
                            Set @CurrentPlace=@bag2
                            Set @bag2=@bag2+1
                          End
                     End
           If @CurrentPlace>49
              Begin
                Continue
              End
           Insert Into Sys_Users_Goods( UserID, BagType,TemplateID, Place, [Count], IsJudge, Color, IsExist, StrengthenLevel, AttackCompose, DefEndCompose, LuckCompose, AgilityCompose, IsBinds, BeginDate, ValidDate) 
                  Values( @UserID, @BagType,@TemplateID, @CurrentPlace, @getCount, 1, '', 1, @StrengthenLevel, @AttackCompose, @DefEndCompose, @LuckCompose, @AgilityCompose, @IsBinds, getdate(), @ValidDate)
           If @@error<>0
              Begin
                Rollback tran
                Return @@error
              End
           End
        End

    Update Sys_Users_Detail Set NickName = @NickName,IsFirst = 1,Style=@style,Colors=@color,Sex=@Sex,GP = 20001  Where UserID = @UserID
    If @@error<>0
       Begin
         Rollback tran
         Return @@error
       End
    -- Update Sys_Users_Fight Set Attack =@Attack,Defence=@Defence,Agility=@Agility,Luck=@Luck  Where UserID = @UserID
    If @@error<>0
       Begin
         Rollback tran
         Return @@error
       End
    Commit tran 
    Set xact_abort off
    Return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_RenameByCard]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		<Xaivo>
-- ALTER  date: <2010-02-04>
-- Description:	<合服信息：修改用户昵称由改名卡影响>
-- =============================================
CREATE Procedure [dbo].[SP_Users_RenameByCard]
@UserName nvarchar(200),
@NickName nvarchar(200),
@NewNickName nvarchar(200)

as

declare @UserID int 
declare @count int
declare @Rename bit

if @NickName is null or @NewNickName is null
begin
    return 1
end

select @UserID=isnull(UserID,0),@Rename=Rename from Sys_Users_Detail where UserName=@UserName and NickName=@NickName

if @UserID=0
begin
    return 2
end
 
select @count=count(*) from Sys_Users_Detail where  NickName=@NewNickName

if @count<>0
begin
    return 4
end

select @count=count(*) from Rename_Nick where NickName=@NewNickName

if @count<>0
begin
    return 5
end

set xact_abort on
begin tran

     INSERT INTO Rename_Nick(UserId, UserName,NickName,[Date],IsExist,OldNickName) 
     VALUES(@UserID, @UserName, @NewNickName , getdate(), 1,@NickName) 

if @@error <> 0
begin
  rollback tran
  return @@error
end

    UPDATE Sys_Users_Detail Set  Rename=0 WHERE UserId=@UserId 

if @@error <> 0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_RenameConsortiaName]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<合服信息：重命名公会>
-- =============================================
CREATE Procedure [dbo].[SP_Users_RenameConsortiaName]
@UserName nvarchar(200),
@NickName nvarchar(200),
@ConsortiaName nvarchar(200)

as

declare @ConsortiaID int 
declare @count int
declare @Rename bit

if @NickName is null or @ConsortiaName is null
begin
    return 1
end

select @Rename=Rename,@ConsortiaID=ConsortiaID from Consortia where IsExist=1 and ChairmanName=@NickName

if @Rename=0
begin
    return 3
end

select @count=count(*) from Consortia where ConsortiaName=@ConsortiaName

if @count<>0
begin
    return 4
end

select @count=count(*) from Rename_Consortia where ConsortiaName=@ConsortiaName

if @count<>0
begin
    return 5
end

set xact_abort on
begin tran

     INSERT INTO Rename_Consortia(ConsortiaID, ConsortiaName,NickName,[Date],IsExist) 
     VALUES(@ConsortiaID, @ConsortiaName, @NickName , getdate(), 1) 

if @@error <> 0
begin
  rollback tran
  return @@error
end

    UPDATE Consortia Set  Rename=0 WHERE ConsortiaID=@ConsortiaID 

if @@error <> 0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0


GO
/****** Object:  StoredProcedure [dbo].[SP_Users_RenameNick]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<合服信息：修改用户昵称>
-- =============================================
CREATE Procedure [dbo].[SP_Users_RenameNick]
@UserName nvarchar(200),
@NickName nvarchar(200),
@NewNickName nvarchar(200)

as

declare @UserID int 
declare @count int
declare @Rename bit

if @NickName is null or @NewNickName is null
begin
    return 1
end

select @UserID=isnull(UserID,0),@Rename=Rename from Sys_Users_Detail where UserName=@UserName and NickName=@NickName

if @UserID=0
begin
    return 2
end

if @Rename=0
begin
    return 3
end

select @count=count(*) from Sys_Users_Detail where  NickName=@NewNickName

if @count<>0
begin
    return 4
end

select @count=count(*) from Rename_Nick where NickName=@NewNickName

if @count<>0
begin
    return 5
end

set xact_abort on
begin tran

     INSERT INTO Rename_Nick(UserId, UserName,NickName,[Date],IsExist,OldNickName) 
     VALUES(@UserID, @UserName, @NewNickName , getdate(), 1,@NickName) 

if @@error <> 0
begin
  rollback tran
  return @@error
end

    UPDATE Sys_Users_Detail Set  Rename=0 WHERE UserId=@UserId 

if @@error <> 0
begin
  rollback tran
  return @@error
end

commit tran
set xact_abort off

return 0

GO
/****** Object:  StoredProcedure [dbo].[SP_Users_SingleAllUserID]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：通过ID获取一条信息,包括已禁号的用户>
-- =============================================
CREATE Procedure [dbo].[SP_Users_SingleAllUserID]
@userID int
as
select * from V_Sys_Users_Detail where UserID=@userID
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_SingleByNickName]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：获取一条用户信息>
-- =============================================
CREATE Procedure [dbo].[SP_Users_SingleByNickName]
@NickName Nvarchar(200)
as

select * from V_Sys_Users_Detail
where NickName=@NickName and IsExist = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_SingleByUserID]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：通过ID获取一条信息>
-- =============================================
CREATE Procedure [dbo].[SP_Users_SingleByUserID]
@userID int
as
select * from V_Sys_Users_Detail
where UserID=@userID and IsExist = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_SingleByUserName]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息:通过用户信获取一条信息>
-- =============================================
CREATE Procedure [dbo].[SP_Users_SingleByUserName]
@UserName Nvarchar(200)
as

select * from V_Sys_Users_Detail
where UserName=@UserName and IsExist = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_Update]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：用户信息更新，从内存中更新到DB中，采用定时或离开时操作>
-- =============================================
CREATE Procedure [dbo].[SP_Users_Update]
@UserID int,
@Attack int,
@Defence int,
@Luck int,
@Agility int,
@Gold int,
@Money int,
@Style Nvarchar(200),
@Colors Nvarchar(200),
@Hide int,
@Grade int,
@GP int,
@State int,
@ConsortiaID int,
@ExpendDate datetime,
@Win int,
@Total int,
@Escape int,
@Skin Nvarchar(50),
@Offer int,
@AntiAddiction int output,
@RichesOffer int,
@RichesRob int,
@CheckCount int output,
@MarryInfoID int,
@DayLoginCount int,
@Nimbus int,
@LastAward datetime,
@GiftToken int,
@QuestSite  varbinary(200),
@PvePermission nvarchar(50),
@FightPower int,
@AnswerSite int,
@LastAuncherAward datetime
as


--set @Offer=0
declare @IsExist bit
declare @ForbidDate datetime
declare @OrdState int
declare @AntiDate datetime
declare @OnlineTime int
set @OnlineTime =0
select @OrdState=State,@AntiDate=AntiDate,@AntiAddiction=AntiAddiction,@ForbidDate=ForbidDate,@IsExist=IsExist from Sys_Users_Detail where UserID=@UserID

if DAY(@AntiDate)<>DAY(getdate())
begin
	set @AntiDate=getdate()
	set @AntiAddiction=0
	set @CheckCount=0
end
else
begin
	if @OrdState<>0 
	begin
	set @OnlineTime = isnull(datediff(mi,@AntiDate,Getdate()),0)
	set @AntiAddiction =@AntiAddiction + @OnlineTime
	--set @AntiAddiction =@AntiAddiction + isnull(datediff(mi,@AntiDate,Getdate()),0)
           end
	set @AntiDate=getdate()
end


--if @CheckCount>20000 and @State=0
--begin
--	set @ForbidDate=dateadd(hh,2,getdate())
--	set @IsExist=0
--end

set xact_abort on
begin tran

if @ExpendDate = ''
begin 
	/*if @OrdState=0 
	begin
		  update Sys_Users_Detail set Gold = @Gold,Money = @Money,Style=@Style,Colors=@Colors,Grade=@Grade,GP=@GP,State=@State,
		AntiDate=@AntiDate,OnlineTime = OnlineTime + isnull(datediff(mi,LastDate,Getdate()),0),RichesOffer=@RichesOffer,RichesRob=@RichesRob,
		Hide=@Hide,Win=@Win,Total=@Total,[Escape]=@Escape,Skin=@Skin,Offer=@Offer,AntiAddiction = @AntiAddiction,CheckCount=@CheckCount where UserID = @UserID
	end
	else
	begin
		  update Sys_Users_Detail set Gold = @Gold,Money = @Money,Style=@Style,Colors=@Colors,Grade=@Grade,GP=@GP,State=@State,
		AntiDate=@AntiDate,RichesOffer=@RichesOffer,RichesRob=@RichesRob,
		Hide=@Hide,Win=@Win,Total=@Total,[Escape]=@Escape,Skin=@Skin,Offer=@Offer,AntiAddiction = @AntiAddiction,CheckCount=@CheckCount where UserID = @UserID
	end*/
 		 update Sys_Users_Detail set Gold = @Gold,Money = @Money,Style=@Style,Colors=@Colors,Grade=@Grade,GP=@GP,State=@State,
		AntiDate=@AntiDate,OnlineTime = OnlineTime + @OnlineTime,RichesOffer=@RichesOffer,RichesRob=@RichesRob,ForbidDate=@ForbidDate,IsExist=@IsExist,
		Hide=@Hide,Win=@Win,Total=@Total,[Escape]=@Escape,Skin=@Skin,Offer=@Offer,AntiAddiction = @AntiAddiction,CheckCount=@CheckCount,MarryInfoID=@MarryInfoID,
		DayLoginCount=@DayLoginCount ,Nimbus=@Nimbus,LastAward=@LastAward,GiftToken=@GiftToken,QuestSite=@QuestSite,PvePermission=@PvePermission,FightPower=@FightPower,AnswerSite=@AnswerSite,LastAuncherAward=@LastAuncherAward  where UserID = @UserID
end
else
begin
  		update Sys_Users_Detail set Gold = @Gold,Money = @Money,Style=@Style,Colors=@Colors,Grade=@Grade,GP=@GP,State=@State,
		AntiDate=@AntiDate,OnlineTime = OnlineTime + @OnlineTime,RichesOffer=@RichesOffer,RichesRob=@RichesRob,ForbidDate=@ForbidDate,IsExist=@IsExist,
		Hide=@Hide,ExpendDate=@ExpendDate,Win=@Win,Total=@Total,[Escape]=@Escape,Skin=@Skin,Offer=@Offer,AntiAddiction = @AntiAddiction,CheckCount=@CheckCount,MarryInfoID=@MarryInfoID,
                           DayLoginCount=@DayLoginCount ,Nimbus=@Nimbus,LastAward=@LastAward,GiftToken=@GiftToken,QuestSite=@QuestSite,PvePermission=@PvePermission,FightPower=@FightPower,AnswerSite=@AnswerSite,LastAuncherAward=@LastAuncherAward where UserID = @UserID
end

if @@error <> 0
begin
  rollback tran
  return @@error
end

update Sys_Users_Fight set Attack=@Attack,Defence=@Defence,Luck=@Luck,Agility=@Agility where UserID = @UserID
if @@error <> 0
begin 
  rollback tran
  return @@error
end

commit tran
set xact_abort off
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Users_UpdatePasswordTwo]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ken>
-- ALTER  date: <2009-10-22>
-- Description:	<用户信息：修改用户二次密码>
-- =============================================
CREATE Procedure [dbo].[SP_Users_UpdatePasswordTwo]
@UserID int,
@PasswordTwo Nvarchar(50)

as

  update Sys_Users_Detail set [PasswordTwo] =@PasswordTwo where UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[SP_UsersState_SingleByNickName]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:<watson>
-- ALTER  date: <2009-11-24>
-- Description:	<玩家状态信息：透过用户名查询>
-- =============================================
CREATE  Procedure [dbo].[SP_UsersState_SingleByNickName]
@NickName Nvarchar(200)
as

select * from db_tank.dbo.Sys_Users_Detail
where NickName=@NickName
GO
/****** Object:  StoredProcedure [dbo].[SP_UsersState_SingleByUserID]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:<watson>
-- ALTER  date: <2009-11-26>
-- Description:	<玩家状态信息：透过用户ID查询>
-- =============================================
create  Procedure [dbo].[SP_UsersState_SingleByUserID]
@UserId int
as

select * from db_tank.dbo.Sys_Users_Detail
where UserId=@UserId


GO
/****** Object:  StoredProcedure [dbo].[SP_UsersState_SingleByUserName]    Script Date: 2022/5/24 14:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:<watson>
-- ALTER  date: <2009-11-24>
-- Description:	<玩家状态信息：透过用户名查询>
-- =============================================
CREATE Procedure [dbo].[SP_UsersState_SingleByUserName]
@UserName Nvarchar(200)
as

select * from db_tank.dbo.Sys_Users_Detail
where UserName=@UserName
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<防沉迷用户编号>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AASInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AASInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AASInfo', @level2type=N'COLUMN',@level2name=N'IDNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AASInfo', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防沉迷用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AASInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<活动表>活动编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'ActiveID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'AwardContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0没有key,1有key,2指定用户领取,3每个用户领取' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'HasKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'IsOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示效果<正常、热门、最新>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动时间内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active', @level2type=N'COLUMN',@level2name=N'ActionTimeContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<活动奖品表>序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'ActiveID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励物品编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效天' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'ValidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强化等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'StrengthenLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'攻击等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'AttackCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防御能力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'DefendCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幸运' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'LuckCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'延迟' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'AgilityCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点劵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0表示男女，1男2女' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award', @level2type=N'COLUMN',@level2name=N'Mark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动奖品表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Award'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<领奖激活码>激活码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Number', @level2type=N'COLUMN',@level2name=N'AwardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Number', @level2type=N'COLUMN',@level2name=N'ActiveID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否领取' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Number', @level2type=N'COLUMN',@level2name=N'PullDown'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'获取时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Number', @level2type=N'COLUMN',@level2name=N'GetDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Number', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励物品标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Number', @level2type=N'COLUMN',@level2name=N'Mark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领奖激活码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Active_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<拍卖所>拍卖编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'AuctionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拍卖人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'AuctioneerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拍卖人 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'AuctioneerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拍卖类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上涨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'Rise'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一口价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'Mouthful'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'ValidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'买家用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'BuyerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'买家名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'TemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'距发布时间的随机时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction', @level2type=N'COLUMN',@level2name=N'Random'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拍卖所' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<用户背包初始化>编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'TemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效天' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'ValidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强化' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'StrengthenLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'攻击' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'AttackCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防御' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'DefendCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幸运' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'LuckCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'敏捷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'AgilityCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否绑定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'IsBinds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背包类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'BagType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存放位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init', @level2type=N'COLUMN',@level2name=N'place'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户背包初始化' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bag_Init'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<子弹表>编号ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'炸弹威力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'Power'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'爆炸半径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'Radii'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'飞行效果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'FlyingPartical'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'爆炸效果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'BombPartical'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否旋转' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'IsSpin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'质量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'Mass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'SpinVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'旋转' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'SpinV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'炸弹数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'风力因素' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'Wind'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'空气阻力因素' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'DragIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重力因素' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否震动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'Shake'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发射声音' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'ShootSound'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'爆炸声音' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'BombSound'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'延时值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'Delay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'ActionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有坑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball', @level2type=N'COLUMN',@level2name=N'HasTunnel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子弹表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ball'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<充值记录表>支付订单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money', @level2type=N'COLUMN',@level2name=N'ChargeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点劵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已经充值0表示已到帐 1表示未到帐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money', @level2type=N'COLUMN',@level2name=N'CanUse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money', @level2type=N'COLUMN',@level2name=N'PayWay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所需金钱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money', @level2type=N'COLUMN',@level2name=N'NeedMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值ip地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Charge_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<公会表>公会编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'ConsortiaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会荣誉' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'Honor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'CreatorName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会长编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'ChairmanID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会长昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'ChairmanName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会宣言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会公告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'Placard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会人数上限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'MaxCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'CelebCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'BuildDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会排名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'Repute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'边接公会ip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接公会端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'Port'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'Riches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扣除时间(工会财富)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'DeductDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'宣战时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'WarnDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一次财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'LastDayRiches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一次增加财富数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'AddDayRiches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一周财富数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'LastWeekRiches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一周财富数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'AddWeekRiches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一次荣誉数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'LastDayHonor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近添加的荣誉数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'AddDayHonor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一周荣誉数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'LastWeekHonor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一周增加的荣誉数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'AddWeekHonor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否充值用户申请加入公会(True允许 False不允许)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'OpenApply'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会保管箱等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'StoreLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'铁匠铺等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'SmithLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会商城等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'ShopLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会重名命' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'Rename'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近踢人时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'KickDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近踢人数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia', @level2type=N'COLUMN',@level2name=N'KickCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会外交表<编号>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Ally', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会1编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Ally', @level2type=N'COLUMN',@level2name=N'Consortia1ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会2编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Ally', @level2type=N'COLUMN',@level2name=N'Consortia2ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Ally', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Ally', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效天数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Ally', @level2type=N'COLUMN',@level2name=N'ValidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在(True表示存在 False表示不存在)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Ally', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会外交表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Ally'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<公会结盟申请表>编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Ally', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会1编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Ally', @level2type=N'COLUMN',@level2name=N'Consortia1ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会2编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Ally', @level2type=N'COLUMN',@level2name=N'Consortia2ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Ally', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Ally', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Ally', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Ally', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会结盟申请表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Ally'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<用户申请表>表示编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Users', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Users', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Users', @level2type=N'COLUMN',@level2name=N'ConsortiaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Users', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Users', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Users', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Users', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在(True表示有效 False无效)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Users', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户申请表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Apply_Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<公会职责表>职责编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Duty', @level2type=N'COLUMN',@level2name=N'DutyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Duty', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Duty', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职责名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Duty', @level2type=N'COLUMN',@level2name=N'DutyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Duty', @level2type=N'COLUMN',@level2name=N'Right'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Duty', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会职责表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Duty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户配置表<工会编号>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Equip_Control', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Equip_Control', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Equip_Control', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Equip_Control', @level2type=N'COLUMN',@level2name=N'Riches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Equip_Control', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户配置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Equip_Control'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会事件<编号>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Event', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Event', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事件内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Event', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Event', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Event', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Event', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Event'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会邀请表<编号>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'ConsortiaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被邀请人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被邀请人昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'InviteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请人名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'InviteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'InviteDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会邀请表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Invite_Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会升级条件表<等级>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工会财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'Riches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扣除财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'Deduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'需要金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'NeedGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'需要物品(暂未用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'NeedItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖赏财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'Reward'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商店所需求财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'StoreRiches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'铁匠铺需求财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'SmithRiches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商量所需财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'ShopRiches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会踢人上限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level', @level2type=N'COLUMN',@level2name=N'KickMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会升级条件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会用户表<编号>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批准用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'RatifierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批准用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'RatifierName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职责' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'DutyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许聊天' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'IsBanChat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公会用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consortia_Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日常奖励<编号>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型1表示物品，2表示金币，3表示点券，4表示经验，5表示功勋，6表示BUFF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'TemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效时间(天为单位)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'ValidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否绑定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'IsBinds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'CountRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取方式0表示web领取1表示登陆器领取' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award', @level2type=N'COLUMN',@level2name=N'GetWay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日常奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Daily_Award'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品掉落条件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Condiction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'掉落类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'DropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'掉落名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'ValueDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否绑定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'IsBind'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'Random'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'BeginData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'EndData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有提示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'IsTips'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否记入日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item', @level2type=N'COLUMN',@level2name=N'IsLogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'掉落物品表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Drop_Item'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<活动变装表>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务器编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'BeginDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'EndDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'BeginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'男装模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'BoyTemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示在自已的提示信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'SelfCue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示在对方的提示信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'EnemyCue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动主题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动变装表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Rate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变身活动表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'PlayBegin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'PlayEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变身方队' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'ChangeTeam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A团队' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'TeamA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B团队' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'TeamB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地图编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'MapID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房量类型撮合/竞技' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动主题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'FightName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜利团队' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record', @level2type=N'COLUMN',@level2name=N'WinTeam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变身活动表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fight_Record'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<公式编号表>此表已废' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'FusionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item9'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Item10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励物品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Reward1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成功机率1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Random1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励物品2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Reward2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成功机率2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Random2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励物品3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Reward3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成功机率3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Random3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成物品等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion', @level2type=N'COLUMN',@level2name=N'Leave'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公式编号表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fusion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<游戏地图表>ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地图名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前景(宽)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'ForegroundWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前景(高)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'ForegroundHeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背景(宽)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'BackroundWidht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背景(高)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'BackroundHeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不可炸开(宽)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'DeadWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不可炸开(高)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'DeadHeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'空气阻力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'DragIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前景图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'ForePic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背景图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'BackPic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不可炸开图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'DeadPic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'Pic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背景音乐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'BackMusic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A队出生默认点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'PosX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地图类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B队出生默认点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map', @level2type=N'COLUMN',@level2name=N'PosX1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏地图表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Game_Map'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<熔化公式新表>编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Fusion', @level2type=N'COLUMN',@level2name=N'FusionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Fusion', @level2type=N'COLUMN',@level2name=N'Item1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品二' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Fusion', @level2type=N'COLUMN',@level2name=N'Item2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品三' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Fusion', @level2type=N'COLUMN',@level2name=N'Item3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品四' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Fusion', @level2type=N'COLUMN',@level2name=N'Item4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'熔炼公式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Fusion', @level2type=N'COLUMN',@level2name=N'Formula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成不对类型物品的机率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Fusion', @level2type=N'COLUMN',@level2name=N'Reward'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'熔化公式新表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Fusion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品铁匠铺记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理商id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'AgentsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属频道' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'Timer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作用户时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1强化2合成3熔炼4转移' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'Operation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成后的物品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成后物编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始前属性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'BeginProperty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束属性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'EndProperty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作结果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record', @level2type=N'COLUMN',@level2name=N'Result'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品铁匠铺记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Record'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强化表<等级>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen', @level2type=N'COLUMN',@level2name=N'StrengthenLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'需要石头' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen', @level2type=N'COLUMN',@level2name=N'Rock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'概率(10000为百分百)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen', @level2type=N'COLUMN',@level2name=N'Random'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强化表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强化转换表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen_Goods', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen_Goods', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前装备' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen_Goods', @level2type=N'COLUMN',@level2name=N'CurrentEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转变后的武器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen_Goods', @level2type=N'COLUMN',@level2name=N'GainEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen_Goods', @level2type=N'COLUMN',@level2name=N'OrginEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强化转化表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item_Strengthen_Goods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<服务地图出现>服务器编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Map_Server', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开放地图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Map_Server', @level2type=N'COLUMN',@level2name=N'OpenMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Map_Server', @level2type=N'COLUMN',@level2name=N'IsSpecial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务地图出现' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Map_Server'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地图出现周期<星期编号>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Map_Week', @level2type=N'COLUMN',@level2name=N'WeekID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开放地图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Map_Week', @level2type=N'COLUMN',@level2name=N'OpenMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地图出现周期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Map_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<结婚申请表>被邀请人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply', @level2type=N'COLUMN',@level2name=N'ApplyUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply', @level2type=N'COLUMN',@level2name=N'ApplyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请类型(1表示申请结婚)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply', @level2type=N'COLUMN',@level2name=N'ApplyType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真情表白' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply', @level2type=N'COLUMN',@level2name=N'LoveProclamation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请结果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply', @level2type=N'COLUMN',@level2name=N'ApplyResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply', @level2type=N'COLUMN',@level2name=N'isExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否拒绝' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply', @level2type=N'COLUMN',@level2name=N'isDeal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结婚申请表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Apply'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交友中心表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Info', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Info', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否公开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Info', @level2type=N'COLUMN',@level2name=N'IsPublishEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'爱情宣言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Info', @level2type=N'COLUMN',@level2name=N'Introduction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Info', @level2type=N'COLUMN',@level2name=N'RegistTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Info', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交友中心表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结婚礼堂' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结婚标题 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'PlayerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'PlayerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'GroomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'GroomName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新娘编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'BrideID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新娘名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'BrideName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'Pwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结婚房间使用时间(小时)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'AvailTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间人数上限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'MaxCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许游客访问' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'GuestInvite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'BeginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中断时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'BreakTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'典礼描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'RoomIntroduction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务器编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已经典礼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'IsHymeneal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'isExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否使用礼炮' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info', @level2type=N'COLUMN',@level2name=N'IsGunsaluteUsed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结婚礼堂' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marry_Room_Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PVEGame中的关卡信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关卡名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总击杀数或者占领的木板数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'TotalCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总回合数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'TotalTurn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关卡AI脚本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Script'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成功条件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Success'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'失败条件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Failure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关卡描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Delay增值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'IncrementDelay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关卡初始Delay值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Delay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关卡标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预留参数1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Param1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预留参数2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info', @level2type=N'COLUMN',@level2name=N'Param2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关卡信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mission_Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NPC的开炮x轴' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NPC_Info', @level2type=N'COLUMN',@level2name=N'FireX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NPC的开炮y轴' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NPC_Info', @level2type=N'COLUMN',@level2name=N'FireY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'掉落物品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NPC_Info', @level2type=N'COLUMN',@level2name=N'DropId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NPC信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NPC_Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副本名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'撮合: 0, 自由: 1, 探险: 2, BOSS战: 3,  夺宝: 4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最低等级限制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'LevelLimits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品掉落表,以,分割的templateId列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'SimpleTemplateIds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'Pic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'简单难度脚本路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'SimpleGameScript'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'普通难度脚本路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'NormalGameScript'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'困难难度脚本路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'HardGameScript'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'梦魇难度脚本路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'TerrorGameScript'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副本显示次序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'Ordering'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不同难度等级建议说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info', @level2type=N'COLUMN',@level2name=N'AdviceTips'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副本信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pve_Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务的唯一ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务显示的位置，0为主线任务，1为支线任务，2为日常任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'QuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在游戏中显示的任务标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在游戏中显示的任务详细内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'Detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在游戏中显示的任务目标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'Objective'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接受该任务的最小等级，玩家等级小于此等级则无法接受该任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'NeedMinLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接受该任务的最大等级，玩家等级大于此等级则无法接受该任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'NeedMaxLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'该任务的前置任务，可以有复数个，接到该任务需要完成所有前置任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'PreQuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'该任务的后置任务，可以有复数个，接到该任务需要完成所有前置任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'NextQuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0表无1表公会2表结婚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'IsOther'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可以重复完成，可以为1，不可以为0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'CanRepeat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可重复任务的时间间隔，单位为小时，以服务器时间为准定时刷新，不考虑接受任务的具体时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RepeatInterval'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在一段时间间隔内可重复提交的任务的次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RepeatMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励的经验' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RewardGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励的金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RewardGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励的礼金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RewardGiftToken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励的功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RewardOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励的财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RewardRiches'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励的buff' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RewardBuffID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励buff的时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RewardBuffDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励的点券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RewardMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务随机奖励机率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'Rands'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'随机奖励倍率
   随机奖励倍率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'RandDouble'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有时间限制，1为有，0为没有' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'TimeMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Condiction', @level2type=N'COLUMN',@level2name=N'QuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条件序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Condiction', @level2type=N'COLUMN',@level2name=N'CondictionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Condiction', @level2type=N'COLUMN',@level2name=N'CondictionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条件标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Condiction', @level2type=N'COLUMN',@level2name=N'CondictionTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制字段1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Condiction', @level2type=N'COLUMN',@level2name=N'Para1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制字段2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Condiction', @level2type=N'COLUMN',@level2name=N'Para2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务条件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Condiction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'QuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励物品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'RewardItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0表必选取 1表多选' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'IsSelect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期（天）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'RewardItemValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'RewardItemCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强化等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'StrengthenLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'攻击加成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'AttackCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防御加成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'DefendCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'敏捷加成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'AgilityCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幸运加成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'LuckCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否受奖励倍率影响
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods', @level2type=N'COLUMN',@level2name=N'IsCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quest_Goods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户任务表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'QuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'IsComplete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'CompletedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成条件1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'Condition1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成条件2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'Condition2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成条件3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'Condition3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成条件4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'Condition4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'剩余接受次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'RepeatFinish'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'获取任务比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData', @level2type=N'COLUMN',@level2name=N'RandDobule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户任务表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验倍率表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rate', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'倍率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rate', @level2type=N'COLUMN',@level2name=N'Rate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rate', @level2type=N'COLUMN',@level2name=N'BeginDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rate', @level2type=N'COLUMN',@level2name=N'EndDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rate', @level2type=N'COLUMN',@level2name=N'BeginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rate', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rate', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验倍率表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<合服:工会表修改记录>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Consortia', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工会编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Consortia', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工会昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Consortia', @level2type=N'COLUMN',@level2name=N'ConsortiaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新后的昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Consortia', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提前日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Consortia', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Consortia', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合服:工会表修改记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Consortia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<合服：用户信息昵称修改>id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Nick', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Nick', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Nick', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称修改' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Nick', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Nick', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Nick', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合服：用户信息昵称修改' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rename_Nick'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GameServer的配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_Config', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_Config', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_Config', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GameServer的配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_Config'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务器列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'Port'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'Online'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'Room'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加密算法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'RSA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级上限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'MustLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级下限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'LowestLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为最新手服务器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List', @level2type=N'COLUMN',@level2name=N'NewerServer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务器列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Server_List'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表示商店位置，例如1为商城，2为战场商城，11-15为公会商城' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'ShopID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'捆绑销售类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'TemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0为日期，1为数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'BuyType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号，数字越大越靠前' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否绑定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'IsBind'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐0为不推荐，1为推荐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'IsVouch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签显示1新品、2热销、3限时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'Label'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打折1为无折扣，0.9为9折，0.8为8折……' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'Beat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A数量/有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'AUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A价格类型1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'APrice1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A数量1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'AValue1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A价格类型2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'APrice2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A数量2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'AValue2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A价格类型3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'APrice3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A数量3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'AValue3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B数量/有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'BUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B价格类型1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'BPrice1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B数量1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'BValue1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B价格类型2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'BPrice2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B数量2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'BValue2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B价格类型3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'BPrice3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'B数量3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'BValue3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C数量/有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'CUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C价格类型1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'CPrice1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C数量1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'CValue1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C价格类型2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'CPrice2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C数量2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'CValue2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C价格类型3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'CPrice3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C数量3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'CValue3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商店物品表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'TemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'CategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'攻击' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Attack'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防御' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Defence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'敏捷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Agility'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幸运' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Luck'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品品质' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Quality'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Pic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重叠数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'MaxCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'NeedSex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'需要等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'NeedLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可以强化' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'CanStrengthen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'能否合成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'CanCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'能否丢弃' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'CanDrop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'能否装备' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'CanEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'能否使用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'CanUse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'能否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'CanDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'脚本名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Script'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'颜色组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Colors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效的(暂时未用到)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Valid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出售数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否绑定（0不1拾2装3使）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'BindType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'熔炼类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'FusionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'熔炼成功率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'FusionRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'熔炼所需成功率系数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods', @level2type=N'COLUMN',@level2name=N'FusionNeedRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<开箱子掉落表>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'箱子编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'DataId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'TemplateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可选' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'IsSelect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否绑定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'IsBind'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品有效期(天)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'ItemValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'ItemCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强化' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'StrengthenLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'攻击' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'AttackCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防御' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'DefendCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'敏捷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'AgilityCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幸运' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'LuckCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'Random'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有提示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'IsTips'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否记录入日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box', @level2type=N'COLUMN',@level2name=N'IsLogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开箱子物品掉落' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Box'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<物品大分类表>ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Categorys', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Categorys', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Categorys', @level2type=N'COLUMN',@level2name=N'Place'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Categorys', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品大分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop_Goods_Categorys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'激活日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否加入工会' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsConsortia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工会ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Win'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃跑数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Escape'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'GP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头衔<暂不用到>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Honor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点卷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Style'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'样式颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Colors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Hide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'共总登陆次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsFirst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GP经验排名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Repute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后活动日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近充值时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ChargeDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近消费时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ExpendDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'激活IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ActiveIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁号时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ForbidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'皮肤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Skin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Offer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户捐献' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ReputeOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'倒数第二次登陆时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastDateSecond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'倒数第三次登陆时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastDateThird'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆次数(一日一次)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LoginCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时长(分钟)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'OnlineTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防沉迷系统时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AntiAddiction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防沉迷时间计算' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AntiDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'贡献财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'RichesOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'掠夺财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'RichesRob'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一次经验' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastDayGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日增GP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AddDayGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后周GP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastWeekGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周增长GP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AddWeekGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后日功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastDayOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日增长功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AddDayOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后周功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastWeekOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周增长功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AddWeekOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户输入验证码次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'CheckCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源站点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Site'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否结婚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsMarried'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配偶ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'SpouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配偶名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'SpouseName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交友中心ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'MarryInfoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日登陆次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'DayLoginCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁号原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ForbidReason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否创建结婚房间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsCreatedMarryRoom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二层密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'PasswordTwo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结婚房间ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'SelfMarryRoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否得到戒指' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsGotRing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务器名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否重名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Rename'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'光环' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Nimbus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近获奖日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastAward'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'GiftToken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'难度等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'PvePermission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'战斗力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'FightPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户答题位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AnswerSite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录器最近获奖日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastAuncherAward'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户资料表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<用户战斗属性表>ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'攻击力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'Attack'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防御力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'Defence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幸运值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'Luck'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'敏捷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'Agility'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'延时值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'Delay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'荣誉' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'Honor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在地图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'Map'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在目录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'Directory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户战斗属性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Fight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<用户好友表>ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'好友ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'FriendID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0友好，1黑名单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Relation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户好友表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Friends'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户物品表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背包类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'BagType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'TemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'Place'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否鉴定(暂未用到)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'IsJudge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强化等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'StrengthenLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'攻击加成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'AttackCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防御加成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'DefendCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幸运加成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'LuckCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'敏捷加成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'AgilityCompose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'暂未用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'Skin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否绑定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'IsBinds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否使用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'IsUsed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'ValidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'移除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'RemoveDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'移除类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'RemoveType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'孔1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods', @level2type=N'COLUMN',@level2name=N'Hole1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户物品表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Goods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户排名表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Password', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Password', @level2type=N'COLUMN',@level2name=N'PasswordQuestion1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码提示问题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Password', @level2type=N'COLUMN',@level2name=N'PasswordQuestion2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码回答问题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Password', @level2type=N'COLUMN',@level2name=N'PasswordAnswer2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近找回密码时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Password', @level2type=N'COLUMN',@level2name=N'LastFindDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'失败次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Password', @level2type=N'COLUMN',@level2name=N'FailedPasswordAttemptCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户找回密码表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Users_Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户双倍经验倍率表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Buff', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型(11防踢卡，12双倍功勋卡，13双倍经验卡，14变色卡)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Buff', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Buff', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Buff', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Buff', @level2type=N'COLUMN',@level2name=N'ValidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'暂未用(用记写脚本)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Buff', @level2type=N'COLUMN',@level2name=N'Data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在(0表示无效1表示有效)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Buff', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户双倍经验倍率表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Buff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<用户邮件表>ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'SenderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Sender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'ReceiverID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接受者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Receiver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否阅读' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'IsRead'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否被接受者删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'IsDelR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否被发送者删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'IfDelS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件1编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件2编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点卷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件有效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'ValidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件一名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex1Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件二名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex2Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'SendDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件三编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件四编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件五编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件三名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex3Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件四名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex4Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件五名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'Annex5Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'汇总说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'AnnexRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼劵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages', @level2type=N'COLUMN',@level2name=N'GiftToken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户邮件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Messages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'Grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'GP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'样式颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'Colors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'Style'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'Hide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后活动日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'LastDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'Win'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃跑数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users', @level2type=N'COLUMN',@level2name=N'Escape'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Consortia_Users"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 116
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sys_Users_Detail"
            Begin Extent = 
               Top = 6
               Left = 229
               Bottom = 116
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Consortia_Duty"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 230
               Right = 185
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 240
      Begin ColumnWidths = 31
         Width = 284
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Consortia_Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交友中心表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否公开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'IsPublishEquip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'爱情宣言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Introduction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否加入工会' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'IsConsortia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工会ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Win'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃跑数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Escape'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'GP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Style'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'样式颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Colors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Hide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GP经验排名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Repute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'皮肤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Skin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Offer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否结婚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'IsMarried'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'UserExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'光环' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'Nimbus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'战斗力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info', @level2type=N'COLUMN',@level2name=N'FightPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Marry_Info"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 109
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sys_Users_Detail"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 109
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 99
               Right = 607
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 29
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Marry_Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'攻击力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Attack'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防御力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Defence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幸运值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Luck'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'敏捷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Agility'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点卷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Style'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'样式颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Colors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'GP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工会ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ConsortiaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Hide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GP经验排名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Repute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否存在' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsExist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'共总登陆次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsFirst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Offer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Win'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃跑数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Escape'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'皮肤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Skin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否加入工会' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsConsortia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户捐献' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ReputeOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防沉迷系统时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AntiAddiction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'贡献财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'RichesOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'掠夺财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'RichesRob'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日增GP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AddDayGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周增长GP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AddWeekGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日增长功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AddDayOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周增长功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AddWeekOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后日功勋' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastDayOffer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一次经验' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastDayGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户输入验证码次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'CheckCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁号时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'ForbidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否结婚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsMarried'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交友中心ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'MarryInfoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否创建结婚房间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsCreatedMarryRoom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日登陆次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'DayLoginCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二层密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'PasswordTwo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结婚房间ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'SelfMarryRoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否得到戒指' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'IsGotRing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'光环' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'Nimbus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近获奖日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'LastAward'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'GiftToken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'战斗力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'FightPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'PasswordQuestion1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码提示问题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'PasswordQuestion2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户答题位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail', @level2type=N'COLUMN',@level2name=N'AnswerSite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -97
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sys_Users_Detail"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 116
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sys_Users_Fight"
            Begin Extent = 
               Top = 6
               Left = 265
               Bottom = 116
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Consortia"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 230
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Consortia_Users"
            Begin Extent = 
               Top = 120
               Left = 241
               Bottom = 230
               Right = 394
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Consortia_Duty"
            Begin Extent = 
               Top = 234
               Left = 38
               Bottom = 344
               Right = 185
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sys_Users_Password"
            Begin Extent = 
               Top = 234
               Left = 223
               Bottom = 344
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 240
      Begin ColumnWidths = 75
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Width = 284
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Style'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'样式颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Colors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Hide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃跑数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Escape'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜场数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends', @level2type=N'COLUMN',@level2name=N'Win'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sys_Users_Friends"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 116
               Right = 173
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sys_Users_Detail"
            Begin Extent = 
               Top = 6
               Left = 211
               Bottom = 116
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Consortia"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 230
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 240
      Begin ColumnWidths = 22
         Width = 284
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Sys_Users_Friends'
GO
USE [master]
GO
ALTER DATABASE [Db_Tank] SET  READ_WRITE 
GO
