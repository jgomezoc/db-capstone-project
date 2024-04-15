CREATE PROCEDURE `GetMaxQuantity` ()
BEGIN
select max(quantity) as `Max Quantity in Order`
from Orders;
END
