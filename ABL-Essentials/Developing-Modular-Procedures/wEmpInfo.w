&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS C-Win 
/*------------------------------------------------------------------------

  File: wEmpInfo.w

  Description: Display employee information

  Input Parameters:
      <none>

  Output Parameters:
      <none>

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

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of first Frame and/or Browse and/or first Query                 */
&Scoped-define FRAME-NAME DEFAULT-FRAME
&Scoped-define BROWSE-NAME brEmployee

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES Employee

/* Definitions for BROWSE brEmployee                                    */
&Scoped-define FIELDS-IN-QUERY-brEmployee Employee.EmpNum Employee.LastName ~
Employee.FirstName 
&Scoped-define ENABLED-FIELDS-IN-QUERY-brEmployee 
&Scoped-define QUERY-STRING-brEmployee FOR EACH Employee NO-LOCK INDEXED-REPOSITION
&Scoped-define OPEN-QUERY-brEmployee OPEN QUERY brEmployee FOR EACH Employee NO-LOCK INDEXED-REPOSITION.
&Scoped-define TABLES-IN-QUERY-brEmployee Employee
&Scoped-define FIRST-TABLE-IN-QUERY-brEmployee Employee


/* Definitions for FRAME DEFAULT-FRAME                                  */
&Scoped-define OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME ~
    ~{&OPEN-QUERY-brEmployee}

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS brEmployee BtnDone RECT-2 
&Scoped-Define DISPLAYED-OBJECTS fiYrsOld fiYrsEmployed 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME


/* ************************  Function Prototypes ********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD YearsEmployed C-Win 
function YearsEmployed returns integer
    (input iEmpNum as integer)  forward.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD YearsOld C-Win
function YearsOld returns integer 
    (input iEmpNum as integer) forward.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
define var C-Win as widget-handle no-undo.

/* Definitions of the field level widgets                               */
define button BtnDone default 
    label "&Exit" 
    size 12 by 1.14
    bgcolor 8 .

define variable fiYrsEmployed as integer format "zz9":U initial 0 
    label "Years Employed" 
    view-as fill-in 
    size 7 by 1 no-undo.

define variable fiYrsOld      as integer format "zz9":U initial 0 
    label "Years Old" 
    view-as fill-in 
    size 7 by 1 no-undo.

define rectangle RECT-2
    edge-pixels 2 graphic-edge  no-fill 
    size 55 by 2.14.

/* Query definitions                                                    */
&ANALYZE-SUSPEND
define query brEmployee for 
    Employee scrolling.
&ANALYZE-RESUME

/* Browse definitions                                                   */
define browse brEmployee
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _DISPLAY-FIELDS brEmployee C-Win _STRUCTURED
    query brEmployee no-lock display
    Employee.EmpNum format "zzzzzzzzz9":U width 9.2
    Employee.LastName format "x(25)":U width 32.6
    Employee.FirstName format "x(15)":U
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME
    WITH NO-ROW-MARKERS SEPARATORS SIZE 69 BY 8.81 FIT-LAST-COLUMN.


/* ************************  Frame Definitions  *********************** */

define frame DEFAULT-FRAME
    brEmployee at row 2.67 col 7
    fiYrsOld at row 12.43 col 18 colon-aligned
    fiYrsEmployed at row 12.43 col 48 colon-aligned
    BtnDone at row 14.1 col 65
    RECT-2 at row 12.19 col 7
    with 1 down no-box keep-tab-order overlay 
    side-labels no-underline three-d 
    at col 1 row 1
    size 80 by 16.


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
        title              = "Employee Information"
        height             = 16
        width              = 80
        max-height         = 16
        max-width          = 80
        virtual-height     = 16
        virtual-width      = 80
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
/* BROWSE-TAB brEmployee 1 DEFAULT-FRAME */
/* SETTINGS FOR FILL-IN fiYrsEmployed IN FRAME DEFAULT-FRAME
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN fiYrsOld IN FRAME DEFAULT-FRAME
   NO-ENABLE                                                            */
if session:display-type = "GUI":U and VALID-HANDLE(C-Win) then C-Win:hidden = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK BROWSE brEmployee
/* Query rebuild information for BROWSE brEmployee
     _TblList          = "Employee"
     _Options          = "NO-LOCK INDEXED-REPOSITION"
     _FldNameList[1]   > Employee.EmpNum
"Employee.EmpNum" ? ? "integer" ? ? ? ? ? ? no ? no no "9.2" yes no no "U" "" ""
     _FldNameList[2]   > Employee.LastName
"Employee.LastName" ? ? "character" ? ? ? ? ? ? no ? no no "32.6" yes no no "U" "" ""
     _FldNameList[3]   = Employee.FirstName
     _Query            is OPENED
*/  /* BROWSE brEmployee */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
on end-error of C-Win /* Employee Information */
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
on window-close of C-Win /* Employee Information */
    do:
        /* This event will close the window and terminate the procedure.  */
        apply "CLOSE":U to this-procedure.
        return no-apply.
    end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define BROWSE-NAME brEmployee
&Scoped-define SELF-NAME brEmployee
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL brEmployee C-Win
on value-changed of brEmployee in frame DEFAULT-FRAME
    do:
        assign 
            fiYrsEmployed = YearsEmployed(Employee.EmpNum)
            fiYrsOld      = YearsOld(Employee.EmpNum).
        display fiYrsEmployed fiYrsOld with frame {&FRAME-NAME}.
    end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME BtnDone
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BtnDone C-Win
on choose of BtnDone in frame DEFAULT-FRAME /* Exit */
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
    if session:display-type = "GUI":U and VALID-HANDLE(C-Win) then delete widget C-Win.
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
    display fiYrsOld fiYrsEmployed 
        with frame DEFAULT-FRAME in window C-Win.
    enable brEmployee BtnDone RECT-2 
        with frame DEFAULT-FRAME in window C-Win.
    {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
    view C-Win.
end procedure.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

/* ************************  Function Implementations ***************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION YearsEmployed C-Win 
function YearsEmployed returns integer
    (input iEmpNum as integer) :
    /*------------------------------------------------------------------------------
      Purpose: Function design to return the number of years an employee has
               been employed. 
    ------------------------------------------------------------------------------*/
    define variable iResult as integer no-undo.

    find Employee no-lock where
        Employee.EmpNum = iEmpNum no-error.
    if available(Employee) then
        assign
            iResult = truncate((today - Employee.StartDate) / 365,0).
    return iResult.   /* Function return value. */

end function.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION YearsOld C-Win
function YearsOld returns integer 
    ( input iEmpNum as integer ):
    /*------------------------------------------------------------------------------
      Purpose: Function design to return employee's age. 
    ------------------------------------------------------------------------------*/
    define variable iResult as integer no-undo.

    find Employee no-lock where
        Employee.EmpNum = iEmpNum no-error.
    if available(Employee) then
        assign
            iResult = truncate((today - Employee.Birthdate) / 365,0).
    return iResult.   /* Function return value. */

end function.
    
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


