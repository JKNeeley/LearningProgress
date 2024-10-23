
/*------------------------------------------------------------------------
    File        : tGo.p
    Purpose     : Find all items with the string “Go” in their name. Display the item name.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each Item where item.ItemName matches "*go*":
    display Item.ItemName.
end.
