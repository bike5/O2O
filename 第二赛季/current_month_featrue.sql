
--month 1
create table c_time_1 as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data1 group by coupon_id,date_received;

create table user_time_1 as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data1 group by user_id,date_received;

create table b_time_1 as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data1 group by merchant_id,date_received;

create table d_1 as
select distance,sum(if(coupon_id='null',0,1)) as d
from data1 group by distance;

create table dis_d_1 as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data1 group by discount_rate,distance;

create table c_d_1 as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data1 group by coupon_id,distance;

create table b_d_1 as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data1 group by merchant_id,distance;

create table user_d_1 as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data1 group by user_id,distance;

create table user_c_d_1 as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data1 group by user_id,coupon_id,distance;

create table user_dis_d_1 as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data1 group by user_id,discount_rate,distance;

create table b_c_d_1 as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data1 group by merchant_id,coupon_id,distance;

create table b_dis_d_1 as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data1 group by  merchant_id,discount_rate,distance;

create table c_dis_d_1 as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data1 group by  coupon_id,discount_rate,distance;

create table user_c_time_1 as
select user_id,coupon_id,date_received,sum(if(coupon_id='null',0,1)) as user_c_time
from data1 group by  user_id,coupon_id,date_received;

create table user_c_last_received_time_1 as
select user_id,coupon_id,max(date_received) as last_received_time from user_c_time_1 group by user_id,coupon_id


create table user_b_time_1 as
select user_id,merchant_id,date_received,sum(if(coupon_id='null',0,1)) as user_b_time
from data1 group by  user_id,merchant_id,date_received;

create table user_dis_time_1 as
select user_id,discount_rate,date_received,sum(if(coupon_id='null',0,1)) as user_dis_time
from data1 group by  user_id,discount_rate,date_received;

create table time_1 as
select date_received, sum(if(coupon_id='null',0,1)) as times 
from data1 group by date_received



--month 2

create table user_c_time_2 as
select user_id,coupon_id,date_received,sum(if(coupon_id='null',0,1)) as user_c_time
from data2 group by  user_id,coupon_id,date_received;

create table user_b_time_2 as
select user_id,merchant_id,date_received,sum(if(coupon_id='null',0,1)) as user_b_time
from data2 group by  user_id,merchant_id,date_received;

create table user_dis_time_2 as
select user_id,discount_rate,date_received,sum(if(coupon_id='null',0,1)) as user_dis_time
from data2 group by  user_id,discount_rate,date_received;

create table time_2 as
select date_received, sum(if(coupon_id='null',0,1)) as times 
from data2 group by date_received

create table user_c_last_received_time_2 as
select user_id,coupon_id,max(date_received) as last_received_time from user_c_time_2 group by user_id,coupon_id

--month 3
create table c_time_3 as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data3 group by coupon_id,date_received;

create table user_time_3 as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data3 group by user_id,date_received;

create table b_time_3 as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data3 group by merchant_id,date_received;

create table d_3 as
select distance,sum(if(coupon_id='null',0,1)) as d
from data3 group by distance;

create table dis_d_3 as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data3 group by discount_rate,distance;

create table c_d_3 as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data3 group by coupon_id,distance;

create table b_d_3 as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data3 group by merchant_id,distance;

create table user_d_3 as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data3 group by user_id,distance;

create table user_c_d_3 as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data3 group by user_id,coupon_id,distance;

create table user_dis_d_3 as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data3 group by user_id,discount_rate,distance;

create table b_c_d_3 as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data3 group by merchant_id,coupon_id,distance;

create table b_dis_d_3 as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data3 group by  merchant_id,discount_rate,distance;

create table c_dis_d_3 as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data3 group by  coupon_id,discount_rate,distance;


create table user_c_time_3 as
select user_id,coupon_id,date_received,sum(if(coupon_id='null',0,1)) as user_c_time
from data3 group by  user_id,coupon_id,date_received;

