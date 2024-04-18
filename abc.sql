-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'buy'
-- 
-- ---

DROP TABLE IF EXISTS `buy`;
		
CREATE TABLE `buy` (
  `Order_id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `Member_ID` INTEGER(5) NULL DEFAULT NULL,
  `Order_date` DATETIME NOT NULL,
  `Status` ENUM('訂單處理中','已出貨','付款完成','訂單已完成','已取消','已退款') NOT NULL,
  `Shipping_address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Order_id`)
);

-- ---
-- Table 'buy_item'
-- 
-- ---

DROP TABLE IF EXISTS `buy_item`;
		
CREATE TABLE `buy_item` (
  `Order_Item_ID` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `Order_ID` INTEGER(10) NOT NULL,
  `Product_ID` INTEGER(10) NOT NULL,
  `Quantity` INTEGER(10) NOT NULL,
  `total_item_price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`Order_Item_ID`)
);

-- ---
-- Table 'class'
-- 
-- ---

DROP TABLE IF EXISTS `class`;
		
CREATE TABLE `class` (
  `Class_ID` INTEGER(5) NOT NULL AUTO_INCREMENT,
  `Class_name` VARCHAR(255) NOT NULL,
  `Class_description` MEDIUMTEXT NOT NULL,
  `C_price` INTEGER(10) NOT NULL,
  `C_discount_price` INTEGER(5) NOT NULL,
  `F_Speaker_ID` INTEGER(5) NOT NULL,
  `Class_person_limit` INTEGER(5) NOT NULL,
  `Start_date` DATE NOT NULL,
  `End_date` DATE NOT NULL,
  `Class_date` DATETIME NOT NULL,
  `Class_end_date` DATETIME NOT NULL,
  `Class_category_ID` INTEGER(10) NOT NULL,
  `valid` TINYINT(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Class_ID`)
);

-- ---
-- Table 'class_categories'
-- 
-- ---

DROP TABLE IF EXISTS `class_categories`;
		
CREATE TABLE `class_categories` (
  `Class_cate_ID` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `Class_cate_name` VARCHAR(255) NOT NULL,
  `C_Description` MEDIUMTEXT NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Class_cate_ID`)
);

-- ---
-- Table 'class_image'
-- 
-- ---

DROP TABLE IF EXISTS `class_image`;
		
CREATE TABLE `class_image` (
  `Image_ID` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `F_Class_ID` INTEGER(10) NOT NULL,
  `Image_URL` VARCHAR(255) NOT NULL,
  `Description` MEDIUMTEXT NOT NULL,
  `Sort_order` INTEGER(5) NOT NULL,
  `Upload_date` DATETIME NOT NULL,
  PRIMARY KEY (`Image_ID`)
);

-- ---
-- Table 'class_like'
-- 
-- ---

DROP TABLE IF EXISTS `class_like`;
		
CREATE TABLE `class_like` (
  `Like_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `User_ID` INTEGER(5) NOT NULL,
  `Class_ID` INTEGER(5) NOT NULL,
  PRIMARY KEY (`Like_ID`)
);

-- ---
-- Table 'coupons'
-- 
-- ---

DROP TABLE IF EXISTS `coupons`;
		
CREATE TABLE `coupons` (
  `Coupon_ID ` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `C_name` VARCHAR(20) NOT NULL,
  `C_code` VARCHAR(255) NOT NULL,
  `Discount_amount` DECIMAL(7,2) NOT NULL,
  `Discount_type` ENUM('百分比', '金額') NOT NULL,
  `Coupon_description` MEDIUMTEXT NOT NULL,
  `Valid_start_date` DATE NOT NULL,
  `Valid_end_date` DATE NOT NULL,
  `coupon_image` VARCHAR(50) NOT NULL,
  `minimum_spend` INTEGER(10) NOT NULL,
  `valid` TINYINT(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Coupon_ID `)
);

-- ---
-- Table 'coupon_categories'
-- 
-- ---

DROP TABLE IF EXISTS `coupon_categories`;
		
