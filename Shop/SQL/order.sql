-- 주문 테이블
CREATE TABLE `order` (
  `order_no` int NOT NULL AUTO_INCREMENT COMMENT '주문번호',
  `ship_name` varchar(100) NOT NULL COMMENT '받는사람이름',
  `zip_code` varchar(100) NOT NULL COMMENT '우편번호',
  `country` varchar(100) NOT NULL COMMENT '국가',
  `address` varchar(200) NOT NULL COMMENT '주소',
  `user_id` varchar(10) DEFAULT NULL COMMENT '회원아이디',
  `total_price` int DEFAULT '0' COMMENT '총가격',
  `phone` varchar(20) DEFAULT NULL COMMENT '비회원 전화번호',
  PRIMARY KEY (`order_no`)
) COMMENT='주문';