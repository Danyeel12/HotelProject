--1
CREATE TABLE Hotels (
  Hotel_ID NUMBER(10) PRIMARY KEY,
  Hotel_Name VARCHAR2(50),
  Address VARCHAR2(100),
  City VARCHAR2(50),
  State VARCHAR2(50),
  Zip_Code VARCHAR2(10),
  Phone_Number VARCHAR2(15),
  Website VARCHAR2(100)
);
-- Insert a new hotel
INSERT INTO Hotels (Hotel_ID, Hotel_Name, Address, City, State, Zip_Code, Phone_Number, Website)
VALUES (1, 'Example Hotel', '123 Main St', 'Anytown', 'CA', '12345', '555-1234', 'www.examplehotel.com');

-- Retrieve all hotels
SELECT * FROM Hotels;

-- Update a hotel's phone number
UPDATE Hotels
SET Phone_Number = '555-5678'
WHERE Hotel_ID = 1;

-- Delete a hotel
DELETE FROM Hotels
WHERE Hotel_ID = 1;

-- Create Rooms table
CREATE TABLE Rooms (
  Room_ID NUMBER(10) PRIMARY KEY,
  Hotel_ID NUMBER(10) REFERENCES Hotels(Hotel_ID),
  Room_Number VARCHAR2(10),
  Room_Type VARCHAR2(50),
  Price_Per_Night NUMBER(10,2)
);

--2
-- Insert a new room
INSERT INTO Rooms (Room_ID, Hotel_ID, Room_Number, Room_Type, Price_Per_Night)
VALUES (1, 1, '101', 'Standard', 100.00);

-- Retrieve all rooms at a hotel
SELECT * FROM Rooms
WHERE Hotel_ID = 1;

-- Update a room's price per night
UPDATE Rooms
SET Price_Per_Night = 110.00
WHERE Room_ID = 1;

-- Delete a room
DELETE FROM Rooms
WHERE Room_ID = 1;

--3
-- Create Bookings table
CREATE TABLE Bookings (
  Booking_ID NUMBER(10) PRIMARY KEY,
  Room_ID NUMBER(10) REFERENCES Rooms(Room_ID),
  Guest_Name VARCHAR2(100),
  Check_in_Date DATE,
  Check_out_Date DATE
);

-- Insert a new booking
INSERT INTO Bookings (Booking_ID, Room_ID, Guest_Name, Check_in_Date, Check_out_Date)
VALUES (1, 1, 'John Smith', TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), TO_DATE('03-JAN-2023', 'DD-MON-YYYY'));

-- Retrieve all bookings for a room
SELECT * FROM Bookings
WHERE Room_ID = 1;

-- Update a booking's check-in date
UPDATE Bookings
SET Check_in_Date = TO_DATE('02-JAN-2023', 'DD-MON-YYYY')
WHERE Booking_ID = 1;

--4
-- Create Guests table
CREATE TABLE Guests (
  Guest_ID NUMBER(10) PRIMARY KEY,
  First_Name VARCHAR2(50),
  Last_Name VARCHAR2(50),
  Email VARCHAR2(100),
  Phone_Number VARCHAR2(15)
);

-- Insert a new guest
INSERT INTO Guests (Guest_ID, First_Name, Last_Name, Email, Phone_Number)
VALUES (1, 'John', 'Smith', 'john.smith@example.com', '555-1234');

-- Retrieve all guests
SELECT * FROM Guests;

-- Update a guest's phone number
UPDATE Guests
SET Phone_Number = '555-5678'
WHERE Guest_ID = 1

--5
-- Create Employees table
CREATE TABLE EMPLOYEES (
  Employee_ID NUMBER(10) PRIMARY KEY,
  Hotel_ID NUMBER(10) REFERENCES Hotels(Hotel_ID),
  First_Name VARCHAR2(50),
  Last_Name VARCHAR2(50),
  Job_Title VARCHAR2(50),
  Department VARCHAR2(50)
);

Drop table employees;

INSERT INTO Employees (Employee_ID, Hotel_ID, First_Name, Last_Name, Job_Title, Department)
VALUES (1, 1, 'John', 'Doe', 'Manager', 'Front Desk');

-- Retrieve all employees
SELECT * FROM Employees;

-- Update an employee's job title
UPDATE Employees
SET Job_Title = 'Assistant Manager'
WHERE Employee_ID = 1;


-6
-- Create Departments table
CREATE TABLE Departments (
  Department_ID NUMBER(10) PRIMARY KEY,
  Department_Name VARCHAR2(50)
);

-- Insert a new department
INSERT INTO Departments (Department_ID, Department_Name)
VALUES (1, 'Housekeeping');

-- Retrieve all departments
SELECT * FROM Departments;

-- Update a department's name
UPDATE Departments
SET Department_Name = 'Maintenance'
WHERE Department_ID = 1;

--7
-- Create Job Titles table
CREATE TABLE Job_Titles (
  Job_Title_ID NUMBER(10) PRIMARY KEY,
  Job_Title_Name VARCHAR2(50)
);

-- Insert a new job title
INSERT INTO Job_Titles (Job_Title_ID, Job_Title_Name)
VALUES (1, 'Housekeeper');

-- Retrieve all job titles
SELECT * FROM Job_Titles;

-- Update a job title's name
UPDATE Job_Titles
SET Job_Title_Name = 'Maintenance Technician'
WHERE Job_Title_ID = 1;

