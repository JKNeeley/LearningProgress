/*------------------------------------------------------------------------
    File        : tSportsSupplier.p
    Purpose     : Find all the suppliers who have the word “Sports” in their name.
    Description : Display a message that states “Supplier <number> is <supplier name>”, where the number and supplier name are replaced with the correct data.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each supplier where NAME matches "*Sports*":
    message "Supplier" SupplierIDNum "is" NAME view-as alert-box.
end.
