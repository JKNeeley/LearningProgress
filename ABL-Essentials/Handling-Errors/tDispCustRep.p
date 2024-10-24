/*------------------------------------------------------------------------
    File        : lDispCustRep.p
    Purpose     : Displays Customer number and name, the name of the Salesrep associated with the Customer, and the first invoice, if any, of the Customer.
  ----------------------------------------------------------------------*/


for each Customer no-lock:
  display Customer.CustNum format ">>>9"
          Customer.NAME format "x(20)". 
  find SalesRep of Customer no-lock.
  display SalesRep.RepName format "x(20)".
  find first Invoice of Customer no-lock no-error.
  if available(Invoice) then
    display Invoice.Amount format ">>,>>9".
end.
