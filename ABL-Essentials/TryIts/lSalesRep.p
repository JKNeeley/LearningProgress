/*------------------------------------------------------------------------
    File        : lSalesRep.p
    Purpose     : Find and display all information in the SalesRep table except MonthQuota
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

REPEAT:
    FIND NEXT SalesRep.
    DISPLAY SalesRep EXCEPT MonthQuota.
END.
