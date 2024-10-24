
/*------------------------------------------------------------------------
    File        : tChangeDept3.p
    Purpose     : Modify tChangeDept2.p to employ complete optimistic locking, and include checking to see if the record is available after fetching the same record again. 
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define variable lChanged as logical no-undo.
display "Department codes are: 100, 200, 300, 400, 500, 600, 700".

repeat:
    prompt-for Department.DeptCode.
    find Department using Department.DeptCode no-lock no-error.
    if available Department then
    do: /* There is such a Department */
        display Department.DeptName.
        prompt-for Department.DeptName.
        Update-blk:
        do transaction:
            find current Department exclusive-lock no-wait no-error.
            if available Department then 
            do:
                if not current-changed Department then 
                    assign Department.DeptName.
                else
                    lChanged = yes. /* Indicate data was changed */
            end. 
      
            else 
            do: /* Record not available */
                if locked Department then 
                do: /* The record is locked */
                    message "The Department record is locked." skip
                        "Choose 'OK' to try again; 'Cancel' to select another Department."
                        view-as alert-box buttons ok-cancel
                        update lRetry as logical.
                    if lRetry then undo Update-blk, retry Update-blk. /* try again */
                end. /* The record is locked */
                else /* The record was deleted */
                    message "Department record has been deleted by another user!"
                        view-as alert-box.
            end. /* Record not available */
        end.  /* End transaction */    
    
        /* Re-read to remove the lingering SHARE-LOCK */
        if available Department then
            find current Department no-lock.
        /* Show the message outside the transaction after the 
           lock has been removed */
        if lChanged then 
        do:
            message "The data has changed while you were working." skip
                "Please try again." view-as alert-box.
            lChanged = no. /* Reset the counter */
        end. /* if record changed */
    end. /* found a Department */
  
    else /* bad Department number */
        message "No such department.  Please re-enter number." view-as alert-box.
end. /* REPEAT */
