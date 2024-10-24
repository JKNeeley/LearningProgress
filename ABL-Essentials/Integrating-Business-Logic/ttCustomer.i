/*------------------------------------------------------------------------
    File        : ttCustomer.i
    Author(s)   : Jade Neeley
    Purpose     : temp-table definition for ettCustomer 
  ----------------------------------------------------------------------*/

  @com.openedge.t4bl.model(modeFile="platform:/resource/ABLEssentials/appModel.t4bl", uuid="_Qy7BYZI-Ee-Q7vjTLYjOeg").
 				 
  define temp-table ettCustomer
   no-undo  
     field CustNum as integer label "Cust Num" format ">>>>9" help "Please enter a customer number." 
     field Name as character label "Name" format "x(30)" help "Please enter a name." 
     field Address as character label "Address" format "x(35)" help "Please enter an address." 
     field City as character label "City" format "x(25)" help "Please enter a city." 
     field State as character label "State" format "x(20)" help "Please enter standard state abbreviation." 
     field Country as character label "Country" format "x(20)" initial "USA" help "Please enter a country." 
  .  
