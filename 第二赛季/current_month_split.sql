--month1
CREATE TABLE user_c_num_1_before
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data_label_1_before
GROUP BY user_id, 
	coupon_id;
	


CREATE TABLE b_dis_1_before
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data_label_1_before
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_1_before
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data_label_1_before
GROUP BY merchant_id;



CREATE TABLE c_num_1_before
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data_label_1_before
GROUP BY coupon_id;

CREATE TABLE dis_1_before
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data_label_1_before
GROUP BY discount_rate;

CREATE TABLE user_b_1_before
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data_label_1_before
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_1_before
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data_label_1_before
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_1_before
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data_label_1_before
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_1_before
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data_label_1_before
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_1_before
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data_label_1_before
GROUP BY user_id;

create table c_time_1_before as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data_label_1_before group by coupon_id,date_received;

create table user_time_1_before as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data_label_1_before group by user_id,date_received;

create table b_time_1_before as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data_label_1_before group by merchant_id,date_received;

create table d_1_before as
select distance,sum(if(coupon_id='null',0,1)) as d
from data_label_1_before group by distance;

create table dis_d_1_before as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data_label_1_before group by discount_rate,distance;

create table c_d_1_before as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data_label_1_before group by coupon_id,distance;

create table b_d_1_before as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data_label_1_before group by merchant_id,distance;

create table user_d_1_before as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data_label_1_before group by user_id,distance;

create table user_c_d_1_before as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data_label_1_before group by user_id,coupon_id,distance;

create table user_dis_d_1_before as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data_label_1_before group by user_id,discount_rate,distance;

create table b_c_d_1_before as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data_label_1_before group by merchant_id,coupon_id,distance;

create table b_dis_d_1_before as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data_label_1_before group by  merchant_id,discount_rate,distance;

create table c_dis_d_1_before as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data_label_1_before group by  coupon_id,discount_rate,distance;

CREATE TABLE user_c_num_1_after
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data_label_1_after
GROUP BY user_id, 
	coupon_id;
	


CREATE TABLE b_dis_1_after
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data_label_1_after
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_1_after
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data_label_1_after
GROUP BY merchant_id;



CREATE TABLE c_num_1_after
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data_label_1_after
GROUP BY coupon_id;

CREATE TABLE dis_1_after
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data_label_1_after
GROUP BY discount_rate;

CREATE TABLE user_b_1_after
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data_label_1_after
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_1_after
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data_label_1_after
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_1_after
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data_label_1_after
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_1_after
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data_label_1_after
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_1_after
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data_label_1_after
GROUP BY user_id;

create table c_time_1_after as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data_label_1_after group by coupon_id,date_received;

create table user_time_1_after as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data_label_1_after group by user_id,date_received;

create table b_time_1_after as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data_label_1_after group by merchant_id,date_received;

create table d_1_after as
select distance,sum(if(coupon_id='null',0,1)) as d
from data_label_1_after group by distance;

create table dis_d_1_after as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data_label_1_after group by discount_rate,distance;

create table c_d_1_after as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data_label_1_after group by coupon_id,distance;

create table b_d_1_after as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data_label_1_after group by merchant_id,distance;

create table user_d_1_after as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data_label_1_after group by user_id,distance;

create table user_c_d_1_after as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data_label_1_after group by user_id,coupon_id,distance;

create table user_dis_d_1_after as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data_label_1_after group by user_id,discount_rate,distance;

create table b_c_d_1_after as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data_label_1_after group by merchant_id,coupon_id,distance;

create table b_dis_d_1_after as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data_label_1_after group by  merchant_id,discount_rate,distance;

create table c_dis_d_1_after as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data_label_1_after group by  coupon_id,discount_rate,distance;


--month 2

CREATE TABLE user_c_num_2_before
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data_label_2_before
GROUP BY user_id, 
	coupon_id;
	


CREATE TABLE b_dis_2_before
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data_label_2_before
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_2_before
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data_label_2_before
GROUP BY merchant_id;



CREATE TABLE c_num_2_before
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data_label_2_before
GROUP BY coupon_id;

CREATE TABLE dis_2_before
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data_label_2_before
GROUP BY discount_rate;

CREATE TABLE user_b_2_before
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data_label_2_before
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_2_before
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data_label_2_before
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_2_before
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data_label_2_before
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_2_before
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data_label_2_before
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_2_before
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data_label_2_before
GROUP BY user_id;

CREATE TABLE c_time_2_before
AS
SELECT coupon_id
	, date_received
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_time
FROM data_label_2_before
GROUP BY coupon_id, 
	date_received;



create table user_time_2_before as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data_label_2_before group by user_id,date_received;

