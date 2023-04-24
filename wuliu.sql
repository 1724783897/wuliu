/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.26 : Database - jiuyuan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jiuyuan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `jiuyuan`;

/*Table structure for table `biz_consumer` */

DROP TABLE IF EXISTS `biz_consumer`;

CREATE TABLE `biz_consumer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '物资消费方',
  `address` varchar(20) DEFAULT NULL COMMENT '地址',
  `create_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `sort` int DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL COMMENT '联系人姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_consumer` */

insert  into `biz_consumer`(`id`,`name`,`address`,`create_time`,`modified_time`,`phone`,`sort`,`contact`) values (28,'个人领取','北京市/市辖区/东城区','2022-02-23 15:14:17','2022-02-23 15:14:17','13598995966',1,'张三');

/*Table structure for table `biz_health` */

DROP TABLE IF EXISTS `biz_health`;

CREATE TABLE `biz_health` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `situation` int NOT NULL,
  `touch` int NOT NULL,
  `passby` int NOT NULL,
  `reception` int NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_health` */

insert  into `biz_health`(`id`,`address`,`user_id`,`situation`,`touch`,`passby`,`reception`,`create_time`) values (24,'湖北省/武汉市/汉南区',5,0,0,0,0,'2020-05-07 15:23:40'),(25,'河北省/秦皇岛市/北戴河区',5,0,1,1,1,'2020-05-10 11:26:27'),(28,'天津市/市辖区/和平区',5,0,1,1,1,'2020-05-13 22:43:09'),(29,'天津市/市辖区/南开区',5,0,1,1,1,'2020-05-14 20:10:12'),(30,'天津市/市辖区/和平区',5,1,0,0,0,'2020-05-14 20:23:07'),(31,'天津市/市辖区/和平区',184,2,1,1,1,'2020-05-14 21:06:47'),(35,'天津市/市辖区/和平区',5,0,1,1,1,'2020-05-18 09:33:33'),(36,'山东省/菏泽市/历下区',5,0,0,0,0,'2021-02-21 11:28:20'),(37,'广东省/广州市/天河区',5,0,0,0,0,'2021-02-26 12:49:28');

/*Table structure for table `biz_in_stock` */

DROP TABLE IF EXISTS `biz_in_stock`;

CREATE TABLE `biz_in_stock` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `in_num` varchar(36) DEFAULT NULL COMMENT '入库单编号',
  `type` int DEFAULT NULL COMMENT '类型：1：捐赠，2：下拨，3：采购,4:退货入库',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  `create_time` datetime DEFAULT NULL COMMENT '入库单创建时间',
  `modified` datetime DEFAULT NULL COMMENT '入库单修改时间',
  `product_number` int DEFAULT NULL COMMENT '物资总数',
  `supplier_id` bigint DEFAULT NULL COMMENT '来源',
  `remark` varchar(100) DEFAULT NULL COMMENT '描述信息',
  `status` int DEFAULT '2' COMMENT '0:正常入库单,1:已进入回收,2:等待审核',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `operator_id` (`operator`) USING BTREE,
  KEY `supplier_id` (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_in_stock` */

insert  into `biz_in_stock`(`id`,`in_num`,`type`,`operator`,`create_time`,`modified`,`product_number`,`supplier_id`,`remark`,`status`) values (108,'41b15415-52f0-4e39-898f-5cd8b81e',1,'admin','2022-02-23 15:13:32','2022-02-23 15:13:27',2,24,'wahahahah',0);

/*Table structure for table `biz_in_stock_info` */

DROP TABLE IF EXISTS `biz_in_stock_info`;

