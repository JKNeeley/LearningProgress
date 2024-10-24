
/*------------------------------------------------------------------------
    File        : tFindEmp2.p
    Purpose     : Modify lFindEmp.p for better error handling.
    Description : Override default error handling for the FIND statement. If the record is not available, display a message to that effect. 
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

repeat:
    prompt-for Employee.LastName label "Last name begins:".
    find first Employee
        where Employee.LastName begins input Employee.LastName no-error.
    if available Employee then
        display Employee.EmpNum Employee.FirstName Employee.LastName Employee.DeptCode with 1 column.
    else 
    do:
        message "There is no employee with last name beginning with"
            input Employee.LastName view-as alert-box.
    end.
end.