create table b_time_2_before as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data_label_2_before group by merchant_id,date_received;

create table d_2_before as
select distance,sum(if(coupon_id='null',0,1)) as d
from data_label_2_before group by distance;

create table dis_d_2_before as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data_label_2_before group by discount_rate,distance;

create table c_d_2_before as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data_label_2_before group by coupon_id,distance;

create table b_d_2_before as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data_label_2_before group by merchant_id,distance;

create table user_d_2_before as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data_label_2_before group by user_id,distance;

create table user_c_d_2_before as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data_label_2_before group by user_id,coupon_id,distance;

create table user_dis_d_2_before as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data_label_2_before group by user_id,discount_rate,distance;

create table b_c_d_2_before as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data_label_2_before group by merchant_id,coupon_id,distance;

create table b_dis_d_2_before as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data_label_2_before group by  merchant_id,discount_rate,distance;

create table c_dis_d_2_before as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data_label_2_before group by  coupon_id,discount_rate,distance;

CREATE TABLE user_c_num_2_after
AS
SELECT user_id
	, coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_num
FROM data_label_2_after
GROUP BY user_id, 
	coupon_id;
	


CREATE TABLE b_dis_2_after
AS
SELECT merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_dis
FROM data_label_2_after
GROUP BY merchant_id, 
	discount_rate;

CREATE TABLE b_num_2_after
AS
SELECT merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS b_num
FROM data_label_2_after
GROUP BY merchant_id;

CREATE TABLE c_num_2_after
AS
SELECT coupon_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS c_num
FROM data_label_2_after
GROUP BY coupon_id;

CREATE TABLE dis_2_after
AS
SELECT discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS dis
FROM data_label_2_after
GROUP BY discount_rate;

CREATE TABLE user_b_2_after
AS
SELECT user_id
	, merchant_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b
FROM data_label_2_after
GROUP BY user_id, 
	merchant_id;

CREATE TABLE user_b_dis_2_after
AS
SELECT user_id
	, merchant_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_b_dis
FROM data_label_2_after
GROUP BY user_id, 
	merchant_id, 
	discount_rate;

CREATE TABLE user_c_dis_2_after
AS
SELECT user_id
	, coupon_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_c_dis
FROM data_label_2_after
GROUP BY user_id, 
	coupon_id, 
	discount_rate;

CREATE TABLE user_dis_2_after
AS
SELECT user_id
	, discount_rate
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_dis
FROM data_label_2_after
GROUP BY user_id, 
	discount_rate;

CREATE TABLE user_get_num_2_after
AS
SELECT user_id
	, SUM(IF(coupon_id = 'null', 0, 1)) AS user_get_num
FROM data_label_2_after
GROUP BY user_id;

create table c_time_2_after as
select coupon_id,date_received,sum(if(coupon_id='null',0,1)) as c_time
from data_label_2_after group by coupon_id,date_received;

create table user_time_2_after as
select user_id,date_received,sum(if(coupon_id='null',0,1)) as user_time
from data_label_2_after group by user_id,date_received;

create table b_time_2_after as
select merchant_id,date_received,sum(if(coupon_id='null',0,1)) as b_time
from data_label_2_after group by merchant_id,date_received;

create table d_2_after as
select distance,sum(if(coupon_id='null',0,1)) as d
from data_label_2_after group by distance;

create table dis_d_2_after as
select discount_rate,distance,sum(if(coupon_id='null',0,1)) as dis_d
from data_label_2_after group by discount_rate,distance;

create table c_d_2_after as
select coupon_id,distance,sum(if(coupon_id='null',0,1)) as c_d
from data_label_2_after group by coupon_id,distance;

create table b_d_2_after as
select merchant_id,distance,sum(if(coupon_id='null',0,1)) as b_d
from data_label_2_after group by merchant_id,distance;

create table user_d_2_after as
select user_id,distance,sum(if(coupon_id='null',0,1)) as user_d
from data_label_2_after group by user_id,distance;

create table user_c_d_2_after as
select user_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as user_c_d
from data_label_2_after group by user_id,coupon_id,distance;

create table user_dis_d_2_after as
select user_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as user_dis_d
from data_label_2_after group by user_id,discount_rate,distance;

create table b_c_d_2_after as
select merchant_id,coupon_id,distance,sum(if(coupon_id='null',0,1)) as b_c_d
from data_label_2_after group by merchant_id,coupon_id,distance;

create table b_dis_d_2_after as
select merchant_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as b_dis_d
from data_label_2_after group by  merchant_id,discount_rate,distance;

