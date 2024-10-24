/*------------------------------------------------------------------------
    File        : lMakeError.p
    Purpose     : This procedure assigns initials to the salresrep field that do not match any in the salesrep table.
  ----------------------------------------------------------------------*/

find first customer.
assign customer.salesrep = "ZZZ".
