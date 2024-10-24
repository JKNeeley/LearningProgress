
/*------------------------------------------------------------------------
    File        : tMult.p
    Purpose     : Create a query to:
                        Find the orders for each customer.
                        Sort the results list by customer number and order date.
                        Display the customer number, customer name, order number, and order date.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define query qOrder for Customer, Order.
open query qOrder for each Customer,
    each Order of Customer
    by Customer.CustNum
    by OrderDate.
repeat:
    get next qOrder.
    if not available Order then leave.
    display Customer.CustNum Customer.Name Order.OrderNum Order.OrderDate.
end.
close query qOrder.
