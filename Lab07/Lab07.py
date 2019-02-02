import sqlite3

def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS warehouse(w_warehousekey DECIMAL(3,0) NOT NULL, w_name CHAR(25) NOT NULL, w_suppkey DECIMAL(2,0) NOT NULL,'
              ' w_capacity DECIMAL(6,2) NOT NULL, w_address VARCHAR(40) NOT NULL, w_nationkey DECIMAL(2,0) NOT NULL)')
    conn.commit()

def dynamic_data():
    warehouse = input("what warehouse number?")
    name = input("Warehouse name? ")
    supplier = input("enter supplier number: ")
    capacity = input("Capacity? ")
    address = input("Address? ")
    nation = input("nation?")
    query = "INSERT INTO warehouse(w_warehousekey, w_name, w_suppkey, w_capacity, w_address, w_nationkey) VALUES (?, ?, ?, ?, ?, ?)"
    c.execute(query, [warehouse, name,supplier, capacity,address,nation])
    conn.commit()

def find_min():
    c.execute("SELECT s_name, MIN(wcnt) FROM (SELECT s_name, COUNT(w_name) as wcnt FROM supplier, warehouse WHERE s_suppkey = w_suppkey GROUP BY s_name)")
    for row in c.fetchall():
        print(row)


def find_max():
    c.execute('SELECT MAX(wmax) FROM (SELECT MAX(w_capacity) as wmax FROM supplier, warehouse WHERE s_suppkey = w_suppkey GROUP BY s_name)')
    for row in c.fetchall():
        print(row)

def find_euro_ware():
    capacity = input("What capacity are you looking for? ")
    query ="SELECT w_name FROM nation, warehouse WHERE n_nationkey = w_nationkey AND n_name = 'EUROPE' AND w_capacity = ?"
    c.execute(query, [capacity,])
    for row in c.fetchall():
        print(row)

def find_supp_quant():
    suppname = input("What suppier name do you want to find? ")
    c.execute("SELECT s_name, SUM(w_capacity), ps_availqty FROM supplier, warehouse, partsupp WHERE s_suppkey  = w_suppkey AND ps_suppkey = s_suppkey AND s_name = ?",[suppname])
    for row in c.fetchall():
        print(row)

def find_nation_ware():
    nation = input("what is the nation? ")
    c.execute("SELECT w_name FROM nation, warehouse WHERE n_nationkey = w_nationkey AND n_name = ? ORDER BY w_capacity DESC",[nation])
    for row in c.fetchall():
        print(row)

def update_supp():
    supplier1 = input("What is the first supplier?")
    supplier2 = input("what is the second supplier?")
    c.execute("UPDATE warehouse SET w_suppkey = ? WHERE w_suppkey = ?",[supplier1,supplier2])
    for row in c.fetchall():
        if row == 0:
            print("NONE")
        else:
            print(row)





def disconnect():
    c.close()
    conn.close()


key = 1

while key != "0":

    key = input("Enter 8 to create table or enter 1 to Enter Data or 2 for query one or 3 for query up to query six which is number 7 or 9 to connect, 10 to disconnecy or 0 to exit: ")

    if key == '1':
        dynamic_data()
    elif key == '2':
        find_min()
    elif key == '3':
        find_max()
    elif key == '4':
        find_euro_ware()
    elif key == '5':
        find_supp_quant()
    elif key == '6':
        find_nation_ware()
    elif key == '7':
        update_supp()
    elif key == '8':
        create_table()
        while x < 1000:
            query = "INSERT INTO warehouse(w_warehousekey, w_name, w_suppkey, w_capacity, w_address, w_nationkey) VALUES (?, ?, ?, ?, ?, ?)"
            c.execute(query, [x, null, null, null, null, null])
            x = x + 1
    elif key == '9':
        conn = sqlite3.connect('TPCH')
        c = conn.cursor()
        null = True
        x = 0

    elif key == '10':
        disconnect()
    else:
        key = '0';


c.close()
conn.close()