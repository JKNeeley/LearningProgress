
/*------------------------------------------------------------------------
    File        : tDelCust2.p
    Purpose     : Modify lDelCust.p to use the RETURN ERROR statement . 
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

trigger procedure for delete of Customer.
define variable answer as logical.

/* Customer record cannot be deleted if outstanding invoices are found */
find first invoice of customer no-error.
if available invoice then 
do:
    if invoice.amount <= invoice.totalpaid + invoice.adjustment then 
    do:
        message "Invoice OK, looking for Orders..."
            view-as alert-box. 
        find first order of customer no-error.
        if not available order then 
        do:
            return.
        end.   
        else 
        do:
            // message "Open orders exist for Customer. Cannot delete." view-as alert-box. 
            return error "Open orders exist for Customer. Cannot delete.".     
        end.
    end.
    else 
    do:
        // message "Outstanding Unpaid Invoice Exists. Cannot Delete" view-as alert-box. 
        return error "Outstanding Unpaid Invoice Exists. Cannot Delete".
    end.
end.   
else 
do:
    find first order of customer no-error.
    if not available order then 
    do:
        return.
    end.   
    else 
    do:
        // message "Open orders exist for Customer. Cannot delete." view-as alert-box. 
        return error "Open orders exist for Customer. Cannot delete.".
    end.
end.      
