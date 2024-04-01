CREATE DATABASE Dealership;
GO

USE Dealership;
GO

CREATE TABLE Customers(
	ID_Customer INT PRIMARY KEY IDENTITY(1,1),
	CustomerSurname VARCHAR(50) NOT NULL,
	CustomerName VARCHAR(50) NOT NULL,
	CustomerMiddleName VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(11) NOT NULL UNIQUE,
	Email VARCHAR(100) NOT NULL UNIQUE
);
GO

INSERT INTO Customers(CustomerSurname, CustomerName, CustomerMiddleName, PhoneNumber, Email)
VALUES
	('Васильева', 'Ариана', 'Евгеньева', '79338729980', 'vasileva@mail.ru'),
	('Макарова', 'Ксения', 'Данииловна', '79064423361', 'makarov@gmail.com'),
	('Леонов', 'Степан', 'Александрович', '79309033880', 'leonov@ya.ru'),
	('Сизова', 'София', 'Богдановна', '79641567792', 'sizova@mail.ru'),
	('Комаров', 'Данила', 'Иванович', '79316925523', 'komarov@ya.ru`');
GO

CREATE TABLE Models(
	ID_Model INT PRIMARY KEY IDENTITY(1,1),
	ModelName VARCHAR(50) NOT NULL UNIQUE
);
GO

INSERT INTO Models(ModelName)
VALUES
	('F8 Tributo'),
	('RS5'),
	('AMG GT'),
	('Cayenne'),
	('Tiguan');
GO

CREATE TABLE Brands(
	ID_Brand INT PRIMARY KEY IDENTITY(1,1),
	BrandName VARCHAR(50) NOT NULL UNIQUE
);
GO

INSERT INTO Brands(BrandName)
VALUES
	('Ferrari'),
	('Audi'),
	('Mercedes-Benz'),
	('Porsche'),
	('Volkswagen');
GO

CREATE TABLE Vehicles(
	ID_Vehicle INT PRIMARY KEY IDENTITY(1,1),
	Years VARCHAR(4) NOT NULL,
	Price DECIMAL(18,2) NOT NULL
);
GO

INSERT INTO Vehicles(Years, Price)
VALUES
	('2021', '35000000.00'),
	('2018', '7990000.00'),
	('2017', '11500000.00'),
	('2013', '2800000.00'),
	('2021', '2145910.00');
GO

CREATE TABLE Orders(
	ID_Order INT PRIMARY KEY IDENTITY(1,1),
	Customer_ID INT NOT NULL FOREIGN KEY REFERENCES Customers(ID_Customer),
	Vehicle_ID INT NOT NULL FOREIGN KEY REFERENCES Vehicles(ID_Vehicle),
	Model_ID INT NOT NULL FOREIGN KEY REFERENCES Models(ID_Model),
	Brand_ID INT NOT NULL FOREIGN KEY REFERENCES Brands(ID_Brand),
	OrderDate DATE NOT NULL,
	Amount INT NOT NULL
);
GO

INSERT INTO Orders(Customer_ID, Vehicle_ID, Model_ID, Brand_ID, OrderDate, Amount)
VALUES
    (1, 1, 1, 1, '27-02-2024', 1),
    (2, 3, 2, 2, '10-06-2023', 2),
    (3, 2, 3, 3, '28-08-2023', 1),
    (4, 4, 4, 4, '26-10-2023', 1),
    (5, 5, 5, 5, '15-06-2023', 3);
GO

SELECT * FROM Customers
SELECT * FROM Models
SELECT * FROM Brands
SELECT * FROM Vehicles
SELECT * FROM Orders

SELECT 
    Orders.ID_Order,
    Customers.ID_Customer,
    Customers.CustomerSurname, 
    Customers.CustomerName, 
    Customers.CustomerMiddleName, 
    Customers.PhoneNumber, 
    Customers.Email, 
    Vehicles.ID_Vehicle,
    Models.ID_Model,
    Brands.ID_Brand,
    Models.ModelName, 
    Brands.BrandName, 
    Vehicles.Years, 
    Vehicles.Price, 
    Orders.OrderDate, 
    Orders.Amount
FROM Orders
INNER JOIN Customers ON Orders.Customer_ID = Customers.ID_Customer
INNER JOIN Vehicles ON Orders.Vehicle_ID = Vehicles.ID_Vehicle
INNER JOIN Models ON Orders.Model_ID = Models.ID_Model
INNER JOIN Brands ON Orders.Brand_ID = Brands.ID_Brand;