create table user_b_time_3 as
select user_id,merchant_id,date_received,sum(if(coupon_id='null',0,1)) as user_b_time
from data3 group by  user_id,merchant_id,date_received;

create table user_dis_time_3 as
select user_id,discount_rate,date_received,sum(if(coupon_id='null',0,1)) as user_dis_time
from data3 group by  user_id,discount_rate,date_received;


create table time_3 as
select date_received, sum(if(coupon_id='null',0,1)) as times 
from data3 group by date_received

create table user_c_last_received_time_3 as
select user_id,coupon_id,max(date_received) as last_received_time from user_c_time_3 group by user_id,coupon_id


--month 4
create table c_time_4 as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data4 group by coupon_id,date_received;

create table user_time_4 as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data4 group by user_id,date_received;

create table b_time_4 as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data4 group by merchant_id,date_received;

create table d_4 as
select distance,sum(if(coupon_id='null',0,1)) as d
from data4 group by distance;

create table dis_d_4 as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data4 group by discount_rate,distance;

create table c_d_4 as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data4 group by coupon_id,distance;

create table b_d_4 as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data4 group by merchant_id,distance;

create table user_d_4 as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data4 group by user_id,distance;

create table user_c_d_4 as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data4 group by user_id,coupon_id,distance;

create table user_dis_d_4 as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data4 group by user_id,discount_rate,distance;

create table b_c_d_4 as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data4 group by merchant_id,coupon_id,distance;

create table b_dis_d_4 as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data4 group by  merchant_id,discount_rate,distance;

create table c_dis_d_4 as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data4 group by  coupon_id,discount_rate,distance;


create table user_c_time_4 as
select user_id,coupon_id,date_received,sum(if(coupon_id='null',0,1)) as user_c_time
from data4 group by  user_id,coupon_id,date_received;

create table user_b_time_4 as
select user_id,merchant_id,date_received,sum(if(coupon_id='null',0,1)) as user_b_time
from data4 group by  user_id,merchant_id,date_received;

create table user_dis_time_4 as
select user_id,discount_rate,date_received,sum(if(coupon_id='null',0,1)) as user_dis_time
from data4 group by  user_id,discount_rate,date_received;

create table time_4 as
select date_received, sum(if(coupon_id='null',0,1)) as times 
from data4 group by date_received

create table user_c_last_received_time_4 as
select user_id,coupon_id,max(date_received) as last_received_time from user_c_time_4 group by user_id,coupon_id

--month 5
create table c_time_5 as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data5 group by coupon_id,date_received;

create table user_time_5 as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data5 group by user_id,date_received;

create table b_time_5 as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data5 group by merchant_id,date_received;

create table d_5 as
select distance,sum(if(coupon_id='null',0,1)) as d
from data5 group by distance;

create table dis_d_5 as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data5 group by discount_rate,distance;

create table c_d_5 as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data5 group by coupon_id,distance;

create table b_d_5 as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data5 group by merchant_id,distance;

create table user_d_5 as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data5 group by user_id,distance;

create table user_c_d_5 as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data5 group by user_id,coupon_id,distance;

create table user_dis_d_5 as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data5 group by user_id,discount_rate,distance;

create table b_c_d_5 as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data5 group by merchant_id,coupon_id,distance;

create table b_dis_d_5 as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data5 group by  merchant_id,discount_rate,distance;

create table c_dis_d_5 as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data5 group by  coupon_id,discount_rate,distance;


create table user_c_time_5 as
select user_id,coupon_id,date_received,sum(if(coupon_id='null',0,1)) as user_c_time
from data5 group by  user_id,coupon_id,date_received;

create table user_b_time_5 as
select user_id,merchant_id,date_received,sum(if(coupon_id='null',0,1)) as user_b_time
from data5 group by  user_id,merchant_id,date_received;

create table user_dis_time_5 as
select user_id,discount_rate,date_received,sum(if(coupon_id='null',0,1)) as user_dis_time
from data5 group by  user_id,discount_rate,date_received;


