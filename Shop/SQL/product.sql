
-- 상품 테이블
DROP TABLE product;
CREATE TABLE product (
	product_id varchar(100) NOT NULL COMMENT '상품ID',
	name varchar(100) NOT NULL COMMENT '상품명',
	unit_price INT NULL COMMENT '가격(단가)',
	description TEXT NULL COMMENT '설명',
	manufacturer varchar(100) NULL COMMENT '제조업체',
	category varchar(100) NULL COMMENT '카테고리',
	units_in_stock INT DEFAULT 0 NOT NULL COMMENT '재고 수',
	`condition` varchar(100) NULL COMMENT '상태',
	file TEXT NULL COMMENT '파일경로',
	quantity INT DEFAULT 0 NOT NULL COMMENT '장바구니 개수', 
	CONSTRAINT product_pk PRIMARY KEY (product_id)
) COMMENT '상품';

INSERT INTO product
(product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`)
VALUES('P1001', 'Z플립5', 3000000, '삼성 갤럭시 Z플립', 'SAMSUNG', '스마트폰', 100, '새제품');

INSERT INTO joeun.product
(product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`)
VALUES('P1002', '아이폰14', 2000000, '아이폰 X 뉴진스', 'Apple', '스마트폰', 100, '새제품');

INSERT INTO joeun.product
(product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`)
VALUES('P1003', '아이패드', 2500000, '아이패드 13인치', 'Apple', '태플릿PC', 100, '새제품');