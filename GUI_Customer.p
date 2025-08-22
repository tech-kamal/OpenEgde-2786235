/*  Declare Variable */
SESSION:DATE-FORMAT = "DMY".
DEFINE VARIABLE vCust_Id AS INTEGER NO-UNDO VIEW-AS FILL-IN SIZE 10 BY 1.

DEFINE VARIABLE vFirst_Name AS CHARACTER NO-UNDO VIEW-AS FILL-IN SIZE 30 BY 1.
DEFINE VARIABLE vLast_Name AS CHARACTER NO-UNDO VIEW-AS FILL-IN SIZE 30 BY 1.

DEFINE VARIABLE vGender AS CHAR   
NO-UNDO VIEW-AS
RADIO-SET RADIO-BUTTONS "Male", "Male", "Female", "Female"
HORIZONTAL SIZE 30 BY 1.

DEFINE VARIABLE vPhone AS CHARACTER 
FORMAT "9999999999"   NO-UNDO VIEW-AS FILL-IN SIZE 20 BY 1.
DEFINE VARIABLE vAddress AS CHARACTER NO-UNDO VIEW-AS FILL-IN SIZE 30 BY 1 .
DEFINE VARIABLE vDOB AS DATE NO-UNDO VIEW-AS FILL-IN SIZE 20 BY 1.
DEFINE VARIABLE vCountry AS CHARACTER FORMAT "x(50)"  NO-UNDO VIEW-AS FILL-IN SIZE 20 BY 1.
DEFINE VARIABLE vMobile AS CHARACTER 
FORMAT "9999999999"   NO-UNDO VIEW-AS FILL-IN SIZE 20 BY 1.
DEFINE VARIABLE vEmail AS CHARACTER NO-UNDO VIEW-AS FILL-IN SIZE 40 BY 1 .
DEFINE VARIABLE vDocuments AS CHARACTER   NO-UNDO LABEL "Available Document" VIEW-AS TEXT.
DEFINE VARIABLE vPassbook AS LOGICAL   NO-UNDO VIEW-AS TOGGLE-BOX.
DEFINE VARIABLE vATM AS LOGICAL   NO-UNDO VIEW-AS TOGGLE-BOX.
DEFINE VARIABLE vCheque_Book AS LOGICAL   NO-UNDO VIEW-AS TOGGLE-BOX.
/*DEFINE VARIABLE vEmailUser AS CHARACTER 
FORMAT "x(50)"  NO-UNDO VIEW-AS FILL-IN SIZE 22 BY 1.
DEFINE VARIABLE vEmailDomain AS CHARACTER   NO-UNDO
           VIEW-AS COMBO-BOX 
           LIST-ITEMS "@gmail", "@yahoo", "@email"
           DROP-DOWN-LIST  SIZE 15 BY 1.
DEFINE VARIABLE vEmailExt AS CHARACTER NO-UNDO
           VIEW-AS COMBO-BOX 
           LIST-ITEMS  ".com", ".in", ".org", ".net"
           DROP-DOWN-LIST SIZE 10 BY 1.     */
           
    /* Define Button */       
DEFINE BUTTON btnAdd LABEL "Add".
DEFINE BUTTON btnUpdate LABEL "Update".
DEFINE BUTTON btnDelete LABEL "Delete".
DEFINE BUTTON btnExit LABEL "Exit".

DEFINE FRAME CustDetails
         vCust_Id        LABEL "Customer ID"                AT ROW 2 COL 10
         vFirst_Name       LABEL "First Name"                  AT ROW 4 COL 10
          vLast_Name       LABEL "Last Name"                  AT ROW 4 COL 60
         vGender          LABEL "Gender"                             AT ROW 6 COL 10
         vDOB              LABEL "Date Of Birth"                             AT ROW 6 COL 60
         vPhone            LABEL "Phone"                                        AT ROW 8 COL 10
         vAddress          LABEL "Address"                                    AT ROW 8 COL 60
         vEmail             LABEL "Email"                                           AT ROW 10 COL 10
         vCountry         LABEL "Country"                                   AT ROW 10 COL 60
         /* vEmailUser        LABEL "EmailUser"                              AT ROW 16 COL 10
         vEmailDomain            AT ROW 16 COL 45
         vEmailExt               AT ROW 16 COL 80  */
         vDocuments       AT ROW 12 COL 10
          vPassbook                LABEL "Passbook"                              AT ROW 13 COL 10
          vATM                LABEL "ATM Card"                              AT ROW 13 COL 35
          vCheque_Book                LABEL "Cheque Book"                              AT ROW 13 COL 60
         btnAdd                 AT ROW 15 COL 20
         btnUpdate                 AT ROW 15 COL 40
         btnDelete                 AT ROW 15 COL 60
         btnExit                 AT ROW 15 COL 80
WITH SIDE-LABELS VIEW-AS DIALOG-BOX TITLE "Fill Details" SIZE 120 BY 20.

ENABLE ALL WITH FRAME    CustDetails.
WAIT-FOR WINDOW-CLOSE OF FRAME CustDetails.
