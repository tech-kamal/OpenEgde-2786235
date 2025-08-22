DEFINE TEMP-TABLE ttCustomer NO-UNDO
        FIELD ttcust AS INT
        FIELD ttName AS CHAR
        FIELD ttOrdernum AS INT.
        
 FOR EACH customer NO-LOCK:
      FOR EACH order NO-LOCK WHERE order.custnum = customer.custnum.
       CREATE ttCustomer.
       ASSIGN ttCustomer.ttcust = Customer.custnum.
                      ttCustomer.ttName = Customer.NAME.
                      ttCustomer.ttOrdernum = Order.ordernum.
 END.
END. 
FOR EACH ttCustomer:
        DISPLAY ttCustomer WITH 2 COL.
END.
