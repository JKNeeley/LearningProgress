/*------------------------------------------------------------------------
    File        : tUSCustomers.p
    Purpose     : Generate a list of all customers who live in the USA. Sort by, and display, their states, cities and names.
    Description : Format the output to allow 15 characters for the city, two characters for the state, and 30 characters for the name
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each Customer where Country = "USA" by State by City by Name: 
    display City format "x(15)" State format "x(2)" NAME format "x(30)".
end.