CREATE TABLE `biz_in_stock_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `in_num` varchar(36) DEFAULT NULL COMMENT '入库单编号',
  `p_num` varchar(36) DEFAULT NULL COMMENT '商品编号',
  `product_number` int DEFAULT NULL COMMENT '数量',
  `create_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_in_stock_info` */

insert  into `biz_in_stock_info`(`id`,`in_num`,`p_num`,`product_number`,`create_time`,`modified_time`) values (361,'41b15415-52f0-4e39-898f-5cd8b81e','952ec21f-d7cd-4112-802e-5164dff0',2,'2022-02-23 15:13:27','2022-02-23 15:13:27');

/*Table structure for table `biz_out_stock` */

DROP TABLE IF EXISTS `biz_out_stock`;

CREATE TABLE `biz_out_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `out_num` varchar(36) NOT NULL COMMENT '出库单',
  `type` int NOT NULL COMMENT '出库类型:0:直接出库,1:审核出库',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL COMMENT '出库时间',
  `product_number` int DEFAULT NULL COMMENT '出库总数',
  `consumer_id` bigint NOT NULL COMMENT '消费者id',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `status` int DEFAULT NULL COMMENT '状态:0:正常入库,1:已进入回收,2:等待审核',
  `priority` int NOT NULL COMMENT '紧急程度:1:不急,2:常规,3:紧急4:特急',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_out_stock` */

insert  into `biz_out_stock`(`id`,`out_num`,`type`,`operator`,`create_time`,`product_number`,`consumer_id`,`remark`,`status`,`priority`) values (15,'4c5d1b74-cb4d-4444-9a0d-76186263',3,'admin','2022-02-23 15:14:22',1,28,'娃哈哈啊啊啊啊',1,1);

/*Table structure for table `biz_out_stock_info` */

DROP TABLE IF EXISTS `biz_out_stock_info`;

CREATE TABLE `biz_out_stock_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `out_num` varchar(36) DEFAULT NULL,
  `p_num` varchar(36) DEFAULT NULL,
  `product_number` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_out_stock_info` */

insert  into `biz_out_stock_info`(`id`,`out_num`,`p_num`,`product_number`,`create_time`,`modified_time`) values (33,'4c5d1b74-cb4d-4444-9a0d-76186263','952ec21f-d7cd-4112-802e-5164dff0',1,'2022-02-23 15:14:17','2022-02-23 15:14:17');

/*Table structure for table `biz_product` */

DROP TABLE IF EXISTS `biz_product`;

CREATE TABLE `biz_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `p_num` varchar(255) DEFAULT NULL COMMENT '商品编号',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `image_url` text COMMENT '图片',
  `model` varchar(100) DEFAULT NULL COMMENT '规格型号',
  `unit` varchar(10) DEFAULT NULL COMMENT '计算单位',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `one_category_id` bigint DEFAULT NULL COMMENT '1级分类',
  `two_category_id` bigint DEFAULT NULL COMMENT '2级分类',
  `three_category_id` bigint DEFAULT NULL COMMENT '3级分类',
  `status` int DEFAULT '0' COMMENT '是否删除:1物资正常,0:物资回收,2:物资审核中',
  KEY `id` (`id`) USING BTREE,
  KEY `category_id` (`one_category_id`) USING BTREE,
  KEY `two_category_id` (`two_category_id`) USING BTREE,
  KEY `three_category_id` (`three_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_product` */

insert  into `biz_product`(`id`,`p_num`,`name`,`image_url`,`model`,`unit`,`remark`,`sort`,`create_time`,`modified_time`,`one_category_id`,`two_category_id`,`three_category_id`,`status`) values (53,'952ec21f-d7cd-4112-802e-5164dff0','娃哈哈','group1/M00/00/07/CgAEEWIV3laAHBaCAAASviVLbkY647.JPG','10','娃哈哈','1111',1,'2022-02-23 15:12:41','2022-02-23 15:12:41',83,85,87,1),(54,'4905f804-28b6-4bdd-ac46-56153746','乐事薯片','group1/M00/00/1C/CgAEEWQ72CaAA_l3AAD3p8nwcnc704.PNG','100','g','111',1,'2023-04-16 11:13:30','2023-04-16 11:13:30',83,85,87,0),(55,'1f2678fe-3186-46d5-895a-f4152009','13','group1/M00/00/1C/CgAEEWQ72RCAf_rgAAArBWTIfK4536.PNG','11','11','111',3,'2023-04-16 11:16:36','2023-04-16 11:16:36',83,85,87,2);

/*Table structure for table `biz_product_category` */

DROP TABLE IF EXISTS `biz_product_category`;

CREATE TABLE `biz_product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` varchar(100) DEFAULT NULL COMMENT '类别名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `pid` bigint DEFAULT NULL COMMENT '父级分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_product_category` */

insert  into `biz_product_category`(`id`,`name`,`remark`,`sort`,`create_time`,`modified_time`,`pid`) values (83,'食品货物','食品货物',1,'2022-02-23 15:10:09','2022-02-23 15:10:09',0),(84,'服装货物','服装货物',1,'2022-02-23 15:10:22','2022-02-23 15:10:22',0),(85,'吃的东西','吃的东西',1,'2022-02-23 15:10:42','2022-02-23 15:10:42',83),(86,'喝的东西','喝的东西',2,'2022-02-23 15:10:57','2022-02-23 15:10:57',83),(87,'膨化食品','膨化食品',1,'2022-02-23 15:11:21','2022-02-23 15:11:21',85),(88,'矿泉水','矿泉水',2,'2022-02-23 15:11:40','2022-02-23 15:11:40',86),(89,'童装','童装',1,'2022-02-23 15:11:53','2022-02-23 15:11:53',84),(90,'儿童上衣','儿童上衣',1,'2022-02-23 15:12:04','2022-02-23 15:12:04',89),(91,'西瓜','3',1,'2023-04-16 11:11:18','2023-04-16 11:11:18',85);

/*Table structure for table `biz_product_stock` */

DROP TABLE IF EXISTS `biz_product_stock`;

CREATE TABLE `biz_product_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `p_num` varchar(32) NOT NULL,
  `stock` bigint DEFAULT NULL COMMENT '商品库存结余',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_product_stock` */

insert  into `biz_product_stock`(`id`,`p_num`,`stock`) values (64,'952ec21f-d7cd-4112-802e-5164dff0',1);

/*Table structure for table `biz_supplier` */

DROP TABLE IF EXISTS `biz_supplier`;

CREATE TABLE `biz_supplier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `address` varchar(255) DEFAULT NULL COMMENT '供应商地址',
  `email` varchar(255) DEFAULT NULL COMMENT '供应商邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '供应商电话',
  `create_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `sort` int DEFAULT NULL COMMENT '排序',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `state` int DEFAULT NULL COMMENT '状态字段0未发货 1途中 2签收',
  `receive` varchar(25) DEFAULT NULL COMMENT '签收者姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `biz_supplier` */

insert  into `biz_supplier`(`id`,`name`,`address`,`email`,`phone`,`create_time`,`modified_time`,`sort`,`contact`,`state`,`receive`) values (24,'不晓得','天津市/市辖区/和平区','767750432@qq.com','13598559688','2022-02-23 15:13:27','2023-04-16 10:56:49',1,'张三',2,'hoami');

/*Table structure for table `tb_department` */

DROP TABLE IF EXISTS `tb_department`;

CREATE TABLE `tb_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '系名',
  `phone` varchar(20) NOT NULL COMMENT '系办公电话',
  `address` varchar(20) DEFAULT NULL COMMENT '办公室地点',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_department` */

insert  into `tb_department`(`id`,`name`,`phone`,`address`,`create_time`,`modified_time`) values (1,'物资管理部','15045741241','负责系统物资的管理。','2022-02-23 00:00:00','2022-02-23 16:48:16');

/*Table structure for table `tb_image` */

DROP TABLE IF EXISTS `tb_image`;

CREATE TABLE `tb_image` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(1023) DEFAULT NULL COMMENT '图片路径',
  `size` bigint DEFAULT NULL COMMENT '图片大小',
  `media_type` varchar(20) DEFAULT NULL COMMENT '图片类型',
  `suffix` varchar(50) DEFAULT NULL COMMENT '图片后缀',
  `height` int DEFAULT NULL COMMENT '图片高度',
  `width` int DEFAULT NULL COMMENT '图片宽度',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_image` */

insert  into `tb_image`(`id`,`path`,`size`,`media_type`,`suffix`,`height`,`width`,`create_time`) values (5,'group1/M00/00/07/CgAEEWIV3laAHBaCAAASviVLbkY647.JPG',NULL,'image/jpeg',NULL,250,250,'2022-02-23 15:12:24'),(6,'group1/M00/00/1C/CgAEEWQ72CaAA_l3AAD3p8nwcnc704.PNG',NULL,'image/png',NULL,280,280,'2023-04-16 11:12:34'),(7,'group1/M00/00/1C/CgAEEWQ72RCAf_rgAAArBWTIfK4536.PNG',NULL,'image/png',NULL,81,80,'2023-04-16 11:16:28');

/*Table structure for table `tb_log` */

DROP TABLE IF EXISTS `tb_log`;

CREATE TABLE `tb_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `username` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `operation` text COMMENT '操作内容',
  `time` decimal(11,0) DEFAULT NULL COMMENT '耗时',
  `method` text COMMENT '操作方法',
  `params` text COMMENT '方法参数',
  `ip` varchar(64) DEFAULT NULL COMMENT '操作者IP',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='操作日志表';

/*Data for the table `tb_log` */

insert  into `tb_log`(`id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`create_time`,`location`) values (175,'admin','更新菜单','10','com.coderman.api.system.controller.MenuController.update()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, menuVO],args:[348, MenuVO(id=348, parentId=347, menuName=货物列表, url=/products, icon=el-icon-goods, type=0, orderNum=2, createTime=Fri Feb 26 22:56:28 CST 2021, modifiedTime=Fri Feb 26 23:11:34 CST 2021, disabled=false, open=0, perms=null)]','127.0.0.1','2022-02-23 15:09:10',NULL),(176,'admin','更新菜单','17','com.coderman.api.system.controller.MenuController.update()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, menuVO],args:[349, MenuVO(id=349, parentId=347, menuName=货物入库, url=/inStocks, icon=el-icon-date, type=0, orderNum=3, createTime=Fri Feb 26 22:57:25 CST 2021, modifiedTime=Sat Feb 27 18:55:00 CST 2021, disabled=false, open=0, perms=)]','127.0.0.1','2022-02-23 15:09:20',NULL),(177,'admin','更新菜单','21','com.coderman.api.system.controller.MenuController.update()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, menuVO],args:[352, MenuVO(id=352, parentId=347, menuName=货物发放, url=/outStocks, icon=el-icon-goods, type=0, orderNum=4, createTime=Fri Feb 26 23:10:48 CST 2021, modifiedTime=Fri Feb 26 23:11:47 CST 2021, disabled=false, open=0, perms=null)]','127.0.0.1','2022-02-23 15:09:28',NULL),(178,'admin','更新菜单','15','com.coderman.api.system.controller.MenuController.update()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, menuVO],args:[351, MenuVO(id=351, parentId=347, menuName=货物类别, url=/productCategorys, icon=el-icon-star-off, type=0, orderNum=1, createTime=Fri Feb 26 23:08:25 CST 2021, modifiedTime=Fri Feb 26 23:11:26 CST 2021, disabled=false, open=0, perms=null)]','127.0.0.1','2022-02-23 15:09:35',NULL),(179,'admin','物资分类添加','47','com.coderman.api.biz.controller.ProductCategoryController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productCategoryVO],args:[ProductCategoryVO(id=null, name=食品货物, remark=食品货物, sort=1, createTime=null, modifiedTime=null, pid=0)]','127.0.0.1','2022-02-23 15:10:09',NULL),(180,'admin','物资分类添加','11','com.coderman.api.biz.controller.ProductCategoryController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productCategoryVO],args:[ProductCategoryVO(id=null, name=服装货物, remark=服装货物, sort=1, createTime=null, modifiedTime=null, pid=0)]','127.0.0.1','2022-02-23 15:10:22',NULL),(181,'admin','物资分类添加','43','com.coderman.api.biz.controller.ProductCategoryController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productCategoryVO],args:[ProductCategoryVO(id=null, name=吃的东西, remark=吃的东西, sort=1, createTime=null, modifiedTime=null, pid=83)]','127.0.0.1','2022-02-23 15:10:42',NULL),(182,'admin','物资分类添加','32','com.coderman.api.biz.controller.ProductCategoryController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productCategoryVO],args:[ProductCategoryVO(id=null, name=喝的东西, remark=喝的东西, sort=2, createTime=null, modifiedTime=null, pid=83)]','127.0.0.1','2022-02-23 15:10:57',NULL),(183,'admin','物资分类添加','16','com.coderman.api.biz.controller.ProductCategoryController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productCategoryVO],args:[ProductCategoryVO(id=null, name=膨化食品, remark=膨化食品, sort=1, createTime=null, modifiedTime=null, pid=85)]','127.0.0.1','2022-02-23 15:11:21',NULL),(184,'admin','物资分类添加','21','com.coderman.api.biz.controller.ProductCategoryController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productCategoryVO],args:[ProductCategoryVO(id=null, name=矿泉水, remark=矿泉水, sort=2, createTime=null, modifiedTime=null, pid=86)]','127.0.0.1','2022-02-23 15:11:40',NULL),(185,'admin','物资分类添加','17','com.coderman.api.biz.controller.ProductCategoryController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productCategoryVO],args:[ProductCategoryVO(id=null, name=童装, remark=童装, sort=1, createTime=null, modifiedTime=null, pid=84)]','127.0.0.1','2022-02-23 15:11:53',NULL),(186,'admin','物资分类添加','10','com.coderman.api.biz.controller.ProductCategoryController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productCategoryVO],args:[ProductCategoryVO(id=null, name=儿童上衣, remark=儿童上衣, sort=1, createTime=null, modifiedTime=null, pid=89)]','127.0.0.1','2022-02-23 15:12:04',NULL),(187,'admin','物资资料添加','50','com.coderman.api.biz.controller.ProductController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productVO],args:[ProductVO(id=null, pNum=null, name=娃哈哈, model=10, unit=娃哈哈, remark=1111, sort=1, createTime=null, modifiedTime=null, imageUrl=group1/M00/00/07/CgAEEWIV3laAHBaCAAASviVLbkY647.JPG, categoryKeys=[83, 85, 87], oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]','127.0.0.1','2022-02-23 15:12:41',NULL),(188,'admin','物资资料审核','19','com.coderman.api.biz.controller.ProductController.publish()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id],args:[53]','127.0.0.1','2022-02-23 15:12:46',NULL),(189,'admin','入库单申请','51','com.coderman.api.biz.controller.InStockController.addIntoStock()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[inStockVO],args:[InStockVO(id=null, inNum=null, type=1, operator=null, supplierId=null, supplierName=null, createTime=null, modified=null, productNumber=null, remark=wahahahah, products=[{productId=53, productNumber=2}], status=null, startTime=null, endTime=null, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, contact=张三)]','127.0.0.1','2022-02-23 15:13:27',NULL),(190,'admin','入库单审核','36','com.coderman.api.biz.controller.InStockController.publish()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id],args:[108]','127.0.0.1','2022-02-23 15:13:32',NULL),(191,'admin','发放单申请','29','com.coderman.api.biz.controller.OutStockController.addOutStock()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[outStockVO],args:[OutStockVO(id=null, outNum=null, type=3, operator=null, createTime=null, productNumber=null, priority=1, products=[{productId=53, productNumber=1}], remark=娃哈哈啊啊啊啊, status=null, consumerId=null, name=个人领取, address=北京市/市辖区/东城区, phone=13598995966, contact=张三, sort=1)]','127.0.0.1','2022-02-23 15:14:17',NULL),(192,'admin','发放单审核','41','com.coderman.api.biz.controller.OutStockController.publish()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id],args:[15]','127.0.0.1','2022-02-23 15:14:22',NULL),(193,'admin','添加角色','56','com.coderman.api.system.controller.RoleController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[roleVO],args:[RoleVO(id=null, roleName=管理员, remark=差一点权限, createTime=null, modifiedTime=null, status=null)]','127.0.0.1','2023-04-16 09:43:59','内网IP|0|0|内网IP|内网IP'),(194,'admin','更新菜单','6','com.coderman.api.system.controller.MenuController.update()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, menuVO],args:[358, MenuVO(id=358, parentId=356, menuName=货物来源, url=/suppliers, icon=el-icon-coordinate, type=1, orderNum=2, createTime=Sat Feb 27 08:04:08 CST 2021, modifiedTime=Sat Feb 27 08:04:08 CST 2021, disabled=false, open=1, perms=null)]','127.0.0.1','2023-04-16 09:45:11','内网IP|0|0|内网IP|内网IP'),(195,'admin','更新菜单','5','com.coderman.api.system.controller.MenuController.update()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, menuVO],args:[358, MenuVO(id=358, parentId=356, menuName=货物来源, url=/suppliers, icon=el-icon-coordinate, type=0, orderNum=2, createTime=Sat Feb 27 08:04:08 CST 2021, modifiedTime=Sun Apr 16 17:45:11 CST 2023, disabled=false, open=0, perms=null)]','127.0.0.1','2023-04-16 09:45:20','内网IP|0|0|内网IP|内网IP'),(196,'admin','新增菜单/按钮','8','com.coderman.api.system.controller.MenuController.add()\n\nresponse:{\"code\":200,\"data\":{\"children\":[],\"menuName\":\"签收\",\"id\":361},\"msg\":\"成功\"}','paramName:[menuVO],args:[MenuVO(id=null, parentId=358, menuName=签收, url=, icon=null, type=1, orderNum=1, createTime=null, modifiedTime=null, disabled=false, open=0, perms=supplier:receive)]','127.0.0.1','2023-04-16 09:57:30','内网IP|0|0|内网IP|内网IP'),(197,'admin','角色授权','61','com.coderman.api.system.controller.RoleController.authority()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, mids],args:[1, [Ljava.lang.Long;@45b8c016]','127.0.0.1','2023-04-16 09:58:44','内网IP|0|0|内网IP|内网IP'),(198,'admin','角色授权','9','com.coderman.api.system.controller.RoleController.authority()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, mids],args:[147, [Ljava.lang.Long;@603f7be9]','127.0.0.1','2023-04-16 10:05:50','内网IP|0|0|内网IP|内网IP'),(199,'admin','新增菜单/按钮','4','com.coderman.api.system.controller.MenuController.add()\n\nresponse:{\"code\":200,\"data\":{\"children\":[],\"menuName\":\"删除\",\"id\":362},\"msg\":\"成功\"}','paramName:[menuVO],args:[MenuVO(id=null, parentId=358, menuName=删除, url=, icon=null, type=1, orderNum=1, createTime=null, modifiedTime=null, disabled=false, open=0, perms=supplier:delete)]','127.0.0.1','2023-04-16 10:06:52','内网IP|0|0|内网IP|内网IP'),(200,'admin','新增菜单/按钮','2','com.coderman.api.system.controller.MenuController.add()\n\nresponse:{\"code\":200,\"data\":{\"children\":[],\"menuName\":\"编辑\",\"id\":363},\"msg\":\"成功\"}','paramName:[menuVO],args:[MenuVO(id=null, parentId=358, menuName=编辑, url=null, icon=null, type=1, orderNum=2, createTime=null, modifiedTime=null, disabled=false, open=0, perms=supplier:edit)]','127.0.0.1','2023-04-16 10:07:24','内网IP|0|0|内网IP|内网IP'),(201,'admin','分配角色','6','com.coderman.api.system.controller.UserController.assignRoles()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, rids],args:[8, [Ljava.lang.Long;@af95478]','127.0.0.1','2023-04-16 10:07:34','内网IP|0|0|内网IP|内网IP'),(202,'admin','添加用户','6','com.coderman.api.system.controller.UserController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[userVO],args:[UserVO(id=null, username=admin2, nickname=啊对min, email=823267011@qq.com, phoneNumber=15690169558, status=null, createTime=null, sex=1, birth=Tue Apr 11 00:00:00 CST 2023, password=123123, departmentName=null, departmentId=1)]','127.0.0.1','2023-04-16 10:08:16','内网IP|0|0|内网IP|内网IP'),(203,'admin','角色授权','28','com.coderman.api.system.controller.RoleController.authority()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, mids],args:[147, [Ljava.lang.Long;@217645e5]','127.0.0.1','2023-04-16 10:09:16','内网IP|0|0|内网IP|内网IP'),(204,'admin','分配角色','2','com.coderman.api.system.controller.UserController.assignRoles()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, rids],args:[9, [Ljava.lang.Long;@4dc14472]','127.0.0.1','2023-04-16 10:09:25','内网IP|0|0|内网IP|内网IP'),(205,'admin','物资来源更新','48','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Wed Feb 23 00:00:00 CST 2022, contact=张三, state=null)]','127.0.0.1','2023-04-16 10:22:22','内网IP|0|0|内网IP|内网IP'),(206,'admin','物资来源更新','4','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2)]','127.0.0.1','2023-04-16 10:26:24','内网IP|0|0|内网IP|内网IP'),(207,'admin','物资来源更新','4','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2)]','127.0.0.1','2023-04-16 10:26:37','内网IP|0|0|内网IP|内网IP'),(208,'admin','物资来源更新','4','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2)]','127.0.0.1','2023-04-16 10:26:52','内网IP|0|0|内网IP|内网IP'),(209,'admin','物资来源更新','61','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2)]','127.0.0.1','2023-04-16 10:28:46','内网IP|0|0|内网IP|内网IP'),(210,'admin','物资资料回收','8','com.coderman.api.biz.controller.ProductController.remove()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id],args:[53]','127.0.0.1','2023-04-16 10:45:09','内网IP|0|0|内网IP|内网IP'),(211,'admin','发放单回收','6','com.coderman.api.biz.controller.OutStockController.remove()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id],args:[15]','127.0.0.1','2023-04-16 10:45:26','内网IP|0|0|内网IP|内网IP'),(212,'admin','物资来源更新','63','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2)]','127.0.0.1','2023-04-16 10:52:27','内网IP|0|0|内网IP|内网IP'),(213,'admin','物资来源更新','73','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2)]','127.0.0.1','2023-04-16 10:52:48','内网IP|0|0|内网IP|内网IP'),(214,'admin','物资来源更新','65','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2)]','127.0.0.1','2023-04-16 10:53:26','内网IP|0|0|内网IP|内网IP'),(215,'admin','物资来源更新','5','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2)]','127.0.0.1','2023-04-16 10:54:19','内网IP|0|0|内网IP|内网IP'),(216,'admin','物资来源更新','65','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2)]','127.0.0.1','2023-04-16 10:55:00','内网IP|0|0|内网IP|内网IP'),(217,'admin','物资来源更新','64','com.coderman.api.biz.controller.SupplierController.update()\n\nresponse:{\"code\":200,\"msg\":\"更新来源成功\"}','paramName:[id, supplierVO],args:[24, SupplierVO(id=24, name=不晓得, address=天津市/市辖区/和平区, email=767750432@qq.com, phone=13598559688, sort=1, createTime=Wed Feb 23 23:13:27 CST 2022, modifiedTime=Sun Apr 16 00:00:00 CST 2023, contact=张三, state=2, receive=hoami)]','127.0.0.1','2023-04-16 10:56:49','内网IP|0|0|内网IP|内网IP'),(218,'admin','物资分类添加','48','com.coderman.api.biz.controller.ProductCategoryController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productCategoryVO],args:[ProductCategoryVO(id=null, name=西瓜, remark=3, sort=1, createTime=null, modifiedTime=null, pid=85)]','127.0.0.1','2023-04-16 11:11:18','内网IP|0|0|内网IP|内网IP'),(219,'admin','物资资料添加','333','com.coderman.api.biz.controller.ProductController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productVO],args:[ProductVO(id=null, pNum=null, name=乐事薯片, model=100, unit=g, remark=111, sort=1, createTime=null, modifiedTime=null, imageUrl=group1/M00/00/1C/CgAEEWQ72CaAA_l3AAD3p8nwcnc704.PNG, categoryKeys=[83, 85, 87], oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]','127.0.0.1','2023-04-16 11:13:30','内网IP|0|0|内网IP|内网IP'),(220,'admin','物资资料审核','8','com.coderman.api.biz.controller.ProductController.publish()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id],args:[54]','127.0.0.1','2023-04-16 11:13:55','内网IP|0|0|内网IP|内网IP'),(221,'admin','物资资料添加','8','com.coderman.api.biz.controller.ProductController.add()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[productVO],args:[ProductVO(id=null, pNum=null, name=13, model=11, unit=11, remark=111, sort=3, createTime=null, modifiedTime=null, imageUrl=group1/M00/00/1C/CgAEEWQ72RCAf_rgAAArBWTIfK4536.PNG, categoryKeys=[83, 85, 87], oneCategoryId=null, twoCategoryId=null, threeCategoryId=null, status=null)]','127.0.0.1','2023-04-16 11:16:36','内网IP|0|0|内网IP|内网IP'),(222,'admin2','新增菜单/按钮','58','com.coderman.api.system.controller.MenuController.add()\n\nresponse:{\"code\":200,\"data\":{\"children\":[],\"menuName\":\"通过按钮\",\"id\":364},\"msg\":\"成功\"}','paramName:[menuVO],args:[MenuVO(id=null, parentId=348, menuName=通过按钮, url=, icon=null, type=1, orderNum=1, createTime=null, modifiedTime=null, disabled=false, open=0, perms=products-pass)]','127.0.0.1','2023-04-16 11:21:03','内网IP|0|0|内网IP|内网IP'),(223,'admin2','新增菜单/按钮','7','com.coderman.api.system.controller.MenuController.add()\n\nresponse:{\"code\":200,\"data\":{\"children\":[],\"menuName\":\"列表权限\",\"id\":365},\"msg\":\"成功\"}','paramName:[menuVO],args:[MenuVO(id=null, parentId=348, menuName=列表权限, url=, icon=null, type=1, orderNum=1, createTime=null, modifiedTime=null, disabled=false, open=0, perms=products-list)]','127.0.0.1','2023-04-16 11:22:36','内网IP|0|0|内网IP|内网IP'),(224,'admin2','角色授权','139','com.coderman.api.system.controller.RoleController.authority()\n\nresponse:{\"code\":200,\"msg\":\"Success\"}','paramName:[id, mids],args:[147, [Ljava.lang.Long;@213e068b]','127.0.0.1','2023-04-16 11:22:44','内网IP|0|0|内网IP|内网IP'),(225,'admin2','新增菜单/按钮','6','com.coderman.api.system.controller.MenuController.add()\n\nresponse:{\"code\":200,\"data\":{\"children\":[],\"menuName\":\"删除\",\"id\":366},\"msg\":\"成功\"}','paramName:[menuVO],args:[MenuVO(id=null, parentId=348, menuName=删除, url=, icon=null, type=1, orderNum=1, createTime=null, modifiedTime=null, disabled=false, open=0, perms=products-remove)]','127.0.0.1','2023-04-16 11:24:43','内网IP|0|0|内网IP|内网IP');