create table c_dis_d_2_after as
select coupon_id,discount_rate,distance,sum(if(coupon_id='null',0,1)) as c_dis_d
from data_label_2_after group by  coupon_id,discount_rate,distance;


----featrue_1
--feature_1_before

CREATE TABLE featrue_label_1_before_one
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
	,a.*
FROM data_label_1_before a
JOIN user_c_num_1_before b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
JOIN user_b_1_before c
ON a.user_id = c.user_id
	AND a.merchant_id = c.merchant_id
JOIN b_dis_1_before f
ON a.merchant_id = f.merchant_id
	AND a.discount_rate = f.discount_rate
JOIN b_num_1_before j
ON j.merchant_id = a.merchant_id
JOIN c_num_1_before i
ON i.coupon_id = a.coupon_id
JOIN dis_1_before g
ON g.discount_rate = a.discount_rate
JOIN user_b_dis_1_before k
ON k.user_id = a.user_id
	AND k.merchant_id = a.merchant_id
	AND k.discount_rate = a.discount_rate
JOIN user_c_dis_1_before l
ON l.user_id = a.user_id
	AND l.coupon_id = a.coupon_id
	AND l.discount_rate = a.discount_rate
JOIN user_dis_1_before m
ON m.user_id = a.user_id
	AND m.discount_rate = a.discount_rate
JOIN user_get_num_1_before n
ON n.user_id = a.user_id;


CREATE TABLE featrue_label_1_before
AS
SELECT
    a.user_c_num 
	,a.user_b 
	,a.b_dis 
	,a.b_num 
	,a.c_num 
	,a.dis 
	,a.user_b_dis 
	,a.user_c_dis 
	,a.user_dis 
	,a.user_get_num 
	,o.c_time
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
	, a.label
FROM featrue_label_1_before_one a
JOIN c_time_1_before o
ON o.coupon_id = a.coupon_id
	AND o.date_received = a.date_received
JOIN user_time_1_before p
ON p.user_id = a.user_id
	AND p.date_received = a.date_received
JOIN b_time_1_before q
ON q.merchant_id = a.merchant_id
	AND q.date_received = a.date_received
JOIN d_1_before r
ON r.distance = a.distance
JOIN dis_d_1_before s
ON s.discount_rate = a.discount_rate
	AND s.distance = a.distance
JOIN c_d_1_before t
ON t.coupon_id = a.coupon_id
	AND t.distance = a.distance
JOIN b_d_1_before u
ON u.merchant_id = a.merchant_id
	AND u.distance = a.distance
JOIN user_d_1_before v
ON v.user_id = a.user_id
	AND v.distance = a.distance
JOIN user_c_d_1_before w
ON w.user_id = a.user_id
	AND w.coupon_id = a.coupon_id
	AND w.distance = a.distance
JOIN user_dis_d_1_before x
ON x.user_id = a.user_id
	AND x.discount_rate = a.discount_rate
	AND x.distance = a.distance
JOIN b_c_d_1_before y
ON y.merchant_id = a.merchant_id
	AND y.coupon_id = a.coupon_id
	AND y.distance = a.distance
JOIN b_dis_d_1_before z
ON z.merchant_id = a.merchant_id
	AND z.discount_rate = a.discount_rate
	AND z.distance = a.distance
JOIN c_dis_d_1_before h
ON h.coupon_id = a.coupon_id
	AND h.discount_rate = a.discount_rate
	AND h.distance = a.distance;

--feature_1_after
CREATE TABLE featrue_label_1_after_one
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
FROM data_label_1_after a
JOIN user_c_num_1_after b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
JOIN user_b_1_after c
ON a.user_id = c.user_id
	AND a.merchant_id = c.merchant_id
JOIN b_dis_1_after f
ON a.merchant_id = f.merchant_id
	AND a.discount_rate = f.discount_rate
JOIN b_num_1_after j
ON j.merchant_id = a.merchant_id
JOIN c_num_1_after i
ON i.coupon_id = a.coupon_id
JOIN dis_1_after g
ON g.discount_rate = a.discount_rate
JOIN user_b_dis_1_after k
ON k.user_id = a.user_id
	AND k.merchant_id = a.merchant_id
	AND k.discount_rate = a.discount_rate
JOIN user_c_dis_1_after l
ON l.user_id = a.user_id
	AND l.coupon_id = a.coupon_id
	AND l.discount_rate = a.discount_rate
JOIN user_dis_1_after m
ON m.user_id = a.user_id
	AND m.discount_rate = a.discount_rate
JOIN user_get_num_1_after n
ON n.user_id = a.user_id;


