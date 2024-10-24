/*------------------------------------------------------------------------
    File        : tPhoneNum.p
    Purpose     : Display the area code of a telephone number.
    Description : Define a character variable to hold the value of a telephone number in your country, for example, 781-555-1111.
                  Specify the part of the telephone number that represents the area of the country where this number is located (such as Paris, northern Australia, the state of New Jersey, western Massachusetts). In the US, this is called the area code.
                  Write a display statement to view your results. For example, the displayed message might be: "My area code is 781."
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define variable cWine as character 
    initial "Zinfandel,Sake,Port,Chardonnay,Chianti,Merlot,Shiraz" no-undo.

message substitute("There are &1 entries in the list", num-entries(cWine)) skip(1) 
    substitute("The third entry is &1", entry(3,cWine)) view-as alert-box.
