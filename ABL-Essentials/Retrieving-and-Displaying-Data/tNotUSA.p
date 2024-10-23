
/*------------------------------------------------------------------------
    File        : tNotUSA.p
    Purpose     : The name and country of customers who are not in the USA.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

  for each Customer where Customer.Country <> "USA":
      display Customer.Name Customer.Country .
  end .
