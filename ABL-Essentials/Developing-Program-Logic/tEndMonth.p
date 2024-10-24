/*------------------------------------------------------------------------
    File        : tEndMonth
    Purpose     : Write a procedure that calculates the number of days until the end of the month.
    Description : Display a senence of the format "There are % days left till the end of this month."
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

define variable dtToday    as date      no-undo.
define variable dtEndMonth as date      no-undo .
define variable cEndMonth  as character no-undo .
define variable iNumDays   as integer   no-undo.

/* ***************************  Main Block  *************************** */

assign 
    dtToday    = today
    dtEndMonth = (today + 30) - day(today + 30).
iNumDays = dtEndMonth -  dtToday .

message "There are" iNumDays "days until the end of the month" 
    view-as alert-box.
