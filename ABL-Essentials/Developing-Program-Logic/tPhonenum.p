/*------------------------------------------------------------------------
    File        : tPhoneNum.p
    Purpose     : Display the area code of a telephone number.
    Description : Define a character variable to hold the value of a telephone number in your country, for example, 781-555-1111.
                  Specify the part of the telephone number that represents the area of the country where this number is located (such as Paris, northern Australia, the state of New Jersey, western Massachusetts). In the US, this is called the area code.
                  Write a display statement to view your results. For example, the displayed message might be: "My area code is 781."
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define variable cPhoneNum as character 
    format "(999)999-9999" initial "7812802000" no-undo.
define variable cAreaCode as character no-undo.

cAreaCode = substring(cPhoneNum,1,3).
display "My area code is" cAreaCode format "x(3)" no-label.