create table time_5 as
select date_received, sum(if(coupon_id='null',0,1)) as times 
from data5 group by date_received



create table user_c_last_received_time_5 as
select user_id,coupon_id,max(date_received) as last_received_time from user_c_time_5 group by user_id,coupon_id

--month 6
create table c_time_6 as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data6 group by coupon_id,date_received;

create table user_time_6 as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data6 group by user_id,date_received;

create table b_time_6 as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data6 group by merchant_id,date_received;

create table d_6 as
select distance,sum(if(coupon_id='null',0,1)) as d
from data6 group by distance;

create table dis_d_6 as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data6 group by discount_rate,distance;

create table c_d_6 as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data6 group by coupon_id,distance;

create table b_d_6 as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data6 group by merchant_id,distance;

create table user_d_6 as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data6 group by user_id,distance;

create table user_c_d_6 as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data6 group by user_id,coupon_id,distance;

create table user_dis_d_6 as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data6 group by user_id,discount_rate,distance;

create table b_c_d_6 as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data6 group by merchant_id,coupon_id,distance;

create table b_dis_d_6 as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data6 group by  merchant_id,discount_rate,distance;

create table c_dis_d_6 as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data6 group by  coupon_id,discount_rate,distance;




create table user_c_time_6 as
select user_id,coupon_id,date_received,sum(if(coupon_id='null',0,1)) as user_c_time
from data6 group by  user_id,coupon_id,date_received;

create table user_b_time_6 as
select user_id,merchant_id,date_received,sum(if(coupon_id='null',0,1)) as user_b_time
from data6 group by  user_id,merchant_id,date_received;

create table user_dis_time_6 as
select user_id,discount_rate,date_received,sum(if(coupon_id='null',0,1)) as user_dis_time
from data6 group by  user_id,discount_rate,date_received;


create table time_6 as
select date_received, sum(if(coupon_id='null',0,1)) as times 
from data6 group by date_received


create table user_c_last_received_time_6 as
select user_id,coupon_id,max(date_received) as last_received_time from user_c_time_6 group by user_id,coupon_id

--month 7
create table c_time_7 as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data7 group by coupon_id,date_received;

create table user_time_7 as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data7 group by user_id,date_received;

create table b_time_7 as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data7 group by merchant_id,date_received;

create table d_7 as
select distance,sum(if(coupon_id='null',0,1)) as d
from data7 group by distance;

create table dis_d_7 as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data7 group by discount_rate,distance;

create table c_d_7 as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data7 group by coupon_id,distance;

create table b_d_7 as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data7 group by merchant_id,distance;

create table user_d_7 as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data7 group by user_id,distance;

create table user_c_d_7 as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data7 group by user_id,coupon_id,distance;

create table user_dis_d_7 as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data7 group by user_id,discount_rate,distance;

create table b_c_d_7 as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data7 group by merchant_id,coupon_id,distance;

create table b_dis_d_7 as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data7 group by  merchant_id,discount_rate,distance;

create table c_dis_d_7 as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data7 group by  coupon_id,discount_rate,distance;

drop table user_c_time_7;
drop table user_b_time_7;
drop table user_dis_time_7;

create table user_c_time_7 as
select user_id,coupon_id,date_received,sum(if(coupon_id='null',0,1)) as user_c_time
from data7 group by  user_id,coupon_id,date_received;

create table user_b_time_7 as
select user_id,merchant_id,date_received,sum(if(coupon_id='null',0,1)) as user_b_time
from data7 group by  user_id,merchant_id,date_received;

create table user_dis_time_7 as
select user_id,discount_rate,date_received,sum(if(coupon_id='null',0,1)) as user_dis_time
from data7 group by  user_id,discount_rate,date_received;

create table time_7 as
select date_received, sum(if(coupon_id='null',0,1)) as times 
from data7 group by date_received

create table user_c_last_received_time_7 as
select user_id,coupon_id,max(date_received) as last_received_time from user_c_time_7 group by user_id,coupon_id