CREATE TABLE `coupon_categories` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` INTEGER(5) NOT NULL,
  `category_id` INTEGER(5) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'event'
-- 
-- ---

DROP TABLE IF EXISTS `event`;
		
CREATE TABLE `event` (
  `Event_ID ` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `Title_E_name` VARCHAR(55) NOT NULL,
  `Content` MEDIUMTEXT NOT NULL,
  `Publish_date` DATETIME NOT NULL,
  `Event_category_ID ` INTEGER(10) NOT NULL,
  PRIMARY KEY (`Event_ID `)
);

-- ---
-- Table 'Event_categories'
-- 
-- ---

DROP TABLE IF EXISTS `Event_categories`;
		
CREATE TABLE `Event_categories` (
  `Event_cate_ID ` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `Event_cate_name` VARCHAR(255) NOT NULL DEFAULT '0',
  `E_Description` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`Event_cate_ID `)
);

-- ---
-- Table 'event_image'
-- 
-- ---

DROP TABLE IF EXISTS `event_image`;
		
CREATE TABLE `event_image` (
  `Image_ID ` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `F_Event_ID ` INTEGER(10) NOT NULL,
  `Image_URL` VARCHAR(255) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Sort_order` INTEGER(5) NOT NULL,
  `Upload_date` DATETIME NOT NULL,
  PRIMARY KEY (`Image_ID `)
);

-- ---
-- Table 'member'
-- 
-- ---

DROP TABLE IF EXISTS `member`;
		
CREATE TABLE `member` (
  `id` INTEGER(5) NOT NULL AUTO_INCREMENT,
  `User_name` VARCHAR(20) NOT NULL,
  `Account` VARCHAR(20) NOT NULL,
  `Password` VARCHAR(55) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Phone` VARCHAR(255) NOT NULL,
  `Gender` ENUM('M', 'F', 'Other') NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `Create_date` DATETIME NOT NULL,
  `Last_login` DATETIME NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  `User_image` VARCHAR(255) NOT NULL,
  `new_F_ register_id` INTEGER(10) NOT NULL,
  `adress` MEDIUMTEXT NULL DEFAULT NULL COMMENT 'new',
  `user_level` INTEGER NULL DEFAULT NULL COMMENT 'new',
  `user_coupon_id` INTEGER NULL DEFAULT NULL COMMENT 'new',
  `user_product` INTEGER NULL DEFAULT NULL COMMENT 'new',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'product'
-- 
-- ---

DROP TABLE IF EXISTS `product`;
		
CREATE TABLE `product` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `category_id` INTEGER(10) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `price` INTEGER(10) NOT NULL,
  `stock_quantity` INTEGER(5) NOT NULL,
  `F_coupon_id` INTEGER(10) NOT NULL,
  `upload_date` DATETIME NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'product_categories'
-- 
-- ---

DROP TABLE IF EXISTS `product_categories`;
		
CREATE TABLE `product_categories` (
  `Product_cate_ID` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `Product_cate_name` VARCHAR(255) NOT NULL,
  `P_Description` MEDIUMTEXT NOT NULL,
  `valid` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`Product_cate_ID`)
);

-- ---
-- Table 'product_image'
-- 
-- ---

DROP TABLE IF EXISTS `product_image`;
		
CREATE TABLE `product_image` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `F_product_id` INTEGER(10) NOT NULL,
  `image_url` VARCHAR(255) NOT NULL,
  `discription` MEDIUMTEXT NOT NULL,
  `sort_order` INTEGER(5) NOT NULL,
  `upload_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'product_like'
-- 
-- ---

DROP TABLE IF EXISTS `product_like`;
		
CREATE TABLE `product_like` (
  `Like_ID` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `User_ID` INTEGER(10) NOT NULL,
  `Product_ID` INTEGER(5) NOT NULL,
  PRIMARY KEY (`Like_ID`)
);

-- ---
-- Table 'recipe'
-- 
-- ---

DROP TABLE IF EXISTS `recipe`;
		
CREATE TABLE `recipe` (
  `Recipe_ID` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `Title_R_name` VARCHAR(55) NOT NULL,
  `Image_URL` VARCHAR(255) NOT NULL,
  `Content` MEDIUMTEXT NOT NULL,
  `Publish_date` DATETIME NOT NULL,
  `Recipe_category_ID` INTEGER(10) NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  `recipe_speaker_id` INTEGER(10) NOT NULL COMMENT 'new',
  PRIMARY KEY (`Recipe_ID`)
);

-- ---
-- Table 'recipe_categories'
-- 
-- ---

DROP TABLE IF EXISTS `recipe_categories`;
		
CREATE TABLE `recipe_categories` (
  `Recipe_cate_ID` INTEGER(5) NOT NULL AUTO_INCREMENT,
  `Recipe_cate_name` VARCHAR(55) NOT NULL,
  `R_Description` MEDIUMTEXT NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Recipe_cate_ID`)
);

-- ---
-- Table 'recipe_image'
-- 
-- ---

DROP TABLE IF EXISTS `recipe_image`;
		
CREATE TABLE `recipe_image` (
  `Image_ID` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `F_Recipe_ID` INTEGER(10) NOT NULL,
  `Image_URL` VARCHAR(255) NOT NULL,
  `Description` MEDIUMTEXT NOT NULL,
  `Sort_order` INTEGER(5) NOT NULL,
  `Upload_date` DATETIME NOT NULL,
  PRIMARY KEY (`Image_ID`)
);

-- ---
-- Table 'recipe_like'
-- 
-- ---

DROP TABLE IF EXISTS `recipe_like`;
		
CREATE TABLE `recipe_like` (
  `Like_ID` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `User_ID` INTEGER(10) NOT NULL,
  `Recipe_ID` INTEGER(10) NOT NULL,
  PRIMARY KEY (`Like_ID`)
);

-- ---
-- Table 'speaker'
-- 
-- ---

DROP TABLE IF EXISTS `speaker`;
		
CREATE TABLE `speaker` (
  `Speaker_ID` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `Speaker_name` VARCHAR(55) NOT NULL,
  `Speaker_description` MEDIUMTEXT NOT NULL,
  `Image` VARCHAR(255) NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Speaker_ID`)
);

