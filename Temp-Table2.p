DEFINE TEMP-TABLE ttCustomer NO-UNDO
       FIELD CustID             AS INTEGER
       FIELD CustName      AS CHARACTER
       FIELD CustBalance   AS DECIMAL
       FIELD CustPhone     AS CHARACTER
       FIELD CustAddress  AS CHARACTER .
       
       
    /*        FOR EACH customer :
                   CREATE  ttCustomer.
                   ASSIGN
                             ttCustomer.CustID            =     Customer.custNum
                             ttCustomer.CustName      =     Customer.NAME
                             ttCustomer.CustBalance   =     Customer.Balance
                             ttCustomer.CustPhone     =     Customer.Phone
                             ttCustomer.CustAddress   =    Customer.Address.
                             
             END.        */
             
    CREATE ttCustomer.
    ASSIGN 
                 ttCustomer.CustID               =   1
                 ttCustomer.CustName        =   "Salam"
                 ttCustomer.CustBalance      =    2365.5
                 ttCustomer.CustPhone        =     "987894651".
                 
                 
 FOR EACH ttCustomer:
             DISPLAY
             CustID  
             CustName   
             CustBalance   
             CustPhone 
             CustAddress WITH 2 COL.
 END.
 