CREATE TABLE featrue_label_1_after
AS
SELECT
	a.user_c_num 
	,a.user_b 
	,a.b_dis 
	,a.b_num 
	,a.c_num 
	,a.dis 
	,a.user_b_dis 
	,a.user_c_dis 
	,a.user_dis 
	,a.user_get_num 
    ,o.c_time
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
	, a.label
FROM featrue_label_1_after_one a
JOIN c_time_1_after o
ON o.coupon_id = a.coupon_id
	AND o.date_received = a.date_received
JOIN user_time_1_after p
ON p.user_id = a.user_id
	AND p.date_received = a.date_received
JOIN b_time_1_after q
ON q.merchant_id = a.merchant_id
	AND q.date_received = a.date_received
JOIN d_1_after r
ON r.distance = a.distance
JOIN dis_d_1_after s
ON s.discount_rate = a.discount_rate
	AND s.distance = a.distance
JOIN c_d_1_after t
ON t.coupon_id = a.coupon_id
	AND t.distance = a.distance
JOIN b_d_1_after u
ON u.merchant_id = a.merchant_id
	AND u.distance = a.distance
JOIN user_d_1_after v
ON v.user_id = a.user_id
	AND v.distance = a.distance
JOIN user_c_d_1_after w
ON w.user_id = a.user_id
	AND w.coupon_id = a.coupon_id
	AND w.distance = a.distance
JOIN user_dis_d_1_after x
ON x.user_id = a.user_id
	AND x.discount_rate = a.discount_rate
	AND x.distance = a.distance
JOIN b_c_d_1_after y
ON y.merchant_id = a.merchant_id
	AND y.coupon_id = a.coupon_id
	AND y.distance = a.distance
JOIN b_dis_d_1_after z
ON z.merchant_id = a.merchant_id
	AND z.discount_rate = a.discount_rate
	AND z.distance = a.distance
JOIN c_dis_d_1_after h
ON h.coupon_id = a.coupon_id
	AND h.discount_rate = a.discount_rate
	AND h.distance = a.distance;







--feature_2
--feature_2_before

CREATE TABLE featrue_label_2_before_one
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
	,a.*
FROM data_label_2_before a
JOIN user_c_num_2_before b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
JOIN user_b_2_before c
ON a.user_id = c.user_id
	AND a.merchant_id = c.merchant_id
JOIN b_dis_2_before f
ON a.merchant_id = f.merchant_id
	AND a.discount_rate = f.discount_rate
JOIN b_num_2_before j
ON j.merchant_id = a.merchant_id
JOIN c_num_2_before i
ON i.coupon_id = a.coupon_id
JOIN dis_2_before g
ON g.discount_rate = a.discount_rate
JOIN user_b_dis_2_before k
ON k.user_id = a.user_id
	AND k.merchant_id = a.merchant_id
	AND k.discount_rate = a.discount_rate
JOIN user_c_dis_2_before l
ON l.user_id = a.user_id
	AND l.coupon_id = a.coupon_id
	AND l.discount_rate = a.discount_rate
JOIN user_dis_2_before m
ON m.user_id = a.user_id
	AND m.discount_rate = a.discount_rate
JOIN user_get_num_2_before n
ON n.user_id = a.user_id;


CREATE TABLE featrue_label_2_before
AS
SELECT
    a.user_c_num 
	,a.user_b 
	,a.b_dis 
	,a.b_num 
	,a.c_num 
	,a.dis 
	,a.user_b_dis 
	,a.user_c_dis 
	,a.user_dis 
	,a.user_get_num 
	,o.c_time
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
	, a.label
FROM featrue_label_2_before_one a
JOIN c_time_2_before o
ON o.coupon_id = a.coupon_id
	AND o.date_received = a.date_received
JOIN user_time_2_before p
ON p.user_id = a.user_id
	AND p.date_received = a.date_received
JOIN b_time_2_before q
ON q.merchant_id = a.merchant_id
	AND q.date_received = a.date_received
JOIN d_2_before r
ON r.distance = a.distance
JOIN dis_d_2_before s
ON s.discount_rate = a.discount_rate
	AND s.distance = a.distance
JOIN c_d_2_before t
ON t.coupon_id = a.coupon_id
	AND t.distance = a.distance
JOIN b_d_2_before u
ON u.merchant_id = a.merchant_id
	AND u.distance = a.distance
JOIN user_d_2_before v
ON v.user_id = a.user_id
	AND v.distance = a.distance
JOIN user_c_d_2_before w
ON w.user_id = a.user_id
	AND w.coupon_id = a.coupon_id
	AND w.distance = a.distance
JOIN user_dis_d_2_before x
ON x.user_id = a.user_id
	AND x.discount_rate = a.discount_rate
	AND x.distance = a.distance
