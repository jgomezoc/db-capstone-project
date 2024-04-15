CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `CheckBooking`(booking_date DATE, table_no INT)
BEGIN
DECLARE is_present int;
DECLARE table_status varchar(45);

set is_present = (select exists (select bookingID from Bookings where bookingDate = booking_date and tableNo = table_no ));

if is_present = 1 then
    set table_status = " is already booked";
else
    set table_status = " is not booked";
end if;
select concat("Table ", table_no, table_status) as "Booking status";

END