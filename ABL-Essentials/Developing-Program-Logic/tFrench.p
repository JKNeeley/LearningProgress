/*------------------------------------------------------------------------
    File        : tFrench.p
    Purpose     : Offer alternative languages depending on the user's choice.
    Description : Use an alert box to determine whether your user speaks French (or any language of your choosing). If the response is positive, display a message in that language. If the response is negative, display a message in English
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/


define variable lChoice as logical no-undo.

message "Do you speak French?"
    view-as alert-box question buttons yes-no
    title "Language Choice " update lChoice.

if lChoice then 
    message "Bonjour.  C'est un beau jour."  
        view-as alert-box title "Réponse française".

else message "Hello. it's a beautiful day."  
        view-as alert-box title "English response".
