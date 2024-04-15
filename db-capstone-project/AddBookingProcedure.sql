CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `AddBooking`(booking_id int, customer_id int, table_no int, booking_date date)
BEGIN
DECLARE is_present int;
DECLARE check_bookingID int;
DECLARE check_customerID int;
DECLARE booking_status varchar(45);

set is_present = (select exists (select bookingID from Bookings 
                                 where bookingDate = booking_date  
                                   and tableNo = table_no));

set check_bookingID = (select exists (select bookingID from Bookings where bookingID = booking_id));
set check_customerID = (select exists (select customerID from CustomerDetails where customerID = customer_id));

if is_present = 1 then
    set booking_status = " is already booked for date: ";
    select concat("Table ", table_no, booking_status, booking_date) as "Confirmation";

elseif check_bookingID = 1 then
    set booking_status = "BookingID is present, select ";
    select concat( booking_status, max(bookingID)+1 ) as "Confirmation" from Bookings;
    
else
    if check_customerID = 0 then
        insert into CustomerDetails (CustomerID) 
                             values (customer_id);
    end if;
    
    set booking_status = "New booking added";
	select booking_status as "Confirmation";
	insert into Bookings(bookingID, bookingDate, tableNo, customerID, staffID)
				  values(booking_id, booking_date, table_no, customer_id, 3);
end if;

END