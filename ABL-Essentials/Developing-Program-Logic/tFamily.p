
/*------------------------------------------------------------------------
    File        : tFamily.p
    Purpose     : Search the Family table for all records where the employee number is less than or equal to 20, and the family member (field Relation) is either son or daughter.
    Description : Display the employee number, relationship of the employee’s family member, and the relation’s name and gender.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

define variable cGender   as character no-undo.
define variable cRelation as character no-undo.

/* ***************************  Main Block  *************************** */

for each family 
    where EmpNum <= 20 
    and (Relation = "Son" or Relation = "Daughter"):

    assign 
        cGender = if Relation = "Son" 
                     then "Male" 
                     else "Female".

    display EmpNum Relation RelativeName cGender.
end.
