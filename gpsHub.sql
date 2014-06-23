drop table driver;
drop table user;
drop table company;

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` 		INT(11)     NOT NULL AUTO_INCREMENT,
  `company_hash`  VARCHAR(50) NOT NULL,
  `name`       		VARCHAR(50) NOT NULL,
  `account_type`	VARCHAR(200),
  `locversion`    INT(11),
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_id` (`company_id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =8;

INSERT INTO `company` (`company_id`, `name`, `company_hash`) VALUES
  (1, 'My favorite company', 'qwerty');

CREATE TABLE IF NOT EXISTS `user` (
  `user_id`         INT(11)       NOT NULL AUTO_INCREMENT,
  `company_id` 		  INT(11)		    NOT NULL,
  `email`           VARCHAR(50)   NOT NULL,
  `password`        VARCHAR(300)  NOT NULL,
  `name`            VARCHAR(50),
  `last_activity`   VARCHAR(50),
  `user_type`      	VARCHAR(50),
  `properties`      VARCHAR(200),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `company_id` (`company_id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =8;

INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `company_id`) VALUES
  (1, 'admin@admin.com', '3d63a9433775737f702615e5e32d61ff28cdc7fd4cc4ad1bd1daf78aa84cfc55', 'admin', 1);

CREATE TABLE IF NOT EXISTS `driver` (
  `driver_id`       	INT(11)       NOT NULL AUTO_INCREMENT,
  `confirmed`				  TINYINT(1)    NOT NULL,
  `rand`             	INT(5),
  `name`            	VARCHAR(70),
  `alias`				      VARCHAR(50),
  `phone_number`    	VARCHAR(20),
  `vehile_num`			  VARCHAR(20),
  `vehile_description`VARCHAR(200),
  `lat`               VARCHAR(20),
  `lng`               VARCHAR(20),
  `last_activity`   	VARCHAR(20),
  `properties`      	VARCHAR(200),
  PRIMARY KEY (`driver_id`),
  UNIQUE KEY `driver_id` (`driver_id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =8;

INSERT INTO `driver` (`driver_id`, `confirmed`, `name`, `phone_number`, `vehile_num`) VALUES
  (101, 1, '������� ������', '+7 (920) 232-32-34', '�� 512 �'),
  (102, 1, '������ ������', '+7 (965) 453-23-42', '�� 777 �'),
  (103, 1, '�������� ���������', '+7 (915) 112-34-45', '�� 312 �'),
  (104, 1, '��������� ������', '+7 (903) 544-23-53', '�� 112 �');

ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);