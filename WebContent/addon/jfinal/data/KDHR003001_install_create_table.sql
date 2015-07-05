--薪酬核算明细
If not exists (select * from KSQL_USERTABLES where KSQL_TABNAME ='T_HR_SCmpCalTable')
create table T_HR_SCmpCalTable(
       FID VARCHAR(44) DEFAULT '' NOT NULL,
       FPersonID VARCHAR(44),
       FCmpPeriodID VARCHAR(44),
	   FPeriodYear INT,
	   FPeriodMonth INT,
       FCalSchemeID VARCHAR(44),
	   FCalTime INT default 1,
       FIsCal VARCHAR(1),
       FIsAudit VARCHAR(1),
       FIsGive VARCHAR(1),
	   FAdminOrgUnitID VARCHAR(44),
	   FPositionID VARCHAR(44),
	   FJobID VARCHAR(44),
	   FCostBearOrgID VARCHAR(44),
	   FCmpCalOrgID VARCHAR(44),
	   FLongNumber VARCHAR(200),
	   FoldEasId VARCHAR(137),
	   S1 NUMERIC(20,10),
	   S2 NUMERIC(20,10),
	   S3 NUMERIC(20,10),
	   S4 NUMERIC(20,10),
	   S5 NUMERIC(20,10),
	   S6 NUMERIC(20,10),
	   S7 NUMERIC(20,10),
	   S8 NUMERIC(20,10),
	   S9 NVARCHAR(1000),
	   S10 NUMERIC(20,10),
	   S11 NVARCHAR(1000),
       CONSTRAINT PK_HR_SCmpCalTable PRIMARY KEY (FID)
);
--核算人员
If not exists (select * from KSQL_USERTABLES where KSQL_TABNAME ='T_HR_SCmpSchemePerson')
create table T_HR_SCmpSchemePerson ( FCmpSchemeID VARCHAR(44),FPersonID VARCHAR(44),
FAdminOrgUnitID VARCHAR(44),FPositionID VARCHAR(44),
FCostBearOrgID VARCHAR(44),FEmpPosOrgRelationID VARCHAR(44),
FcmpCalOrgID VARCHAR(44),
FID VARCHAR(44) DEFAULT '' NOT NULL ,CONSTRAINT PK_HR_SCmpSchemeP PRIMARY KEY (FID));
--预置薪酬核算表薪酬项目字段S9是字符型的薪酬项目
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='S9' and KSQL_COL_TABNAME='T_HR_SCmpCalTable') 
alter table T_HR_SCmpCalTable add S9 NVARCHAR(1000);
--预置薪酬核算表薪酬项目字段S11是字符型的薪酬项目
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='S11' and KSQL_COL_TABNAME='T_HR_SCmpCalTable') 
alter table T_HR_SCmpCalTable add S11 NVARCHAR(1000);
--预置实发合计项目
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='S3' and KSQL_COL_TABNAME='T_HR_SCmpCalTable') 
alter table T_HR_SCmpCalTable add S3 NUMERIC(20,10);
--核算人员表添加字段，解决shr1升级到shr1.5问题
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FEmpPosOrgRelationID' and KSQL_COL_TABNAME='T_HR_SCmpSchemePerson') 
alter table T_HR_SCmpSchemePerson add FEmpPosOrgRelationID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FcmpCalOrgID' and KSQL_COL_TABNAME='T_HR_SCmpSchemePerson') 
alter table T_HR_SCmpSchemePerson add FcmpCalOrgID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FCmpSchemeID' and KSQL_COL_TABNAME='T_HR_SCmpSchemePerson') 
alter table T_HR_SCmpSchemePerson add FCmpSchemeID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FPersonID' and KSQL_COL_TABNAME='T_HR_SCmpSchemePerson') 
alter table T_HR_SCmpSchemePerson add FPersonID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FAdminOrgUnitID' and KSQL_COL_TABNAME='T_HR_SCmpSchemePerson') 
alter table T_HR_SCmpSchemePerson add FAdminOrgUnitID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FCostBearOrgID' and KSQL_COL_TABNAME='T_HR_SCmpSchemePerson') 
alter table T_HR_SCmpSchemePerson add FCostBearOrgID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FPositionID' and KSQL_COL_TABNAME='T_HR_SCmpSchemePerson') 
alter table T_HR_SCmpSchemePerson add FPositionID VARCHAR(44);
--添加FLongNumber
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FLongNumber' and KSQL_COL_TABNAME='T_HR_SCmpCalTable') 
alter table T_HR_SCmpCalTable add FLongNumber VARCHAR(200);
--8.0薪酬计算结果表添加字段FoldEasId
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FoldEasId' and KSQL_COL_TABNAME='T_HR_SCmpCalTable') 
alter table T_HR_SCmpCalTable add FoldEasId VARCHAR(137);
--核算规则改为行政组织隔离
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FAdminOrgUnitID' and KSQL_COL_TABNAME='T_HR_SCalScheme') 
alter table T_HR_SCalScheme add FAdminOrgUnitID VARCHAR(44);

