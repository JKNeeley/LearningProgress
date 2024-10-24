/*----------------------------------------------------------------------------
  File      : ValState.p
  Purpose   : Procedure which validates to ensure that the state abbreviation entered is correct.   
  Parameters:  INPUT pcStateCode (CHARACTER) - State Abbreviation
               OUTPUT pcStateName (CHARACTER) - State Name
  Author(s) : moified by Jade Neeley
------------------------------------------------------------------------------*/

define input parameter pcStateCode as character no-undo.
define output parameter pcStateName as character no-undo.

find State no-lock where
    State.State = pcStateCode no-error.
if available(State) then
    assign pcStateName = State.StateName.
