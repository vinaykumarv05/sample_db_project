-- create database Online_Book_sales;

use Online_Book_sales;

create table Publisher(

name varchar(200) not null,
contact_details int,
Publisher_id int primary key

);


CREATE TABLE Book (

BookID INT PRIMARY KEY,

Title VARCHAR(200) NOT NULL,

ISBN VARCHAR(20) NOT NULL,

Edition INT NOT NULL,

PublicationYear INT,

Price DECIMAL(10, 2),

PublisherID INT,

FOREIGN KEY (PublisherID) REFERENCES Publisher (Publisher_id));
  

CREATE TABLE Genre (

GenreID INT PRIMARY KEY,
GenreName VARCHAR(100) NOT NULL);

CREATE TABLE BookGenre (

BookID INT,

GenreID INT,

PRIMARY KEY (BookID, GenreID),

FOREIGN KEY (BookID) REFERENCES Book (BookID),

FOREIGN KEY (GenreID) REFERENCES Genre (GenreID));

CREATE TABLE Author (

AuthorID INT PRIMARY KEY,

Name VARCHAR(100) NOT NULL,

Biography TEXT);



CREATE TABLE BookAuthor (

BookID INT,

AuthorID INT,

PRIMARY KEY (BookID, AuthorID),

FOREIGN KEY (BookID) REFERENCES Book(BookID),

FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE Customer (

CustomerID INT PRIMARY KEY,

Name VARCHAR(100) NOT NULL);




CREATE TABLE Address (

AddressID INT PRIMARY KEY,

CustomerID INT,

Street VARCHAR(100),

City VARCHAR(100),

State VARCHAR(100),

Zip VARCHAR(10),

Country VARCHAR(100), 

foreign KEY (CustomerID) REFERENCES Customer(CustomerID)

);












CREATE TABLE Wishlist (

CustomerID INT,

BookID INT,

PRIMARY KEY (CustomerID, BookID),

FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),

FOREIGN KEY (BookID) REFERENCES Book (BookID));


CREATE TABLE Orderr (

OrderID INT PRIMARY KEY,

OrderDate DATE NOT NULL,

CustomerID INT,

PaymentDetails VARCHAR(255),

ShipmentStatus VARCHAR(50),

ShippingAddressID INT,

FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),

FOREIGN KEY (ShippingAddressID) REFERENCES Address (AddressID)

);




CREATE TABLE Order_Book (

OrderItemID INT PRIMARY KEY,

OrderID INT,

BookID INT,

Quantity INT NOT NULL,

ItemDiscount DECIMAL(5,2),

FOREIGN KEY (OrderID) REFERENCES Orderr(Or
derID),

FOREIGN KEY (BookID) REFERENCES Book (BookID)

);