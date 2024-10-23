/*------------------------------------------------------------------------
    File        : tWater.p
    Purpose     : Find items that might be used in water sports and display their name and description.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

for each Item where CatDescription contains "water": 
    display ItemName CatDescription.
end.
