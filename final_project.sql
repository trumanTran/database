SET linesize 150;
SET pagesize 30;

CREATE TABLE cell_phone_category (
  PHONE_ID NUMBER(10) NOT NULL,
  CARRIER VARCHAR(50) DEFAULT NULL,
  MODEL VARCHAR(20) DEFAULT NULL,
  MANUFACTURER VARCHAR(50) DEFAULT NULL,
  OS VARCHAR(20) DEFAULT NULL,
  CONDITION VARCHAR(20) NOT NULL,
  CONSTRAINT condition_table CHECK (CONDITION IN ('NEW','USED_LIKE_NEW','USED_VERY_GOOD','USED_GOOD','REFURBISHED')),
  PRICE NUMBER(20) NOT NULL,
  NUM_IN_STOCK NUMBER(10) NOT NULL,
  PRIMARY KEY (PHONE_ID)
);


INSERT INTO cell_phone_category VALUES
(1, 'ATT', 'Galaxy S6', 'Samsung', 'Android', 'NEW', 350, 10);
INSERT INTO cell_phone_category VALUES
(2, 'Sprint', 'iPhone-6s', 'Apple', 'iOS', 'NEW', 400, 20);
INSERT INTO cell_phone_category VALUES
(3, 'Verizon Wireless', 'Lumia-1', 'Microsoft', 'Windows', 'NEW', 350, 5);
INSERT INTO cell_phone_category VALUES
(4, 'Verizon Wireless', 'G2', 'LG', 'Android', 'USED_VERY_GOOD', 150, 2);
INSERT INTO cell_phone_category VALUES
(5, 'ATT', 'Galaxy Note 7', 'Samsung', 'Android', 'USED_GOOD', 400, 5);
INSERT INTO cell_phone_category VALUES
(6, 'ATT', 'Google Pixel', 'Google', 'Android', 'NEW', 730, 5);
INSERT INTO cell_phone_category VALUES
(7, 'Verizon Wireless', 'Google Pixel XL', 'Google', 'Android', 'NEW', 799, 5);
INSERT INTO cell_phone_category VALUES
(8, 'T-Mobile', 'iPhone-7', 'Apple', 'iOS', 'USED_LIKE_NEW', 650, 5);
INSERT INTO cell_phone_category VALUES
(9, 'ATT', 'Huawei Ascend XT', 'Huawei', 'Android', 'USED_LIKE_NEW', 140, 10);
INSERT INTO cell_phone_category VALUES
(10, 'Boost Mobile', 'Galaxy J7', 'Samsung', 'Android', 'REFURBISHED', 50, 15);

COLUMN CARRIER format a19;
COLUMN MANUFACTURER format a15;
COLUMN OS format a15;
COLUMN CONDITION format a20;

CREATE TABLE customer_account (
  ACCOUNT_ID NUMBER(10) NOT NULL,
  PHONE_NUMBER VARCHAR(20) NOT NULL,
  EMAIL VARCHAR(100) NOT NULL,
  FNAME VARCHAR(100) NOT NULL,
  LNAME VARCHAR(100) NOT NULL,
  ADDRESS_STREET VARCHAR(50) NOT NULL,
  ADDRESS_CITY VARCHAR(20) NOT NULL,
  ADDRESS_STATE VARCHAR(2) NOT NULL,
  ADDRESS_ZIP VARCHAR(5) NOT NULL,
  BIRTH DATE DEFAULT NULL,
  PRIMARY KEY (ACCOUNT_ID)
);