--薪酬报表查询方案
If not exists (select * from KSQL_USERTABLES where KSQL_TABNAME ='T_HR_SCmpReportQuerySchema')
Create Table T_HR_SCmpReportQuerySchema ( FName NVARCHAR(50),FOrgFilter CLOB(5000),FIsDefault INT,FItemRange CLOB(5000),FSearchDate DateTime,FPersonid VARCHAR(44),FModel VARCHAR(100),FQuery VARCHAR(100),FSql CLOB(2000),FUipk VARCHAR(100),FType INT,FDataFilter CLOB(2000),FPeriodId VARCHAR(44),FCalSchemeId VARCHAR(44),FCreatorID VARCHAR(44),FCreateTime DateTime,FLastUpdateUserID VARCHAR(44),FLastUpdateTime DateTime,FControlUnitID VARCHAR(44),FID VARCHAR(44) DEFAULT '' NOT NULL ,CONSTRAINT PK_HR_ReportQuery PRIMARY KEY (FID));
--薪酬档案银行账号
If not exists (select * from KSQL_USERTABLES where KSQL_TABNAME ='T_HR_SCmpEmpAccount')
Create Table T_HR_SCmpEmpAccount ( FBankID VARCHAR(44),FIsEnable INT,FAccountNum VARCHAR(30),FProvince_l1 NVARCHAR(255),
FProvince_l2 NVARCHAR(255),FProvince_l3 NVARCHAR(255),FCity_l1 NVARCHAR(255),FCity_l2 NVARCHAR(255),FCity_l3 NVARCHAR(255),
FBillID VARCHAR(44),FPersonID VARCHAR(44),FBusinessUnitID VARCHAR(44),FSortn INT,FCreatorID VARCHAR(44),FCreateTime DateTime,
FLastUpdateUserID VARCHAR(44),FLastUpdateTime DateTime,FControlUnitID VARCHAR(44),FID VARCHAR(44) DEFAULT '' NOT NULL ,
CONSTRAINT PK_HR_SCmpEmpAcc PRIMARY KEY (FID));
--同步原GUI银行账号
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FSortn' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FSortn INT;
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FCreatorID' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FCreatorID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FCreateTime' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FCreateTime DateTime;
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FLastUpdateUserID' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FLastUpdateUserID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FLastUpdateTime' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FLastUpdateTime DateTime;
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FControlUnitID' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FControlUnitID VARCHAR(44);
--利用多语言字段解决sqlserver上中文乱码问题
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FProvince_l1' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FProvince_l1 NVARCHAR(255);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FProvince_l2' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FProvince_l2 NVARCHAR(255);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FProvince_l3' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FProvince_l3 NVARCHAR(255);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FCity_l1' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FCity_l1 NVARCHAR(255);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FCity_l2' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FCity_l2 NVARCHAR(255);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FCity_l3' and KSQL_COL_TABNAME='T_HR_SCmpEmpAccount') 
alter table T_HR_SCmpEmpAccount add FCity_l3 NVARCHAR(255);
--费用分配
If not exists (select * from KSQL_USERTABLES where KSQL_TABNAME ='T_HR_SCostBear')
Create Table T_HR_SCostBear ( FID VARCHAR(44) DEFAULT '' NOT NULL ,FCostBearOrgID VARCHAR(44),FCostBearOrgUnitID VARCHAR(44),
FCalOrgUnitID VARCHAR(44),FHrOrgUnitID VARCHAR(44),FAdminOrgID VARCHAR(44),FCalSchemeID VARCHAR(44),FCmpPeriodID VARCHAR(44),
FCmpItemID VARCHAR(44),FPersonID VARCHAR(44),FCostBearPerc VARCHAR(5),FBearMoney NUMERIC(20,10),FCostMoney NUMERIC(20,10),
FCalTime INT DEFAULT 1,FCreatorID VARCHAR(44),FCreateTime DateTime,FLastUpdateUserID VARCHAR(44),FLastUpdateTime DateTime,
FControlUnitID VARCHAR(44),CONSTRAINT PK_HR_SCostBear PRIMARY KEY (FID));
--费用承担组织
If not exists (select * from KSQL_USERTABLES where KSQL_TABNAME ='T_HR_SCostBearOrg')
Create Table T_HR_SCostBearOrg ( FCostBearOrgID VARCHAR(44),FCostBearPerc VARCHAR(5),FCmpItemID VARCHAR(44),FPersonID VARCHAR(44),
FBusinessUnitID VARCHAR(44),FState INT,FEffactDate DateTime,FCreatorID VARCHAR(44),FCreateTime DateTime,FLastUpdateUserID VARCHAR(44),
FLastUpdateTime DateTime,FControlUnitID VARCHAR(44),FID VARCHAR(44) DEFAULT '' NOT NULL ,CONSTRAINT PK_HR_SCostBearOrg PRIMARY KEY (FID));
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FState' and KSQL_COL_TABNAME='T_HR_SCostBearOrg') 
alter table T_HR_SCostBearOrg add FState INT;
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FEffactDate' and KSQL_COL_TABNAME='T_HR_SCostBearOrg') 
alter table T_HR_SCostBearOrg add FEffactDate DateTime;
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FCreatorID' and KSQL_COL_TABNAME='T_HR_SCostBearOrg') 
alter table T_HR_SCostBearOrg add FCreatorID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FCreateTime' and KSQL_COL_TABNAME='T_HR_SCostBearOrg') 
alter table T_HR_SCostBearOrg add FCreateTime DateTime;
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FLastUpdateUserID' and KSQL_COL_TABNAME='T_HR_SCostBearOrg') 
alter table T_HR_SCostBearOrg add FLastUpdateUserID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FLastUpdateTime' and KSQL_COL_TABNAME='T_HR_SCostBearOrg') 
alter table T_HR_SCostBearOrg add FLastUpdateTime DateTime;
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FControlUnitID' and KSQL_COL_TABNAME='T_HR_SCostBearOrg') 
alter table T_HR_SCostBearOrg add FControlUnitID VARCHAR(44);
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FIsCostBear' and KSQL_COL_TABNAME='T_HR_SCalSchemeItem') 
alter table T_HR_SCalSchemeItem add FIsCostBear INT;


