/*------------------------------------------------------------------------
    File        : tDelCust.p
    Purpose     : Modified copy of the trigger procedure for deleting a customer.
  ----------------------------------------------------------------------*/


trigger procedure for delete of Customer.
define variable answer as logical.

/* Customer record cannot be deleted if outstanding invoices are found */
find first invoice of customer no-error.
if available invoice then do:
  if invoice.amount <= invoice.totalpaid + invoice.adjustment then do:
    message "Invoice OK, looking for Orders..." view-as alert-box.
    find first order of customer no-error.
    if not available order then return.
    else do:
      message "Open orders exist for Customer. Cannot delete."
              view-as alert-box.
      return error.     
    end.
  end.
  else do:
    message "Outstanding Unpaid Invoice Exists. Cannot Delete"
            view-as alert-box.
    return error.
  end.
end.   
else do:
  find first order of customer no-error.
  if not available order then return.
  else do:
    message "Open orders exist for Customer. Cannot delete."
            view-as alert-box.
    return error.
  end.
end.      

