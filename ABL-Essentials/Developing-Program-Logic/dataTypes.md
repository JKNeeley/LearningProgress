*Specify ABL data types you would use to hold the following values:*

Value / Data type
151 / integer
151.19 / decimal
One hundred fifty two / character
True / logical
10/10/04 / date
NO / logical
January, February, March / character
December 31, 2001 / character
365 / integer

Define a variable to be used as a counter that starts from zero.
- define variable iCounter as integer initial 0 no-undo .

Define a variable to store monthly sales total with two decimal places.
- define variable dSalesTot as decimal format "->>,>>9.99" no-undo .

Define a variable to store a value of a country with the initial value USA.
- define variable cCountry as character initial "USA" no-undo .

Define a variable to store a value of either Yes or No.
- define variable lok as logical no-undo .

Define a variable to store an employee’s date of birth.
- define variable dtBirthDate as date no-undo .

Define a variable to store a name with the initial value as your name. Specify a display format that is long enough to hold your first and last names.
- define variable cFullName as character format "x(25)" initial "John Doe" no-undo .

Define a variable to store decimal values. Specify a display format for three positions before and two positions after the decimal point.
- define variable dNumber as decimal format ">>9.99" no-undo .