--month 2
CREATE TABLE user_c_num_2
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data2
GROUP BY user_id, 
	coupon_id;

CREATE TABLE b_c_dis_2
AS
SELECT merchant_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_dis
FROM data2
GROUP BY merchant_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE b_c_num_2
AS
SELECT merchant_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_num
FROM data2
GROUP BY merchant_id, 
	coupon_id;

CREATE TABLE b_dis_2
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data2
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_2
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data2
GROUP BY merchant_id;

CREATE TABLE c_dis_2
AS
SELECT coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_dis
FROM data2
GROUP BY coupon_id, 
	discount_rate;

CREATE TABLE c_num_2
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data2
GROUP BY coupon_id;

CREATE TABLE dis_2
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data2
GROUP BY discount_rate;

CREATE TABLE user_b_2
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data2
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_2
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data2
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_2
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data2
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_2
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data2
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_2
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data2
GROUP BY user_id;

create table c_time_2 as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data2 group by coupon_id,date_received;

create table user_time_2 as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data2 group by user_id,date_received;

create table b_time_2 as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data2 group by merchant_id,date_received;

create table d_2 as
select distance,sum(if(coupon_id='null',0,1)) as d
from data2 group by distance;

create table dis_d_2 as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data2 group by discount_rate,distance;

create table c_d_2 as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data2 group by coupon_id,distance;

create table b_d_2 as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data2 group by merchant_id,distance;

create table user_d_2 as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data2 group by user_id,distance;

create table user_c_d_2 as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data2 group by user_id,coupon_id,distance;

create table user_dis_d_2 as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data2 group by user_id,discount_rate,distance;

create table b_c_d_2 as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data2 group by merchant_id,coupon_id,distance;

create table b_dis_d_2 as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data2 group by  merchant_id,discount_rate,distance;

create table c_dis_d_2 as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data2 group by  coupon_id,discount_rate,distance;


--month 3
CREATE TABLE user_c_num_3
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data3
GROUP BY user_id, 
	coupon_id;

CREATE TABLE b_c_dis_3
AS
SELECT merchant_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_dis
FROM data3
GROUP BY merchant_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE b_c_num_3
AS
SELECT merchant_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_num
FROM data3
GROUP BY merchant_id, 
	coupon_id;

CREATE TABLE b_dis_3
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data3
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_3
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data3
GROUP BY merchant_id;

CREATE TABLE c_dis_3
AS
SELECT coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_dis
FROM data3
GROUP BY coupon_id, 
	discount_rate;

CREATE TABLE c_num_3
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data3
GROUP BY coupon_id;

CREATE TABLE dis_3
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data3
GROUP BY discount_rate;

CREATE TABLE user_b_3
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data3
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_3
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data3
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_3
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data3
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_3
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data3
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_3
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data3
GROUP BY user_id;

--month 4
CREATE TABLE user_c_num_4
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data4
GROUP BY user_id, 
	coupon_id;

CREATE TABLE b_c_dis_4
AS
SELECT merchant_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_dis
FROM data4
GROUP BY merchant_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE b_c_num_4
AS
SELECT merchant_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_num
FROM data4
GROUP BY merchant_id, 
	coupon_id;

CREATE TABLE b_dis_4
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data4
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_4
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data4
GROUP BY merchant_id;

CREATE TABLE c_dis_4
AS
SELECT coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_dis
FROM data4
GROUP BY coupon_id, 
	discount_rate;

CREATE TABLE c_num_4
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data4
GROUP BY coupon_id;

CREATE TABLE dis_4
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data4
GROUP BY discount_rate;

CREATE TABLE user_b_4
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data4
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_4
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data4
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_4
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data4
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_4
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data4
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_4
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data4
GROUP BY user_id;

--month 5
CREATE TABLE user_c_num_5
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data5
GROUP BY user_id, 
	coupon_id;

