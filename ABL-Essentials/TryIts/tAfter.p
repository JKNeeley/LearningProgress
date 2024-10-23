/*------------------------------------------------------------------------
    File        : tAfter.p
    Purpose     : All orders shipped after 6/1/98, with the output in a single column.

    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each Customer where Balance >= 30000:
    display Customer.Name Customer.Balance .
end .
