
/*------------------------------------------------------------------------
    File        : DataUtil.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : modified by Jade Neeley
  ----------------------------------------------------------------------*/

&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v9r12
&ANALYZE-RESUME
/* Connected Databases 
          sports2000       PROGRESS
*/

/* Temp-Table and Buffer definitions                                    */
define temp-table ttCustomer no-undo like Customer
    field RowIdent as rowid
    index RowIdent RowIdent.
define temp-table ttInvoice no-undo like Invoice
    field RowIdent as rowid
    index RowIdent RowIdent.
define temp-table ttItem no-undo like Item.
define temp-table ttOrder no-undo like Order
    field RowIdent as rowid
    index RowIdent RowIdent
    .
define temp-table ttOrderLine no-undo like OrderLine
    field RowIdent as rowid
    index RowIdent RowIdent.
define temp-table ttSalesrep no-undo like Salesrep
    field RowIdent as rowid
    index RowIdent RowIdent.


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS Procedure 
/*------------------------------------------------------------------------
    File        : DataUtil.p
    Purpose     : Retrieves order records from the database. 

    Syntax      :

    Description :

    Author(s)   : Stan Swiercz 
    Created     : November 2000
    Notes       :
  ----------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Procedure
&Scoped-define DB-AWARE no



/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Procedure
   Allow: 
   Frames: 0
   Add Fields to: Neither
   Other Settings: CODE-ONLY COMPILE
   Temp-Tables and Buffers:
      TABLE: ttCustomer T "?" NO-UNDO Sports2000 Customer
      ADDITIONAL-FIELDS:
          FIELD RowIdent AS ROWID
          INDEX RowIdent RowIdent
      END-FIELDS.
      TABLE: ttInvoice T "?" NO-UNDO Sports2000 Invoice
      ADDITIONAL-FIELDS:
          FIELD RowIdent AS ROWID
          INDEX RowIdent RowIdent
      END-FIELDS.
      TABLE: ttItem T "?" NO-UNDO Sports2000 Item
      TABLE: ttOrder T "?" NO-UNDO Sports2000 Order
      ADDITIONAL-FIELDS:
          FIELD RowIdent AS ROWID
          INDEX RowIdent RowIdent
          
      END-FIELDS.
      TABLE: ttOrderLine T "?" NO-UNDO Sports2000 OrderLine
      ADDITIONAL-FIELDS:
          FIELD RowIdent AS ROWID
          INDEX RowIdent RowIdent
      END-FIELDS.
      TABLE: ttSalesrep T "?" NO-UNDO Sports2000 Salesrep
      ADDITIONAL-FIELDS:
          FIELD RowIdent AS ROWID
          INDEX RowIdent RowIdent
      END-FIELDS.
   END-TABLES.
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW Procedure ASSIGN
         HEIGHT             = 15
         WIDTH              = 60.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

 


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Procedure 


/* ***************************  Main Block  *************************** */
subscribe to "Shutdown" anywhere
    run-procedure "Shutdown".

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&IF DEFINED(EXCLUDE-DeleteCustomer) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE DeleteCustomer Procedure 
procedure DeleteCustomer :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input parameter prowRowIdent as rowid no-undo.

    find Customer where rowid(Customer) = prowRowIdent exclusive-lock no-error.

    if available Customer then
    do:
        delete Customer no-error.
    end.
    else
        return error "The record is not available.".

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-DeleteInvoice) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE DeleteInvoice Procedure 
procedure DeleteInvoice :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input parameter prowRowIdent as rowid no-undo.

    find Invoice where rowid(Invoice) = prowRowIdent exclusive-lock no-error.

    if available Invoice then
    do:
        delete Invoice no-error.
    end.
    else
        return error "The record is not available.".

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-DeleteOrder) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE DeleteOrder Procedure 
procedure DeleteOrder :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input parameter prowRowIdent as rowid no-undo.

    if can-find(first Orderline where Orderline.Ordernum = Order.Ordernum) then
    do:
        return error "Orderlines exist for this Order. Cannot delete.".
    end.

    find Order where rowid(Order) = prowRowIdent exclusive-lock no-error.

    if available Order then delete Order.
    else return error "The record is not available.".

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-DeleteOrderline) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE DeleteOrderline Procedure 
procedure DeleteOrderline :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input parameter prowRowIdent as rowid no-undo.

    find Orderline where rowid(Orderline) = prowRowIdent exclusive-lock no-error.

    if available Orderline then delete Orderline.
    else return error "The record is not available.".

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-DeleteSalesrep) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE DeleteSalesrep Procedure 
procedure DeleteSalesrep :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input parameter prowRowIdent as rowid no-undo.

    find Salesrep where rowid(Salesrep) = prowRowIdent exclusive-lock no-error.

    if available Salesrep then delete Salesrep.
    else return error "The record is not available.".
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetCustData) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetCustData Procedure 
procedure GetCustData :
    /*------------------------------------------------------------------------------
      Purpose:  This procedure retrieves customer data.
      Notes:    This code causes wCustDisplayL.w to be populated with Customer data. 
           
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttCustomer.

    empty temp-table ttCustomer.

    for each Customer no-lock:
        if available Customer then 
        do:
            create ttCustomer.
            buffer-copy Customer to ttCustomer no-error.
        end.
        else return error "Customer records are not available".
    end. /* FOR EACH */
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetCustRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetCustRecord Procedure 
procedure GetCustRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttCustomer.
    define input  parameter prowCustomerRow as rowid no-undo.

    /*Get rid of the old ttCustomer records they exist*/
    for each ttCustomer exclusive-lock:
        delete ttCustomer.
    end.
    if prowCustomerRow <> ? then
        find Customer where rowid(Customer) = prowCustomerRow no-lock no-error.
    else
        find last Customer no-lock no-error.  
 
    if available Customer then
    do:
        create ttCustomer.
        buffer-copy Customer to ttCustomer no-error.
        assign 
            ttCustomer.RowIdent = rowid(Customer).
    end.
    else return error "Customer records are not available".
            
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetInvoiceData) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetInvoiceData Procedure 
procedure GetInvoiceData :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttInvoice.

    /*Get rid of the old ttSalesRep records if they exist*/
    for each ttInvoice exclusive-lock:
        delete ttInvoice.
    end.
    
    for each Invoice no-lock:
        if available Invoice then
        do:
            create ttInvoice.
            buffer-copy Invoice to ttInvoice no-error.
            assign 
                ttInvoice.RowIdent = rowid(Invoice).
        end. /* IF AVAILABLE Invoice */
        else return error "Invoice records are not available".
    end. /* FOR EACH */
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetInvoiceRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetInvoiceRecord Procedure 
procedure GetInvoiceRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/

    define output parameter TABLE for ttInvoice.
    define input  parameter prowInvoiceRow as rowid no-undo.

    /*Get rid of the old ttOrder records they exist*/
    for each ttInvoice exclusive-lock:
        delete ttInvoice.
    end.

    find Invoice where rowid(Invoice) = prowInvoiceRow no-lock no-error.
    if available Invoice then
    do:
        create ttInvoice.
        buffer-copy Invoice to ttInvoice no-error.
        assign 
            ttInvoice.RowIdent = rowid(Invoice).
    end.
    else return error "Invoice records are not available".

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetItemData) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetItemData Procedure 
procedure GetItemData :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttItem.

    /*Get rid of the old ttItem records if they exist*/
    empty temp-table ttItem.

    /* Populate the temp-table. */ 
    for each Item no-lock:
        if available Item then
        do:
            create ttItem.
            buffer-copy Item to ttItem no-error.
        end.
        else return error "Item records are not available".
    end. /* FOR EACH */
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetOrderData) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetOrderData Procedure 
procedure GetOrderData :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttOrder.

    /*Get rid of the old ttSalesRep records if they exist*/
    for each ttOrder exclusive-lock:
        delete ttOrder.
    end.

    for each Order no-lock:
        if available Order then
        do:
            create ttOrder.
            buffer-copy Order to ttOrder no-error.
            assign 
                ttOrder.ROWID = rowid(Order).
        end.
        else return error "Order records are not available".

    end.

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetOrderlineData) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetOrderlineData Procedure 
procedure GetOrderlineData :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes: The procedure uses a query to find the orderlines for a specific
             order.     
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttOrderline.
    define input  parameter pcKeyName   as character    no-undo.
    define input  parameter pcKeyValue  as character    no-undo.
  
    define variable cQueryPhrase as character no-undo.
  
    define query qOrderlineOfOrder for Orderline.


    /*Get rid of the old ttSalesRep records if they exist*/
    for each ttOrderline exclusive-lock:
        delete ttOrderline.
    end.

    /* Build the WHERE clause for the key value */

    if pcKeyName = ? then cQueryPhrase = "FOR EACH Orderline".
    else cQueryPhrase = substitute("FOR EACH Orderline WHERE Orderline.&1 = &2":U,pcKeyName,pcKeyValue).

    /* Build the results set */
    
    query qOrderlineOfOrder:query-prepare(cQueryPhrase) no-error.

    query qOrderlineOfOrder:query-open().

    get first qOrderlineOfOrder no-lock.
    if available Orderline then
    do while not query qOrderlineOfOrder:query-off-end:
        create ttOrderline.
        buffer-copy Orderline to ttOrderline no-error.
        assign 
            ttOrderline.ROWID = rowid(Orderline).
        get next qOrderlineOfOrder no-lock.
    end.

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetOrderlineRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetOrderlineRecord Procedure 
procedure GetOrderlineRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttOrderline.
    define input  parameter prowOrderlineRow as rowid no-undo.

    /*Get rid of the old ttOrder records they exist*/
    for each ttOrderline exclusive-lock:
        delete ttOrderline.
    end.

    find Orderline where rowid(Orderline) = prowOrderlineRow no-lock no-error.
    if available Orderline then
    do:
        create ttOrderline.
        buffer-copy Orderline to ttOrderline no-error.
        assign 
            ttOrderline.RowIdent = rowid(Orderline).
    end.
    else return error "Orderline records are not available".

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetOrderRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetOrderRecord Procedure 
procedure GetOrderRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttOrder.
    define input  parameter prowOrderRow as rowid no-undo.

    /*Get rid of the old ttOrder records they exist*/
    for each ttOrder exclusive-lock:
        delete ttOrder.
    end.
    if prowOrderRow <> ? then
        find Order where rowid(Order) = prowOrderRow no-lock no-error.
    else
        find last Order no-lock no-error.  
 
    if available Order then
    do:
        create ttOrder.
        buffer-copy Order to ttOrder no-error.
        assign 
            ttOrder.RowIdent = rowid(Order).
    end.
    else return error "Order records are not available".
            
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetRepData) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetRepData Procedure 
procedure GetRepData :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttSalesRep.

    /*Get rid of the old ttSalesRep records if they exist*/
    empty temp-table ttSalesRep.
    
    /* Popluate the temp-table */
    for each SalesRep no-lock:
        if available SalesRep then
        do:
            create ttSalesRep.
            buffer-copy SalesRep to ttSalesRep no-error.
        end.
        else return error "SalesRep records are not available".
    end.

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-GetRepRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE GetRepRecord Procedure 
procedure GetRepRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define output parameter TABLE for ttSalesRep.
    define input  parameter prowSalesrepRow as rowid no-undo.

    /*Get rid of the old ttSalesrep records they exist*/
    for each ttSalesrep exclusive-lock:
        delete ttSalesrep.
    end.

    if prowSalesrepRow <> ? then
        find SalesRep where rowid(SalesRep) = prowSalesrepRow no-lock no-error.
    else
        find last SalesRep no-lock no-error.  
    
    if available SalesRep then
    do:
        create ttSalesrep.
        buffer-copy SalesRep to ttSalesrep no-error.
        assign 
            ttSalesrep.RowIdent = rowid(SalesRep).
    end.
    else return error "SalesRep records are not available".

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-SaveCustRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE SaveCustRecord Procedure 
procedure SaveCustRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input-output parameter TABLE for  ttCustomer.
    define input parameter pcMode as character  no-undo.

    find first ttCustomer no-lock.

    if pcMode = "New" then 
    do:
        create Customer.
        find current Customer exclusive-lock no-error.
    end.
    else 
        find Customer where rowid(Customer) = ttCustomer.RowIdent exclusive-lock no-error.

    if available Customer then
        buffer-copy ttCustomer except RowIdent CustNum to Customer .
    else return error "Record not available".  
    find current Customer no-lock no-error.
    if available Customer then buffer-copy Customer to ttCustomer.

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-SaveInvoiceRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE SaveInvoiceRecord Procedure 
procedure SaveInvoiceRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input-output parameter TABLE for  ttInvoice.
    define input parameter pcMode as character  no-undo.

    find first ttInvoice no-lock.

    if pcMode = "New" then 
    do:
        create Invoice.
        find current Invoice exclusive-lock no-error.
    end.
    else
        find Invoice where rowid(Invoice) = ttInvoice.RowIdent exclusive-lock no-error.

    if available Invoice then
        buffer-copy ttInvoice except RowIdent InvoiceNum to Invoice .
    else return error "Record not available".

    find current Invoice no-lock no-error.
    if available Invoice then buffer-copy Invoice to ttInvoice.

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-SaveOrderlineRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE SaveOrderlineRecord Procedure 
procedure SaveOrderlineRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input-output parameter TABLE for  ttOrderline.
    define input parameter pcMode as character  no-undo.

    find first ttOrderline no-lock.

    if pcMode = "New" then 
    do:
        create Orderline.
        find current Orderline exclusive-lock no-error.
    end.
    else
        find Orderline where rowid(Orderline) = ttOrderline.RowIdent exclusive-lock no-error.

    if available Orderline then
        buffer-copy ttOrderline except RowIdent to Orderline.
    else return error "Record not available".

    find current Orderline no-lock no-error.
    if available Orderline then buffer-copy Orderline to ttOrderline.

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-SaveOrderRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE SaveOrderRecord Procedure 
procedure SaveOrderRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input-output parameter TABLE for  ttOrder.
    define input parameter pcMode as character  no-undo.

    find first ttOrder no-lock.

    if pcMode = "New" then 
    do:
        create Order.
        find current Order exclusive-lock no-error.
    end.
    else
        find Order where rowid(Order) = ttOrder.RowIdent exclusive-lock no-error.

    if available Order then
        buffer-copy ttOrder except RowIdent OrderNum to Order .
    else return error "Record not available".

    find current Order no-lock no-error.
    if available Order then
    do:
        buffer-copy Order to ttOrder.
        assign 
            ttOrder.RowIdent = rowid(Order).
    end.

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-SaveRepRecord) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE SaveRepRecord Procedure 
procedure SaveRepRecord :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    define input-output parameter TABLE for  ttSalesrep.
    define input parameter pcMode as character  no-undo.

    find first ttSalesrep no-lock no-error.
    
    if pcMode = "New" then 
    do:
        create Salesrep.
        find current Salesrep exclusive-lock no-error.
    end.
    else
        find Salesrep where rowid(Salesrep) = ttSalesrep.RowIdent exclusive-lock no-error.

    if available Salesrep then
        buffer-copy ttSalesrep except RowIdent to Salesrep .
    else return error "Record not available".

    find current Salesrep no-lock no-error.
    if available Salesrep then
        buffer-copy Salesrep to ttSalesrep.
    assign 
        ttSalesrep.RowIdent = rowid(Salesrep).

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-Shutdown) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE Shutdown Procedure 
procedure Shutdown :
    /*------------------------------------------------------------------------------
      Purpose:     
      Parameters:  <none>
      Notes:       
    ------------------------------------------------------------------------------*/
    apply "close" to this-procedure.
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