CREATE TABLE b_c_dis_5
AS
SELECT merchant_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_dis
FROM data5
GROUP BY merchant_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE b_c_num_5
AS
SELECT merchant_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_num
FROM data5
GROUP BY merchant_id, 
	coupon_id;

CREATE TABLE b_dis_5
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data5
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_5
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data5
GROUP BY merchant_id;

CREATE TABLE c_dis_5
AS
SELECT coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_dis
FROM data5
GROUP BY coupon_id, 
	discount_rate;

CREATE TABLE c_num_5
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data5
GROUP BY coupon_id;

CREATE TABLE dis_5
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data5
GROUP BY discount_rate;

CREATE TABLE user_b_5
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data5
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_5
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data5
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_5
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data5
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_5
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data5
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_5
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data5
GROUP BY user_id;

--month 6
CREATE TABLE user_c_num_6
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data6
GROUP BY user_id, 
	coupon_id;

CREATE TABLE b_c_dis_6
AS
SELECT merchant_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_dis
FROM data6
GROUP BY merchant_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE b_c_num_6
AS
SELECT merchant_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_num
FROM data6
GROUP BY merchant_id, 
	coupon_id;

CREATE TABLE b_dis_6
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data6
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_6
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data6
GROUP BY merchant_id;

CREATE TABLE c_dis_6
AS
SELECT coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_dis
FROM data6
GROUP BY coupon_id, 
	discount_rate;

CREATE TABLE c_num_6
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data6
GROUP BY coupon_id;

CREATE TABLE dis_6
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data6
GROUP BY discount_rate;

CREATE TABLE user_b_6
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data6
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_6
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data6
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_6
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data6
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_6
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data6
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_6
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data6
GROUP BY user_id;

--data7
CREATE TABLE user_c_num_7
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data7
GROUP BY user_id, 
	coupon_id;

CREATE TABLE b_c_dis_7
AS
SELECT merchant_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_dis
FROM data7
GROUP BY merchant_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE b_c_num_7
AS
SELECT merchant_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_c_num
FROM data7
GROUP BY merchant_id, 
	coupon_id;

CREATE TABLE b_dis_7
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data7
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_7
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data7
GROUP BY merchant_id;

CREATE TABLE c_dis_7
AS
SELECT coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_dis
FROM data7
GROUP BY coupon_id, 
	discount_rate;

CREATE TABLE c_num_7
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data7
GROUP BY coupon_id;

CREATE TABLE dis_7
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data7
GROUP BY discount_rate;

CREATE TABLE user_b_7
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data7
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_7
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data7
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_7
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data7
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_7
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data7
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_7
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data7
GROUP BY user_id;


--feature_1
drop table featrue_label_1_one ;


CREATE TABLE featrue_label_1_one
AS
SELECT b.user_c_num
	, c.user_b
	, f.b_dis
	, j.b_num
	, i.c_num
	, g.dis
	, k.user_b_dis
	, l.user_c_dis
	, m.user_dis
	, n.user_get_num
	, a.*
FROM data_label_1 a
JOIN user_c_num_1 b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
JOIN user_b_1 c
ON a.user_id = c.user_id
	AND a.merchant_id = c.merchant_id
JOIN b_dis_1 f
ON a.merchant_id = f.merchant_id
	AND a.discount_rate = f.discount_rate
JOIN b_num_1 j
ON j.merchant_id = a.merchant_id
JOIN c_num_1 i
ON i.coupon_id = a.coupon_id
JOIN dis_1 g
ON g.discount_rate = a.discount_rate
JOIN user_b_dis_1 k
ON k.user_id = a.user_id
	AND k.merchant_id = a.merchant_id
	AND k.discount_rate = a.discount_rate
JOIN user_c_dis_1 l
ON l.user_id = a.user_id
	AND l.coupon_id = a.coupon_id
	AND l.discount_rate = a.discount_rate
JOIN user_dis_1 m
ON m.user_id = a.user_id
	AND m.discount_rate = a.discount_rate
