/*------------------------------------------------------------------------
    File        : tCustBalance.p
    Purpose     : The customer’s name and balance for customers with a balance of at least $30,000.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each Customer where Balance >= 30000:
    display Customer.Name Customer.Balance .
end .
