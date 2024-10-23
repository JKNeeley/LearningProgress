
/*------------------------------------------------------------------------
    File        : connect.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : Jade Neeley
    Created     : Wed Oct 2 13:48:17 UTC 2024
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

block-level on error undo, throw.
define variable cDatabaseName as character no-undo init 'sports2020' .

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
connect value ("-db " + cDatabaseName + " -H localhost -S 9999") .
