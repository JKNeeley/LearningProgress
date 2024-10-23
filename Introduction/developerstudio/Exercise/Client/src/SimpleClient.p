
/*------------------------------------------------------------------------
    File        : SimpleClient.p
    Purpose     : 

    Syntax      :

  
    Author(s)   : 
    Created     : Tue Nov 11 11:10:08 EST 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

block-level on error undo, throw.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */


define variable CustomerName as character no-undo.

/* normally the application server has the connection to the database
   so we add it here in our project AVM for testing purposes only */
   
run connect.p.

run GetFirstCustomerName.p (output CustomerName).

message "First Customer is: " CustomerName view-as alert-box.

return.
