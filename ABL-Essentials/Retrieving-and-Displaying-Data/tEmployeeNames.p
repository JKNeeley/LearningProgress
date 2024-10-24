/*------------------------------------------------------------------------
    File        : tEmployeeNames.p
    Purpose     : Generate a list of employees by department, then, within each department, by last name, then by first name.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each employee by DeptCode by LastName by firstName:
    display DeptCode LastName FirstName.
end.
