/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : wx.platform.borrowing

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-04 18:11:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `s_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `s_coupon`;
CREATE TABLE `s_coupon` (
  `CouponID` int(8) NOT NULL AUTO_INCREMENT,
  `CouponName` varchar(100) NOT NULL,
  `CouponType` int(2) NOT NULL COMMENT '优惠券类型：1-免手续费；2-直接减现',
  `CouponAmount` decimal(8,0) DEFAULT NULL COMMENT '优惠券面值金额',
  `ValidityTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '有效期至',
  `CouponState` int(4) NOT NULL COMMENT '优惠券状态：0-未使用；1-已使用',
  PRIMARY KEY (`CouponID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of s_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `s_repaymentaccount`
-- ----------------------------
DROP TABLE IF EXISTS `s_repaymentaccount`;
CREATE TABLE `s_repaymentaccount` (
  `SPayID` int(8) NOT NULL AUTO_INCREMENT,
  `UserID` int(8) NOT NULL COMMENT '用户编号',
  `Payee` varchar(50) NOT NULL COMMENT '开户人',
  `ReceAcc` varchar(128) DEFAULT NULL COMMENT '收款账号',
  `OpenBrand` varchar(500) DEFAULT NULL COMMENT '开户行',
  `AliPayName` varchar(50) DEFAULT NULL COMMENT '支付宝姓名',
  `AliPayAcc` varchar(128) DEFAULT NULL COMMENT '支付宝账号',
  PRIMARY KEY (`SPayID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of s_repaymentaccount
-- ----------------------------

-- ----------------------------
-- Table structure for `u_base`
-- ----------------------------
DROP TABLE IF EXISTS `u_base`;
CREATE TABLE `u_base` (
  `BaseID` int(8) NOT NULL AUTO_INCREMENT,
  `UserID` int(8) NOT NULL COMMENT '用户编号',
  `Mobile` varchar(20) NOT NULL COMMENT '手机号',
  `ServPwd` varchar(128) NOT NULL COMMENT '运营商密码',
  `AINAcc` varchar(120) NOT NULL COMMENT '学信网账号',
  `AINPass` varchar(128) NOT NULL COMMENT '学信网密码',
  `RegTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `QQ` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `Email` varchar(120) DEFAULT NULL COMMENT '邮箱',
  `Education` varchar(50) DEFAULT NULL COMMENT '教育水平',
  `HomeAddr` varchar(500) DEFAULT NULL COMMENT '家庭地址',
  `DormAddr` varchar(500) DEFAULT NULL COMMENT '寝室地址',
  `ParentName` varchar(30) DEFAULT NULL COMMENT '双亲名称',
  `ParentPhone` varchar(30) DEFAULT NULL COMMENT '双亲电话',
  `StudName` varchar(30) DEFAULT NULL COMMENT '同学名称',
  `StudPhone` varchar(30) DEFAULT NULL COMMENT '同学电话',
  `InvCode` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `AccState` int(1) NOT NULL DEFAULT '0' COMMENT '账号状态：1-待审核；2-正常',
  PRIMARY KEY (`BaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of u_base
-- ----------------------------

-- ----------------------------
-- Table structure for `u_cert`
-- ----------------------------
DROP TABLE IF EXISTS `u_cert`;
CREATE TABLE `u_cert` (
  `CertID` int(8) NOT NULL AUTO_INCREMENT,
  `UserID` int(8) NOT NULL COMMENT '用户编号',
  `RealName` varchar(50) NOT NULL,
  `CardNum` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `StudNum` varchar(50) NOT NULL,
  `CertPhoto1` varchar(255) DEFAULT NULL COMMENT '身份证正面',
  `CertPhoto2` varchar(255) DEFAULT NULL COMMENT '身份证反面',
  `CertPhoto3` varchar(255) DEFAULT NULL COMMENT '学生证正面',
  `CertPhoto4` varchar(255) DEFAULT NULL COMMENT '学生证反面',
  PRIMARY KEY (`CertID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of u_cert
-- ----------------------------

-- ----------------------------
-- Table structure for `u_couponuserecords`
-- ----------------------------
DROP TABLE IF EXISTS `u_couponuserecords`;
CREATE TABLE `u_couponuserecords` (
  `CoupUseID` int(8) NOT NULL AUTO_INCREMENT,
  `UserID` int(8) NOT NULL COMMENT '用户ID',
  `CouponID` int(8) NOT NULL COMMENT '优惠券ID',
  `IsUsed` int(2) NOT NULL COMMENT '是否已使用',
  `UseTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '使用时间',
  PRIMARY KEY (`CoupUseID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of u_couponuserecords
-- ----------------------------

-- ----------------------------
-- Table structure for `u_invrela`
-- ----------------------------
DROP TABLE IF EXISTS `u_invrela`;
CREATE TABLE `u_invrela` (
  `InvID` int(8) NOT NULL AUTO_INCREMENT,
  `InvUserID` int(8) NOT NULL COMMENT '邀请用户编号',
  `BeInvUserID` int(8) NOT NULL COMMENT '受邀用户编号',
  `BeInvTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '受邀注册时间',
  PRIMARY KEY (`InvID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of u_invrela
-- ----------------------------

-- ----------------------------
-- Table structure for `u_loanapp`
-- ----------------------------
DROP TABLE IF EXISTS `u_loanapp`;
CREATE TABLE `u_loanapp` (
  `LoanID` int(8) NOT NULL AUTO_INCREMENT,
  `UserID` int(8) NOT NULL,
  `LoanTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '借款时间',
  `LoanAmount` decimal(8,0) NOT NULL COMMENT '借款金额',
  `RepayCycle` int(2) NOT NULL COMMENT '还款周期',
  `RepayTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '还款时间',
  `AppCode` varchar(50) NOT NULL COMMENT '借款单号',
  `ReceMethod` int(2) NOT NULL COMMENT '收款方式',
  `Payee` varchar(50) NOT NULL COMMENT '开户人',
  `ReceAcc` varchar(128) DEFAULT NULL COMMENT '收款账号',
  `OpenBrand` varchar(500) DEFAULT NULL COMMENT '开户行',
  `AliPayName` varchar(50) DEFAULT NULL COMMENT '支付宝姓名',
  `AliPayAcc` varchar(128) DEFAULT NULL COMMENT '支付宝账号',
  `ServCharge` decimal(8,0) DEFAULT NULL COMMENT '服务费',
  `MgrCharge` decimal(8,0) DEFAULT NULL COMMENT '管理费',
  `AppState` int(2) NOT NULL COMMENT '借款单状态：0-待审核；1-待放款；2-待还款；3-交易完成',
  `UserIsDeleted` int(1) NOT NULL COMMENT '用户是否已删除',
  `MgrIsDeleted` int(1) NOT NULL COMMENT '管理员是否已删除',
  PRIMARY KEY (`LoanID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of u_loanapp
-- ----------------------------

-- ----------------------------
-- Table structure for `u_loanappr`
-- ----------------------------
DROP TABLE IF EXISTS `u_loanappr`;
CREATE TABLE `u_loanappr` (
  `ApprID` int(8) NOT NULL AUTO_INCREMENT,
  `LoanID` int(8) NOT NULL COMMENT '申请单ID',
  `ApprState` int(4) NOT NULL COMMENT '审核状态：0-待审核；1-通过申请；2-驳回申请',
  `ApprMsg` varchar(200) DEFAULT NULL COMMENT '审核原因',
  `Remarks` text COMMENT '补充说明',
  `ApprUserID` int(8) NOT NULL COMMENT '审核人ID',
  `ApprTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  PRIMARY KEY (`ApprID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of u_loanappr
-- ----------------------------

-- ----------------------------
-- Table structure for `u_main`
-- ----------------------------
DROP TABLE IF EXISTS `u_main`;
CREATE TABLE `u_main` (
  `UserID` int(8) NOT NULL AUTO_INCREMENT,
  `OpenID` varchar(128) NOT NULL,
  `NickName` varchar(50) DEFAULT NULL,
  `Sex` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `HeadImgUrl` varchar(255) DEFAULT NULL,
  `JoinTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserType` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型：0-游客；1-注册用户；2-管理员',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of u_main
-- ----------------------------

-- ----------------------------
-- Table structure for `u_payaccount`
-- ----------------------------
DROP TABLE IF EXISTS `u_payaccount`;
CREATE TABLE `u_payaccount` (
  `PayID` int(8) NOT NULL AUTO_INCREMENT,
  `UserID` int(8) NOT NULL COMMENT '用户编号',
  `Payee` varchar(50) NOT NULL COMMENT '开户人',
  `ReceAcc` varchar(128) DEFAULT NULL COMMENT '收款账号',
  `OpenBrand` varchar(500) DEFAULT NULL COMMENT '开户行',
  `AliPayName` varchar(50) DEFAULT NULL COMMENT '支付宝姓名',
  `AliPayAcc` varchar(128) DEFAULT NULL COMMENT '支付宝账号',
  PRIMARY KEY (`PayID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of u_payaccount
-- ----------------------------

-- ----------------------------
-- Table structure for `u_repaymentrecords`
-- ----------------------------
DROP TABLE IF EXISTS `u_repaymentrecords`;
CREATE TABLE `u_repaymentrecords` (
  `RepayID` int(8) NOT NULL AUTO_INCREMENT,
  `LoanID` int(8) NOT NULL COMMENT '申请单ID',
  `RepayTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '还款时间',
  `RepayAmount` decimal(8,0) NOT NULL COMMENT '还款金额',
  `EnteringUserID` int(8) NOT NULL COMMENT '录入用户ID',
  PRIMARY KEY (`RepayID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of u_repaymentrecords
-- ----------------------------

-- ----------------------------
-- Table structure for `w_tokensession`
-- ----------------------------
DROP TABLE IF EXISTS `w_tokensession`;
CREATE TABLE `w_tokensession` (
  `sId` int(2) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(200) NOT NULL,
  `expires_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jsapi_ticket` varchar(200) DEFAULT NULL,
  `js_expires_in` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of w_tokensession
-- ----------------------------
