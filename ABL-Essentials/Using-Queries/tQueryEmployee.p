/*------------------------------------------------------------------------
    File        : tQueryEmployee.p
    Purpose     : Write a procedure that defines a query that retrieves every employee in department code 500 (Training). Display the employee number, first name, last name, and department code.
    Description : Use the QUERY-OFF-END function.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

define query qEmp for Employee.

open query qEmp for each Employee where DeptCode = "500".

repeat:
    get next qEmp.
    if query-off-end("qEmp") then leave.
    display Employee.EmpNum Employee.FirstName Employee.LastName Employee.DeptCode.
end. /* REPEAT */
close query qEmp.    
