import sqlite3
import os.path


BASE_DIR = os.path.dirname(os.path.abspath(__file__))
db_path = os.path.join(BASE_DIR, "Project.db")
conn = sqlite3.connect(db_path)
c = conn.cursor()

gCars = []
gOrderNumber = 0
gTotal = 0
gCheck = -1

def search_car():
    global gTotal
    global gCheck
    global gCars

    search = input("Enter 1 to search by model; \tEnter 2 for manufacturer; \tEnter 3 for transmission; \tEnter 4 for price: ")
    if search == '1':
        model = input("Enter model you are looking for: ")
        query = "SELECT * FROM car WHERE model = ?"
        c.execute(query,[model])
        for row in c.fetchall():
            print(row)
            #print(row[0], " , ",  row[1], " , ", row[2]," , ", row[3], " , MPG: ", row[4]," , Price:$", row[5]," , Car ID: ", row[6])
        print("(Model,Manufacturer, Stock,Transmission, Fuel Efficiency,Price,Car ID)")
        
    elif search == '2':
        manu = input("Enter manufacturer you are looking for: ")
        query = "SELECT * FROM car WHERE manufacturer = ?"
        c.execute(query, [manu])
        for row in c.fetchall():
            print(row)
            #print(row[0], " , ",  row[1], " , ", row[2]," , ", row[3], " , MPG: ", row[4]," , Price:$", row[5]," , Car ID: ", row[6])
        print("(Model,Manufacturer, Stock,Transmission, Fuel Efficiency,Price,Car ID)")
        
    elif search == '3':
        trans = input("Enter transmission you are looking for: ")
        query = "SELECT * FROM car WHERE transmission = ?"
        c.execute(query, [trans])
        for row in c.fetchall():
            print(row)
            #print(row[0], " , ",  row[1], " , ", row[2]," , ", row[3], " , MPG: ", row[4]," , Price:$", row[5]," , Car ID: ", row[6])            
        print("(Model,Manufacturer, Stock,Transmission, Fuel Efficiency,Price,Car ID)")
        
    elif search == '4':
        value = input("Enter the price : ")
        sign = input("Enter 1 for greater; Enter 2 for less than: ")
        if sign == '1':
            query = "SELECT * FROM car WHERE price > ?"
            c.execute(query, [value])
            for row in c.fetchall():
                print(row)
                #print(row[0], " , ",  row[1], " , ", row[2]," , ", row[3], " , MPG: ", row[4]," , Price:$", row[5]," , Car ID: ", row[6])                
            print("(Model,Manufacturer, Stock,Transmission, Fuel Efficiency,Price,Car ID)")
            
        elif sign == '2':
            query = "SELECT * FROM car WHERE price < ?"
            c.execute(query, [value])
            for row in c.fetchall():
                print(row)
                #print(row[0], " , ",  row[1], " , ", row[2]," , ", row[3], " , MPG: ", row[4]," , Price:$", row[5]," , Car ID: ", row[6])
            print("(Model,Manufacturer, Stock,Transmission, Fuel Efficiency,Price,Car ID)")
            

def cart():

    #ID from car search as parameter. 
    id = '0'
    global gTotal
    global gCheck
    global gCars
    global gOrderNumber

    checkoutid = int(input("Enter your checkout ID: "))
    gCheck = checkoutid + 6000

    while id != 'x':

        id = input("Enter the car id you will like to add to cart; \tEnter x to exit: ")

        query = "SELECT * FROM car WHERE carid = ?"
        c.execute(query,[id])
        for row in c.fetchall():
            print(row, " Has been added to your cart")
            gCars.append(row[6])
            gTotal = gTotal + row[5]
            

