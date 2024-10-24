/*------------------------------------------------------------------------
    File        : tList.p
    Purpose     : Display the number of items in a list and the third item in a list.
    Description : Define a variable to hold a list of several of your favorite kinds of beer, wine, or soft drink. Display a message in the format "There are 7 entries in the list. The third entry is Port ."
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define variable cWine as character 
    initial "Zinfandel,Sake,Port,Chardonnay,Chianti,Merlot,Shiraz" no-undo.

message substitute("There are &1 entries in the list", num-entries(cWine)) skip(1) 
    substitute("The third entry is &1", entry(3,cWine)) view-as alert-box.
