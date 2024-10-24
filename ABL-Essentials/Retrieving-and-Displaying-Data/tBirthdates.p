/*------------------------------------------------------------------------
    File        : tBirthdates.p
    Purpose     : List the family members, from youngest to oldest, of all employees, sorted by birthdates. Include the employee number in the output.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each Family by Birthdate descending: 
    display EmpNum Birthdate RelativeName.
end.
