/*------------------------------------------------------------------------
    File        : tCountingWhile.p
    Purpose     : Use a while to loop through messages.
    Description : Display an alert box with a message, Even numbers from 2 to 20:. The alert box shows the number 2 during the first iteration, then shows the next even number at the next iteration, and so on, until 20 is displayed on the last iteration.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define variable iCounter as integer initial 2 no-undo.

do while iCounter < 21:
    message "Even numbers from 2 to 20:" iCounter view-as alert-box.
    assign 
        iCounter = iCounter + 2.
end.
