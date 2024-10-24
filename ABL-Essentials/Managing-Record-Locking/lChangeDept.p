/*------------------------------------------------------------------------
    File        : lChangeDept.p
    Purpose     : Table update with Progress default locking
  ----------------------------------------------------------------------*/

display "Department codes are: 100, 200, 300, 400, 500, 600, 700".

repeat:
  prompt-for Department.DeptCode.
  find Department using DeptCode.
  update DeptName.
end. /* REPEAT */
