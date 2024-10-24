/*------------------------------------------------------------------------
    File        : tNextCustNum.p
    Purpose     : Verify sequence modifications. 
    Description : Display the customer number and name of the last customer.
                  Create a new customer, assign a name to the customer and display the customer number and name.
                  Modify the sequence such that the customer number increments by 10.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

find last Customer.
display Customer.Custnum Customer.Name.
pause.
create Customer.
assign 
    Name = "Weinberg".
display Customer.Custnum Customer.Name.
