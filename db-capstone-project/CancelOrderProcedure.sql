CREATE DEFINER=`capstoneProject`@`%` PROCEDURE `CancelOrder`(IN order_id INT)
BEGIN
DECLARE is_present INT;
DECLARE order_status VARCHAR(45);

SET is_present = (select exists (select orderID from Orders where orderID = order_id));

if is_present = 1 then
    /* DELETE FROM Orders WHERE orderID = order_id */
    set order_status = " is cancelled";
else
    set order_status = " not exists";
end if;

select concat("Order ", order_id, order_status) as "Confirmation";

END