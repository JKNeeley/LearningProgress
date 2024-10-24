/*------------------------------------------------------------------------
    File        : tMidnight.p
    Purpose     : Write a procedure to calculate and display the number of hours, minutes, and seconds until midnight.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

define variable Hour     as integer no-undo.
define variable Minute   as integer no-undo.
define variable Sec      as integer no-undo.
define variable Timeleft as integer no-undo.

/* ***************************  Main Block  *************************** */

assign 
    Timeleft = (24 * 60 * 60) - time
    Sec      = Timeleft modulo 60 /* seconds till next midnight */
    Timeleft = (Timeleft - Sec) / 60
    Minute   = Timeleft modulo 60 /* minutes till next midnight */
    Hour     = (Timeleft - Minute) / 60 /* hours till next midnight */.

message "Time to midnight:" skip 
    "Total seconds:" Timeleft skip
    Hour "hours" Minute "minutes" Sec "seconds" 
    view-as alert-box. 
