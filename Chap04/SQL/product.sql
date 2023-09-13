DROP TABLE joeun.product;

CREATE TABLE joeun.product (
	product_id varchar(100) NOT NULL,
	name varchar(100) NOT NULL,
	unit_price INT NULL,
	description TEXT NULL,
	manufacturer varchar(100) NULL,
	category varchar(100) NULL,
	units_in_stock INT DEFAULT 0 NOT NULL,
	`condition` varchar(100) NULL,
	CONSTRAINT product_pk PRIMARY KEY (product_id)
);


INSERT INTO joeun.product
(product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`)
VALUES('P1001', 'Z플립5', 3000000, '삼성 갤럭시 Z플립', 'SAMSUNG', '스마트폰', 100, '새제품');

INSERT INTO joeun.product
(product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`)
VALUES('P1002', '아이폰14', 2000000, '아이폰 X 뉴진스', 'Apple', '스마트폰', 100, '새제품');

INSERT INTO joeun.product
(product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`)
VALUES('P1003', '아이패드', 2500000, '아이패드 13인치', 'Apple', '태플릿PC', 100, '새제품');
