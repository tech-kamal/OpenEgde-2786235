DEFINE QUERY qCustomer FOR Customer.
OPEN QUERY qCustomer FOR EACH Customer 
        WHERE Customer.Balance > 10000
        BY Customer.NAME.
 
 GET FIRST qCustomer.
 DO WHILE AVAIL(Customer):
        DISPLAY Customer.CustNum
                        Customer.NAME
                        Customer.Balance
                        WITH FRAME A.
                        PAUSE.
        GET NEXT qCustomer.
 END.
 CLOSE  QUERY qCustomer.