-- ---
-- Table 'class_content'
-- new
-- ---

DROP TABLE IF EXISTS `class_content`;
		
CREATE TABLE `class_content` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `F_Class_ID` INTEGER(10) NOT NULL,
  `contents` MEDIUMTEXT NOT NULL,
  `sort_order` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'new';

-- ---
-- Table 'speaker_exp'
-- new
-- ---

DROP TABLE IF EXISTS `speaker_exp`;
		
CREATE TABLE `speaker_exp` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `contents` MEDIUMTEXT NOT NULL,
  `sort_order` INTEGER(10) NOT NULL,
  `speak_id` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'new';

-- ---
-- Table 'speaker_li'
-- new
-- ---

DROP TABLE IF EXISTS `speaker_li`;
		
CREATE TABLE `speaker_li` (
  `id` INTEGER(10) NULL DEFAULT NULL,
  `contents` MEDIUMTEXT NOT NULL,
  `sort_order` INTEGER(10) NOT NULL,
  `speak_id` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'new';

-- ---
-- Table 'new_login'
-- 
-- ---

DROP TABLE IF EXISTS `new_login`;
		
CREATE TABLE `new_login` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `User_name` VARCHAR(20) NOT NULL,
  `Password` VARCHAR(55) NOT NULL,
  `Last_Login_Time` DATETIME NOT NULL,
  `Login_Attempts` INTEGER(5) NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  `Create_date` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'new_register'
-- 
-- ---

DROP TABLE IF EXISTS `new_register`;
		
CREATE TABLE `new_register` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `User_name` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Phone` VARCHAR(255) NOT NULL,
  `Gender` ENUM('M', 'F', 'Other') NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `Password` VARCHAR(55) NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  `Create_date` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'new_Discounted_Products'
-- 
-- ---

DROP TABLE IF EXISTS `new_Discounted_Products`;
		
CREATE TABLE `new_Discounted_Products` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `F_product_id` INTEGER(10) NOT NULL,
  `Discount_type` ENUM('百分比', '金額') NOT NULL,
  `Valid_start_date` DATE NOT NULL,
  `Valid_end_date` DATE NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'new_Discounted_categories'
-- 
-- ---

DROP TABLE IF EXISTS `new_Discounted_categories`;
		
CREATE TABLE `new_Discounted_categories` (
  `Discounted_cate_id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `Discounted_cate_name` VARCHAR(255) NOT NULL,
  `P_Description` MEDIUMTEXT NOT NULL,
  `valid` TINYINT(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Discounted_cate_id`)
);

-- ---
-- Table 'new_order'
-- 訂單資料表
-- ---

DROP TABLE IF EXISTS `new_order`;
		
CREATE TABLE `new_order` (
  `Order_ID` INTEGER(10) NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `Customer_ID` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `Order_date` DATETIME NOT NULL AUTO_INCREMENT DEFAULT 'NULL' COMMENT '訂單日期',
  `Total_amount` DECIMAL(10,2) NOT NULL AUTO_INCREMENT DEFAULT NULL COMMENT '總金額',
  `status` VARCHAR(50) NOT NULL AUTO_INCREMENT DEFAULT 'NULL',
  `Shipping_address` VARCHAR(255) NOT NULL AUTO_INCREMENT DEFAULT 'NULL',
  `Payment_method ` VARCHAR(50) NOT NULL AUTO_INCREMENT DEFAULT 'NULL',
  `Shipping_date` DATE NULL DEFAULT NULL,
  `Completed_date` DATE NULL DEFAULT NULL,
  `product_id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `class_id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `Coupon_ID` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`Order_ID`)
) COMMENT '訂單資料表';

-- ---
-- Table 'new_Order_Detail'
-- 訂單明細資料表
-- ---

DROP TABLE IF EXISTS `new_Order_Detail`;
		
CREATE TABLE `new_Order_Detail` (
  `Order_Item_ID` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `Order_ID` INTEGER NULL DEFAULT NULL,
  `product_id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `Quantity` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `Unit_price` DECIMAL NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `Total_item_price` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`Order_Item_ID`)
) COMMENT '訂單明細資料表';

