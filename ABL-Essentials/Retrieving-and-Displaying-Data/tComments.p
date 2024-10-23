/*------------------------------------------------------------------------
    File        : tComments.p
    Purpose     : Find all customers whose customer number is less than 3040
    Description : Display a message that shows the name of the customer and the contents of the Comments field.
                  Add a colon (:) between the customer name and the comment.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each customer where custnum < 3040:
    message Name ":" Comments view-as alert-box.
end.