/*Table structure for table `tb_login_log` */

DROP TABLE IF EXISTS `tb_login_log`;

CREATE TABLE `tb_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `location` varchar(50) DEFAULT NULL COMMENT '登录地点',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `user_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `user_browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1673 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='登录日志表';

/*Data for the table `tb_login_log` */

insert  into `tb_login_log`(`id`,`username`,`login_time`,`location`,`ip`,`user_system`,`user_browser`) values (1661,'admin','2023-04-16 09:41:43','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1662,'admin','2023-04-16 09:58:54','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1663,'admin2','2023-04-16 10:08:45','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1664,'admin','2023-04-16 10:08:56','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1665,'admin2','2023-04-16 10:09:37','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1666,'admin','2023-04-16 10:22:08','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1667,'admin2','2023-04-16 10:34:17','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1668,'admin','2023-04-16 10:43:41','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1669,'admin2','2023-04-16 11:14:32','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1670,'admin','2023-04-16 11:16:19','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1671,'admin2','2023-04-16 11:16:52','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11'),(1672,'admin','2023-04-16 11:28:10','内网IP|0|0|内网IP|内网IP','127.0.0.1','Windows 10','Chrome 11');

/*Table structure for table `tb_menu` */

DROP TABLE IF EXISTS `tb_menu`;

CREATE TABLE `tb_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `parent_id` bigint DEFAULT NULL COMMENT '上级菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单/按钮名称',
  `url` varchar(50) DEFAULT NULL COMMENT '菜单URL',
  `perms` text COMMENT '权限标识',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `type` char(2) NOT NULL COMMENT '类型 0菜单 1按钮',
  `order_num` bigint DEFAULT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `available` int DEFAULT '1' COMMENT '0：不可用，1：可用',
  `open` int DEFAULT '1' COMMENT '0:不展开，1：展开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

