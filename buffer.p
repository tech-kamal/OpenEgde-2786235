// all Questions Of Buffer 

/* all records by buffer */
/*
DEFINE BUFFER bCust FOR Customer.
FOR EACH bCust NO-LOCK:
       DISPLAY bCust WITH 2 COL FRAME A SIZE 100 BY 20.
END.        */

/* Condition Buffer */
/*
DEFINE BUFFER bCust FOR Customer.
FIND FIRST bCust NO-LOCK.
IF AVAIL bCust THEN
DO:
       DISP bCust WITH 2 COL SIZE 100 BY 20. 
END.
ELSE
      MESSAGE "Customer Not Found."
          VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.   */
 /*         
 DEFINE BUFFER qCust FOR Customer.
 DEFINE VARIABLE iCustNo AS INTEGER     NO-UNDO.
 DEFINE VARIABLE dNewBalance AS DECIMAL     NO-UNDO.
 UPDATE   iCustNo LABEL "Enter Your Customer No: ".
 UPDATE   dNewBalance LABEL "Enter Your NewBalance: ".
 
 FIND qCust EXCLUSIVE-LOCK WHERE qCust.CustNum = iCustNo NO-ERROR.
 IF AVAIL qCust THEN
 DO:
          qCust.Balance =    dNewBalance.
          MESSAGE "You Updated Successfull Your Balance: " qCust.NAME
              VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
 END.
 ELSE DO:
          MESSAGE "Customer Not Found."
              VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
 END.
 
  IF AVAIL qCust THEN
 DO:
          DISP qCust.NAME ", Your Balance Is : " qCust.Balance WITH FRAME xam.
 END.           */
 
/* 
DEFINE BUFFER qCust FOR Customer.
DEFINE VARIABLE iNo AS INTEGER     NO-UNDO.
UPDATE iNo LABEL "Enter Customer Name: ".
FIND FIRST qCust NO-LOCK WHERE qCust.CustNum =   iNo NO-ERROR.

IF NOT AVAIL  qCust THEN
DO:
          MESSAGE "Customer Not Find."
              VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.
ELSE
         MESSAGE "Welcome To The " qCust.NAME
             VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
 
*/
  /*
DEFINE BUFFER qCust1 FOR Customer.
DEFINE BUFFER qCust2 FOR Customer.

FOR EACH qCust1 NO-LOCK BY qCust1.NAME:
      DISPLAY qCust1.custNum NAME address city WITH FRAME xam DOWN.
END.

FOR EACH qCust2 NO-LOCK BY qCust2.State:
      DISPLAY NAME Balance City WITH FRAME xamx DOWN.
END.   */
/*
DEFINE BUFFER bSource FOR Customer.
DEFINE BUFFER  bTarget FOR Customer.
DEFINE VARIABLE iCustNo AS INTEGER     NO-UNDO.
UPDATE iCustNo LABEL "Enter Customer Number To Copy.".

FIND bSource NO-LOCK WHERE bSource.custNum = iCustNo   NO-ERROR.

IF AVAILABLE bSource THEN
DO:
          CREATE  bTarget.
          BUFFER-COPY  bSource TO bTarget.
          MESSAGE "Record Copied Successfully!"
              VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.
ELSE DO:
         MESSAGE "Customer Not Found."
             VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.   */
  /*
DEFINE BUFFER bCust FOR Customer.
DEFINE VARIABLE iNo AS INTEGER     NO-UNDO.
UPDATE iNo LABEL "Enter Number Whose Delete".
FIND bCust EXCLUSIVE-LOCK WHERE bCust.custNum = iNo NO-ERROR.

IF AVAIL bCust THEN
DO:
        DELETE bCust.
        MESSAGE "Customer Delete Successfull."
            VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.
ELSE
        MESSAGE "Customer Not Found."
           VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.          */
/*
DEFINE BUFFER bCust FOR Customer.
DEFINE VARIABLE i AS INTEGER     NO-UNDO.
FOR EACH bCust NO-LOCK:
        i = i + 1.
        DISP bCust WITH 2 COL SIZE 100 BY 20.
        IF i = 11 THEN LEAVE.
END.   */

 /*
DEFINE BUFFER bCust FOR Customer.
DEFINE VARIABLE iCount AS INTEGER     NO-UNDO.
ASSIGN iCount = 0.

FOR EACH bCust NO-LOCK:
        iCount = iCount + 1.
END.

MESSAGE "Total Record Is : " iCount
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.     */










































          
          
          
          
          
          
          
          
          
          
          
          
          
          
