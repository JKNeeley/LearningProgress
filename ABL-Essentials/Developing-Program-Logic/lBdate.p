/*------------------------------------------------------------------------
    File        : lBdate.p
    Purpose     : Display your birthday and age.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define variable bdate as date initial 08/15/99.
define variable wday as character 
  initial "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday".
define variable yold as integer.

assign yold = truncate(((today - bdate) / 365.25), 0).  
display substitute("You were born on a &1.", entry(weekday(bdate), wday)) format "X(30)" skip(1)
        substitute("You are &1 years old.", yold) format "X(50)".  
