CREATE DATABASE Hotel;

USE Hotel;

CREATE TABLE Position 
(
Id INT NOT NULL PRIMARY KEY,
PositionName NVARCHAR(70) NOT NULL
);

CREATE TABLE Category 
(
Id INT NOT NULL PRIMARY KEY,
CategoryName NVARCHAR(70) NOT NULL
);


CREATE TABLE Employee (
Id INT NOT NULL PRIMARY KEY,
LastName NVARCHAR(50) NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
MiddleName NVARCHAR(50) NOT NULL,
DateOfBirth DATETIME NOT NULL,
PositionId INT NOT NULL,
Salary MONEY NOT NULL,
CONSTRAINT employee_position_fk FOREIGN KEY(PositionId) REFERENCES Position(Id)
);



CREATE TABLE Room (
Id INT NOT NULL PRIMARY KEY,
RoomNumber NVARCHAR(10) NOT NULL,
PricePerDay MONEY NOT NULL,
NumberOfSeats INT NOT NULL,
CategoryId INT NOT NULL,
CONSTRAINT room_category_fk FOREIGN KEY(CategoryId) REFERENCES Category(Id)
);

CREATE TABLE Customer (
Id INT NOT NULL PRIMARY KEY,
LastName NVARCHAR(50) NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
MiddleName NVARCHAR(50) NOT NULL,
DateOfBirth DATETIME NOT NULL,
Sex NVARCHAR(20) NOT NULL,
AddressCustomer NVARCHAR(70) NOT NULL,
);

CREATE TABLE Reservation (
Id INT NOT NULL PRIMARY KEY,
EmployeeId INT NOT NULL,
RoomId INT NOT NULL,
ArrivalDate DATETIME NOT NULL,
DepartureDate DATETIME NOT NULL,
CheckIn BIT NOT NULL,
CheckOut BIT NOT NULL,
CONSTRAINT reservation_employee_fk FOREIGN KEY(EmployeeId) REFERENCES Employee(Id),
CONSTRAINT reservation_room_fk FOREIGN KEY(RoomId) REFERENCES Room(Id),

);

DROP TABLE Reservation;

CREATE TABLE Reservation_Customer (
Id INT NOT NULL PRIMARY KEY,
CustomerId INT NOT NULL,
ReservationId INT NOT NULL,
CONSTRAINT reservation_customer_customer FOREIGN KEY(CustomerId) REFERENCES Customer(Id),
CONSTRAINT reservation_customer_reservation FOREIGN KEY(ReservationId) REFERENCES Reservation(Id)
);


