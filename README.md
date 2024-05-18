Welcome to the Little Lemon Database Project! This repository contains the SQL scripts and stored procedures used to manage the bookings system for the Little Lemon restaurant. 
This is part of my weekly exercises and projects for the Meta Database Engineer course.

Database Structure
The database includes the following tables:

Customers

CustomerID: INT, Primary Key
FullName: VARCHAR(255)
Bookings

BookingID: INT, Primary Key
BookingDate: DATE
TableNumber: INT
CustomerID: INT, Foreign Key
Orders

OrderID: INT, Primary Key
TotalCost: DECIMAL(10,2)
CustomerID: INT, Foreign Key
StaffID: INT, Foreign Key
Menus

MenuID: INT, Primary Key
MenuName: VARCHAR(255)
MenuItems

MenuItemID: INT, Primary Key
CourseName: VARCHAR(255)
StarterName: VARCHAR(255)
MenuID: INT, Foreign Key
Menu_Has_Orders

MenuID: INT, Foreign Key
OrderID: INT, Foreign Key
MenuItemID: INT, Foreign Key
OrderDeliveryStatus

OrderID: INT, Primary Key
Status: VARCHAR(100)
DeliveryDate: DATE
Staff

StaffID: INT, Primary Key
Name: VARCHAR(255)
Role: VARCHAR(100)
Stored Procedures
AddBooking: Adds a new booking record.
UpdateBooking: Updates an existing booking record.
CancelBooking: Deletes a booking record.
CheckBooking: Checks if a table is already booked.
AddValidBooking: Adds a booking only if the table is not already booked.
