-- To create a stored procedure called AddBooking that adds a new table booking record, you can follow these steps:

-- Define the stored procedure with input parameters for booking details.
-- Insert the new booking into the Bookings table.
USE littlelemondb;
DELIMITER //

CREATE PROCEDURE AddBooking(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    -- Insert the new booking record into the Bookings table
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (p_BookingID, p_CustomerID, p_BookingDate, p_TableNumber);
END //

DELIMITER ;
-- To use the 'AddBooking' procedure, we can call it with the desired booking details:
-- Then the call attempt will add a booking with booking ID 1, customer ID 1, booking date '2022-10-10', and table number 5.
CALL AddBooking(6, 4, '2022-10-15', 4);
CALL AddBooking(7, 2, '2022-12-15', 6);
-- Adding another new booking
CALL AddBooking(8, 3, '2022-12-20', 7);

SELECT * FROM Bookings;
-- =========================== TASK 2 UpdateBooking=======================================
-- Update the booking with BookingID = 2 to have a new date
CALL UpdateBooking(2, '2023-01-01');
