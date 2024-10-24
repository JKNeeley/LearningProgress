/*------------------------------------------------------------------------
    File        : tTestTrigger.p
    Purpose     : Test the delete customer trigger: tDelCust2.p
    Description : Prompt the user for a customer number.
                  Delete the customer using the NO-ERROR option.
                  Test the ERROR-STATUS:ERROR handle to see if an error occurred.
                  DISPLAY the error string returned from the trigger.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

prompt-for Customer.CustNum.
find Customer where Customer.CustNum = input Customer.CustNum.
delete Customer no-error.

if error-status:error then
    message return-value view-as alert-box.
