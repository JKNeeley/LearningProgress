&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v9r12 GUI
&ANALYZE-RESUME

&Scoped-define WINDOW-NAME C-Win

/* Temp-Table and Buffer definitions                                    */
define temp-table ttCustomer no-undo like Customer
       field RowIdent as rowid
       index RowIdent RowIdent.


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS C-Win 
/*------------------------------------------------------------------------

  File: wCustDisplayL.w
  Description: displays customer data in the fill-in fields.
  Author: modified by Jade Neeley

------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

create widget-pool.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */
define variable hDataUtil as handle no-undo.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of first Frame and/or Browse and/or first Query                 */
&Scoped-define FRAME-NAME DEFAULT-FRAME

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES ttCustomer

/* Definitions for FRAME DEFAULT-FRAME                                  */
&Scoped-define FIELDS-IN-QUERY-DEFAULT-FRAME ttCustomer.CustNum ~
ttCustomer.SalesRep ttCustomer.Name ttCustomer.Terms ttCustomer.Address ~
ttCustomer.CreditLimit ttCustomer.Address2 ttCustomer.Balance ~
ttCustomer.City ttCustomer.Discount ttCustomer.State ttCustomer.Comments ~
ttCustomer.Country ttCustomer.PostalCode ttCustomer.Contact ~
ttCustomer.Phone ttCustomer.Fax ttCustomer.EmailAddress 
&Scoped-define ENABLED-FIELDS-IN-QUERY-DEFAULT-FRAME ttCustomer.CustNum ~
ttCustomer.SalesRep ttCustomer.Name ttCustomer.Terms ttCustomer.Address ~
ttCustomer.CreditLimit ttCustomer.Address2 ttCustomer.Balance ~
ttCustomer.City ttCustomer.Discount ttCustomer.State ttCustomer.Comments ~
ttCustomer.Country ttCustomer.PostalCode ttCustomer.Contact ~
ttCustomer.Phone ttCustomer.Fax ttCustomer.EmailAddress 
&Scoped-define ENABLED-TABLES-IN-QUERY-DEFAULT-FRAME ttCustomer
&Scoped-define FIRST-ENABLED-TABLE-IN-QUERY-DEFAULT-FRAME ttCustomer
&Scoped-define QUERY-STRING-DEFAULT-FRAME FOR EACH ttCustomer SHARE-LOCK
&Scoped-define OPEN-QUERY-DEFAULT-FRAME OPEN QUERY DEFAULT-FRAME FOR EACH ttCustomer SHARE-LOCK.
&Scoped-define TABLES-IN-QUERY-DEFAULT-FRAME ttCustomer
&Scoped-define FIRST-TABLE-IN-QUERY-DEFAULT-FRAME ttCustomer


/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS ttCustomer.CustNum ttCustomer.SalesRep ~
ttCustomer.Name ttCustomer.Terms ttCustomer.Address ttCustomer.CreditLimit ~
ttCustomer.Address2 ttCustomer.Balance ttCustomer.City ttCustomer.Discount ~
ttCustomer.State ttCustomer.Comments ttCustomer.Country ~
ttCustomer.PostalCode ttCustomer.Contact ttCustomer.Phone ttCustomer.Fax ~
ttCustomer.EmailAddress 
&Scoped-define ENABLED-TABLES ttCustomer
&Scoped-define FIRST-ENABLED-TABLE ttCustomer
&Scoped-Define ENABLED-OBJECTS RECT-17 BtnNext BtnPrev BtnDone 
&Scoped-Define DISPLAYED-FIELDS ttCustomer.CustNum ttCustomer.SalesRep ~
ttCustomer.Name ttCustomer.Terms ttCustomer.Address ttCustomer.CreditLimit ~
ttCustomer.Address2 ttCustomer.Balance ttCustomer.City ttCustomer.Discount ~
ttCustomer.State ttCustomer.Comments ttCustomer.Country ~
ttCustomer.PostalCode ttCustomer.Contact ttCustomer.Phone ttCustomer.Fax ~
ttCustomer.EmailAddress 
&Scoped-define DISPLAYED-TABLES ttCustomer
&Scoped-define FIRST-DISPLAYED-TABLE ttCustomer


