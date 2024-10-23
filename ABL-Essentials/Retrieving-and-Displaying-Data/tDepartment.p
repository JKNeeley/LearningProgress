/*------------------------------------------------------------------------
    File        : tDepartment.p
    Purpose     : Find the department whose department code is 700.
    Description : Display a message that shows the name of the department for department 700. The department code field is of CHARACTER data type.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

find Department where DeptCode = "700".
message "Department 700 is" DeptName view-as alert-box.
