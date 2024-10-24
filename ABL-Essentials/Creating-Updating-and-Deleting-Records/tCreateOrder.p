/*------------------------------------------------------------------------
    File        : tCreateOrder.p
    Purpose     : Test trigger updates in CrOrderTRIGGER.p.
    Description : Create an order.
                  Display the order number, order date, and promise date.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

create Order.
display Order.Ordernum Order.OrderDate Order.PromiseDate.