/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
define var C-Win as widget-handle no-undo.

/* Definitions of the field level widgets                               */
define button BtnDone default 
     label "&Done" 
     size 15 by 1.14
     bgcolor 8 .

define button BtnNext 
     label "&Next" 
     size 15 by 1.14
     bgcolor 8 .

define button BtnPrev 
     label "&Prev" 
     size 15 by 1.14
     bgcolor 8 .

define rectangle RECT-17
     edge-pixels 2 graphic-edge  no-fill 
     size 107 by 15.24.

/* Query definitions                                                    */
&ANALYZE-SUSPEND
define query DEFAULT-FRAME for 
      ttCustomer scrolling.
&ANALYZE-RESUME

/* ************************  Frame Definitions  *********************** */

define frame DEFAULT-FRAME
     ttCustomer.CustNum at row 2.43 col 13.8 colon-aligned
          view-as fill-in 
          size 9 by 1
     ttCustomer.SalesRep at row 2.43 col 74 colon-aligned
          view-as fill-in 
          size 9.6 by 1
     ttCustomer.Name at row 3.43 col 13.8 colon-aligned
          view-as fill-in 
          size 32 by 1
     ttCustomer.Terms at row 3.43 col 74 colon-aligned
          view-as fill-in 
          size 22 by 1
     ttCustomer.Address at row 4.43 col 13.8 colon-aligned
          view-as fill-in 
          size 37 by 1
     ttCustomer.CreditLimit at row 4.43 col 74 colon-aligned
          view-as fill-in 
          size 16 by 1
     ttCustomer.Address2 at row 5.43 col 13.8 colon-aligned
          view-as fill-in 
          size 37 by 1
     ttCustomer.Balance at row 5.43 col 74 colon-aligned
          view-as fill-in 
          size 20.2 by 1
     ttCustomer.City at row 6.43 col 13.8 colon-aligned
          view-as fill-in 
          size 27 by 1
     ttCustomer.Discount at row 6.43 col 74 colon-aligned
          view-as fill-in 
          size 7.6 by 1
     ttCustomer.State at row 7.43 col 13.8 colon-aligned
          view-as fill-in 
          size 22 by 1
     ttCustomer.Comments at row 8.38 col 49 colon-aligned
          view-as fill-in 
          size 56 by 1
     ttCustomer.Country at row 8.43 col 13.8 colon-aligned
          view-as fill-in 
          size 22 by 1
     ttCustomer.PostalCode at row 9.43 col 13.8 colon-aligned
          view-as fill-in 
          size 15.6 by 1
     ttCustomer.Contact at row 10.43 col 13.8 colon-aligned
          view-as fill-in 
          size 32 by 1
     BtnNext at row 10.52 col 86.4
     ttCustomer.Phone at row 11.43 col 13.8 colon-aligned
          view-as fill-in 
          size 22 by 1
     ttCustomer.Fax at row 12.43 col 13.8 colon-aligned
          view-as fill-in 
          size 22 by 1
     BtnPrev at row 12.43 col 86.4
     ttCustomer.EmailAddress at row 13.43 col 13.8 colon-aligned
          view-as fill-in 
          size 52 by 1
     BtnDone at row 14.33 col 86.4
     "Details" view-as text
          size 8 by .62 at row 1.24 col 4
     RECT-17 at row 1.43 col 1.6
    with 1 down no-box keep-tab-order overlay 
         side-labels no-underline three-d 
         at col 1 row 1
         size 108.4 by 16.1
         default-button BtnDone.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Window
   Allow: Basic,Browse,DB-Fields,Window,Query
   Other Settings: COMPILE
   Temp-Tables and Buffers:
      TABLE: ttCustomer T "?" NO-UNDO Customer
      ADDITIONAL-FIELDS:
          FIELD RowIdent AS ROWID
          INDEX RowIdent RowIdent
      END-FIELDS.
   END-TABLES.
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
if session:display-type = "GUI":U then
  create window C-Win assign
         hidden             = yes
         title              = "Customer Information"
         height             = 16.1
         width              = 108.4
         max-height         = 17.48
         max-width          = 108.4
         virtual-height     = 17.48
         virtual-width      = 108.4
         resize             = yes
         scroll-bars        = no
         status-area        = no
         bgcolor            = ?
         fgcolor            = ?
         keep-frame-z-order = yes
         three-d            = yes
         message-area       = no
         sensitive          = yes.