JOIN user_get_num_1 n
ON n.user_id = a.user_id


drop table featrue_label_1;
drop table featrue_label_1_more;

CREATE TABLE featrue_label_1
AS
SELECT 
	o.c_time
	, p.user_time
	, q.b_time
	, r.d
	, s.dis_d
	, t.c_d
	, u.b_d
	, v.user_d
	, w.user_c_d
	, x.user_dis_d
	, y.b_c_d
	, z.b_dis_d
	, h.c_dis_d
	, aa.*
FROM featrue_label_1_one aa
JOIN c_time_1 o
ON o.coupon_id = aa.coupon_id
	AND o.date_received = aa.date_received
JOIN user_time_1 p
ON p.user_id = aa.user_id
	AND p.date_received = aa.date_received
JOIN b_time_1 q
ON q.merchant_id = aa.merchant_id
	AND q.date_received = aa.date_received
JOIN d_1 r
ON r.distance = aa.distance
JOIN dis_d_1 s
ON s.discount_rate = aa.discount_rate
	AND s.distance = aa.distance
JOIN c_d_1 t
ON t.coupon_id = aa.coupon_id
	AND t.distance = aa.distance
JOIN b_d_1 u
ON u.merchant_id = aa.merchant_id
	AND u.distance = aa.distance
JOIN user_d_1 v
ON v.user_id = aa.user_id
	AND v.distance = aa.distance
JOIN user_c_d_1 w
ON w.user_id = aa.user_id
	AND w.coupon_id = aa.coupon_id
	AND w.distance = aa.distance
JOIN user_dis_d_1 x
ON x.user_id = aa.user_id
	AND x.discount_rate = aa.discount_rate
	AND x.distance = aa.distance
JOIN b_c_d_1 y
ON y.merchant_id = aa.merchant_id
	AND y.coupon_id = aa.coupon_id
	AND y.distance = aa.distance
JOIN b_dis_d_1 z
ON z.merchant_id = aa.merchant_id
	AND z.discount_rate = aa.discount_rate
	AND z.distance = aa.distance
JOIN c_dis_d_1 h
ON h.coupon_id = aa.coupon_id
	AND h.discount_rate = aa.discount_rate
	AND h.distance = aa.distance;
	

CREATE TABLE featrue_label_1_more
AS
SELECT
	ee.times 
	,bb.user_c_time
	, cc.user_b_time
	, dd.user_dis_time
	, aaa.*
FROM featrue_label_1 aaa
JOIN user_c_time_1 bb
ON bb.user_id = aaa.user_id
	AND bb.coupon_id = aaa.coupon_id
	AND bb.date_received = aaa.date_received
JOIN user_b_time_1 cc
ON cc.user_id = aaa.user_id
	AND cc.merchant_id = aaa.merchant_id
	AND cc.date_received = aaa.date_received
JOIN user_dis_time_1 dd
ON dd.user_id = aaa.user_id
	AND dd.discount_rate = aaa.discount_rate
	AND dd.date_received = aaa.date_received
JOIN time_1 ee
ON ee.date_received = aaa.date_received



--feature_2

CREATE TABLE featrue_label_2_one
AS
SELECT b.user_c_num
	, c.user_b
	, f.b_dis
	, j.b_num
	, i.c_num
	, g.dis
	, k.user_b_dis
	, l.user_c_dis
	, m.user_dis
	, n.user_get_num
	, a.*
FROM data_label_2 a
JOIN user_c_num_2 b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
JOIN user_b_2 c
ON a.user_id = c.user_id
	AND a.merchant_id = c.merchant_id
JOIN b_dis_2 f
ON a.merchant_id = f.merchant_id
	AND a.discount_rate = f.discount_rate
JOIN b_num_2 j
ON j.merchant_id = a.merchant_id
JOIN c_num_2 i
ON i.coupon_id = a.coupon_id
JOIN dis_2 g
ON g.discount_rate = a.discount_rate
JOIN user_b_dis_2 k
ON k.user_id = a.user_id
	AND k.merchant_id = a.merchant_id
	AND k.discount_rate = a.discount_rate
