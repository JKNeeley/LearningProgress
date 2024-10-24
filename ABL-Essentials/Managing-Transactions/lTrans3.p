/*------------------------------------------------------------------------
    File        : lTrans2.p
    Purpose     : Reduce scope of transactions in lTrans2.p and identify transactions with a compile listing.
    Author(s)   : modified by Jade Neeley
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
    if lAnswer then do transaction:
      create ITEM.
      assign ItemName.
      set ITEM except ItemNum.
    end. /* CreateItem */
    else leave.
  end. /* AskQuestion */
  display ITEM except ItemImage.
end. /* Repblk */ 