-- ---
-- Foreign Keys 
-- ---


-- ---
-- Table Properties
-- ---

-- ALTER TABLE `buy` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `buy_item` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `class` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `class_categories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `class_image` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `class_like` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `coupons` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `coupon_categories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `event` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Event_categories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `event_image` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `member` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `product` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `product_categories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `product_image` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `product_like` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `recipe` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `recipe_categories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `recipe_image` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `recipe_like` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `speaker` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `class_content` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `speaker_exp` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `speaker_li` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `new_login` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `new_register` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `new_Discounted_Products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `new_Discounted_categories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `new_order` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `new_Order_Detail` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `buy` (`Order_id`,`Member_ID`,`Order_date`,`Status`,`Shipping_address`) VALUES
-- ('','','','','');
-- INSERT INTO `buy_item` (`Order_Item_ID`,`Order_ID`,`Product_ID`,`Quantity`,`total_item_price`) VALUES
-- ('','','','','');
-- INSERT INTO `class` (`Class_ID`,`Class_name`,`Class_description`,`C_price`,`C_discount_price`,`F_Speaker_ID`,`Class_person_limit`,`Start_date`,`End_date`,`Class_date`,`Class_end_date`,`Class_category_ID`,`valid`) VALUES
-- ('','','','','','','','','','','','','');
-- INSERT INTO `class_categories` (`Class_cate_ID`,`Class_cate_name`,`C_Description`,`valid`) VALUES
-- ('','','','');
-- INSERT INTO `class_image` (`Image_ID`,`F_Class_ID`,`Image_URL`,`Description`,`Sort_order`,`Upload_date`) VALUES
-- ('','','','','','');
-- INSERT INTO `class_like` (`Like_ID`,`User_ID`,`Class_ID`) VALUES
-- ('','','');
-- INSERT INTO `coupons` (`Coupon_ID `,`C_name`,`C_code`,`Discount_amount`,`Discount_type`,`Coupon_description`,`Valid_start_date`,`Valid_end_date`,`coupon_image`,`minimum_spend`,`valid`) VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO `coupon_categories` (`id`,`coupon_id`,`category_id`) VALUES
-- ('','','');
-- INSERT INTO `event` (`Event_ID `,`Title_E_name`,`Content`,`Publish_date`,`Event_category_ID `) VALUES
-- ('','','','','');
-- INSERT INTO `Event_categories` (`Event_cate_ID `,`Event_cate_name`,`E_Description`) VALUES
-- ('','','');
-- INSERT INTO `event_image` (`Image_ID `,`F_Event_ID `,`Image_URL`,`Description`,`Sort_order`,`Upload_date`) VALUES
-- ('','','','','','');
-- INSERT INTO `member` (`id`,`User_name`,`Account`,`Password`,`Email`,`Phone`,`Gender`,`date_of_birth`,`Create_date`,`Last_login`,`valid`,`User_image`,`new_F_ register_id`,`adress`,`user_level`,`user_coupon_id`,`user_product`) VALUES
-- ('','','','','','','','','','','','','','','','','');
-- INSERT INTO `product` (`id`,`category_id`,`name`,`description`,`price`,`stock_quantity`,`F_coupon_id`,`upload_date`,`valid`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `product_categories` (`Product_cate_ID`,`Product_cate_name`,`P_Description`,`valid`) VALUES
-- ('','','','');
-- INSERT INTO `product_image` (`id`,`F_product_id`,`image_url`,`discription`,`sort_order`,`upload_date`) VALUES
-- ('','','','','','');
-- INSERT INTO `product_like` (`Like_ID`,`User_ID`,`Product_ID`) VALUES
-- ('','','');
-- INSERT INTO `recipe` (`Recipe_ID`,`Title_R_name`,`Image_URL`,`Content`,`Publish_date`,`Recipe_category_ID`,`valid`,`recipe_speaker_id`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `recipe_categories` (`Recipe_cate_ID`,`Recipe_cate_name`,`R_Description`,`valid`) VALUES
-- ('','','','');
-- INSERT INTO `recipe_image` (`Image_ID`,`F_Recipe_ID`,`Image_URL`,`Description`,`Sort_order`,`Upload_date`) VALUES
-- ('','','','','','');
-- INSERT INTO `recipe_like` (`Like_ID`,`User_ID`,`Recipe_ID`) VALUES
-- ('','','');
-- INSERT INTO `speaker` (`Speaker_ID`,`Speaker_name`,`Speaker_description`,`Image`,`valid`) VALUES
-- ('','','','','');
-- INSERT INTO `class_content` (`id`,`F_Class_ID`,`contents`,`sort_order`) VALUES
-- ('','','','');
-- INSERT INTO `speaker_exp` (`id`,`contents`,`sort_order`,`speak_id`) VALUES
-- ('','','','');
-- INSERT INTO `speaker_li` (`id`,`contents`,`sort_order`,`speak_id`) VALUES
-- ('','','','');
-- INSERT INTO `new_login` (`id`,`User_name`,`Password`,`Last_Login_Time`,`Login_Attempts`,`valid`,`Create_date`) VALUES
-- ('','','','','','','');
-- INSERT INTO `new_register` (`id`,`User_name`,`Email`,`Phone`,`Gender`,`date_of_birth`,`Password`,`valid`,`Create_date`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `new_Discounted_Products` (`id`,`F_product_id`,`Discount_type`,`Valid_start_date`,`Valid_end_date`,`valid`) VALUES
-- ('','','','','','');
-- INSERT INTO `new_Discounted_categories` (`Discounted_cate_id`,`Discounted_cate_name`,`P_Description`,`valid`) VALUES
-- ('','','','');
-- INSERT INTO `new_order` (`Order_ID`,`Customer_ID`,`Order_date`,`Total_amount`,`status`,`Shipping_address`,`Payment_method `,`Shipping_date`,`Completed_date`,`product_id`,`class_id`,`Coupon_ID`) VALUES
-- ('','','','','','','','','','','','');
-- INSERT INTO `new_Order_Detail` (`Order_Item_ID`,`Order_ID`,`product_id`,`Quantity`,`Unit_price`,`Total_item_price`) VALUES
-- ('','','','','','');