JOIN user_c_dis_2 l
ON l.user_id = a.user_id
	AND l.coupon_id = a.coupon_id
	AND l.discount_rate = a.discount_rate
JOIN user_dis_2 m
ON m.user_id = a.user_id
	AND m.discount_rate = a.discount_rate
JOIN user_get_num_2 n
ON n.user_id = a.user_id;




CREATE TABLE featrue_label_2
AS
SELECT 
	o.c_time
	, p.user_time
	, q.b_time
	, r.d
	, s.dis_d
	, t.c_d
	, u.b_d
	, v.user_d
	, w.user_c_d
	, x.user_dis_d
	, y.b_c_d
	, z.b_dis_d
	, h.c_dis_d
	, aa.*
FROM featrue_label_2_one aa
JOIN c_time_2 o
ON o.coupon_id = aa.coupon_id
	AND o.date_received = aa.date_received
JOIN user_time_2 p
ON p.user_id = aa.user_id
	AND p.date_received = aa.date_received
JOIN b_time_2 q
ON q.merchant_id = aa.merchant_id
	AND q.date_received = aa.date_received
JOIN d_2 r
ON r.distance = aa.distance
JOIN dis_d_2 s
ON s.discount_rate = aa.discount_rate
	AND s.distance = aa.distance
JOIN c_d_2 t
ON t.coupon_id = aa.coupon_id
	AND t.distance = aa.distance
JOIN b_d_2 u
ON u.merchant_id = aa.merchant_id
	AND u.distance = aa.distance
JOIN user_d_2 v
ON v.user_id = aa.user_id
	AND v.distance = aa.distance
JOIN user_c_d_2 w
ON w.user_id = aa.user_id
	AND w.coupon_id = aa.coupon_id
	AND w.distance = aa.distance
JOIN user_dis_d_2 x
ON x.user_id = aa.user_id
	AND x.discount_rate = aa.discount_rate
	AND x.distance = aa.distance
JOIN b_c_d_2 y
ON y.merchant_id = aa.merchant_id
	AND y.coupon_id = aa.coupon_id
	AND y.distance = aa.distance
JOIN b_dis_d_2 z
ON z.merchant_id = aa.merchant_id
	AND z.discount_rate = aa.discount_rate
	AND z.distance = aa.distance
JOIN c_dis_d_2 h
ON h.coupon_id = aa.coupon_id
	AND h.discount_rate = aa.discount_rate
	AND h.distance = aa.distance;
	

CREATE TABLE featrue_label_2_more
AS
SELECT
	ee.times 
	,bb.user_c_time
	, cc.user_b_time
	, dd.user_dis_time
	, aaa.*
FROM featrue_label_2 aaa
JOIN user_c_time_2 bb
ON bb.user_id = aaa.user_id
	AND bb.coupon_id = aaa.coupon_id
	AND bb.date_received = aaa.date_received
JOIN user_b_time_2 cc
ON cc.user_id = aaa.user_id
	AND cc.merchant_id = aaa.merchant_id
	AND cc.date_received = aaa.date_received
JOIN user_dis_time_2 dd
ON dd.user_id = aaa.user_id
	AND dd.discount_rate = aaa.discount_rate
	AND dd.date_received = aaa.date_received
JOIN time_2 ee
ON ee.date_received = aaa.date_received



--train data


CREATE TABLE featrue_label
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2
			UNION ALL
			SELECT *
			FROM featrue_label_3
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4
			UNION ALL
			SELECT *
			FROM featrue_label_5
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6
) t4;




CREATE TABLE featrue_label_more
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_more
			UNION ALL
			SELECT *
			FROM featrue_label_3_more
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_more
			UNION ALL
			SELECT *
			FROM featrue_label_5_more
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_more
) t4;





