/*------------------------------------------------------------------------
    File        : tQuery.p
    Purpose     : Write a procedure that defines a query for the Item table and displays the item number, name, price, and number of items available.
    Description : Use the IF NOT AVAILABLE statement for the query.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define query qItem for Item.

open query qItem for each Item.

repeat:
    get next qItem.
    if not available Item then leave. 
    display item.ItemNum item.ItemName item.Price item.Onhand.
end.
close query qItem.
