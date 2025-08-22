One -----

DEFINE QUERY qEmp FOR Employee.
OPEN QUERY qEmp FOR EACH Employee.
GET FIRST qEmp.

DO WHILE AVAIL(Employee):
      DISPLAY Employee WITH 2 COL TITLE "Employees Details.".
      GET NEXT qEmp.
      PAUSE.
END.
CLOSE QUERY qEmp.

Two -----

DEFINE QUERY qEmp FOR Employee.
OPEN QUERY qEmp FOR EACH Employee 
            WHERE employee.DeptCode = "400".
GET FIRST qEmp.
DO WHILE AVAIL(Employee):
        DISP Employee WITH 2 COL TITLE "Customer Details".
        GET NEXT qEmp.
        PAUSE.
END.
CLOSE QUERY qEmp.

Three -----

DEFINE QUERY qEmp FOR Employee.
OPEN QUERY  qEmp FOR EACH Employee BY Employee.firstName.
GET FIRST qEmp.

DO WHILE AVAIL(Employee):
        DISP Employee WITH 2 COL TITLE "Customer Details".
        GET NEXT qEmp.
        PAUSE.
END.

CLOSE QUERY qEmp.  

Four ------

DEFINE QUERY qCust FOR Customer.
DEFINE VARIABLE iCount AS INTEGER     NO-UNDO.
OPEN QUERY  qCust FOR EACH Customer BY Customer.Balance DESC.
GET FIRST qCust.

DO WHILE AVAIL(Customer):
        iCount = iCount + 1.
        DISP Customer WITH 2 COL TITLE "Customer Details" SIZE 100 BY 20.
        GET NEXT qCust.
        PAUSE.
        IF iCount = 10 THEN   LEAVE.      
END.
CLOSE QUERY qCust.   

Five -------

DEFINE QUERY qOrder FOR Order.
DEFINE VARIABLE dToday AS DATE        NO-UNDO.
DEFINE VARIABLE dFromDate AS DATE        NO-UNDO.

ASSIGN       dToday = 07/23/23.
                    dFromDate = dToday - 30.
 
OPEN QUERY qOrder FOR EACH Order
           WHERE Order.OrderDate <= dFromDate
            BY Order.OrderDate DESC.
GET FIRST  qOrder.

DO WHILE AVAIL(Order):
          DISP   Order WITH 2 COL TITLE "Order 30 Days".
          GET NEXT qOrder.
          PAUSE.
END.
CLOSE QUERY qOrder.     

--------------------------------
All Order Showing =>>>>>>>>>>>>>

FOR EACH order:
         DISP   Order WITH 2 COL TITLE "Order Details".
END.  
