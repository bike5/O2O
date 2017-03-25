# -*- coding: utf-8 -*-
"""
Created on Sun Nov 06 17:14:16 2016
 
@author: Administrator
"""
from __future__ import division
import csv
import time
import MySQLdb

def offlineTrainData():
    offline_train_data = []
    with open("splitData\data123456.csv") as fs:
        data = csv.reader(fs)
        for line in data:
            offline_train_data.append(line)
    return offline_train_data

def python_operate_mysql(offlineTrainData):
    
            
    db = MySQLdb.connect('localhost','root','0324','o2o')
    cursor = db.cursor()
    cursor.execute("DROP TABLE IF EXISTS data123456")     
     
    cursor.execute("create table data123456(\
    User_id INT NOT NULL,\
    Merchant_id INT NOT NULL,\
    Coupon_id INT,\
    Discount_rate CHAR(255),\
    Distance TINYINT,\
    Date_received DATE,\
    Date DATE)")
    
    for line in offlineTrainData:
        User_id = line[0]
        Merchant_id = line[1]
        Counpon_id = line[2]
        Discount_rate = line[3]
        Date_received = line[5]
        Distance = line[4]
        Date = line[6]
        sql = "insert into data123456\
    (User_id, Merchant_id, Coupon_id, Discount_rate, Distance, Date_received, Date)\
    values\
    (%s,%s,%s,'%s',%s,%s,%s)"%(User_id, Merchant_id, Counpon_id, Discount_rate, Distance ,Date_received, Date)
        #print sql
        cursor.execute(sql)
    cursor.close()
    
    db.commit()
    db.close()
        