INSERT INTO customer_account VALUES
(1, '9174560091', 'jhunters01@cuny.edu', 'Jack', 'Hunter', '11 67ST', 'New York', 'NY', '10024', TO_DATE('1998/01/22 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO customer_account VALUES
(2, '7134560012', 'L.Larson@gmail.com', 'Linda', 'Larson', '100-9 Brooklyn Hwy', 'New York', 'NY', '11225', TO_DATE('1996/12/20 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO customer_account VALUES
(3, '5303056927', 'sciencerules@gmail.com', 'Albert', 'Newton', '1206 Francis Mine', 'Sacramento', 'CA', '95814', TO_DATE('2001/05/17 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO customer_account VALUES
(4, '5106204676', 'luvlucy@yahoo.com', 'Ricky', 'Ricardo', '90 maple street west', 'Trenton', 'NJ', '08861', TO_DATE('1942/12/01 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO customer_account VALUES
(5, '3237843058', 'RalphJRiggins@dayrep.com', 'Ralph', 'Riggins', '3373 Hillhaven Drive', 'Los Angeles', 'CA', '90017', TO_DATE('1964/10/02 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO customer_account VALUES
(6, '2133384287', 'lavonnaRWilliams@mail.com', 'Lavonna', 'Williams', '1305 Zimmerman Lane', 'City of Commerce', 'CA', '90040', TO_DATE('1983/03/03 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO customer_account VALUES
(7, '6313604478', 'antoninetteRe@gmail.com', 'Antoinette', 'Reynolds', '2329 Wayback Lane', 'Smithtown', 'NY', '11787', TO_DATE('1990/10/25 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO customer_account VALUES
(8, '9736948587', 'Mcdonald@yahoo.com', 'Berger', 'McDonald', '3024 Spring Haven Trail', 'Mountain View', 'NJ', '07470', TO_DATE('1960/06/17 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO customer_account VALUES
(9, '9082074677', 'M.Lester@gmail.com', 'Moe', 'Lester', '2980 Williams Mine Road', 'Lakewood', 'NJ', '08701', TO_DATE('1988/10/05 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO customer_account VALUES
(10, '8282351937', 'son@rhyta.com', 'Dam', 'Son', '98 McVaney Road', 'Canton', 'NC', '28716', TO_DATE('1957/08/28 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));

COLUMN PHONE_NUMBER format a10;
COLUMN EMAIL format a25;
COLUMN FNAME format a15;
COLUMN LNAME format a15;
COLUMN ADDRESS_STREET format a25;
COLUMN ADDRESS_CITY format a20;


CREATE TABLE payment (
  PAYMENT_ID NUMBER(10) NOT NULL,
  ACCOUNT_ID NUMBER(10) NOT NULL,
  B_ADDRESS_STREET VARCHAR(50) NOT NULL,
  B_ADDRESS_CITY VARCHAR(20) NOT NULL,
  B_ADDRESS_STATE VARCHAR(2) NOT NULL,
  B_ADDRESS_ZIP VARCHAR(5) NOT NULL,
  CARD_NUMBER VARCHAR(20) NOT NULL,
  CARD_EXPIRE date NOT NULL,
  CARD_CSV VARCHAR(5) NOT NULL,
  PRIMARY KEY (PAYMENT_ID),  
  CONSTRAINT ACCOUNT_ID_FK FOREIGN KEY (ACCOUNT_ID) REFERENCES customer_account (ACCOUNT_ID)
);



INSERT INTO payment VALUES
(1, 2, '100-9 Brooklyn Hwy', 'New York', 'NY', '11225', '1234567890123456', TO_DATE('2018/12/12 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '901');
INSERT INTO payment VALUES
(2, 3, '98 Main Street', 'Trenton', 'NJ', '08931', '9999888877776666', TO_DATE('2017/12/20 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '345');
INSERT INTO payment VALUES
(3, 1, '11 67ST', 'New York', 'NY', '10024', '5400250894324579', TO_DATE('2017/10/20 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '123');
INSERT INTO payment VALUES
(4, 4, '90 maple street west', 'Trenton', 'NJ', '08861', '5152885964735319', TO_DATE('2016/12/30 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '100');
INSERT INTO payment VALUES
(5, 7, '3250 Edwards Street', 'Robersonville', 'NC', '27871', '5159490268566412', TO_DATE('2019/01/02 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '355');
INSERT INTO payment VALUES
(6, 8, '93024 Spring Haven Trail', 'Mountain View', 'NJ', '07470', '4556863960489129', TO_DATE('2016/12/28 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '600');
INSERT INTO payment VALUES
(7, 5, '3373 Hillhaven Drive', 'Los Angeles', 'CA', '90017', '4916918156169029', TO_DATE('2018/01/13 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '298');
INSERT INTO payment VALUES
(8, 10, '958 Blackwell Street', 'Anchorage', 'AK', '99502', '5145039287561685', TO_DATE('2018/02/28 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '335');
INSERT INTO payment VALUES
(9, 9, '2980 Williams Mine Road', 'Lakewood', 'NJ', '08701', '4916594710292621', TO_DATE('2017/03/30 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '008');
INSERT INTO payment VALUES
(10, 6, '856 Wilson Street', 'Bishop', 'CA', '93514', '5524335106914282', TO_DATE('2019/02/20 00:00:00', 'yyyy/mm/dd hh24:mi:ss'), '951');


CREATE TABLE orders (
  ORDER_NUMBER NUMBER(20) NOT NULL,
  PAYMENT_ID NUMBER(10) NOT NULL,
  ACCOUNT_ID NUMBER(10) NOT NULL,
  STATUS VARCHAR(10) NOT NULL,
  CONSTRAINT status_table CHECK (STATUS IN ('Received','Confirmed','Shipped','Delivered')),
  SUBTOTAL NUMBER(20) NOT NULL,
  SHIPPING_TYPE VARCHAR(20) NOT NULL,
  CONSTRAINT shipping_table CHECK (SHIPPING_TYPE IN ('Economy','2-Day Ground','Express','Over-night')),
  SHIPPING_COST NUMBER(20) NOT NULL,
  S_ADDRESS_STREET VARCHAR(50) NOT NULL,
  S_ADDRESS_CITY VARCHAR(20) NOT NULL,
  S_ADDRESS_STATE VARCHAR(2) NOT NULL,
  S_ADDRESS_ZIP VARCHAR(5) NOT NULL,
  TRACKING_NUM VARCHAR(50) NOT NULL,
  TAX NUMBER(20) NOT NULL,
  ORDER_DATE date NOT NULL,
  PRIMARY KEY (ORDER_NUMBER),
  CONSTRAINT PAYMENT_FK FOREIGN KEY (PAYMENT_ID) REFERENCES payment (PAYMENT_ID),  
  CONSTRAINT ACCOUNT_FK FOREIGN KEY (ACCOUNT_ID) REFERENCES customer_account (ACCOUNT_ID)
) ;


INSERT INTO orders VALUES
(1, 4, 4, 'Shipped', 1050.00, 'Economy', 5.95, '90 maple street west', 'Trenton', 'NJ', '08861', '1234567098723435435', 78.75, TO_DATE('2016/12/05 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO orders VALUES
(2, 2, 3, 'Confirmed', 300.00, 'Over-night', 35.95, '98 Main Street', 'Trenton', 'NJ', '08931', '8069861495825013659', 25.20, TO_DATE('2016/12/08 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO orders VALUES
(3, 1, 2, 'Delivered', 400.00, 'Express', 20.95, '100-9 Brooklyn Hwy', 'New York', 'NY', '11225', '2004777891786465478', 19.34, TO_DATE('2016/07/13 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO orders VALUES
(4, 10, 6, 'Delivered', 730.00, '2-Day Ground', 10.95, '856 Wilson Street', 'Bishop', 'CA', '93514', '5455588012547433596', 35.20, TO_DATE('2016/06/08 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO orders VALUES
(5, 8, 10, 'Delivered', 1400.00, 'Economy', 5.95, '958 Blackwell Street', 'Anchorage', 'AK', '99502', '6594477412236440211', 98.00, TO_DATE('2015/01/05 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO orders VALUES
(6, 9, 9, 'Confirmed', 350.00, 'Express', 20.95, '2980 Williams Mine Road', 'Lakewood', 'NJ', '08701', '8745696555214770258', 28.00, TO_DATE('2016/12/10 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO orders VALUES
(7, 3, 1, 'Shipped', 280.00, 'Economy', 5.95, '11 67ST', 'New York', 'NY', '10024', '9996571111112586355', 24.85, TO_DATE('2016/12/06 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO orders VALUES
(8, 7, 5, 'Shipped', 100.00, '2-Day Ground', 10.95, '3373 Hillhaven Drive', 'Los Angeles', 'CA', '90017', '4569201490085465996', 9.00, TO_DATE('2016/12/09 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO orders VALUES
(9, 6, 8, 'Received', 799.00, 'Over-night', 35.95, '93024 Spring Haven Trail', 'Mountain View', 'NJ', '07470', '3333222157899987454', 63.92, TO_DATE('2016/12/11 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO orders VALUES
(10, 5, 7, 'Delivered', 650.00, 'Economy', 5.95, '3250 Edwards Street', 'Robersonville', 'NC', '27871', '2145867574693487859', 45.50, TO_DATE('2016/02/14 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));



CREATE TABLE order_entry (
  ORDER_NUM NUMBER(10) NOT NULL,
  PHONE_ID NUMBER(10) NOT NULL,
  QUANTITY NUMBER(10) NOT NULL,
  PRIMARY KEY (ORDER_NUM,PHONE_ID),
  CONSTRAINT order_entry_ibfk_2 FOREIGN KEY (ORDER_NUM) REFERENCES orders (ORDER_NUMBER),
  CONSTRAINT order_entry_ibfk_1 FOREIGN KEY (PHONE_ID) REFERENCES cell_phone_category (PHONE_ID)
) ;


INSERT INTO order_entry VALUES
(1, 1, 3);
INSERT INTO order_entry VALUES
(2, 4, 2);
INSERT INTO order_entry VALUES
(3, 2, 1);
INSERT INTO order_entry VALUES
(4, 6, 1);
INSERT INTO order_entry VALUES
(5, 1, 4);
INSERT INTO order_entry VALUES
(6, 3, 1);
INSERT INTO order_entry VALUES
(7, 9, 2);
INSERT INTO order_entry VALUES
(8, 10, 2);
INSERT INTO order_entry VALUES
(9, 7, 1);
INSERT INTO order_entry VALUES
(10, 8, 1);



CREATE TABLE shopping_cart (
  ACCOUNT_ID NUMBER(10) NOT NULL,
  PHONE_ID NUMBER(10) NOT NULL,
  QUANTITY NUMBER(10) NOT NULL,
  PRIMARY KEY (ACCOUNT_ID,PHONE_ID),
  CONSTRAINT shopping_cart_ibfk_2 FOREIGN KEY (PHONE_ID) REFERENCES cell_phone_category (PHONE_ID),
  CONSTRAINT shopping_cart_ibfk_1 FOREIGN KEY (ACCOUNT_ID) REFERENCES customer_account (ACCOUNT_ID)
) ;

INSERT INTO shopping_cart VALUES
(1, 2, 2);
INSERT INTO shopping_cart VALUES
(3, 7, 1);
INSERT INTO shopping_cart VALUES
(2, 8, 3);
INSERT INTO shopping_cart VALUES
(4, 4, 1);
INSERT INTO shopping_cart VALUES
(5, 6, 3);
INSERT INTO shopping_cart VALUES
(6, 5, 5);
INSERT INTO shopping_cart VALUES
(7, 1, 3);
INSERT INTO shopping_cart VALUES
(9, 1, 2);
INSERT INTO shopping_cart VALUES
(10, 10, 4);
INSERT INTO shopping_cart VALUES
(8, 8, 1);
