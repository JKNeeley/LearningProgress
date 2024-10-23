
/*------------------------------------------------------------------------
    File        : GetFirstCustomerName.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : Jade Neeley
    Created     : Wed Oct 2 16:36:47 UTC 2024
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

block-level on error undo, throw.
define output parameter pCustomerName as character no-undo.
/* ********************  Preprocessor Definitions  ******************** */

/* ***************************  Main Block  *************************** */
find last Customer no-error.
pCustomerName = Customer.Name.
return.