--薪酬报表查询方案增加用户Id
If not exists (select * from KSQL_USERCOLUMNS where KSQL_COL_NAME ='FUserId' and KSQL_COL_TABNAME='T_HR_SCmpReportQuerySchema') 
alter table T_HR_SCmpReportQuerySchema add FUserId VARCHAR(44);

--工作流发放单据 核算记录表
If not exists (select * from KSQL_USERTABLES where KSQL_TABNAME ='T_HR_SCmpCalTableWFRecord')
Create Table T_HR_SCmpCalTableWFRecord ( FCalTableId VARCHAR(44),FCmpSendBillId VARCHAR(44),FID VARCHAR(44) DEFAULT '' NOT NULL ,CONSTRAINT PK_HR_CalWFRecord PRIMARY KEY (FID));

--工作流发放单据
If not exists (select * from KSQL_USERTABLES where KSQL_TABNAME ='T_HR_SCmpWorkFlowMainBill')
Create Table T_HR_SCmpWorkFlowMainBill ( FID VARCHAR(44) DEFAULT '' NOT NULL ,FTime INT,FCalSchemeId VARCHAR(44),FCmpPeriodId VARCHAR(44),FAdminOrgUnitId VARCHAR(44),FHROrgUnitID VARCHAR(44),FBillState INT,FApproveType INT,FIsMultiEntry INT,FNumber VARCHAR(80),FBizDate DateTime,FHandlerID VARCHAR(44),FDescription VARCHAR(255),FHasEffected INT,FAuditorID VARCHAR(44),FSourceBillID VARCHAR(44),FSourceFunction VARCHAR(80),FCreatorID VARCHAR(44),FCreateTime DateTime,FLastUpdateUserID VARCHAR(44),FLastUpdateTime DateTime,FControlUnitID VARCHAR(44),CONSTRAINT PK_HR_WorkFlowMain PRIMARY KEY (FID));












