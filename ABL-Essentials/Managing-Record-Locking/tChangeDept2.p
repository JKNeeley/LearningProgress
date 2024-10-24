
/*------------------------------------------------------------------------
    File        : lChangeDept2.p
    Purpose     : Modify lChangeDept1 to employ simple optimistic locking without checking if the record is available after fetching the record again.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define variable lChanged as logical no-undo.

display "Department codes are: 100, 200, 300, 400, 500, 600, 700".

repeat:
    prompt-for Department.DeptCode.
    find Department no-lock using Department.DeptCode.
    Retry-blk:
    do on error undo, retry:
        display Department.DeptName.
        prompt-for Department.DeptName.
        Update-blk:
        do transaction:
            find current Department exclusive-lock.
            if not current-changed Department then assign Department.DeptName.
            else 
            do:
                message "The data has changed while you were working." skip
                    "Please try again." view-as alert-box.
                undo retry-blk, retry retry-blk.
            end. /* Data changed, retry */
        end.  /* Transaction ends */
    end. /* Retry-blk */
end. /* REPEAT */
