USE littlelemondb;
-- Structure of the Bookings Table
DESCRIBE Bookings;
-- If the TableNumber column does not exist, you can add it using the following SQL statement:
ALTER TABLE Bookings ADD COLUMN TableNumber INT;
-- ============================Task 1 Exercise============================
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);
DESCRIBE Bookings;
-- Verify the output to check if the table is created and populated correctly.
SELECT * FROM Bookings;

