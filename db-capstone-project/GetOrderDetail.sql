prepare GetOrderDetail from '
select o.orderID, o.quantity, o.cost
from Bookings as b
join Orders as o on o.orderID = b.orderID 
where b.customerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

DEALLOCATE PREPARE GetOrderDetail;
