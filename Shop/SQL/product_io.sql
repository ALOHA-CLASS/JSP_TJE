-- joeun.product_io definition

CREATE TABLE `product_io` (
  `io_no` int NOT NULL AUTO_INCREMENT COMMENT '입출고번호',
  `product_id` varchar(100) NOT NULL COMMENT '상품아이디',
  `order_no` int DEFAULT NULL COMMENT '주문번호',
  `amount` int DEFAULT NULL COMMENT '입출고량',
  `type` varchar(100) DEFAULT NULL COMMENT '입고(IN),출고(OUT)',
  `io_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '입출고날짜',
  `user_id` varchar(10) DEFAULT NULL COMMENT '회원아이디',
  PRIMARY KEY (`io_no`),
  KEY `product_id_FK` (`product_id`),
  KEY `product_id_FK_1` (`order_no`),
  CONSTRAINT `product_id_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `product_id_FK_1` FOREIGN KEY (`order_no`) REFERENCES `order` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='상품 입출고';