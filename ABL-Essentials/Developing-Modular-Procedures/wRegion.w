&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v9r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS C-Win 
/*------------------------------------------------------------------------
  File: wRegion.w
  Description: Get Region button retrieves the reagion of the state based off the state's abbreviation or it's name.
  Author: modified yb Jade Neeley
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

define variable hEmp as handle no-undo.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME DEFAULT-FRAME

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS fiStateCode fiStateName BtnGetRegion ~
fiRegion BtnExit 
&Scoped-Define DISPLAYED-OBJECTS fiStateCode fiStateName fiRegion 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
define var C-Win as widget-handle no-undo.

/* Definitions of the field level widgets                               */
define button BtnExit default 
     label "&Exit" 
     size 15 by 1.14
     bgcolor 8 .

define button BtnGetRegion 
     label "Get Region" 
     size 18 by 1.62.

define variable fiRegion as character format "X(256)":U 
     label "Region" 
     view-as fill-in 
     size 14 by 1 no-undo.

define variable fiStateCode as character format "X(256)":U 
     label "Enter State Code" 
     view-as fill-in 
     size 14 by 1.19 no-undo.

define variable fiStateName as character format "X(256)":U 
     label "State" 
     view-as fill-in 
     size 27 by 1 no-undo.


/* ************************  Frame Definitions  *********************** */

define frame DEFAULT-FRAME
     fiStateCode at row 1.95 col 21 colon-aligned
     fiStateName at row 4.33 col 21 colon-aligned
     BtnGetRegion at row 5.52 col 55
     fiRegion at row 6.48 col 21 colon-aligned
     BtnExit at row 7.43 col 58
    with 1 down no-box keep-tab-order overlay 
         side-labels no-underline three-d 
         at col 1 row 1
         size 74.8 by 8.24
         default-button BtnExit.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Window
   Allow: Basic,Browse,DB-Fields,Window,Query
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
if session:display-type = "GUI":U then
  create window C-Win assign
         hidden             = yes
         title              = "Running persistent"
         height             = 8.24
         width              = 74.8
         max-height         = 34.33
         max-width          = 204.8
         virtual-height     = 34.33
         virtual-width      = 204.8
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
   FRAME-NAME                                                           */
if session:display-type = "GUI":U and VALID-HANDLE(C-Win)
then C-Win:hidden = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
on end-error of C-Win /* Running persistent */
or endkey of {&WINDOW-NAME} anywhere 
    do:
        /* This case occurs when the user presses the "Esc" key.
           In a persistently run window, just ignore this.  If we did not, the
           application would exit. */
        if this-procedure:persistent then return no-apply.
    end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
on window-close of C-Win /* Running persistent */
do:
        /* This event will close the window and terminate the procedure.  */
        apply "CLOSE":U to this-procedure.
        return no-apply.
    end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME BtnExit
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BtnExit C-Win
on choose of BtnExit in frame DEFAULT-FRAME /* Exit */
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


&Scoped-define SELF-NAME BtnGetRegion
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BtnGetRegion C-Win
on choose of BtnGetRegion in frame DEFAULT-FRAME /* Get Region */
do:
    /* Write your trigger code here */

    
    end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BtnGetRegion C-Win
on mouse-select-click of BtnGetRegion in frame DEFAULT-FRAME /* Get Region */
do:
    assign fiStateCode.
    run valRegion in hEmp (input fiStateCode, 
        output fiStateName, 
        output fiRegion).
    display fiStateName fiRegion with frame {&FRAME-NAME}.   
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
    run disable_UI.

/* Best default for GUI applications is...                              */
pause 0 before-hide.

if not valid-handle(hEmp)then run lEmpLibrary.p persistent set hEmp.

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
do on error   undo MAIN-BLOCK, leave MAIN-BLOCK
    on end-key undo MAIN-BLOCK, leave MAIN-BLOCK:
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
  display fiStateCode fiStateName fiRegion 
      with frame DEFAULT-FRAME in window C-Win.
  enable fiStateCode fiStateName BtnGetRegion fiRegion BtnExit 
      with frame DEFAULT-FRAME in window C-Win.
  {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
  view C-Win.
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

