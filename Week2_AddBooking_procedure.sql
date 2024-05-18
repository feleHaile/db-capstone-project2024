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
-- the stored procedure UpdateBooking does not exist in the littlelemondb database. Let's create the UpdateBooking procedure first, and then we can call it to update a booking.
-- SQL Code to Create the Procedure

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN new_booking_date DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = new_booking_date
    WHERE BookingID = booking_id;
END //

DELIMITER ;

-- Update the booking with BookingID = 2 to have a new date
CALL UpdateBooking(2, '2023-01-01');
-- Select all records from the Bookings table to confirm the update
SELECT * FROM Bookings;
-- ============================== Task 3 CancelBooking==========================================================================
-- Create the CancelBooking procedure
DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = booking_id;
END //

DELIMITER ;

-- Call the CancelBooking procedure
CALL CancelBooking(2);

-- Verify the deletion
SELECT * FROM Bookings;
