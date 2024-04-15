CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `UpdateBooking`(booking_id int, booking_date date)
BEGIN

DECLARE check_bookingID int;
DECLARE check_date int;
DECLARE booking_status varchar(100);

set check_bookingID = (select exists (select bookingID from Bookings where bookingID = booking_id));
set check_date = (select exists (select bookingDate from Bookings where bookingDate = booking_date));

if check_bookingID = 0 then
    set booking_status = "Can not update, BookingID not present in table";
    select booking_status as "Confirmation";

elseif check_date = 1 then
    set booking_status = "Can not update, date already booked";
    select booking_status as "Confirmation";

else
    set booking_status = " updated";
    select concat("Booking ", booking_id, booking_status);
    update Bookings set bookingDate = booking_date where bookingID = booking_id; 
     
end if;

END