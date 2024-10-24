/*------------------------------------------------------------------------
    File        : lTrans2.p
    Purpose     : Identify transactions with a compile listing.
  ----------------------------------------------------------------------*/

Repblk:
repeat with 1 column:
  prompt-for ItemName.
  find item using ItemName no-error.
  if not available item then 
  AskQuestion:
  do:
    message "The item" input ItemName "does not exist."
      "Do you wish to add this item?" 
      view-as alert-box question button yes-no
      update lAnswer as logical.
    if lAnswer then create ITEM.
    assign ItemName.
    set Item except ItemNum.
  end. /* AskQuestion */
  display Item.ItemName.
end. /* Repblk */  
