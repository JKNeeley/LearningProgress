/*------------------------------------------------------------------------
    File        : lTrans1.p
    Purpose     : Identify transactions with a compile listing.
  ----------------------------------------------------------------------*/

define variable iLineNum as integer no-undo.

RepOrdblk:
repeat:
  create Order.
  display OrderNum.
  update Order.OrderDate Order.CustNum Order.Carrier.
  find Customer of Order.
  iLineNum = 0.
  RepOrdlineblk:
  repeat:
    create OrderLine.
    assign OrderLine.OrderNum = Order.OrderNum
           iLineNum = iLineNum + 1
           OrderLine.LineNum = iLineNum.
    assign Qty = 0.
    display LineNum.
    update OrderLine.ItemNum Qty.
  end. /* RepOrdlineblk */
end. /* RepOrdblk */ 
ForCustblk:
for each Order of Customer:
  display Order.CustNum Order.OrderNum.
  update Customer.SalesRep.
end. /* ForCustblk */
