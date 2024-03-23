Use mysql_project;
Create Table supplier(
SUPP_ID INT Primary Key,
SUPP_NAME VARCHAR(20) NOT NULL,
SUPP_CITY VARCHAR (20)NOT NULL,
SUPP_PHONE VARCHAR(20)NOT NULL
);
Insert Into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
VALUES(1,'RAJESH RETAILS','DELHI','1234567890'),
(2,'Appario Ltd.','MUMBAI','2589631470'),
(3,'Knome products','BANGLORE','9785462315'),
(4,'Bansal Retails','KOCHI','8975463285'),
(5,'Mittal Ltd','LUCKNOW','7898456532');

Select * from supplier;
Create Table coustomerr(
CUS_ID Int Primary Key,
CUS_NAME VARCHAR(25)NOT NULL,
CUS_CITY VARCHAR(25)NOT NULL,
CUS_PHONE VARCHAR(20)NOT NULL,
CUS_GENDER CHAR );
Insert Into coustomerr(CUS_ID,CUS_NAME,CUS_CITY,CUS_PHONE,CUS_GENDER)
Values(1, 'AAKASH', '9999999999','DELHI', 'M'),
(2,' AMAN','9785463215', 'NOIDA', 'M'),
(3,'NEHA','9999999999','MUMBAI', 'F'),
(4,'MEGHA','9994562399','KOLKATA','F'),
(5,'PULKIT','7895999999','LUCKNOW','M');
Select * from coustomerr;

Create Table category(
CAT_ID Int Primary Key,
CAT_NAME VARCHAR(20) NOT NULL);

Insert Into category(CAT_ID,CAT_NAME)
Values(1,'BOOKS'),
(2,'GAMES'),
(3,'GROCERIES'),
(4,'ELECTRONICS'),
(5,'CLOTHES');

Select * from category;

Create Table product(
PRO_ID Int Primary Key,
PRO_NAME VARCHAR(25) NOT NULL DEFAULT "dummy",
PRO_DESC VARCHAR(60) ,
CAT_ID Int,
Foreign Key (CAT_ID) 
References category(CAT_ID)  );

Insert Into product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
values(1,'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2,'TSHIRT','SIZE-L with Black, Blue and White variations', 5),
(3,'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD',4),
(4,'OATS',' Highly Nutritious from Nestle',3),
(5,'HARRY POTTER','Best Collection of all time by J.K Rowling', 1),
(6,' MILK',' 1L Toned MIlk', 3),
(7,' Boat Earphones',' 1.5Meter long Dolby Atmos', 4),
(8,' Jeans',' Stretchable Denim Jeans with various sizes and color', 5),
(9,'Project IGI', 'compatible with windows 7 and above', 2),
(10,'Hoodie','Black GUCCI for 13 yrs and above',5),
(11,' Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

Select * from product;
Create Table supplier_pricing (
PRICING_ID INT Primary Key,
PRO_ID INT,
SUPP_ID INT,
Foreign Key (PRO_ID)
References product(PRO_ID),

foreign key (SUPP_ID)
REFERENCES supplier(SUPP_ID),

SUPP_PRICE INT Not Null

);

Insert Into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE)
Values(1, 1, 2, 1500),
(2,3,5,30000),
(3, 5, 1, 3000),
(4,2,3,2500),
(5,4,1,1000),
(6,12,2,780),
(7,12,4,789),
(8,3,1,31000),
(9,1,5,1450),
(10,4,2,999),
(11,7,3,549),
(12,7,4,529),
(13,6,2,105),
(14,6,1,99),
(15,2,5,2999),
(16,5,2,2999);

Select * from supplier_pricing;
Desc supplier_pricing;

CREATE TABLE order_table (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES coustomerr(CUS_ID),
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES
    (101, 1500, '2021-10-06', 2, 1),
    (102, 1000, '2021-10-12', 3, 5),
    (103, 30000, '2021-09-16', 5, 2),
    (104, 1500, '2021-10-05', 1, 1),
    (105, 3000, '2021-08-16', 4, 3),
    (106, 1450, '2021-08-18', 1, 9),
    (107, 789, '2021-09-01', 3, 7),
    (108, 780, '2021-09-07', 5, 6),
    (109, 3000, '2021-09-10', 5, 3),
    (110, 2500, '2021-09-10', 2, 4),
    (111, 1000, '2021-09-15', 4, 5),
    (112, 789, '2021-09-16', 4, 7),
    (113, 31000, '2021-09-16', 1, 8),
    (114, 1000, '2021-09-16', 3, 5),
    (115, 3000, '2021-09-16', 5, 3),
    (116, 99, '2021-09-17', 2, 14);
Select * from order_table;
Drop table orders;
Alter Table orders ADD Foreign Key(CUS_ID ) References coustomerr(CUS_ID);
ALter table orders Add Foreign Key(PRICING_ID) references supplier_pricing(PRICING_ID);
DESC orders;

Create Table rating(
RAT_ID INT PRIMARY KEY,
ORD_ID INT,
RAT_RATSTARS Int Not Null,
FOREIGN KEY (ORD_ID) REFERENCES order_table(ORD_ID));

Insert Into rating(RAT_ID,ORD_ID,RAT_RATSTARS)
values(1,101,4),
(2,102,3),
(3,103,1),
(4,104,2),
(5,105,4),
(6,106,3),
(7,107,4),
(8,108,4),
(9,109,3),
(10,110,5),
(11,111,3),
(12,112,4),
(13,113,2),
(14,114,1),
(15,115,1),
(16,116,0);

Select * from rating;
Drop table rating;
Alter table rating Add foreign Key (ORD_ID) references orders(ORD_ID);
Desc rating;


SELECT CUS_GENDER, COUNT(DISTINCT CUS_ID) AS Total_Customers
FROM order_table
JOIN coustomerr ON order_table.CUS_ID = coustomerr.CUS_ID
WHERE ORD_AMOUNT >= 3000
GROUP BY CUS_GENDER;

SELECT order_table.*, product.PRO_NAME
FROM order_table
JOIN supplier_pricing ON order_table.PRICING_ID = supplier_pricing.PRICING_ID
JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID
WHERE order_table.CUS_ID = 2;

SELECT PRO_ID, PRO_NAME
FROM product
WHERE PRO_ID IN (
    SELECT DISTINCT p.PRO_ID
    FROM product p
    JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
    JOIN order_table o ON sp.PRICING_ID = o.PRICING_ID
    WHERE o.ORD_DATE > '2021-10-05'
);


SELECT SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE
FROM supplier
WHERE SUPP_ID IN (
    SELECT SUPP_ID
    FROM supplier_pricing
    GROUP BY SUPP_ID
    HAVING COUNT(DISTINCT PRO_ID) > 1
);


CREATE VIEW lowest_expensive_product AS
SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE
FROM category c
JOIN product p ON c.CAT_ID = p.CAT_ID
JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
JOIN (
    SELECT CAT_ID, MIN(SUPP_PRICE) AS min_price
    FROM product
    JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
    GROUP BY CAT_ID
) AS min_prices ON sp.SUPP_PRICE = min_prices.min_price AND c.CAT_ID = min_prices.CAT_ID;


SELECT * FROM lowest_expensive_product;
SELECT CUS_NAME, CUS_GENDER
FROM coustomerr
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';

