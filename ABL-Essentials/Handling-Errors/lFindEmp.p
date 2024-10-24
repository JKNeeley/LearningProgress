/*------------------------------------------------------------------------
    File        : lFindEmp.p
    Purpose     : Ask the user to input the beginning letters of an employee’s last name then displays fields from the employee’s record.
  ----------------------------------------------------------------------*/

repeat with 1 column:
  prompt-for Employee.LastName label "Last name begins".
  find first Employee
    where Employee.LastName begins input Employee.LastName.
  display EmpNum FirstName LastName DeptCode.
end. /* REPEAT */
