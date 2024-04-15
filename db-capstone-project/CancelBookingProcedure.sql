CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `CancelBooking`(booking_id int)
BEGIN

DECLARE check_bookingID int;
DECLARE booking_status varchar(100);

set check_bookingID = (select exists (select bookingID from Bookings where bookingID = booking_id));

if check_bookingID = 0 then
    set booking_status = "Can not cancel, BookingID not present in table";
   
else
    set booking_status = (select concat("Booking ", booking_id, " cancelled"));
    delete from Bookings where bookingID = booking_id;
    
end if;
select booking_status as "Confirmation";

END