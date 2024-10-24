
/*------------------------------------------------------------------------
    File        : tDelParentChild.p
    Purpose     : Delete a record and all it's children.

    Syntax      :

    Description : Find the child records (Invoice and Order) of Customer No: 3255 and delete them first. Include messages to identify what is happening.
Delete the parent record Customer No: 3255.

    Author(s)   : Jade Neeley
    Created     : Thu Oct 24 13:22:35 UTC 2024
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

define variable iCustNum as integer initial 3255 no-undo.
define variable lYesno   as logical no-undo.

/* ***************************  Main Block  *************************** */

/* Delete Invoice child                                                 */
for each Invoice where Invoice.CustNum = iCustNum:
    message "Are you sure you want to delete invoice#" invoice.invoicenum 
        "of customer #" invoice.custnum view-as alert-box buttons yes-no 
        update lYesno.

    if lYesno then
        delete Invoice.
    else 
    do: /* DO statement #1 */
        message "Cancelled deletion of invoice #" invoice.invoicenum .
        return no-apply.
    end. /* End DO statement #1 */
end. /* End FOR EACH Invoice */

/* Delete Order child                                                    */
for each Order where Order.CustNum = iCustNum:
    message "Are you sure you want to delete order #" Order.Ordernum 
        "of customer #" Order.CustNum view-as alert-box buttons yes-no update lYesno.
    if lYesno then
        delete Order.
    else 
    do: /* DO statement #2 */
        message "Cancelled deletion of order #" Order.Ordernum .
        return.
    end. /* End DO statement #2 */
end. /* End FOR EACH Order */

/* Delete Customer parent                                                */
find Customer where Customer.CustNum = iCustNum.
message " Are you sure you want to delete  customer #" customer.custnum  
    view-as alert-box buttons yes-no update lYesno.
if lYesno then
    delete Customer.
else 
do: /* DO statement #3 */
    message "Cancelled deletion of customer #" customer.custnum .
    return.
end. /* DO statement #3 */
