
/*------------------------------------------------------------------------
    File        : GetFirstCustomerName.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 10 09:04:46 EDT 2015
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

block-level on error undo, throw.
define output parameter pCustomerName as character no-undo.
/* ********************  Preprocessor Definitions  ******************** */

/* ***************************  Main Block  *************************** */
find first Customer no-error.
pCustomerName = Customer.Name.
return.