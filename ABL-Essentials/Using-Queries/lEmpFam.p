/*------------------------------------------------------------------------
    File        : lEmpFam.p
    Purpose     : Scroll through a list of employee relations.
    Author(s)   : modified by Jade Neeley
    Notes       : Add code to make the First button (BtnFirst) reposition the browse to the first record.
                  Add code to make the Last button (BtnLast) reposition the browse to the last record.
  ----------------------------------------------------------------------*/

/*  Preprocessor Definitions                                            */
&Scoped-define WINDOW-NAME C-Win
&Scoped-define BROWSE-NAME brEmployee
&Scoped-define OPEN-QUERY-brEmployee OPEN QUERY brEmployee ~
      FOR EACH Employee NO-LOCK, EACH Family OF Employee NO-LOCK.
&Scoped-define OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME {&OPEN-QUERY-brEmployee}

/* Define the widget handle for the window                              */
DEFINE VAR C-Win AS WIDGET-HANDLE NO-UNDO.

/* Button definitions                                                   */
DEFINE BUTTON BtnDone DEFAULT 
     LABEL "&Done" 
     SIZE 15 BY 1.14
     BGCOLOR 8 .

DEFINE BUTTON BtnFirst 
     LABEL "&First" 
     SIZE 15 BY 1.14
     BGCOLOR 8 .

DEFINE BUTTON BtnLast 
     LABEL "&Last" 
     SIZE 15 BY 1.14
     BGCOLOR 8 .

/* Query definition                                                     */
DEFINE QUERY brEmployee FOR Employee, Family SCROLLING.

/* Browse definition                                                    */
DEFINE BROWSE brEmployee
      QUERY brEmployee NO-LOCK DISPLAY
      Employee.EmpNum FORMAT "zzzzzzzzz9"
      Employee.FirstName FORMAT "x(15)"
      Employee.LastName FORMAT "x(25)" WIDTH 20.4
      Family.RelativeName FORMAT "x(15)" WIDTH 25.8
      Family.Relation FORMAT "x(15)"
      WITH NO-ROW-MARKERS SEPARATORS SIZE 94 BY 7.38 FIT-LAST-COLUMN.

/*  Frame Definition                                                    */
DEFINE FRAME DEFAULT-FRAME
     brEmployee AT ROW 1.95 COL 7
     BtnDone AT ROW 10.29 COL 85
     BtnFirst AT ROW 10.52 COL 14
     BtnLast AT ROW 10.52 COL 38
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 104 BY 11.57
         DEFAULT-BUTTON BtnDone.
/*   Create the window                                                  */
CREATE WINDOW C-Win ASSIGN
         HIDDEN             = YES
         TITLE              = "Employee Families"
         HEIGHT             = 11.57
         WIDTH              = 104
         MAX-HEIGHT         = 18.62
         MAX-WIDTH          = 113.6
         VIRTUAL-HEIGHT     = 18.62
         VIRTUAL-WIDTH      = 113.6
         RESIZE             = yes
         SCROLL-BARS        = no
         STATUS-AREA        = no
         THREE-D            = yes
         SENSITIVE          = yes.

/*   Control Triggers                                                  */

ON END-ERROR OF C-Win OR ENDKEY OF {&WINDOW-NAME} ANYWHERE 
DO:
  /* This case occurs when the user presses the "Esc" key.
     In a persistently run window, just ignore this.  If we did not, the
     application would exit. */
  IF THIS-PROCEDURE:PERSISTENT THEN RETURN NO-APPLY.
END.

ON WINDOW-CLOSE OF C-Win 
DO:
  /* This event will close the window and terminate the procedure.  */
  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN NO-APPLY.
END.

ON CHOOSE OF BtnDone IN FRAME DEFAULT-FRAME 
DO:
  APPLY "CLOSE":U TO THIS-PROCEDURE.
END.

ON CHOOSE OF BtnFirst IN FRAME DEFAULT-FRAME 
DO:
  GET FIRST brEmployee.
  REPOSITION brEmployee TO ROWID ROWID(Employee).
END.

ON CHOOSE OF BtnLast IN FRAME DEFAULT-FRAME 
DO:
  GET LAST brEmployee.
  REPOSITION brEmployee TO ROWID ROWID(Employee).
END.

/* ***************************  Main Block  *************************** */
/* The CLOSE event can be used from inside or outside the procedure to  */
/* terminate it.                                                        */
ON CLOSE OF THIS-PROCEDURE 
  RUN disable_UI.

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
  RUN enable_UI.
  IF NOT THIS-PROCEDURE:PERSISTENT THEN
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
END.

/* **********************  Internal Procedures  *********************** */
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Delete the WINDOW we created */
    IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

PROCEDURE enable_UI :
/*------------------------------------------------------------------------------
  Purpose:     ENABLE the User Interface
  Notes:       Here we display/view/enable the widgets in the
               user-interface.  In addition, OPEN all queries
               associated with each FRAME and BROWSE.
------------------------------------------------------------------------------*/
    ENABLE brEmployee BtnDone BtnFirst BtnLast 
        WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
    {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
    VIEW C-Win.
END PROCEDURE.
