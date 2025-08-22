Define Query Customer-Query FOR Customer.

Define Variable Crt-Rcrd   As RowId   No-Undo.
Define Variable Anwser     As Logical No-Undo.

Define Button btn-Prev      Label "Prev"    size 20 by 2.
Define Button btn-Next      Label "Next"    size 20 by 2.
Define Button btn-Add       Label "Add"     size 20 by 2.
Define Button btn-Update  Label "Update"  size 20 by 2.
Define Button btn-Delete   Label "Delete"  size 20 by 2.                                              
Define Button btn-Exit        Label "Exit"    size 20 by 2.

Define Button btn-OK       Label "OK".
Define Button btn-Cancel Label "Cancel".

Define Frame Frame1
Sports2025.Customer.CustNum           LABEL      "Customer No."      AT ROW 2 COL 10
Sports2025.Customer.Name                 LABEL      "Customer Name"  AT ROW 4 COL 10
Sports2025.Customer.Address              LABEL      "Address"                AT ROW 4 COL 60
Sports2025.Customer.City                     LABEL      "City"                       AT ROW 6 COL 10
Sports2025.Customer.Phone                 LABEL      "Phone"                   AT ROW 6 COL 60
Sports2025.Customer.Balance               LABEL     "Balance"                 AT ROW 8 COL 10
Sports2025.Customer.State                   LABEL      "State"                     AT ROW 8 COL 60
Sports2025.Customer.EmailAddress    LABEL "EmailAddress"            AT ROW 10 COL 10

btn-Add          AT ROW 12 COL 20
btn-Update     AT ROW 12 COL 50
btn-Delete      AT ROW 12 COL 80
                   
btn-Prev         AT ROW 14 COL 20
btn-Next         AT ROW 14 COL 50
btn-Exit           AT ROW 14 COL 80

WITH SIDE-LABELS view-as Dialog-box with title "Customer Details" size 120 BY 20.

On Choose of btn-Add Do:
DEFINE VARIABLE Info-text AS CHARACTER  FORMAT "x(100)" NO-UNDO VIEW-AS TEXT.
         create Customer.
	     Update 
         Customer.CustNum     AT ROW 2 COL 10
             NAME                        AT ROW 4 COL 10
	         Address                     AT ROW 10 COL 10
             City                            AT ROW 6 COL 10
             Phone                        AT ROW 8 COL 10
	     	 Balance                      AT ROW 6 COL 60
             State                          AT ROW 4 COL 60                 
             EmailAddres             AT ROW 12 COL 10 
             Info-text       LABEL  "Please  Fill The All Entry Then Enter  To Exit."     AT ROW 15 COL 10  
         WITH SIDE-LABELS VIEW-AS DIALOG-BOX 
         TITLE "ADD CUSTOMER THE DATA" SIZE 100 BY 25 FRAME frame2.
	     Display CustNum Name Address City Phone Balance State EmailAddres with frame frame1.
         WAIT-FOR WINDOW-CLOSE OF FRAME frame2.
End.

On Choose of btn-Update Do:
DEFINE VARIABLE Info-text-Update AS CHARACTER  FORMAT "x(100)" NO-UNDO VIEW-AS TEXT.
    Crt-Rcrd = ROWID(Customer).
	
	Find First Customer Where ROWID(Customer) = Crt-Rcrd Exclusive-Lock.
	
	IF AVAILABLE(Customer) THEN 
	DO:
	    Update Customer.Name    AT ROW 2 COL 10
        Address                                AT ROW 4 COL 10
        City                                       AT ROW 4 COL 60
        Phone                                   AT ROW 7 COL 10
		Balance                                 AT ROW 7 COL 60
        State                                     AT ROW 10 COL 10
        EmailAddres                        AT ROW 12 COL 10
          Info-text-Update    LABEL  "Please  Update Whose Field Change Then Enter  To Exit."     AT ROW 14 COL 10
          WITH SIDE-LABELS VIEW-AS DIALOG-BOX  TITLE "UPDATE CUSTOMER" SIZE 100 BY 25  FRAME Frame2.
          Display CustNum Name Address City Phone Balance State EmailAddres with 2 col frame frame1.
        	
	END.
	Else 
	DO:
	    Find First Customer Where ROWID(Customer) = Crt-Rcrd No-Lock.
		Message "Record in Use. Unable To Update." view-as ALERT-BOX.
    End.

End.

ON Choose of btn-Delete DO:
        Message "Do You Really Want To Delete" Customer.Name "?"
        view-as alert-box question button yes-no Update Anwser.

    If Anwser Then Do:
        Crt-Rcrd = RowId(Customer).
	   
	    Find First Customer Where RowId(Customer) = Crt-Rcrd No-Error.
			if AVAILABLE(Customer) THEN DO:
			Delete Customer.
			
			Open Query Customer-Query For Each Customer No-Lock.
			Get FIRST Customer-Query.
			
			Display  Customer.CustNum Name Address City Phone Balance State EmailAddres with 2 col frame frame1.
	END.
	Else DO:
	    Find First Customer Where RowId(Customer) = Crt-Rcrd No-Error.
		Message "Record in Use. Unable To Delete." view-as ALERT-BOX.
    End.
     End.
end.



On Choose Of btn-Prev Do:
    Get Prev Customer-Query.
	if Query-OFF-End ("Customer-Query") then get last Customer-Query.
	Display Customer.CustNum Name Address City Phone Balance State EmailAddres with 2 col frame frame1.

end.

On Choose Of btn-Next Do:
    Get Next Customer-Query.
	if Query-OFF-End ("Customer-Query") then get First Customer-Query.
	Display Customer.CustNum Name Address City Phone Balance State EmailAddres with 2 col frame frame1.

end.

Open Query Customer-Query for each Customer.

Get First Customer-Query.

Display Customer.CustNum Name Address City Phone Balance State EmailAddres with frame frame1 Use-text.

Enable 
    btn-Add
    btn-Update
    btn-Delete  
    btn-Prev  
    btn-Next  
    btn-Exit    
	with frame frame1.
	
Wait-For CHOOSE of btn-Exit.
Close Query Customer-Query.

