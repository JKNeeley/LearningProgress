/*------------------------------------------------------------------------
    File        : tAfter.p
    Purpose     : All orders shipped after 6/1/98, with the output in a single column.

    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each Order where Order.ShipDate > 6/1/1998:
    display Order with 1 column .
end .