else {&WINDOW-NAME} = current-window.
/* END WINDOW DEFINITION                                                */
&ANALYZE-RESUME



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW C-Win
  VISIBLE,,RUN-PERSISTENT                                               */
/* SETTINGS FOR FRAME DEFAULT-FRAME
                                                                        */
if session:display-type = "GUI":U and VALID-HANDLE(C-Win)
then C-Win:hidden = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME DEFAULT-FRAME
/* Query rebuild information for FRAME DEFAULT-FRAME
     _TblList          = "Temp-Tables.ttCustomer"
     _Query            is OPENED
*/  /* FRAME DEFAULT-FRAME */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
on end-error of C-Win /* Customer Information */
or endkey of {&WINDOW-NAME} anywhere do:
  /* This case occurs when the user presses the "Esc" key.
     In a persistently run window, just ignore this.  If we did not, the
     application would exit. */
  if this-procedure:persistent then return no-apply.
end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
on window-close of C-Win /* Customer Information */
do:
  /* This event will close the window and terminate the procedure.  */
  apply "CLOSE":U to this-procedure.
  return no-apply.
end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME BtnDone
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BtnDone C-Win
on choose of BtnDone in frame DEFAULT-FRAME /* Done */
do:
  &IF "{&PROCEDURE-TYPE}" EQ "SmartPanel" &THEN
    &IF "{&ADM-VERSION}" EQ "ADM1.1" &THEN
      RUN dispatch IN THIS-PROCEDURE ('exit').
    &ELSE
      RUN exitObject.
    &ENDIF
  &ELSE
      apply "CLOSE":U to this-procedure.
  &ENDIF
end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME BtnNext
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BtnNext C-Win
on choose of BtnNext in frame DEFAULT-FRAME /* Next */
do:
  &IF "{&PROCEDURE-TYPE}" EQ "SmartPanel" &THEN
    &IF "{&ADM-VERSION}" EQ "ADM1.1" &THEN
      RUN notify IN THIS-PROCEDURE ("get-next") NO-ERROR.
    &ELSE
      PUBLISH "fetchNext":U.
    &ENDIF
  &ELSEIF "{&TABLES-IN-QUERY-{&FRAME-NAME}}" ne "" &THEN
  /* This is a simple NEXT RECORD navigation button, useful for building
     test screens quickly.  NOTE: if there are no tables in the query, then
     this code will not compile; so use the preprocessor to skip it. */
      get next {&FRAME-NAME}.
      if not available {&FIRST-TABLE-IN-QUERY-{&FRAME-NAME}}
          then get last {&FRAME-NAME}.
      if available {&FIRST-TABLE-IN-QUERY-{&FRAME-NAME}} then do:
          display {&FIELDS-IN-QUERY-{&FRAME-NAME}} with frame {&FRAME-NAME}.
   {&OPEN-BROWSERS-IN-QUERY-{&FRAME-NAME}}
      end.
  &ENDIF
end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME BtnPrev
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BtnPrev C-Win
on choose of BtnPrev in frame DEFAULT-FRAME /* Prev */
do:
  &IF "{&PROCEDURE-TYPE}" EQ "SmartPanel" &THEN
    &IF "{&ADM-VERSION}" EQ "ADM1.1" &THEN
      RUN notify IN THIS-PROCEDURE ("get-prev") NO-ERROR.
    &ELSE
      PUBLISH "fetchPrev":U.
    &ENDIF
  &ELSEIF "{&TABLES-IN-QUERY-{&FRAME-NAME}}" ne "" &THEN
  /* This is a simple PREV RECORD navigation button, useful for building
     test screens quickly.  NOTE: if there are no tables in the query, then
     this code will not compile; so use the preprocessor to skip it. */
      get prev {&FRAME-NAME}.
      if not available {&FIRST-TABLE-IN-QUERY-{&FRAME-NAME}}
      then get first {&FRAME-NAME}.
      if available {&FIRST-TABLE-IN-QUERY-{&FRAME-NAME}} then do:
 display {&FIELDS-IN-QUERY-{&FRAME-NAME}} with frame {&FRAME-NAME}.
        {&OPEN-BROWSERS-IN-QUERY-{&FRAME-NAME}}
      end.
  &ENDIF