/*Data for the table `tb_menu` */

insert  into `tb_menu`(`id`,`parent_id`,`menu_name`,`url`,`perms`,`icon`,`type`,`order_num`,`create_time`,`modified_time`,`available`,`open`) values (1,0,'人员管理','',NULL,'el-icon-user','0',2,'2020-03-07 17:41:30','2021-02-26 23:59:35',1,0),(4,1,'菜单管理','/menus',NULL,'el-icon-help','0',3,'2020-03-07 18:57:42','2021-02-21 12:35:19',1,0),(5,0,'日志管理','/logs',NULL,'el-icon-camera','0',6,'2020-03-07 18:58:18','2020-05-07 19:35:19',1,0),(226,1,'用户管理','/users','users','el-icon-user','0',2,'2020-03-10 05:27:54','2020-04-23 20:04:36',1,0),(230,229,'物资入库','/inStocks','el-icon-date','el-icon-date','0',1,'2020-03-10 05:34:28','2021-02-26 23:05:34',0,0),(234,226,'用户添加','','user:add','el-icon-plus','1',1,'2020-03-10 05:50:44','2020-03-10 07:51:56',1,0),(235,1,'角色管理','/roles','','el-icon-postcard','0',3,'2020-03-10 05:51:28','2020-05-16 16:37:58',1,0),(239,226,'用户删除','','user:delete','el-icon-picture','1',1,'2020-03-10 06:05:30','2020-03-10 08:10:19',1,0),(240,226,'用户编辑','','user:edit','el-icon-video-camera-solid','1',1,'2020-03-10 06:06:30','2020-03-10 07:52:28',1,0),(241,235,'角色编辑','','role:edit','el-icon-s-promotion','1',2,'2020-03-10 06:11:03','2020-03-11 11:40:19',1,0),(242,235,'角色删除','','role:delete','el-icon-s-marketing','1',3,'2020-03-10 06:15:29','2020-03-11 11:43:36',1,0),(247,4,'添加菜单','','menu:add','el-icon-s-opportunity','1',1,'2020-03-10 07:55:10','2020-04-27 09:59:43',1,0),(249,4,'修改菜单','','menu:update','el-icon-share','1',2,'2020-03-10 07:56:55','2020-03-15 13:29:29',1,0),(250,4,'删除菜单','','menu:delete','el-icon-folder-opened','1',3,'2020-03-10 07:57:38','2020-03-15 13:29:41',1,0),(251,235,'分配权限','','role:authority','el-icon-document-add','1',1,'2020-03-10 08:13:22','2020-03-11 11:39:30',1,0),(254,226,'分配角色','','user:assign','el-icon-s-tools','1',3,'2020-03-11 01:32:29','2020-04-27 10:58:30',1,0),(255,235,'添加角色','','role:add','el-icon-help','1',1,'2020-03-11 01:34:18','2020-03-11 01:34:18',1,0),(256,226,'禁用用户','','user:status','el-icon-circle-close','1',1,'2020-03-11 06:50:04','2020-03-14 05:05:49',1,0),(258,226,'用户更新','','user:update','el-icon-refresh','1',1,'2020-03-11 08:26:54','2020-03-11 08:26:54',1,0),(259,235,'角色更新','','role:update','el-icon-refresh-left','1',1,'2020-03-11 11:45:20','2020-03-11 11:45:20',1,0),(260,235,'状态更新','','role:status','el-icon-refresh','1',1,'2020-03-14 05:07:02','2020-03-14 05:07:24',1,0),(261,1,'部门管理','/departments','','el-icon-s-home','0',3,'2020-03-15 06:05:48','2020-03-22 22:53:42',1,0),(262,261,'添加部门','','department:add','el-icon-plus','1',1,'2020-03-15 11:57:42','2020-03-21 12:37:21',1,0),(263,261,'编辑院系','','department:edit','el-icon-edit','1',1,'2020-03-15 11:59:52','2020-03-15 12:16:36',1,0),(264,261,'更新院系','','department:update','el-icon-refresh','1',1,'2020-03-15 12:02:34','2020-03-15 12:16:32',1,0),(265,261,'删除院系',NULL,'department:delete','el-icon-delete','1',1,'2020-03-15 12:03:21','2020-03-15 12:03:21',1,0),(267,229,'物资资料','/products','','el-icon-goods','0',2,'2020-03-16 09:01:02','2021-02-26 23:05:40',0,0),(268,229,'物资类别','/productCategorys','','el-icon-star-off','0',2,'2020-03-16 09:01:48','2021-02-26 23:09:41',0,0),(269,311,'物资来源','/suppliers','','el-icon-coordinate','0',5,'2020-03-16 12:35:10','2020-04-11 13:56:16',1,0),(270,229,'物资发放','/outStocks','','el-icon-goods','0',5,'2020-03-16 13:55:49','2021-02-26 23:11:00',0,1),(271,5,'登入日志','/loginLog','login:log','el-icon-date','0',1,'2020-03-20 10:31:12','2020-04-04 20:01:02',1,0),(273,303,'全国疫情','/map','map:view','el-icon-s-opportunity','0',1,'2020-03-20 11:32:02','2020-03-20 11:32:02',1,1),(274,267,'添加物资','','product:add','el-icon-s-opportunity','1',1,'2020-03-21 02:04:24','2020-03-21 02:04:24',1,0),(276,267,'上传图片',NULL,'upload:image','el-icon-finished','1',2,'2020-03-21 02:05:21','2020-03-21 02:05:21',1,0),(277,267,'更新物资',NULL,'product:update','el-icon-folder','1',3,'2020-03-21 02:05:56','2020-03-21 02:05:56',1,0),(278,267,'编辑物资',NULL,'product:edit','el-icon-edit','1',1,'2020-03-21 02:06:23','2020-03-21 02:06:23',1,0),(279,269,'删除来源','','supplier:delete','el-icon-document-delete','1',1,'2020-03-21 02:17:29','2020-03-21 12:32:22',1,0),(280,269,'更新来源','','supplier:update','el-icon-paperclip','1',1,'2020-03-21 02:18:34','2020-03-21 12:36:41',1,0),(281,269,'添加来源',NULL,'supplier:add','el-icon-document-add','1',1,'2020-03-21 02:19:02','2020-03-21 02:19:02',1,1),(282,269,'编辑来源',NULL,'supplier:edit','el-icon-scissors','1',2,'2020-03-21 02:19:36','2020-03-21 02:19:36',1,1),(283,268,'添加类别','','productCategory:add',' el-icon-folder-add','1',1,'2020-03-21 02:26:12','2020-03-21 02:44:22',1,0),(284,268,'删除类别',NULL,'productCategory:delete','el-icon-delete','1',1,'2020-03-21 02:27:05','2020-03-21 02:28:49',1,0),(285,268,'编辑类别',NULL,'productCategory:edit','el-icon-scissors','1',2,'2020-03-21 02:27:42','2020-03-21 02:27:42',1,0),(286,268,'更新类别',NULL,'productCategory:update',' el-icon-coordinate','1',1,'2020-03-21 02:28:17','2020-03-21 02:28:17',1,0),(295,0,'其他管理','','','el-icon-s-marketing','0',5,'2020-03-22 01:21:56','2020-05-16 16:54:43',1,0),(298,297,'SQL监控','/druid',NULL,'el-icon-view','0',1,'2020-03-22 02:48:05','2020-11-14 19:29:32',0,0),(299,271,'删除日志','','loginLog:delete','el-icon-delete','1',1,'2020-03-22 21:55:44','2020-03-22 21:55:44',1,0),(300,271,'批量删除','','loginLog:batchDelete','el-icon-delete-solid','1',1,'2020-03-22 22:19:26','2020-03-22 22:19:26',1,0),(301,4,'编辑菜单','','menu:edit','el-icon-edit','1',1,'2020-03-22 23:12:25','2020-03-22 23:12:25',1,0),(304,303,'健康打卡','/health','','el-icon-s-cooperation','0',1,'2020-03-24 10:12:57','2020-05-06 09:37:51',1,0),(307,5,'操作日志','/logs','','el-icon-edit','0',1,'2020-04-04 19:04:53','2020-05-16 16:39:18',1,1),(308,307,'删除日志','','log:delete','el-icon-circle-close','1',1,'2020-04-04 19:59:20','2020-04-04 19:59:20',1,1),(309,307,'批量删除',NULL,'log:batchDelete','el-icon-document-delete','1',2,'2020-04-04 19:59:59','2020-04-04 19:59:59',1,0),(310,311,'物资去处','/consumers','','el-icon-edit','0',1,'2020-04-05 10:08:21','2020-04-05 10:08:21',1,0),(311,312,'物资流向',NULL,NULL,'el-icon-edit','0',3,'2020-04-05 10:16:59','2020-04-30 18:40:43',1,0),(316,229,'物资库存','/stocks','','el-icon-tickets','0',5,'2020-04-16 08:45:08','2021-02-26 23:10:02',0,0),(317,226,'导出表格','','user:export','el-icon-edit','1',1,'2020-04-17 18:02:05','2020-04-17 18:02:05',1,0),(318,295,'图标管理','/icons','','el-icon-star-off','0',2,'2020-04-21 12:06:33','2020-05-16 17:07:35',1,1),(320,319,'公告发布','/notices/add','','el-icon-edit','1',1,'2020-04-21 12:26:56','2020-04-21 12:26:56',1,1),(322,310,'添加去处','','consumer:add','el-icon-plus','1',2,'2020-04-27 16:57:04','2020-04-27 16:58:21',1,1),(323,310,'删除去处',NULL,'consumer:delete','el-icon-delete','1',1,'2020-04-27 16:57:42','2020-04-27 16:57:42',1,0),(324,310,'编辑去处','','consumer:edit','el-icon-edit','1',1,'2020-04-27 16:59:17','2020-04-27 16:59:17',1,0),(325,310,'更新去处',NULL,'consumer:update','el-icon-star-off','1',1,'2020-04-27 17:00:18','2020-04-27 17:00:18',1,1),(326,230,'添加入库','','inStock:in','el-icon-plus','1',3,'2020-04-27 17:07:04','2020-08-19 17:57:15',1,1),(328,230,'入库明细',NULL,'inStock:detail','el-icon-zoom-in','1',2,'2020-04-27 17:08:25','2020-04-27 17:08:25',1,0),(329,4,'导出菜单',NULL,'menu:export','el-icon-edit','1',1,'2020-04-27 17:26:40','2020-04-27 17:26:40',1,0),(331,267,'删除物资',NULL,'product:delete','el-icon-delete','1',1,'2020-04-30 18:27:02','2020-04-30 19:05:31',1,0),(332,267,'回收物资','','product:remove','el-icon-remove','1',1,'2020-04-30 18:56:48','2020-04-30 18:56:48',1,1),(333,267,'物资审核',NULL,'product:publish','el-icon-edit','1',1,'2020-04-30 18:58:38','2020-04-30 19:05:42',1,0),(336,267,'物资还原',NULL,'product:back','el-icon-top-left','1',1,'2020-04-30 19:06:22','2020-04-30 19:06:22',1,0),(337,230,'入库回收','','inStock:remove','el-icon-remove','1',3,'2020-04-30 19:12:56','2020-08-19 17:57:55',1,1),(338,230,'入库审核',NULL,'inStock:publish','el-icon-edit','1',2,'2020-04-30 19:13:32','2020-08-19 17:57:32',1,0),(339,230,'删除记录',NULL,'inStock:delete','el-icon-delete','1',4,'2020-04-30 19:14:03','2020-08-19 17:57:42',1,0),(340,230,'入库还原','','inStock:back','el-icon-d-arrow-left','1',3,'2020-04-30 19:17:27','2020-08-19 17:57:49',1,0),(343,304,'健康上报','','health:report','el-icon-edit','1',1,'2020-05-14 20:21:09','2020-05-14 20:21:09',1,0),(345,0,'数据分析','','','el-icon-s-data','0',4,'2021-02-26 22:49:33','2021-02-27 00:04:49',1,0),(346,345,'仓库分析','/stocks','','el-icon-s-home','0',1,'2021-02-26 22:50:47','2021-02-26 23:56:24',1,0),(347,0,'货物管理','','','el-icon-box','0',2,'2021-02-26 22:54:53','2021-02-27 18:54:24',1,0),(348,347,'货物列表','/products',NULL,'el-icon-goods','0',2,'2021-02-26 22:56:28','2022-02-23 15:09:10',1,0),(349,347,'货物入库','/inStocks','','el-icon-date','0',3,'2021-02-26 22:57:25','2022-02-23 15:09:20',1,0),(351,347,'货物类别','/productCategorys',NULL,'el-icon-star-off','0',1,'2021-02-26 23:08:25','2022-02-23 15:09:35',1,0),(352,347,'货物发放','/outStocks',NULL,'el-icon-goods','0',4,'2021-02-26 23:10:48','2022-02-23 15:09:28',1,0),(353,295,'图片管理','/attachments','','el-icon-picture-outline','0',2,'2021-02-26 23:13:10','2021-02-26 23:13:10',1,1),(354,345,'登入统计','/Qqgrup','','el-icon-s-check','0',2,'2021-02-26 23:29:44','2021-02-26 23:56:00',1,1),(355,0,'系统首页','/welcome','welcome:view','el-icon-star-off','0',1,'2021-02-26 23:57:21','2021-02-26 23:57:21',1,1),(356,0,'物流管理','','','el-icon-sell','0',3,'2021-02-27 00:03:20','2021-02-27 00:03:20',1,0),(357,356,'货物去处','/consumers',NULL,'el-icon-edit','0',1,'2021-02-27 00:03:44','2021-02-27 00:03:44',1,0),(358,356,'货物来源','/suppliers',NULL,'el-icon-coordinate','0',2,'2021-02-27 00:04:08','2023-04-16 09:45:20',1,0),(360,355,'系统首页','/welcome','welcome:view','el-icon-star-off','0',1,'2022-02-23 14:04:33','2022-02-23 14:05:02',1,1),(361,358,'签收','','supplier:receive',NULL,'1',1,'2023-04-16 09:57:30','2023-04-16 09:57:30',1,0),(362,358,'删除','','supplier:delete',NULL,'1',1,'2023-04-16 10:06:52','2023-04-16 10:06:52',1,0),(363,358,'编辑',NULL,'supplier:edit',NULL,'1',2,'2023-04-16 10:07:24','2023-04-16 10:07:24',1,0),(364,348,'通过按钮','','products-pass',NULL,'1',1,'2023-04-16 11:21:03','2023-04-16 11:21:03',1,0),(365,348,'列表权限','','products-list',NULL,'1',1,'2023-04-16 11:22:36','2023-04-16 11:22:36',1,0),(366,348,'删除','','products-remove',NULL,'1',1,'2023-04-16 11:24:43','2023-04-16 11:24:43',1,0);

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int DEFAULT '1' COMMENT '是否可用,0:不可用，1：可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色表';

