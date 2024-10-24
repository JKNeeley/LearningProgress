
/*------------------------------------------------------------------------
    File        : tMult2.p
    Purpose     : Modify the code in tMult.p to show only the first order for each customer.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define query qOrder for Customer, Order.
open query qOrder for each Customer,
    first Order of Customer
    by Customer.CustNum
    by OrderDate.
repeat:
    get next qOrder.
    if not available Order then leave.
    display Customer.CustNum Customer.Name Order.OrderNum Order.OrderDate.
end.
close query qOrder.
