/*------------------------------------------------------------------------

  File          : wEmployee.w
  Purpose       :  Procedure which returns an employee's first and last name based upon an employee number.  
  Parameters    : INPUT intEmpNum (INTEGER) - Employee number
                  OUTPUT chFName (CHARACTER) - First Name
                  OUTPUT chLName (CHARACTER) - Last Name

------------------------------------------------------------------------*/

define input parameter piEmpNum as integer no-undo.
define output parameter pcFName as character no-undo.
define output parameter pcLName as character no-undo.

find Employee no-lock where
    Employee.EmpNum = piEmpNum no-error.
if available(Employee) then
    assign
        pcFName = Employee.FirstName
        pcLName = Employee.LastName.

