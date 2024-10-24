
/*------------------------------------------------------------------------
    File        : tIncreasePrice.p
    Purpose     : Modify Order# 10000 to reflect an increase of the price of its products by 25%.
    Description : Store the original price as a variable.
                  Increase the price in each Orderline for Order# 10000 by 25%.
                  Display the line number, original price, and revised price.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define variable dPrice as decimal no-undo.

for each Orderline where ordernum = 10000:
    assign 
        dPrice = Orderline.Price
        Orderline.Price  = Orderline.Price * 1.25.
    display Orderline.Linenum 
        Orderline.Price  label "New price" 
        dPrice label "Old price" format "$>,>>>9.99".
end.