--8
CREATE TABLE Services (
  Service_ID NUMBER(10) PRIMARY KEY,
  Service_Name VARCHAR2(50),
  Price NUMBER(10,2)
);

INSERT INTO Services (Service_ID, Service_Name, Price) VALUES (1, 'Room Service', 50);

--9
CREATE TABLE Service_Requests (
  Service_Request_ID NUMBER(10) PRIMARY KEY,
  Guest_ID NUMBER(10) REFERENCES Guests(Guest_ID),
  Service_ID NUMBER(10) REFERENCES Services(Service_ID),
  Status VARCHAR2(50)
);
INSERT INTO Service_Requests (Service_Request_ID, Guest_ID, Service_ID, Status) VALUES (1, 1, 1, 'Pending')

--10
CREATE TABLE Payments (
  Payment_ID NUMBER(10) PRIMARY KEY,
  Guest_ID NUMBER(10) REFERENCES Guests(Guest_ID),
  Amount NUMBER(10,2),
  Payment_Date DATE
);
INSERT INTO Payments (Payment_ID, Guest_ID, Amount, Payment_Date) VALUES (1, 1, 100, TO_DATE('2023-04-09', 'YYYY-MM-DD'));



--DDL
--1
Select * from hotels;
ALTER TABLE hotels
ADD Province VARCHAR(100);

--putting a value in the province
UPDATE Hotels
SET Province = 'Ontario'
WHERE Hotel_ID = 1;

--2
SELECT * FROM Rooms;
ALTER TABLE Rooms
ADD Floor_number VARCHAR(100);

--putting a value in the floor number
UPDATE Rooms
SET Floor_number = '26th'
WHERE Room_ID = 1;

--3
SELECT * FROM Bookings;
--Add check in time
ALTER TABLE Bookings
ADD Check_In_Time TIMESTAMP DEFAULT TO_TIMESTAMP('08:00:00', 'HH24:MI:SS') NOT NULL;

--Add check out time
ALTER TABLE Bookings
ADD Check_Out_Time TIMESTAMP DEFAULT TO_TIMESTAMP('08:00:00', 'HH24:MI:SS') NOT NULL;


--4
SELECT * FROM Guests;
ALTER TABLE Guests
ADD Government_issued_Id VARCHAR(100);

--Add Id
UPDATE Guests
SET Government_issued_Id = 'Passport'
WHERE Guest_ID = 1;

--5
SELECT * FROM Employees;
ALTER TABLE Employees
ADD Length_of_services_in_Years Number(10);

--Value for Length of services
UPDATE Employees
SET Length_of_services_in_Years = 5
WHERE Employee_ID = 1;

--6
SELECT * FROM Departments;
ALTER TABLE Departments
ADD Room_Number Number(20);

--value for room number
UPDATE Departments
SET Room_Number = 65
WHERE Department_ID = 1;

--7
SELECT * FROM Job_Titles;
ALTER TABLE Job_Titles
ADD Job_Description VARCHAR(100);

--Value for Job Description
UPDATE Job_Titles
SET Job_Description = 'Junior'
WHERE Job_Title_ID = 1;

--8
Select * From Services;
ALTER TABLE Services
ADD Housekeeper varchar(100);

--name of housekeeper
UPDATE Services
SET Housekeeper = 'John Doe'
WHERE Service_id = 1;

--9
Select * from Service_Requests;
ALTER TABLE Service_Requests
ADD Type_of_Request Varchar(100);

--type of request
UPDATE Service_Requests
SET Type_of_Request= 'Housekeeping'
WHERE Service_Request_id = 1;

--10
Select * from payments;
ALTER TABLE payments
ADD Mode_of_payment Varchar(100);

--Mode of payment
UPDATE payments
SET Mode_of_payment = 'Credit Card'
WHERE payment_id = 1;

--DML
--1
Select * from hotels;

INSERT INTO Hotels (Hotel_ID, Hotel_Name, Address, City, State, Zip_Code, Phone_Number, Website)
VALUES (2, 'Grand Hotel', '123 Main St', 'New York', 'New York', '10001', '555-1234', 'www.grandhotel.com');


UPDATE Hotels
SET Phone_Number = '555-5678', Website = 'www.hotelxyz.com'
WHERE Hotel_ID = 2;

--2
SELECT * FROM Rooms
INSERT INTO Rooms (Room_ID, Hotel_ID, Room_Number, Room_Type, Price_Per_Night)
VALUES (2, 1, '101', 'Standard', 100.00);

UPDATE Rooms
SET Floor_Number = '20th'
WHERE Room_ID = 2;

--3
select * from Services
INSERT INTO Services (Service_ID, Service_Name, Price)
VALUES (2, 'Massage', 50.00);

Update Services
Set Housekeeper = 'jane'
Where Service_ID = 2;

--Operators
SELECT SUM(Price) AS TotalRevenue
FROM Services;

Select * from Services;

--Functions
CREATE OR REPLACE FUNCTION get_service_price(service_id NUMBER)
RETURN NUMBER
AS
  price SERVICES.PRICE%TYPE;
BEGIN
  SELECT MAX(Price) INTO price
  FROM Services
  WHERE Service_ID = service_id;
  
  RETURN price;
END;

SELECT get_service_price(1) AS price FROM dual;
