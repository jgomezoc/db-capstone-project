CREATE VIEW `OrdersView` AS
select orderID, quantity, cost
from Orders
where quantity > 2