JOIN b_c_d_2_before y
ON y.merchant_id = a.merchant_id
	AND y.coupon_id = a.coupon_id
	AND y.distance = a.distance
JOIN b_dis_d_2_before z
ON z.merchant_id = a.merchant_id
	AND z.discount_rate = a.discount_rate
	AND z.distance = a.distance
JOIN c_dis_d_2_before h
ON h.coupon_id = a.coupon_id
	AND h.discount_rate = a.discount_rate
	AND h.distance = a.distance;

--feature_2_after
CREATE TABLE featrue_label_2_after_one
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
FROM data_label_2_after a
JOIN user_c_num_2_after b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
JOIN user_b_2_after c
ON a.user_id = c.user_id
	AND a.merchant_id = c.merchant_id
JOIN b_dis_2_after f
ON a.merchant_id = f.merchant_id
	AND a.discount_rate = f.discount_rate
JOIN b_num_2_after j
ON j.merchant_id = a.merchant_id
JOIN c_num_2_after i
ON i.coupon_id = a.coupon_id
JOIN dis_2_after g
ON g.discount_rate = a.discount_rate
JOIN user_b_dis_2_after k
ON k.user_id = a.user_id
	AND k.merchant_id = a.merchant_id
	AND k.discount_rate = a.discount_rate
JOIN user_c_dis_2_after l
ON l.user_id = a.user_id
	AND l.coupon_id = a.coupon_id
	AND l.discount_rate = a.discount_rate
JOIN user_dis_2_after m
ON m.user_id = a.user_id
	AND m.discount_rate = a.discount_rate
JOIN user_get_num_2_after n
ON n.user_id = a.user_id;


CREATE TABLE featrue_label_2_after
AS
SELECT
	a.user_c_num 
	,a.user_b 
	,a.b_dis 
	,a.b_num 
	,a.c_num 
	,a.dis 
	,a.user_b_dis 
	,a.user_c_dis 
	,a.user_dis 
	,a.user_get_num 
    ,o.c_time
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
	, a.label
FROM featrue_label_2_after_one a
JOIN c_time_2_after o
ON o.coupon_id = a.coupon_id
	AND o.date_received = a.date_received
JOIN user_time_2_after p
ON p.user_id = a.user_id
	AND p.date_received = a.date_received
JOIN b_time_2_after q
ON q.merchant_id = a.merchant_id
	AND q.date_received = a.date_received
JOIN d_2_after r
ON r.distance = a.distance
JOIN dis_d_2_after s
ON s.discount_rate = a.discount_rate
	AND s.distance = a.distance
JOIN c_d_2_after t
ON t.coupon_id = a.coupon_id
	AND t.distance = a.distance
JOIN b_d_2_after u
ON u.merchant_id = a.merchant_id
	AND u.distance = a.distance
JOIN user_d_2_after v
ON v.user_id = a.user_id
	AND v.distance = a.distance
JOIN user_c_d_2_after w
ON w.user_id = a.user_id
	AND w.coupon_id = a.coupon_id
	AND w.distance = a.distance
JOIN user_dis_d_2_after x
ON x.user_id = a.user_id
	AND x.discount_rate = a.discount_rate
	AND x.distance = a.distance
JOIN b_c_d_2_after y
ON y.merchant_id = a.merchant_id
	AND y.coupon_id = a.coupon_id
	AND y.distance = a.distance
JOIN b_dis_d_2_after z
ON z.merchant_id = a.merchant_id
	AND z.discount_rate = a.discount_rate
	AND z.distance = a.distance
JOIN c_dis_d_2_after h
ON h.coupon_id = a.coupon_id
	AND h.discount_rate = a.discount_rate
	AND h.distance = a.distance;


drop table featrue_label_1_merge;
create table featrue_label_1_merge as
select * from (select * from featrue_label_1_before union all select * from featrue_label_1_after) t;

drop table featrue_label_2_merge;
create table featrue_label_2_merge as
select * from (select * from featrue_label_2_before union all select * from featrue_label_2_after) t;


--train data
drop table featrue_label_merge;
CREATE TABLE featrue_label_merge
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_merge
			UNION ALL
			SELECT *
			FROM featrue_label_3_merge
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_merge
			UNION ALL
			SELECT *
			FROM featrue_label_5_merge
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_before
) t4;

--estimate data
drop table feature_label_234_merge;
CREATE TABLE IF NOT EXISTS feature_label_234_merge
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM featrue_label_2_merge
		UNION ALL
		SELECT *
		FROM featrue_label_3_merge
	) t1
	UNION ALL
	SELECT *
	FROM featrue_label_4_merge
) t2;


