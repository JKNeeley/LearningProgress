
/*------------------------------------------------------------------------
    File        : tNewLineNum.p
    Purpose     : Assign Orderline numbers automatically when a new order is created.
    Description : Create a new procedure called tNewLineNum.p in Progress Developer Studio.
                  Define a variable to store the value of the Orderline number.
                  Write code to find the latest Order in the database.
                  Write code to find the last Orderline for that Order.
                  Determine the appropriate value for the next line number and assign it to your variable. If this is the first line number, assign it a value of 1.
                  Create a new Orderline record and populate it with the appropriate OrderNum and LineNum. Also assign some values for ItemNum, Price, and Qty.
                  Display the Orderline record.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define variable iOrderLine as integer. 

find last Order.
find last Orderline of Order.
if available OrderLine then
    assign iOrderLine = Orderline.LineNum + 1. 
if not available OrderLine then
    assign iOrderLine = 1.

create Orderline.
assign 
    Orderline.LineNum  = iOrderLine
    Orderline.OrderNum = Order.OrderNum
    Orderline.ItemNum            = 7
    Orderline.Price              = 1.20
    Orderline.Qty                = 6.
display orderline with 1 column.