def payment():
    global gTotal
    global gCheck
    global gCars
    global gOrderNumber

    option = '1'
    while option != 'x':
        option = input("Enter 1 to checkout; \tEnter 2 to make payment; \tEnter 3 to cancel order; \tEnter x to exit: ")
        if option == '1':
            print("Order Placed!")
        elif option == '2':
            ordernum = int(input("Enter your checkout ID : "))
            ordernum += 6000
            while(gTotal > 0):
                print("Amount Due: ", gTotal)
                payment = int(input("Enter the amount you wish to pay : "))
                if(payment < 0 or payment > gTotal):
                    print("Invalid payment amount. Please try again.")
                gTotal -= payment
                query = "UPDATE checkoutservice SET total = (total - ?) WHERE checkoutid = ?"

                c.execute(query,[payment,ordernum])

                query2 = "SELECT total FROM checkoutservice WHERE checkoutid = ?"
                c.execute(query2,[ordernum])
                for row in c.fetchall():
                    print("Remaining total: ",row)

                conn.commit()
            print("Order Complete. You have purchased : ")
            for row in gCars:
                query = "SELECT * FROM car WHERE carid = ?"
                c.execute(query,[row])
                for col in c.fetchall():
                    print(col)
        elif option == '3':
            custid = int(input("Enter your customer ID: "))
            custid += 3000
            orderid = int(input("Enter the order you will like to cancel: "))
            orderid += 1000
            query = "SELECT custid FROM customer WHERE custid = ?"
            c.execute(query, [custid])
            query = "DELETE FROM customer WHERE ordernumber = ? AND custid = ?"
            c.execute(query,[orderid,custid])
            query = "DELETE FROM accountant WHERE ordernumber = ?"
            c.execute(query,[orderid])
            gTotal = 0
            gCheck = -1
            gCars = []
            gOrderNumber = 0
            print("Order has now been deleted")
            conn.commit()

def manpayment():

    global gTotal
    global gCheck
    global gCars
    global gOrderNumber
    ordernum = int(input("Enter your checkout ID to make payment: "))
    ordernum += 6000
    payment = int(input("Enter the amount you wish to pay: "))
    query = "UPDATE checkoutservice SET total = (total - ?) WHERE checkoutid = ?"
    c.execute(query, [payment, ordernum])
    query2 = "SELECT total FROM checkoutservice WHERE checkoutid = ?"
    c.execute(query2, [ordernum])
    for row in c.fetchall():
        print("New total: ", row)

    conn.commit()

def mancancel():
    global gTotal
    global gCheck
    global gCars
    global gOrderNumber

    custid = int(input("Enter the customer ID: "))
    custid += 3000
    query = "SELECT ordernumber FROM customer WHERE custid = ?"
    c.execute(query, [custid])
    for row in c.fetchall():
        print("Order number for the customer: ", row)
    orderid = int(input("Enter the order you will like to cancel: "))
    orderid += 1000

    query = "DELETE FROM customer WHERE ordernumber = ? AND custid = ?"
    c.execute(query, [orderid, custid])
    query = "DELETE FROM accountant WHERE ordernumber = ?"
    c.execute(query, [orderid])
    print("Order has now been deleted")
    conn.commit()


def manrefund():
    global gTotal
    global gCheck
    global gCars
    global gOrderNumber
    ordernum = int(input("Enter the order number to issue the refund: "))
    ordernum += 1000
    query = "UPDATE refund SET orderstatus = 'T' WHERE ordernumber = ?"
    c.execute(query,[ordernum])
    query1 = "SELECT * FROM refund WHERE ordernumber = ?"
    c.execute(query1, [ordernum])
    for row in c.fetchall():
        print("Refund processed! " , row)

    conn.commit()

def mandelete():
    global gTotal
    global gCheck
    global gCars
    global gOrderNumber
    custid = '0'
    areyousure = '0'

    while custid != "exit":

        custid = input("Enter the customer ID to delete customer info; \tEnter exit to quit: ")
        newCustID = int(custid)
        newCustID += 3000

        while areyousure != 'x':

            areyousure = input("Are you sure you want to delete this information? \tEnter y for yes; n for no: ")

            if areyousure == 'y':

                query = "DELETE FROM customer WHERE custid = ?"

                c.execute(query, [custid])

                areyousure = 'x'



            elif areyousure == 'n':

                areyousure = 'x'








key = '100'

while key != '3':

    key = input("Enter 1 to enter customer mode; Enter 2 to enter management mode; Enter 3 to exit: ")

    if key == '1':

        while key != '0':

            request = input("Enter 1 to search car; Enter 2 to add to cart or check cart; Enter 3 to checkout or make payment or cancel order; Enter 0 to return to original options: ")

            if request == '1':
                search_car()
            elif request == '2':
                cart()
            elif request == '3':
                payment()
            elif request == '0':
                key = '0'

    elif key == '2':

        password = input("Enter management password: ")
        manpass = '1234'

        if password == manpass:

            while key != '0':

                manmode = input("Enter 1 to make payment; \tEnter 2 to cancel order; \tEnter 3 to issue refund; \tEnter 4 to delete customer info; \tEnter 0 to exit: ")

                if manmode == '1':
                    manpayment()
                elif manmode == '2':
                    mancancel()
                elif manmode == '3':
                    manrefund()
                elif manmode == '4':
                    mandelete()
                elif manmode == '0':
                    key = '0'
        elif password != manpass:

            print('Access Denied')
    elif key == '3':
        c.close()
        conn.close()