/*Data for the table `tb_role` */

insert  into `tb_role`(`id`,`role_name`,`remark`,`create_time`,`modified_time`,`status`) values (1,'超级管理员','拥有系统的最高权限','2020-04-21 10:34:12','2020-04-21 10:34:12',1),(147,'管理员','差一点权限','2023-04-16 09:43:59','2023-04-16 09:43:59',1);

/*Table structure for table `tb_role_menu` */

DROP TABLE IF EXISTS `tb_role_menu`;

CREATE TABLE `tb_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单/按钮ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色菜单关联表';

/*Data for the table `tb_role_menu` */

insert  into `tb_role_menu`(`role_id`,`menu_id`) values (0,253),(0,234),(0,240),(0,256),(0,258),(0,317),(0,254),(0,321),(0,4),(0,247),(0,301),(0,329),(0,249),(0,250),(0,235),(0,251),(0,255),(0,259),(0,260),(0,241),(0,242),(0,261),(0,262),(0,263),(0,264),(0,265),(0,320),(0,312),(0,229),(0,230),(0,326),(0,337),(0,338),(0,339),(0,340),(0,328),(0,267),(0,274),(0,278),(0,331),(0,332),(0,333),(0,336),(0,276),(0,277),(0,268),(0,283),(0,284),(0,286),(0,285),(0,270),(0,316),(0,311),(0,310),(0,323),(0,324),(0,325),(0,322),(0,269),(0,279),(0,280),(0,281),(0,282),(0,303),(0,273),(0,304),(0,343),(0,305),(0,272),(0,295),(0,297),(0,298),(0,341),(0,296),(0,318),(0,5),(0,271),(0,299),(0,300),(0,307),(0,308),(0,309),(0,1),(0,226),(1,355),(1,360),(1,1),(1,226),(1,234),(1,239),(1,240),(1,256),(1,258),(1,317),(1,254),(1,4),(1,247),(1,301),(1,329),(1,249),(1,250),(1,235),(1,251),(1,255),(1,259),(1,260),(1,241),(1,242),(1,261),(1,262),(1,263),(1,264),(1,265),(1,347),(1,351),(1,348),(1,349),(1,352),(1,356),(1,357),(1,358),(1,361),(1,345),(1,346),(1,354),(1,295),(1,318),(1,5),(1,271),(1,299),(1,300),(1,307),(1,308),(1,309),(147,355),(147,360),(147,1),(147,226),(147,234),(147,239),(147,240),(147,256),(147,258),(147,317),(147,254),(147,4),(147,247),(147,301),(147,329),(147,249),(147,250),(147,235),(147,251),(147,255),(147,259),(147,260),(147,241),(147,242),(147,261),(147,262),(147,263),(147,264),(147,265),(147,351),(147,365),(147,349),(147,352),(147,356),(147,357),(147,358),(147,361),(147,347),(147,348);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `nickname` varchar(20) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `avatar` text COMMENT '头像',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `status` int NOT NULL COMMENT '状态 0锁定 1有效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` int DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐',
  `type` int NOT NULL DEFAULT '1' COMMENT '0:超级管理员，1：系统用户',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `birth` date DEFAULT NULL,
  `department_id` bigint DEFAULT '1' COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`username`,`nickname`,`email`,`avatar`,`phone_number`,`status`,`create_time`,`modified_time`,`sex`,`salt`,`type`,`password`,`birth`,`department_id`) values (5,'admin','hoami','Who@163.com','https://travel-class.oss-cn-hangzhou.aliyuncs.com/images/logo/logo.png.jpg','17744444444',1,'2019-06-14 21:12:16','2022-02-23 04:20:40',0,'cfbf6d34-d3e4-4653-86f0-e33d4595d52b',0,'d7b9c28cac022955cff27947eafce0ad','2020-03-27',1),(6,'张三风','zhang','123@qq.com','http://badidol.com/uploads/images/avatars/201910/24/18_1571921832_HG9E55x9NY.jpg','13598665988',1,'2020-11-14 18:27:13','2022-02-23 18:27:13',1,'0093ecd9-5ddb-43d4-af9f-ddf1e881',1,'8f39458dfca2192ea72fa195b470b9c4','2020-11-11',1),(8,'测试人员1','测试人员1','123456@163.com','http://badidol.com/uploads/images/avatars/201910/24/18_1571921832_HG9E55x9NY.jpg','13030303300',1,'2021-02-25 21:00:29','2022-02-23 21:00:29',1,'6efa6471-cac7-48a8-9208-7e97daa1',1,'6c01b371ec4fd88064ba3c133baf46aa','2020-03-11',14),(9,'admin2','啊对min','823267011@qq.com','http://badidol.com/uploads/images/avatars/201910/24/18_1571921832_HG9E55x9NY.jpg','15690169558',1,'2023-04-16 10:08:16','2023-04-16 10:08:16',1,'fbe493de-e6cf-4055-894e-3843bea5',1,'48042615b33146af52fdcefe5ab327d4','2023-04-10',1);

/*Table structure for table `tb_user_role` */

DROP TABLE IF EXISTS `tb_user_role`;

CREATE TABLE `tb_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';

/*Data for the table `tb_user_role` */

insert  into `tb_user_role`(`user_id`,`role_id`) values (6,1),(6,7),(9,147);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
