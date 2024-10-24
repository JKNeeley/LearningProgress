/*------------------------------------------------------------------------
    File        : tDispCustRep.p
    Purpose     : Add a DO ON ERROR UNDO, LEAVE statement around the FIND and DISPLAY Salesrep statement to lDispCust.p for better error handling.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each Customer no-lock:
    display Customer.CustNum format ">>>9"
        Customer.NAME format "x(20)". 

    do on error undo, leave:
        find SalesRep no-lock of Customer no-error.
        if available SalesRep then 
            display SalesRep.RepName format "x(20)".
    end.
    find first Invoice no-lock of Customer no-error.
    if available(Invoice) then
        display Invoice.Amount format ">>,>>9".
end.