end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK C-Win 


/* ***************************  Main Block  *************************** */

/* Set CURRENT-WINDOW: this will parent dialog-boxes and frames.        */
assign CURRENT-WINDOW                = {&WINDOW-NAME} 
       THIS-PROCEDURE:CURRENT-WINDOW = {&WINDOW-NAME}.

/* The CLOSE event can be used from inside or outside the procedure to  */
/* terminate it.                                                        */
on close of this-procedure 
   run Shutdown.


/* Best default for GUI applications is...                              */
pause 0 before-hide.

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
do on error   undo MAIN-BLOCK, leave MAIN-BLOCK
   on end-key undo MAIN-BLOCK, leave MAIN-BLOCK:
    run InitializeObjects.
    run enable_UI.
  if not this-procedure:persistent then
    wait-for close of this-procedure.
end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI C-Win  _DEFAULT-DISABLE
procedure disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Delete the WINDOW we created */
  if session:display-type = "GUI":U and VALID-HANDLE(C-Win)
  then delete widget C-Win.
  if this-procedure:persistent then delete procedure this-procedure.
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI C-Win  _DEFAULT-ENABLE
procedure enable_UI :
/*------------------------------------------------------------------------------
  Purpose:     ENABLE the User Interface
  Parameters:  <none>
  Notes:       Here we display/view/enable the widgets in the
               user-interface.  In addition, OPEN all queries
               associated with each FRAME and BROWSE.
               These statements here are based on the "Other 
               Settings" section of the widget Property Sheets.
------------------------------------------------------------------------------*/

  {&OPEN-QUERY-DEFAULT-FRAME}
  get first DEFAULT-FRAME.
  if available ttCustomer then 
    display ttCustomer.CustNum ttCustomer.SalesRep ttCustomer.Name 
          ttCustomer.Terms ttCustomer.Address ttCustomer.CreditLimit 
          ttCustomer.Address2 ttCustomer.Balance ttCustomer.City 
          ttCustomer.Discount ttCustomer.State ttCustomer.Comments 
          ttCustomer.Country ttCustomer.PostalCode ttCustomer.Contact 
          ttCustomer.Phone ttCustomer.Fax ttCustomer.EmailAddress 
      with frame DEFAULT-FRAME in window C-Win.
  enable RECT-17 ttCustomer.CustNum ttCustomer.SalesRep ttCustomer.Name 
         ttCustomer.Terms ttCustomer.Address ttCustomer.CreditLimit 
         ttCustomer.Address2 ttCustomer.Balance ttCustomer.City 
         ttCustomer.Discount ttCustomer.State ttCustomer.Comments 
         ttCustomer.Country ttCustomer.PostalCode ttCustomer.Contact BtnNext 
         ttCustomer.Phone ttCustomer.Fax BtnPrev ttCustomer.EmailAddress 
         BtnDone 
      with frame DEFAULT-FRAME in window C-Win.
  {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
  view C-Win.
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE InitializeObjects C-Win 
procedure InitializeObjects :
    /*------------------------------------------------------------------------------
      Purpose:   initialize data objects
      Parameters:  OUTPUT ttCustomer (TABLE) 
    ------------------------------------------------------------------------------*/
    define variable hDataUtil as handle no-undo.
    run DataUtil.p persistent set hDataUtil.
    run GetCustData in hDataUtil (output TABLE ttCustomer).

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE Shutdown C-Win 
procedure Shutdown :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/

   publish "Shutdown".
   run disable_UI.

end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

