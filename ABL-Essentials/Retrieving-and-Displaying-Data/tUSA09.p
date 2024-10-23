/*------------------------------------------------------------------------
    File        : tUSA09.p
    Purpose     : retrieve all customers in the USA whose postal code begins with a zero (0) or a nine (9). Display the customer name, country, and postal code.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each customer 
    where Country = "USA" 
    and (PostalCode begins "0" or PostalCode begins "9"):
    display NAME Country Postalcode.
end.
