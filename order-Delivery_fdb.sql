DROP TABLE BUYER;

CREATE TABLE BUYER (
  BuyerID int NOT NULL PRIMARY KEY,
  FName varchar(25) NOT NULL,
  LName varchar(30) NOT NULL,
  City varchar(20),
  ZipCode varchar(5),
  Phnumber varchar(13)
);

INSERT INTO BUYER VALUES
(1, 'Henry', 'Heinonen', 'Kokkola', '00410', '+358410000000'),
(2, 'Katri', 'Mulmi', 'Vantaa', '00250', '+358410000001'),
(3, 'Maija', 'Virtanen', 'Seinäjoki', '00580', '+358410000002'),
(4, 'Jacob', 'Vehviläinen', 'Vaasa', '00450', '+358410000003'),
(5, 'Maria', 'Laakso', 'Espoo', '03210', '+358410000004'),
(6, 'Maeikko', 'Jalonen', 'Espoo', '02280', '+358410000006'),
(7,'Alex','Heikkinen','Sipoo','00980','+358410000005'),
(8,'Juhani','Elomma','Espoo','01009','+358410000007'),
(9,'Kalevi','Gauffin','Kirkkonummi','02400','+358410000008'),
(10,'Ilmari','Jussila','Kainuu','87100','+358410000009');

DROP TABLE IF EXISTS STAFF;

CREATE TABLE STAFF (
  StaffID int NOT NULL PRIMARY KEY,
  Forename varchar(25) NOT NULL,
  Surname varchar(30) NOT NULL,
  City varchar(20),
  Birthdate date,
  Phnumber varchar(13)
);

INSERT INTO STAFF VALUES
(11, 'Kari', 'Korhonen', 'Helsinki', '1985-01-01', '+358412356891'),
(12, 'Matti', 'Heinonen', 'Vantaa', '1980-02-01', '+3581234567'),
(13, 'Sanna', 'Korpela', 'Espoo', '1975-03-01', '+358235569'),
(14, 'Leena', 'Sihvola', 'Helsinki', '1983-04-08', '+358789456'),
(15, 'Asta', 'Markus', 'Espoo', '1995-05-12', '+358456123');

DROP TABLE IF EXISTS E_order;

CREATE TABLE E_order (
  OrderID char(2) NOT NULL PRIMARY KEY,
  OrderDate datetime NOT NULL,
  ShipDate datetime NOT NULL,
  Buyer int,
  Staff int,
  FOREIGN KEY (Buyer) REFERENCES BUYER(BuyerID),
  FOREIGN KEY (Staff) REFERENCES STAFF(StaffID)
);

INSERT INTO E_ORDER VALUES
('V1', '2023-03-01 10:00:00', '2023-03-03 11:00:00', 2, 12),
('V2', '2023-03-01 12:00:00', '2023-03-03 11:00:00', 1, 11),
('V3', '2023-03-02 17:00:00', '2023-03-04 18:00:00', 3, 12),
('V4', '2023-03-03 21:00:00', '2023-03-06 10:00:00', 5, 14),
('V5', '2023-03-04 06:00:00', '2023-03-06 10:00:00', 2, 13),
('V6', '2023-03-05 10:00:00', '2023-03-07 12:00:00', 6, 12),
('V7', '2023-03-06 10:00:00', '2023-03-07 12:00:00', 8, 13),
('V8', '2023-03-07 10:00:00', '2023-03-09 14:00:00', 9, 12),
('V9', '2023-03-08 10:00:00', '2023-03-09 14:00:00', 10, 15),
('V10', '2023-03-09 10:00:00', '2023-03-11 12:00:00', 7, 15);

DROP TABLE IF EXISTS PRODUCT;

CREATE TABLE PRODUCT (
	ProductID char(4) NOT NULL PRIMARY KEY,
    Name varchar(32),
    Brand varchar(32),
    Retail_price int,
    Stock int
);

INSERT INTO PRODUCT VALUES
('P1', 'Handbag', 'Guess', 400, 20),
('P2', 'Crossbody bag', 'Michael Kors', 500, 15),
('P3', 'Tote bag', 'Marc Jacobs', 800, 30),
('P4', 'Cotton bag', 'Marimekko', 100, 50),
('P5', 'Leather bag', 'Gucci', 2000, 10),
('P6', 'Briefcase bag', 'Paco Robanne', 650, 25),
('P7', 'Sicily bag', 'Dolce & Gabbana', 1450, 10),
('P8', 'Twist MM bag', 'Gucci', 3550, 5),
('P9', 'Book Tote bag', 'Christian Dior', 2450, 30),
('P10', 'Shoulder bag', 'Isabel Marant', 550, 22);

DROP TABLE IF EXISTS ORDER_DETAILS;
    
CREATE TABLE ORDER_DETAILS (
	OrderID char(2),
    ProductID char(4),
    Quantity int,
    TotalCost int,
    PRIMARY KEY (OrderID, ProductID),
	FOREIGN KEY (OrderID) REFERENCES E_ORDER(OrderID),
	FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

INSERT INTO order_details VALUES
('V1', 'P2', 1, 550),
('V2', 'P1', 6, 2400),
('V3', 'P3', 2, 1650),
('V4', 'P4', 10, 1050),
('V5', 'P4', 5, 550),
('V6', 'P5', 1, 2000),
('V7', 'P6', 3, 650),
('V8', 'P7', 1, 1450),
('V9', 'P8', 2, 7100),
('V10', 'P9', 1, 2450);