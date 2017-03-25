

--2 month
DROP TABLE featrue_label_2_flag_plus;

CREATE TABLE featrue_label_2_flag_plus
AS
SELECT a.*
	, IF(b.date_pay <> 'null'
	AND a.date_received = b.date_pay, 0, 1) AS flag2
	, IF(a.distance = 'null', 11, cast(a.distance as bigint)) AS distance_flag
	, decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',100,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,150) AS dis_flag
FROM featrue_label_2_flag a
LEFT OUTER JOIN (
	SELECT user_id
		, coupon_id
		, date_pay
	FROM data_label_1
	GROUP BY user_id, 
		coupon_id, 
		date_pay
) b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
	


--3 month
drop table featrue_label_3_flag_plus;
CREATE TABLE featrue_label_3_flag_plus
AS
SELECT a.*
	, IF(b.date_pay <> 'null'
	AND a.date_received = b.date_pay, 0, 1) as flag2
	, IF(a.distance = 'null', 11, cast(a.distance as bigint)) AS distance_flag
	, decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',100,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,150) AS dis_flag
FROM featrue_label_3_flag a
LEFT OUTER JOIN (
	SELECT user_id
		, coupon_id
		, date_pay
	FROM data_label_2
	GROUP BY user_id, 
		coupon_id, 
		date_pay
) b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
	
--4 month
drop table featrue_label_4_flag_plus;
CREATE TABLE featrue_label_4_flag_plus
AS
SELECT a.*
	, IF(b.date_pay <> 'null'
	AND a.date_received = b.date_pay, 0, 1) as flag2
	, IF(a.distance = 'null', 11, cast(a.distance as bigint)) AS distance_flag
	, decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',200,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,150) AS dis_flag

FROM featrue_label_4_flag a
LEFT OUTER JOIN (
	SELECT user_id
		, coupon_id
		, date_pay
	FROM data_label_3
	GROUP BY user_id, 
		coupon_id, 
		date_pay
) b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
	
-- 5 month 
drop table featrue_label_5_flag_plus;
CREATE TABLE featrue_label_5_flag_plus
AS
SELECT a.*
	, IF(b.date_pay <> 'null'
	AND a.date_received = b.date_pay, 0, 1) as flag2
	, IF(a.distance = 'null', 11, cast(a.distance as bigint)) AS distance_flag
	, decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',100,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,150) AS dis_flag

FROM featrue_label_5_flag a
LEFT OUTER JOIN (
	SELECT user_id
		, coupon_id
		, date_pay
	FROM data_label_4
	GROUP BY user_id, 
		coupon_id, 
		date_pay
) b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
	
--6 month
drop table featrue_label_6_flag_plus;
CREATE TABLE featrue_label_6_flag_plus
AS
SELECT a.*
	, IF(b.date_pay <> 'null'
	AND a.date_received = b.date_pay, 0, 1) as flag2
	, IF(a.distance = 'null', 11, cast(a.distance as bigint)) AS distance_flag
	, decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',100,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,150) AS dis_flag

FROM featrue_label_6_flag a
LEFT OUTER JOIN (
	SELECT user_id
		, coupon_id
		, date_pay
	FROM data_label_5
	GROUP BY user_id, 
		coupon_id, 
		date_pay
) b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
	
	
-- 7 month
drop table featrue_7_flag_plus;
CREATE TABLE featrue_7_flag_plus
AS
SELECT a.*
	, IF(b.date_pay <> 'null'
	AND a.date_received = b.date_pay, 0, 1) as flag2
	, IF(a.distance = 'null', 11, cast(a.distance as bigint)) AS distance_flag
	, decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',100,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,150) AS dis_flag
FROM featrue_7_flag a
LEFT OUTER JOIN (
	SELECT user_id
		, coupon_id
		, date_pay
	FROM data_label_6
	GROUP BY user_id, 
		coupon_id, 
		date_pay
) b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
	

--train data	
drop table featrue_label_flag_plus;
CREATE TABLE featrue_label_flag_plus
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_flag_plus
			UNION ALL
			SELECT *
			FROM featrue_label_3_flag_plus
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_flag_plus
			UNION ALL
			SELECT *
			FROM featrue_label_5_flag_plus
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_flag_plus
) t4;


---------往月
--（用户-商店，记录数、消费次数、消费概率）
drop table featrue_label_2_flag_plus2;
CREATE TABLE featrue_label_2_flag_plus2
AS
SELECT times
	, user_c_time
	, user_b_time
	, user_dis_time
	, c_time
	, user_time
	, b_time
	, d
	, dis_d
	, c_d
	, b_d
	, user_d
	, user_c_d
	, user_dis_d
	, user_c_num
	, user_b
	, b_dis
	, b_num
	, c_num
	, dis
	, user_b_dis
	, user_c_dis
	, user_dis
	, user_get_num
	, user_last_time
	, b_last_time
	, c_last_time
	, dis_last_time
	, user_b_last_time
	, user_c_last_time
	, user_dis_last_time
	, user_diff
	, b_diff
	, c_diff
	, dis_diff
	, user_b_diff
	, user_c_diff
	, user_dis_diff
	, user_id
	, merchant_id
	, coupon_id
	, discount_rate
	, distance
	, date_received
	, date_pay
	, label
	, flag
	, flag2
	, distance_flag
	, dis_flag
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(consume_num IS NULL, 0, consume_num) AS consume_num
	, IF(prob IS NULL, 0, prob) AS prob
	
FROM (
	SELECT a.*
		, t.num_all
		, t.consume_num
		, t.prob
		, b.prior_flag
	FROM featrue_label_2_flag_plus a
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, COUNT(coupon_id) AS num_all
			, SUM(IF(date_pay <> 'null', 1, 0)) AS consume_num
			, SUM(IF(date_pay <> 'null', 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE) AS prob
		FROM data1
		GROUP BY user_id, 
			merchant_id
	) t
	ON a.user_id = t.user_id
		AND a.merchant_id = t.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, IF(SUM(IF(date_pay = 'null', 0, 1)) > 0, 1, 0) AS prior_flag
		FROM data1
		GROUP BY user_id, 
			coupon_id
	) b
	ON a.user_id = b.user_id
		AND a.coupon_id = b.coupon_id
) t1

--3 月
drop table featrue_label_3_flag_plus2;
CREATE TABLE featrue_label_3_flag_plus2
AS
SELECT times
	, user_c_time
	, user_b_time
	, user_dis_time
	, c_time
	, user_time
	, b_time
	, d
	, dis_d
	, c_d
	, b_d
	, user_d
	, user_c_d
	, user_dis_d
	, user_c_num
	, user_b
	, b_dis
	, b_num
	, c_num
	, dis
	, user_b_dis
	, user_c_dis
	, user_dis
	, user_get_num
	, user_last_time
	, b_last_time
	, c_last_time
	, dis_last_time
	, user_b_last_time
	, user_c_last_time
	, user_dis_last_time
	, user_diff
	, b_diff
	, c_diff
	, dis_diff
	, user_b_diff
	, user_c_diff
	, user_dis_diff
	, user_id
	, merchant_id
	, coupon_id
	, discount_rate
	, distance
	, date_received
	, date_pay
	, label
	, flag
	, flag2
	, distance_flag
	, dis_flag
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(consume_num IS NULL, 0, consume_num) AS consume_num
	, IF(prob IS NULL, 0, prob) AS prob

FROM (
	SELECT a.*
		, t.num_all
		, t.consume_num
		, t.prob
		, b.prior_flag
	FROM featrue_label_3_flag_plus a
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, COUNT(coupon_id) AS num_all
			, SUM(IF(date_pay <> 'null', 1, 0)) AS consume_num
			, SUM(IF(date_pay <> 'null', 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE) AS prob
		FROM data12
		GROUP BY user_id, 
			merchant_id
	) t
	ON a.user_id = t.user_id
		AND a.merchant_id = t.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, IF(SUM(IF(date_pay = 'null', 0, 1)) > 0, 1, 0) AS prior_flag
		FROM data12
		GROUP BY user_id, 
			coupon_id
	) b
	ON a.user_id = b.user_id
		AND a.coupon_id = b.coupon_id
) t1
--4月
drop table featrue_label_4_flag_plus2;
CREATE TABLE featrue_label_4_flag_plus2
AS
SELECT times
	, user_c_time
	, user_b_time
	, user_dis_time
	, c_time
	, user_time
	, b_time
	, d
	, dis_d
	, c_d
	, b_d
	, user_d
	, user_c_d
	, user_dis_d
	, user_c_num
	, user_b
	, b_dis
	, b_num
	, c_num
	, dis
	, user_b_dis
	, user_c_dis
	, user_dis
	, user_get_num
	, user_last_time
	, b_last_time
	, c_last_time
	, dis_last_time
	, user_b_last_time
	, user_c_last_time
	, user_dis_last_time
	, user_diff
	, b_diff
	, c_diff
	, dis_diff
	, user_b_diff
	, user_c_diff
	, user_dis_diff
	, user_id
	, merchant_id
	, coupon_id
	, discount_rate
	, distance
	, date_received
	, date_pay
	, label
	, flag
	, flag2
	, distance_flag
	, dis_flag
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(consume_num IS NULL, 0, consume_num) AS consume_num
	, IF(prob IS NULL, 0, prob) AS prob
FROM (
	SELECT a.*
		, t.num_all
		, t.consume_num
		, t.prob
		, b.prior_flag
	FROM featrue_label_4_flag_plus a
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, COUNT(coupon_id) AS num_all
			, SUM(IF(date_pay <> 'null', 1, 0)) AS consume_num
			, SUM(IF(date_pay <> 'null', 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE) AS prob
		FROM data123
		GROUP BY user_id, 
			merchant_id
	) t
	ON a.user_id = t.user_id
		AND a.merchant_id = t.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, IF(SUM(IF(date_pay = 'null', 0, 1)) > 0, 1, 0) AS prior_flag
		FROM data123
		GROUP BY user_id, 
			coupon_id
	) b
	ON a.user_id = b.user_id
		AND a.coupon_id = b.coupon_id
) t1
--5 月
drop table featrue_label_5_flag_plus2;
CREATE TABLE featrue_label_5_flag_plus2
AS
SELECT times
	, user_c_time
	, user_b_time
	, user_dis_time
	, c_time
	, user_time
	, b_time
	, d
	, dis_d
	, c_d
	, b_d
	, user_d
	, user_c_d
	, user_dis_d
	, user_c_num
	, user_b
	, b_dis
	, b_num
	, c_num
	, dis
	, user_b_dis
	, user_c_dis
	, user_dis
	, user_get_num
	, user_last_time
	, b_last_time
	, c_last_time
	, dis_last_time
	, user_b_last_time
	, user_c_last_time
	, user_dis_last_time
	, user_diff
	, b_diff
	, c_diff
	, dis_diff
	, user_b_diff
	, user_c_diff
	, user_dis_diff
	, user_id
	, merchant_id
	, coupon_id
	, discount_rate
	, distance
	, date_received
	, date_pay
	, label
	, flag
	, flag2
	, distance_flag
	, dis_flag
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(consume_num IS NULL, 0, consume_num) AS consume_num
	, IF(prob IS NULL, 0, prob) AS prob
FROM (
	SELECT a.*
		, t.num_all
		, t.consume_num
		, t.prob
		, b.prior_flag
	FROM featrue_label_5_flag_plus a
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, COUNT(coupon_id) AS num_all
			, SUM(IF(date_pay <> 'null', 1, 0)) AS consume_num
			, SUM(IF(date_pay <> 'null', 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE) AS prob
		FROM data1234
		GROUP BY user_id, 
			merchant_id
	) t
	ON a.user_id = t.user_id
		AND a.merchant_id = t.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, IF(SUM(IF(date_pay = 'null', 0, 1)) > 0, 1, 0) AS prior_flag
		FROM data1234
		GROUP BY user_id, 
			coupon_id
	) b
	ON a.user_id = b.user_id
		AND a.coupon_id = b.coupon_id
) t1
--6月
drop table featrue_label_6_flag_plus2;
CREATE TABLE featrue_label_6_flag_plus2
AS
SELECT times
	, user_c_time
	, user_b_time
	, user_dis_time
	, c_time
	, user_time
	, b_time
	, d
	, dis_d
	, c_d
	, b_d
	, user_d
	, user_c_d
	, user_dis_d
	, user_c_num
	, user_b
	, b_dis
	, b_num
	, c_num
	, dis
	, user_b_dis
	, user_c_dis
	, user_dis
	, user_get_num
	, user_last_time
	, b_last_time
	, c_last_time
	, dis_last_time
	, user_b_last_time
	, user_c_last_time
	, user_dis_last_time
	, user_diff
	, b_diff
	, c_diff
	, dis_diff
	, user_b_diff
	, user_c_diff
	, user_dis_diff
	, user_id
	, merchant_id
	, coupon_id
	, discount_rate
	, distance
	, date_received
	, date_pay
	, label
	, flag
	, flag2
	, distance_flag
	, dis_flag
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(consume_num IS NULL, 0, consume_num) AS consume_num
	, IF(prob IS NULL, 0, prob) AS prob
FROM (
	SELECT a.*
		, t.num_all
		, t.consume_num
		, t.prob
		, b.prior_flag
	FROM featrue_label_6_flag_plus a
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, COUNT(coupon_id) AS num_all
			, SUM(IF(date_pay <> 'null', 1, 0)) AS consume_num
			, SUM(IF(date_pay <> 'null', 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE) AS prob
		FROM data12345
		GROUP BY user_id, 
			merchant_id
	) t
	ON a.user_id = t.user_id
		AND a.merchant_id = t.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, IF(SUM(IF(date_pay = 'null', 0, 1)) > 0, 1, 0) AS prior_flag
		FROM data12345
		GROUP BY user_id, 
			coupon_id
	) b
	ON a.user_id = b.user_id
		AND a.coupon_id = b.coupon_id
) t1
--7 月
drop table featrue_7_flag_plus2;
CREATE TABLE featrue_7_flag_plus2
AS
SELECT times
	, user_c_time
	, user_b_time
	, user_dis_time
	, c_time
	, user_time
	, b_time
	, d
	, dis_d
	, c_d
	, b_d
	, user_d
	, user_c_d
	, user_dis_d
	, user_c_num
	, user_b
	, b_dis
	, b_num
	, c_num
	, dis
	, user_b_dis
	, user_c_dis
	, user_dis
	, user_get_num
	, user_last_time
	, b_last_time
	, c_last_time
	, dis_last_time
	, user_b_last_time
	, user_c_last_time
	, user_dis_last_time
	, user_diff
	, b_diff
	, c_diff
	, dis_diff
	, user_b_diff
	, user_c_diff
	, user_dis_diff
	, user_id
	, merchant_id
	, coupon_id
	, discount_rate
	, distance
	, date_received
	, flag
	, flag2
	, distance_flag
	, dis_flag
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(consume_num IS NULL, 0, consume_num) AS consume_num
	, IF(prob IS NULL, 0, prob) AS prob
FROM (
	SELECT a.*
		, t.num_all
		, t.consume_num
		, t.prob
		, b.prior_flag
	FROM featrue_7_flag_plus a
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, COUNT(coupon_id) AS num_all
			, SUM(IF(date_pay <> 'null', 1, 0)) AS consume_num
			, SUM(IF(date_pay <> 'null', 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE) AS prob
		FROM data123456
		GROUP BY user_id, 
			merchant_id
	) t
	ON a.user_id = t.user_id
		AND a.merchant_id = t.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, IF(SUM(IF(date_pay = 'null', 0, 1)) > 0, 1, 0) AS prior_flag
		FROM data123456
		GROUP BY user_id, 
			coupon_id
	) b
	ON a.user_id = b.user_id
		AND a.coupon_id = b.coupon_id
) t1

--trian data
drop table featrue_label_flag_plus2;
CREATE TABLE featrue_label_flag_plus2
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_flag_plus2
			UNION ALL
			SELECT *
			FROM featrue_label_3_flag_plus2
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_flag_plus2
			UNION ALL
			SELECT *
			FROM featrue_label_5_flag_plus2
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_flag_plus2
) t4;
-------------
---------------
------------month 2
DROP TABLE test_2;

CREATE TABLE test_2
AS
SELECT *
	, decode(discount_rate, '0.2', 0, '0.5', 1, '0.6', 2, '0.7', 3, '0.75', 4, '0.8', 5, '0.85', 6, '0.9', 7, '0.95', 8, '100:1', 9, '100:10', 10, '100:20', 11, '100:30', 12, '100:5', 13, '100:50', 14, '10:1', 15, '10:5', 16, '150:10', 17, '150:20', 18, '200:10', 19, '200:20', 20, '200:30', 21, '200:5', 22, '200:50', 23, '20:1', 24, '20:10', 25, '20:5', 26, '300:30', 27, '30:1', 28, '30:10', 29, '30:20', 30, '30:5', 31, '50:1', 32, '50:10', 33, '50:20', 34, '50:5', 35, 36) AS dis_flag2
FROM featrue_label_2_flag_plus2

-----month 3
DROP TABLE test_3;
CREATE TABLE test_3
AS
SELECT *
	, decode(discount_rate, '0.2', 0, '0.5', 1, '0.6', 2, '0.7', 3, '0.75', 4, '0.8', 5, '0.85', 6, '0.9', 7, '0.95', 8, '100:1', 9, '100:10', 10, '100:20', 11, '100:30', 12, '100:5', 13, '100:50', 14, '10:1', 15, '10:5', 16, '150:10', 17, '150:20', 18, '200:10', 19, '200:20', 20, '200:30', 21, '200:5', 22, '200:50', 23, '20:1', 24, '20:10', 25, '20:5', 26, '300:30', 27, '30:1', 28, '30:10', 29, '30:20', 30, '30:5', 31, '50:1', 32, '50:10', 33, '50:20', 34, '50:5', 35, 36) AS dis_flag2
FROM featrue_label_3_flag_plus2
---month 4
DROP TABLE test_4;

CREATE TABLE test_4
AS
SELECT *
	, decode(discount_rate, '0.2', 0, '0.5', 1, '0.6', 2, '0.7', 3, '0.75', 4, '0.8', 5, '0.85', 6, '0.9', 7, '0.95', 8, '100:1', 9, '100:10', 10, '100:20', 11, '100:30', 12, '100:5', 13, '100:50', 14, '10:1', 15, '10:5', 16, '150:10', 17, '150:20', 18, '200:10', 19, '200:20', 20, '200:30', 21, '200:5', 22, '200:50', 23, '20:1', 24, '20:10', 25, '20:5', 26, '300:30', 27, '30:1', 28, '30:10', 29, '30:20', 30, '30:5', 31, '50:1', 32, '50:10', 33, '50:20', 34, '50:5', 35, 36) AS dis_flag2
FROM featrue_label_4_flag_plus2
--------------month 5
DROP TABLE test_5;

CREATE TABLE test_5
AS
SELECT *
	, decode(discount_rate, '0.2', 0, '0.5', 1, '0.6', 2, '0.7', 3, '0.75', 4, '0.8', 5, '0.85', 6, '0.9', 7, '0.95', 8, '100:1', 9, '100:10', 10, '100:20', 11, '100:30', 12, '100:5', 13, '100:50', 14, '10:1', 15, '10:5', 16, '150:10', 17, '150:20', 18, '200:10', 19, '200:20', 20, '200:30', 21, '200:5', 22, '200:50', 23, '20:1', 24, '20:10', 25, '20:5', 26, '300:30', 27, '30:1', 28, '30:10', 29, '30:20', 30, '30:5', 31, '50:1', 32, '50:10', 33, '50:20', 34, '50:5', 35, 36) AS dis_flag2
FROM featrue_label_5_flag_plus2
-------month 6
DROP TABLE test_6;
CREATE TABLE test_6
AS
SELECT *
	, decode(discount_rate, '0.2', 0, '0.5', 1, '0.6', 2, '0.7', 3, '0.75', 4, '0.8', 5, '0.85', 6, '0.9', 7, '0.95', 8, '100:1', 9, '100:10', 10, '100:20', 11, '100:30', 12, '100:5', 13, '100:50', 14, '10:1', 15, '10:5', 16, '150:10', 17, '150:20', 18, '200:10', 19, '200:20', 20, '200:30', 21, '200:5', 22, '200:50', 23, '20:1', 24, '20:10', 25, '20:5', 26, '300:30', 27, '30:1', 28, '30:10', 29, '30:20', 30, '30:5', 31, '50:1', 32, '50:10', 33, '50:20', 34, '50:5', 35, 36) AS dis_flag2
FROM featrue_label_6_flag_plus2
--------month 7
DROP TABLE test_7;
CREATE TABLE test_7
AS
SELECT *
	, decode(discount_rate, '0.2', 0, '0.5', 1, '0.6', 2, '0.7', 3, '0.75', 4, '0.8', 5, '0.85', 6, '0.9', 7, '0.95', 8, '100:1', 9, '100:10', 10, '100:20', 11, '100:30', 12, '100:5', 13, '100:50', 14, '10:1', 15, '10:5', 16, '150:10', 17, '150:20', 18, '200:10', 19, '200:20', 20, '200:30', 21, '200:5', 22, '200:50', 23, '20:1', 24, '20:10', 25, '20:5', 26, '300:30', 27, '30:1', 28, '30:10', 29, '30:20', 30, '30:5', 31, '50:1', 32, '50:10', 33, '50:20', 34, '50:5', 35, 36) AS dis_flag2
FROM featrue_7_flag_plus2
-----train data
drop table test;
CREATE TABLE test
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM test_2
			UNION ALL
			SELECT *
			FROM test_3
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM test_4
			UNION ALL
			SELECT *
			FROM test_5
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM test_6
) t4;

-----------




















--select user_id,coupon_id,date_received from (select * from test_2 order by date_received limit 10000000) a group by user_id,coupon_id,date_received

---------------------
--2 month
create table featrue_label_2_flag_plus3 as
SELECT a.*
	, a.b_time / CAST(a.times AS DOUBLE) AS b_time_times_rate
	, a.user_time / CAST(a.times AS DOUBLE) AS user_time_times_rate
	, a.user_b_time / CAST(a.times AS DOUBLE) AS user_b_time_times_rate
	, a.user_c_time / CAST(a.times AS DOUBLE) AS user_c_time_times_rate
	, a.c_time / CAST(a.times AS DOUBLE) AS c_time_times_rate
	, a.user_dis_time / CAST(a.times AS DOUBLE) AS user_dis_time_times_rate
	, a.b_time / CAST(a.b_num AS DOUBLE) AS b_time_b_rate
	, a.user_time / CAST(a.user_get_num AS DOUBLE) AS user_time_user_rate
	, a.c_time / CAST(a.c_num AS DOUBLE) AS c_time_c_rate
	, a.user_dis_time / CAST(a.user_get_num AS DOUBLE) AS user_dis_time_user_rate
	, a.user_dis_time / CAST(a.dis AS DOUBLE) AS user_dis_time_dis_rate
	, a.user_b_time / CAST(a.user_get_num AS DOUBLE) AS user_b_time_user_rate
	, a.user_b_time / CAST(a.b_num AS DOUBLE) AS user_b_time_b_rate
	, a.user_c_time / CAST(a.user_get_num AS DOUBLE) AS user_c_time_user_rate
	, a.user_c_time / CAST(a.c_num AS DOUBLE) AS user_c_time_c_rate
	, datediff(TO_DATE(a.date_received, 'yyyymmdd'), TO_DATE('20160201', 'yyyymmdd'), 'dd') AS day_flag
	, IF(a.date_received <> b.last_day, 0, 1) AS user_is_last_day
	, IF(a.date_received <> c.last_day, 0, 1) AS merchant_is_last_day
	, IF(a.date_received <> ddd.last_day, 0, 1) AS coupon_is_last_day
	, IF(a.date_received <> e.last_day, 0, 1) AS dis_is_last_day
	, IF(a.date_received <> f.last_day, 0, 1) AS d_is_last_day
	, IF(a.date_received <> j.last_day, 0, 1) AS user_b_is_last_day
	, IF(a.date_received <> h.last_day, 0, 1) AS user_dis_is_last_day
	, IF(a.date_received <> i.last_day, 0, 1) AS user_d_is_last_day
	, IF(a.date_received <> g.last_day, 0, 1) AS b_c_is_last_day
	, aa.c_variety_by_user
	, bb.b_variety_by_user
	, cc.dis_variety_by_user
	, dd.c_variety_by_b
	, ee.user_variety_by_b
	, ff.dis_variety_by_b
	, gg.user_variety_c
	, hh.b_variety_c
FROM test_2 a
LEFT OUTER JOIN (
	SELECT user_id
		, MAX(date_received) AS last_day
	FROM test_2
	GROUP BY user_id
) b
ON a.user_id = b.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, MAX(date_received) AS last_day
	FROM test_2
	GROUP BY merchant_id
) c
ON a.merchant_id = c.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, MAX(date_received) AS last_day
	FROM test_2
	GROUP BY coupon_id
) ddd
ON a.coupon_id = ddd.coupon_id
LEFT OUTER JOIN (
	SELECT discount_rate
		, MAX(date_received) AS last_day
	FROM test_2
	GROUP BY discount_rate
) e
ON a.discount_rate = e.discount_rate
LEFT OUTER JOIN (
	SELECT distance
		, MAX(date_received) AS last_day
	FROM test_2
	GROUP BY distance
) f
ON a.distance = f.distance
LEFT OUTER JOIN (
	SELECT user_id
		, merchant_id
		, MAX(date_received) AS last_day
	FROM test_2
	GROUP BY user_id, 
		merchant_id
) j
ON a.user_id = j.user_id
	AND a.merchant_id = j.merchant_id
LEFT OUTER JOIN (
	SELECT user_id
		, discount_rate
		, MAX(date_received) AS last_day
	FROM test_2
	GROUP BY user_id, 
		discount_rate
) h
ON a.user_id = h.user_id
	AND a.discount_rate = h.discount_rate
LEFT OUTER JOIN (
	SELECT user_id
		, distance
		, MAX(date_received) AS last_day
	FROM test_2
	GROUP BY user_id, 
		distance
) i
ON a.user_id = i.user_id
	AND a.distance = i.distance
LEFT OUTER JOIN (
	SELECT merchant_id
		, coupon_id
		, MAX(date_received) AS last_day
	FROM test_2
	GROUP BY coupon_id, 
		merchant_id
) g
ON a.merchant_id = g.merchant_id
	AND a.coupon_id = g.coupon_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_user
	FROM test_2
	GROUP BY user_id
) aa
ON a.user_id = aa.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT merchant_id) AS b_variety_by_user
	FROM test_2
	GROUP BY user_id
) bb
ON a.user_id = bb.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_user
	FROM test_2
	GROUP BY user_id
) cc
ON a.user_id = cc.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_b
	FROM test_2
	GROUP BY merchant_id
) dd
ON a.merchant_id = dd.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT user_id) AS user_variety_by_b
	FROM test_2
	GROUP BY merchant_id
) ee
ON a.merchant_id = ee.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_b
	FROM test_2
	GROUP BY merchant_id
) ff
ON a.merchant_id = ff.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT user_id) AS user_variety_c
	FROM test_2
	GROUP BY coupon_id
) gg
ON a.coupon_id = gg.coupon_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT merchant_id) AS b_variety_c
	FROM test_2
	GROUP BY coupon_id
) hh
ON a.coupon_id = hh.coupon_id

----3 month 
create table featrue_label_3_flag_plus3 as
SELECT a.*
	, a.b_time / CAST(a.times AS DOUBLE) AS b_time_times_rate
	, a.user_time / CAST(a.times AS DOUBLE) AS user_time_times_rate
	, a.user_b_time / CAST(a.times AS DOUBLE) AS user_b_time_times_rate
	, a.user_c_time / CAST(a.times AS DOUBLE) AS user_c_time_times_rate
	, a.c_time / CAST(a.times AS DOUBLE) AS c_time_times_rate
	, a.user_dis_time / CAST(a.times AS DOUBLE) AS user_dis_time_times_rate
	, a.b_time / CAST(a.b_num AS DOUBLE) AS b_time_b_rate
	, a.user_time / CAST(a.user_get_num AS DOUBLE) AS user_time_user_rate
	, a.c_time / CAST(a.c_num AS DOUBLE) AS c_time_c_rate
	, a.user_dis_time / CAST(a.user_get_num AS DOUBLE) AS user_dis_time_user_rate
	, a.user_dis_time / CAST(a.dis AS DOUBLE) AS user_dis_time_dis_rate
	, a.user_b_time / CAST(a.user_get_num AS DOUBLE) AS user_b_time_user_rate
	, a.user_b_time / CAST(a.b_num AS DOUBLE) AS user_b_time_b_rate
	, a.user_c_time / CAST(a.user_get_num AS DOUBLE) AS user_c_time_user_rate
	, a.user_c_time / CAST(a.c_num AS DOUBLE) AS user_c_time_c_rate
	, datediff(TO_DATE(a.date_received, 'yyyymmdd'), TO_DATE('20160301', 'yyyymmdd'), 'dd') AS day_flag
	, IF(a.date_received <> b.last_day, 0, 1) AS user_is_last_day
	, IF(a.date_received <> c.last_day, 0, 1) AS merchant_is_last_day
	, IF(a.date_received <> ddd.last_day, 0, 1) AS coupon_is_last_day
	, IF(a.date_received <> e.last_day, 0, 1) AS dis_is_last_day
	, IF(a.date_received <> f.last_day, 0, 1) AS d_is_last_day
	, IF(a.date_received <> j.last_day, 0, 1) AS user_b_is_last_day
	, IF(a.date_received <> h.last_day, 0, 1) AS user_dis_is_last_day
	, IF(a.date_received <> i.last_day, 0, 1) AS user_d_is_last_day
	, IF(a.date_received <> g.last_day, 0, 1) AS b_c_is_last_day
	, aa.c_variety_by_user
	, bb.b_variety_by_user
	, cc.dis_variety_by_user
	, dd.c_variety_by_b
	, ee.user_variety_by_b
	, ff.dis_variety_by_b
	, gg.user_variety_c
	, hh.b_variety_c
FROM test_3 a
LEFT OUTER JOIN (
	SELECT user_id
		, MAX(date_received) AS last_day
	FROM test_3
	GROUP BY user_id
) b
ON a.user_id = b.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, MAX(date_received) AS last_day
	FROM test_3
	GROUP BY merchant_id
) c
ON a.merchant_id = c.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, MAX(date_received) AS last_day
	FROM test_3
	GROUP BY coupon_id
) ddd
ON a.coupon_id = ddd.coupon_id
LEFT OUTER JOIN (
	SELECT discount_rate
		, MAX(date_received) AS last_day
	FROM test_3
	GROUP BY discount_rate
) e
ON a.discount_rate = e.discount_rate
LEFT OUTER JOIN (
	SELECT distance
		, MAX(date_received) AS last_day
	FROM test_3
	GROUP BY distance
) f
ON a.distance = f.distance
LEFT OUTER JOIN (
	SELECT user_id
		, merchant_id
		, MAX(date_received) AS last_day
	FROM test_3
	GROUP BY user_id, 
		merchant_id
) j
ON a.user_id = j.user_id
	AND a.merchant_id = j.merchant_id
LEFT OUTER JOIN (
	SELECT user_id
		, discount_rate
		, MAX(date_received) AS last_day
	FROM test_3
	GROUP BY user_id, 
		discount_rate
) h
ON a.user_id = h.user_id
	AND a.discount_rate = h.discount_rate
LEFT OUTER JOIN (
	SELECT user_id
		, distance
		, MAX(date_received) AS last_day
	FROM test_3
	GROUP BY user_id, 
		distance
) i
ON a.user_id = i.user_id
	AND a.distance = i.distance
LEFT OUTER JOIN (
	SELECT merchant_id
		, coupon_id
		, MAX(date_received) AS last_day
	FROM test_3
	GROUP BY coupon_id, 
		merchant_id
) g
ON a.merchant_id = g.merchant_id
	AND a.coupon_id = g.coupon_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_user
	FROM test_3
	GROUP BY user_id
) aa
ON a.user_id = aa.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT merchant_id) AS b_variety_by_user
	FROM test_3
	GROUP BY user_id
) bb
ON a.user_id = bb.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_user
	FROM test_3
	GROUP BY user_id
) cc
ON a.user_id = cc.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_b
	FROM test_3
	GROUP BY merchant_id
) dd
ON a.merchant_id = dd.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT user_id) AS user_variety_by_b
	FROM test_3
	GROUP BY merchant_id
) ee
ON a.merchant_id = ee.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_b
	FROM test_3
	GROUP BY merchant_id
) ff
ON a.merchant_id = ff.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT user_id) AS user_variety_c
	FROM test_3
	GROUP BY coupon_id
) gg
ON a.coupon_id = gg.coupon_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT merchant_id) AS b_variety_c
	FROM test_3
	GROUP BY coupon_id
) hh
ON a.coupon_id = hh.coupon_id


----- 4 month 
create table featrue_label_4_flag_plus3 as
SELECT a.*
	, a.b_time / CAST(a.times AS DOUBLE) AS b_time_times_rate
	, a.user_time / CAST(a.times AS DOUBLE) AS user_time_times_rate
	, a.user_b_time / CAST(a.times AS DOUBLE) AS user_b_time_times_rate
	, a.user_c_time / CAST(a.times AS DOUBLE) AS user_c_time_times_rate
	, a.c_time / CAST(a.times AS DOUBLE) AS c_time_times_rate
	, a.user_dis_time / CAST(a.times AS DOUBLE) AS user_dis_time_times_rate
	, a.b_time / CAST(a.b_num AS DOUBLE) AS b_time_b_rate
	, a.user_time / CAST(a.user_get_num AS DOUBLE) AS user_time_user_rate
	, a.c_time / CAST(a.c_num AS DOUBLE) AS c_time_c_rate
	, a.user_dis_time / CAST(a.user_get_num AS DOUBLE) AS user_dis_time_user_rate
	, a.user_dis_time / CAST(a.dis AS DOUBLE) AS user_dis_time_dis_rate
	, a.user_b_time / CAST(a.user_get_num AS DOUBLE) AS user_b_time_user_rate
	, a.user_b_time / CAST(a.b_num AS DOUBLE) AS user_b_time_b_rate
	, a.user_c_time / CAST(a.user_get_num AS DOUBLE) AS user_c_time_user_rate
	, a.user_c_time / CAST(a.c_num AS DOUBLE) AS user_c_time_c_rate
	, datediff(TO_DATE(a.date_received, 'yyyymmdd'), TO_DATE('20160401', 'yyyymmdd'), 'dd') AS day_flag
	, IF(a.date_received <> b.last_day, 0, 1) AS user_is_last_day
	, IF(a.date_received <> c.last_day, 0, 1) AS merchant_is_last_day
	, IF(a.date_received <> ddd.last_day, 0, 1) AS coupon_is_last_day
	, IF(a.date_received <> e.last_day, 0, 1) AS dis_is_last_day
	, IF(a.date_received <> f.last_day, 0, 1) AS d_is_last_day
	, IF(a.date_received <> j.last_day, 0, 1) AS user_b_is_last_day
	, IF(a.date_received <> h.last_day, 0, 1) AS user_dis_is_last_day
	, IF(a.date_received <> i.last_day, 0, 1) AS user_d_is_last_day
	, IF(a.date_received <> g.last_day, 0, 1) AS b_c_is_last_day
	, aa.c_variety_by_user
	, bb.b_variety_by_user
	, cc.dis_variety_by_user
	, dd.c_variety_by_b
	, ee.user_variety_by_b
	, ff.dis_variety_by_b
	, gg.user_variety_c
	, hh.b_variety_c
FROM test_4 a
LEFT OUTER JOIN (
	SELECT user_id
		, MAX(date_received) AS last_day
	FROM test_4
	GROUP BY user_id
) b
ON a.user_id = b.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, MAX(date_received) AS last_day
	FROM test_4
	GROUP BY merchant_id
) c
ON a.merchant_id = c.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, MAX(date_received) AS last_day
	FROM test_4
	GROUP BY coupon_id
) ddd
ON a.coupon_id = ddd.coupon_id
LEFT OUTER JOIN (
	SELECT discount_rate
		, MAX(date_received) AS last_day
	FROM test_4
	GROUP BY discount_rate
) e
ON a.discount_rate = e.discount_rate
LEFT OUTER JOIN (
	SELECT distance
		, MAX(date_received) AS last_day
	FROM test_4
	GROUP BY distance
) f
ON a.distance = f.distance
LEFT OUTER JOIN (
	SELECT user_id
		, merchant_id
		, MAX(date_received) AS last_day
	FROM test_4
	GROUP BY user_id, 
		merchant_id
) j
ON a.user_id = j.user_id
	AND a.merchant_id = j.merchant_id
LEFT OUTER JOIN (
	SELECT user_id
		, discount_rate
		, MAX(date_received) AS last_day
	FROM test_4
	GROUP BY user_id, 
		discount_rate
) h
ON a.user_id = h.user_id
	AND a.discount_rate = h.discount_rate
LEFT OUTER JOIN (
	SELECT user_id
		, distance
		, MAX(date_received) AS last_day
	FROM test_4
	GROUP BY user_id, 
		distance
) i
ON a.user_id = i.user_id
	AND a.distance = i.distance
LEFT OUTER JOIN (
	SELECT merchant_id
		, coupon_id
		, MAX(date_received) AS last_day
	FROM test_4
	GROUP BY coupon_id, 
		merchant_id
) g
ON a.merchant_id = g.merchant_id
	AND a.coupon_id = g.coupon_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_user
	FROM test_4
	GROUP BY user_id
) aa
ON a.user_id = aa.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT merchant_id) AS b_variety_by_user
	FROM test_4
	GROUP BY user_id
) bb
ON a.user_id = bb.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_user
	FROM test_4
	GROUP BY user_id
) cc
ON a.user_id = cc.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_b
	FROM test_4
	GROUP BY merchant_id
) dd
ON a.merchant_id = dd.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT user_id) AS user_variety_by_b
	FROM test_4
	GROUP BY merchant_id
) ee
ON a.merchant_id = ee.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_b
	FROM test_4
	GROUP BY merchant_id
) ff
ON a.merchant_id = ff.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT user_id) AS user_variety_c
	FROM test_4
	GROUP BY coupon_id
) gg
ON a.coupon_id = gg.coupon_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT merchant_id) AS b_variety_c
	FROM test_4
	GROUP BY coupon_id
) hh
ON a.coupon_id = hh.coupon_id

--------5 month 
create table featrue_label_5_flag_plus3 as
SELECT a.*
	, a.b_time / CAST(a.times AS DOUBLE) AS b_time_times_rate
	, a.user_time / CAST(a.times AS DOUBLE) AS user_time_times_rate
	, a.user_b_time / CAST(a.times AS DOUBLE) AS user_b_time_times_rate
	, a.user_c_time / CAST(a.times AS DOUBLE) AS user_c_time_times_rate
	, a.c_time / CAST(a.times AS DOUBLE) AS c_time_times_rate
	, a.user_dis_time / CAST(a.times AS DOUBLE) AS user_dis_time_times_rate
	, a.b_time / CAST(a.b_num AS DOUBLE) AS b_time_b_rate
	, a.user_time / CAST(a.user_get_num AS DOUBLE) AS user_time_user_rate
	, a.c_time / CAST(a.c_num AS DOUBLE) AS c_time_c_rate
	, a.user_dis_time / CAST(a.user_get_num AS DOUBLE) AS user_dis_time_user_rate
	, a.user_dis_time / CAST(a.dis AS DOUBLE) AS user_dis_time_dis_rate
	, a.user_b_time / CAST(a.user_get_num AS DOUBLE) AS user_b_time_user_rate
	, a.user_b_time / CAST(a.b_num AS DOUBLE) AS user_b_time_b_rate
	, a.user_c_time / CAST(a.user_get_num AS DOUBLE) AS user_c_time_user_rate
	, a.user_c_time / CAST(a.c_num AS DOUBLE) AS user_c_time_c_rate
	, datediff(TO_DATE(a.date_received, 'yyyymmdd'), TO_DATE('20160501', 'yyyymmdd'), 'dd') AS day_flag
	, IF(a.date_received <> b.last_day, 0, 1) AS user_is_last_day
	, IF(a.date_received <> c.last_day, 0, 1) AS merchant_is_last_day
	, IF(a.date_received <> ddd.last_day, 0, 1) AS coupon_is_last_day
	, IF(a.date_received <> e.last_day, 0, 1) AS dis_is_last_day
	, IF(a.date_received <> f.last_day, 0, 1) AS d_is_last_day
	, IF(a.date_received <> j.last_day, 0, 1) AS user_b_is_last_day
	, IF(a.date_received <> h.last_day, 0, 1) AS user_dis_is_last_day
	, IF(a.date_received <> i.last_day, 0, 1) AS user_d_is_last_day
	, IF(a.date_received <> g.last_day, 0, 1) AS b_c_is_last_day
	, aa.c_variety_by_user
	, bb.b_variety_by_user
	, cc.dis_variety_by_user
	, dd.c_variety_by_b
	, ee.user_variety_by_b
	, ff.dis_variety_by_b
	, gg.user_variety_c
	, hh.b_variety_c
FROM test_5 a
LEFT OUTER JOIN (
	SELECT user_id
		, MAX(date_received) AS last_day
	FROM test_5
	GROUP BY user_id
) b
ON a.user_id = b.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, MAX(date_received) AS last_day
	FROM test_5
	GROUP BY merchant_id
) c
ON a.merchant_id = c.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, MAX(date_received) AS last_day
	FROM test_5
	GROUP BY coupon_id
) ddd
ON a.coupon_id = ddd.coupon_id
LEFT OUTER JOIN (
	SELECT discount_rate
		, MAX(date_received) AS last_day
	FROM test_5
	GROUP BY discount_rate
) e
ON a.discount_rate = e.discount_rate
LEFT OUTER JOIN (
	SELECT distance
		, MAX(date_received) AS last_day
	FROM test_5
	GROUP BY distance
) f
ON a.distance = f.distance
LEFT OUTER JOIN (
	SELECT user_id
		, merchant_id
		, MAX(date_received) AS last_day
	FROM test_5
	GROUP BY user_id, 
		merchant_id
) j
ON a.user_id = j.user_id
	AND a.merchant_id = j.merchant_id
LEFT OUTER JOIN (
	SELECT user_id
		, discount_rate
		, MAX(date_received) AS last_day
	FROM test_5
	GROUP BY user_id, 
		discount_rate
) h
ON a.user_id = h.user_id
	AND a.discount_rate = h.discount_rate
LEFT OUTER JOIN (
	SELECT user_id
		, distance
		, MAX(date_received) AS last_day
	FROM test_5
	GROUP BY user_id, 
		distance
) i
ON a.user_id = i.user_id
	AND a.distance = i.distance
LEFT OUTER JOIN (
	SELECT merchant_id
		, coupon_id
		, MAX(date_received) AS last_day
	FROM test_5
	GROUP BY coupon_id, 
		merchant_id
) g
ON a.merchant_id = g.merchant_id
	AND a.coupon_id = g.coupon_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_user
	FROM test_5
	GROUP BY user_id
) aa
ON a.user_id = aa.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT merchant_id) AS b_variety_by_user
	FROM test_5
	GROUP BY user_id
) bb
ON a.user_id = bb.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_user
	FROM test_5
	GROUP BY user_id
) cc
ON a.user_id = cc.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_b
	FROM test_5
	GROUP BY merchant_id
) dd
ON a.merchant_id = dd.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT user_id) AS user_variety_by_b
	FROM test_5
	GROUP BY merchant_id
) ee
ON a.merchant_id = ee.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_b
	FROM test_5
	GROUP BY merchant_id
) ff
ON a.merchant_id = ff.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT user_id) AS user_variety_c
	FROM test_5
	GROUP BY coupon_id
) gg
ON a.coupon_id = gg.coupon_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT merchant_id) AS b_variety_c
	FROM test_5
	GROUP BY coupon_id
) hh
ON a.coupon_id = hh.coupon_id

----6 month
create table featrue_label_6_flag_plus3 as
SELECT a.*
	, a.b_time / CAST(a.times AS DOUBLE) AS b_time_times_rate
	, a.user_time / CAST(a.times AS DOUBLE) AS user_time_times_rate
	, a.user_b_time / CAST(a.times AS DOUBLE) AS user_b_time_times_rate
	, a.user_c_time / CAST(a.times AS DOUBLE) AS user_c_time_times_rate
	, a.c_time / CAST(a.times AS DOUBLE) AS c_time_times_rate
	, a.user_dis_time / CAST(a.times AS DOUBLE) AS user_dis_time_times_rate
	, a.b_time / CAST(a.b_num AS DOUBLE) AS b_time_b_rate
	, a.user_time / CAST(a.user_get_num AS DOUBLE) AS user_time_user_rate
	, a.c_time / CAST(a.c_num AS DOUBLE) AS c_time_c_rate
	, a.user_dis_time / CAST(a.user_get_num AS DOUBLE) AS user_dis_time_user_rate
	, a.user_dis_time / CAST(a.dis AS DOUBLE) AS user_dis_time_dis_rate
	, a.user_b_time / CAST(a.user_get_num AS DOUBLE) AS user_b_time_user_rate
	, a.user_b_time / CAST(a.b_num AS DOUBLE) AS user_b_time_b_rate
	, a.user_c_time / CAST(a.user_get_num AS DOUBLE) AS user_c_time_user_rate
	, a.user_c_time / CAST(a.c_num AS DOUBLE) AS user_c_time_c_rate
	, datediff(TO_DATE(a.date_received, 'yyyymmdd'), TO_DATE('20160601', 'yyyymmdd'), 'dd') AS day_flag
	, IF(a.date_received <> b.last_day, 0, 1) AS user_is_last_day
	, IF(a.date_received <> c.last_day, 0, 1) AS merchant_is_last_day
	, IF(a.date_received <> ddd.last_day, 0, 1) AS coupon_is_last_day
	, IF(a.date_received <> e.last_day, 0, 1) AS dis_is_last_day
	, IF(a.date_received <> f.last_day, 0, 1) AS d_is_last_day
	, IF(a.date_received <> j.last_day, 0, 1) AS user_b_is_last_day
	, IF(a.date_received <> h.last_day, 0, 1) AS user_dis_is_last_day
	, IF(a.date_received <> i.last_day, 0, 1) AS user_d_is_last_day
	, IF(a.date_received <> g.last_day, 0, 1) AS b_c_is_last_day
	, aa.c_variety_by_user
	, bb.b_variety_by_user
	, cc.dis_variety_by_user
	, dd.c_variety_by_b
	, ee.user_variety_by_b
	, ff.dis_variety_by_b
	, gg.user_variety_c
	, hh.b_variety_c
FROM test_6 a
LEFT OUTER JOIN (
	SELECT user_id
		, MAX(date_received) AS last_day
	FROM test_6
	GROUP BY user_id
) b
ON a.user_id = b.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, MAX(date_received) AS last_day
	FROM test_6
	GROUP BY merchant_id
) c
ON a.merchant_id = c.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, MAX(date_received) AS last_day
	FROM test_6
	GROUP BY coupon_id
) ddd
ON a.coupon_id = ddd.coupon_id
LEFT OUTER JOIN (
	SELECT discount_rate
		, MAX(date_received) AS last_day
	FROM test_6
	GROUP BY discount_rate
) e
ON a.discount_rate = e.discount_rate
LEFT OUTER JOIN (
	SELECT distance
		, MAX(date_received) AS last_day
	FROM test_6
	GROUP BY distance
) f
ON a.distance = f.distance
LEFT OUTER JOIN (
	SELECT user_id
		, merchant_id
		, MAX(date_received) AS last_day
	FROM test_6
	GROUP BY user_id, 
		merchant_id
) j
ON a.user_id = j.user_id
	AND a.merchant_id = j.merchant_id
LEFT OUTER JOIN (
	SELECT user_id
		, discount_rate
		, MAX(date_received) AS last_day
	FROM test_6
	GROUP BY user_id, 
		discount_rate
) h
ON a.user_id = h.user_id
	AND a.discount_rate = h.discount_rate
LEFT OUTER JOIN (
	SELECT user_id
		, distance
		, MAX(date_received) AS last_day
	FROM test_6
	GROUP BY user_id, 
		distance
) i
ON a.user_id = i.user_id
	AND a.distance = i.distance
LEFT OUTER JOIN (
	SELECT merchant_id
		, coupon_id
		, MAX(date_received) AS last_day
	FROM test_6
	GROUP BY coupon_id, 
		merchant_id
) g
ON a.merchant_id = g.merchant_id
	AND a.coupon_id = g.coupon_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_user
	FROM test_6
	GROUP BY user_id
) aa
ON a.user_id = aa.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT merchant_id) AS b_variety_by_user
	FROM test_6
	GROUP BY user_id
) bb
ON a.user_id = bb.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_user
	FROM test_6
	GROUP BY user_id
) cc
ON a.user_id = cc.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_b
	FROM test_6
	GROUP BY merchant_id
) dd
ON a.merchant_id = dd.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT user_id) AS user_variety_by_b
	FROM test_6
	GROUP BY merchant_id
) ee
ON a.merchant_id = ee.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_b
	FROM test_6
	GROUP BY merchant_id
) ff
ON a.merchant_id = ff.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT user_id) AS user_variety_c
	FROM test_6
	GROUP BY coupon_id
) gg
ON a.coupon_id = gg.coupon_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT merchant_id) AS b_variety_c
	FROM test_6
	GROUP BY coupon_id
) hh
ON a.coupon_id = hh.coupon_id

-----month 7
create table featrue_7_flag_plus3 as
SELECT a.*
	, a.b_time / CAST(a.times AS DOUBLE) AS b_time_times_rate
	, a.user_time / CAST(a.times AS DOUBLE) AS user_time_times_rate
	, a.user_b_time / CAST(a.times AS DOUBLE) AS user_b_time_times_rate
	, a.user_c_time / CAST(a.times AS DOUBLE) AS user_c_time_times_rate
	, a.c_time / CAST(a.times AS DOUBLE) AS c_time_times_rate
	, a.user_dis_time / CAST(a.times AS DOUBLE) AS user_dis_time_times_rate
	, a.b_time / CAST(a.b_num AS DOUBLE) AS b_time_b_rate
	, a.user_time / CAST(a.user_get_num AS DOUBLE) AS user_time_user_rate
	, a.c_time / CAST(a.c_num AS DOUBLE) AS c_time_c_rate
	, a.user_dis_time / CAST(a.user_get_num AS DOUBLE) AS user_dis_time_user_rate
	, a.user_dis_time / CAST(a.dis AS DOUBLE) AS user_dis_time_dis_rate
	, a.user_b_time / CAST(a.user_get_num AS DOUBLE) AS user_b_time_user_rate
	, a.user_b_time / CAST(a.b_num AS DOUBLE) AS user_b_time_b_rate
	, a.user_c_time / CAST(a.user_get_num AS DOUBLE) AS user_c_time_user_rate
	, a.user_c_time / CAST(a.c_num AS DOUBLE) AS user_c_time_c_rate
	, datediff(TO_DATE(a.date_received, 'yyyymmdd'), TO_DATE('20160701', 'yyyymmdd'), 'dd') AS day_flag
	, IF(a.date_received <> b.last_day, 0, 1) AS user_is_last_day
	, IF(a.date_received <> c.last_day, 0, 1) AS merchant_is_last_day
	, IF(a.date_received <> ddd.last_day, 0, 1) AS coupon_is_last_day
	, IF(a.date_received <> e.last_day, 0, 1) AS dis_is_last_day
	, IF(a.date_received <> f.last_day, 0, 1) AS d_is_last_day
	, IF(a.date_received <> j.last_day, 0, 1) AS user_b_is_last_day
	, IF(a.date_received <> h.last_day, 0, 1) AS user_dis_is_last_day
	, IF(a.date_received <> i.last_day, 0, 1) AS user_d_is_last_day
	, IF(a.date_received <> g.last_day, 0, 1) AS b_c_is_last_day
	, aa.c_variety_by_user
	, bb.b_variety_by_user
	, cc.dis_variety_by_user
	, dd.c_variety_by_b
	, ee.user_variety_by_b
	, ff.dis_variety_by_b
	, gg.user_variety_c
	, hh.b_variety_c
FROM test_7 a
LEFT OUTER JOIN (
	SELECT user_id
		, MAX(date_received) AS last_day
	FROM test_7
	GROUP BY user_id
) b
ON a.user_id = b.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, MAX(date_received) AS last_day
	FROM test_7
	GROUP BY merchant_id
) c
ON a.merchant_id = c.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, MAX(date_received) AS last_day
	FROM test_7
	GROUP BY coupon_id
) ddd
ON a.coupon_id = ddd.coupon_id
LEFT OUTER JOIN (
	SELECT discount_rate
		, MAX(date_received) AS last_day
	FROM test_7
	GROUP BY discount_rate
) e
ON a.discount_rate = e.discount_rate
LEFT OUTER JOIN (
	SELECT distance
		, MAX(date_received) AS last_day
	FROM test_7
	GROUP BY distance
) f
ON a.distance = f.distance
LEFT OUTER JOIN (
	SELECT user_id
		, merchant_id
		, MAX(date_received) AS last_day
	FROM test_7
	GROUP BY user_id, 
		merchant_id
) j
ON a.user_id = j.user_id
	AND a.merchant_id = j.merchant_id
LEFT OUTER JOIN (
	SELECT user_id
		, discount_rate
		, MAX(date_received) AS last_day
	FROM test_7
	GROUP BY user_id, 
		discount_rate
) h
ON a.user_id = h.user_id
	AND a.discount_rate = h.discount_rate
LEFT OUTER JOIN (
	SELECT user_id
		, distance
		, MAX(date_received) AS last_day
	FROM test_7
	GROUP BY user_id, 
		distance
) i
ON a.user_id = i.user_id
	AND a.distance = i.distance
LEFT OUTER JOIN (
	SELECT merchant_id
		, coupon_id
		, MAX(date_received) AS last_day
	FROM test_7
	GROUP BY coupon_id, 
		merchant_id
) g
ON a.merchant_id = g.merchant_id
	AND a.coupon_id = g.coupon_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_user
	FROM test_7
	GROUP BY user_id
) aa
ON a.user_id = aa.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT merchant_id) AS b_variety_by_user
	FROM test_7
	GROUP BY user_id
) bb
ON a.user_id = bb.user_id
LEFT OUTER JOIN (
	SELECT user_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_user
	FROM test_7
	GROUP BY user_id
) cc
ON a.user_id = cc.user_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT coupon_id) AS c_variety_by_b
	FROM test_7
	GROUP BY merchant_id
) dd
ON a.merchant_id = dd.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT user_id) AS user_variety_by_b
	FROM test_7
	GROUP BY merchant_id
) ee
ON a.merchant_id = ee.merchant_id
LEFT OUTER JOIN (
	SELECT merchant_id
		, COUNT(DISTINCT discount_rate) AS dis_variety_by_b
	FROM test_7
	GROUP BY merchant_id
) ff
ON a.merchant_id = ff.merchant_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT user_id) AS user_variety_c
	FROM test_7
	GROUP BY coupon_id
) gg
ON a.coupon_id = gg.coupon_id
LEFT OUTER JOIN (
	SELECT coupon_id
		, COUNT(DISTINCT merchant_id) AS b_variety_c
	FROM test_7
	GROUP BY coupon_id
) hh
ON a.coupon_id = hh.coupon_id

----train data
drop table featrue_label_flag_plus3;
CREATE TABLE featrue_label_flag_plus3
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_flag_plus3
			UNION ALL
			SELECT *
			FROM featrue_label_3_flag_plus3
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_flag_plus3
			UNION ALL
			SELECT *
			FROM featrue_label_5_flag_plus3
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_flag_plus3
) t4;
--------------------加上往月的特征值
---2 month
create table featrue_label_2_flag_plus4 as
SELECT a.*
	, IF(b.user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	,if(b.user_u_num_less_15 is null,0,user_u_num_less_15) as user_u_num_less_15
	,if(b.user_u_num_all is null,0,user_u_num_all) as user_u_num_all
	,if(b.user_no_u_num is null,0,user_no_u_num) as user_no_u_num
	,if(b.user_get_c_num is null,0,user_get_c_num) as user_get_c_num
	,if(b.user_use_c_all is null,0,user_use_c_all) as user_use_c_all
	
	,if(c.c_u_c_rate is null,0,c_u_c_rate) as c_u_c_rate
	,if(c.c_u_num_less_15 is null,0,c_u_num_less_15) as c_u_num_less_15
	,if(c.c_u_num_all is null,0,c_u_num_all) as c_u_num_all
	,if(c.c_no_u_num is null,0,c_no_u_num) as c_no_u_num
	,if(c.c_get_c_num is null,0,c_get_c_num) as c_get_c_num
	,if(c.c_use_c_all is null,0,c_use_c_all) as c_use_c_all
	
	,if(ddd.dis_u_c_rate is null,0,dis_u_c_rate) as dis_u_c_rate
	,if(ddd.dis_u_num_less_15 is null,0,dis_u_num_less_15) as dis_u_num_less_15
	,if(ddd.dis_u_num_all is null,0,dis_u_num_all) as dis_u_num_all
	,if(ddd.dis_no_u_num is null,0,dis_no_u_num) as dis_no_u_num
	,if(ddd.dis_use_c_all is null,0,dis_use_c_all) as dis_use_c_all
	
	,if(e.d_u_c_rate is null,0,d_u_c_rate) as d_u_c_rate
	,if(e.d_u_num_less_15 is null,0,d_u_num_less_15) as d_u_num_less_15
	,if(e.d_u_num_all is null,0,d_u_num_all) as d_u_num_all
	,if(e.d_no_u_num is null,0,d_no_u_num) as d_no_u_num
	,if(e.d_use_c_all is null,0,d_use_c_all) as d_use_c_all
	
	,if(f.user_b_u_c_rate is null ,0,user_b_u_c_rate) as user_b_u_c_rate
	,if(f.user_b_u_num_less_15 is null ,0,user_b_u_num_less_15) as user_b_u_num_less_15
	,if(f.user_b_u_num_all is null ,0,user_b_u_num_all) as user_b_u_num_all
	,if(f.user_b_no_u_num is null ,0,user_b_no_u_num) as user_b_no_u_num
	,if(f.user_b_use_c_all is null ,0,user_b_use_c_all) as user_b_use_c_all
	
	,if(g.user_d_u_c_rate is null,0,user_d_u_c_rate) as user_d_u_c_rate
	,if(g.user_d_u_num_less_15 is null,0,user_d_u_num_less_15) as user_d_u_num_less_15
	,if(g.user_d_u_num_all is null,0,user_d_u_num_all) as user_d_u_num_all
	,if(g.user_d_no_u_num is null,0,user_d_no_u_num) as user_d_no_u_num
	,if(g.user_d_use_c_all is null,0,user_d_use_c_all) as user_d_use_c_all
	
	,if(h.user_c_u_c_rate is null,0,user_c_u_c_rate) as user_c_u_c_rate
	,if(h.user_c_u_num_less_15 is null,0,user_c_u_num_less_15) as user_c_u_num_less_15
	,if(h.user_c_u_num_all is null,0,user_c_u_num_all) as user_c_u_num_all
	,if(h.user_c_no_u_num is null,0,user_c_no_u_num) as user_c_no_u_num
	
	,if(i.user_dis_u_c_rate is null,0,user_dis_u_c_rate) as user_dis_u_c_rate
	,if(i.user_dis_u_num_less_15 is null,0,user_dis_u_num_less_15) as user_dis_u_num_less_15
	,if(i.user_dis_u_num_all is null,0,user_dis_u_num_all) as user_dis_u_num_all
	,if(i.user_dis_no_u_num is null,0,user_dis_no_u_num) as user_dis_no_u_num
	
	,if(j.b_dis_u_c_rate is null,0,b_dis_u_c_rate) as b_dis_u_c_rate
	,if(j.b_dis_u_num_less_15 is null,0,b_dis_u_num_less_15) as b_dis_u_num_less_15
	,if(j.b_dis_u_num_all is null,0,b_dis_u_num_all) as b_dis_u_num_all
	,if(j.b_dis_no_u_num is null,0,b_dis_no_u_num) as b_dis_no_u_num
	
	,if(k.c_d_u_c_rate is null ,0,c_d_u_c_rate) as c_d_u_c_rate
	,if(k.c_d_u_num_less_15 is null ,0,c_d_u_num_less_15) as c_d_u_num_less_15
	,if(k.c_d_u_num_all is null ,0,c_d_u_num_all) as c_d_u_num_all
	,if(k.c_d_no_u_num is null ,0,c_d_u_c_rate) as c_d_no_u_num
	
	,if(l.b_d_u_c_rate is null,0,b_d_u_c_rate) as b_d_u_c_rate
	,if(l.b_d_u_num_less_15 is null,0,b_d_u_num_less_15) as b_d_u_num_less_15
	,if(l.b_d_u_num_all is null,0,b_d_u_num_all) as b_d_u_num_all
	,if(l.b_d_no_u_num is null,0,b_d_no_u_num) as b_d_no_u_num
	,if(l.b_d_use_c_all is null,0,b_d_use_c_all) as b_d_use_c_all
	
	,if(m.b_c_dis_u_c_rate is null,0,b_c_dis_u_c_rate) as b_c_dis_u_c_rate
	,if(m.b_c_dis_u_num_less_15 is null,0,b_c_dis_u_num_less_15) as b_c_dis_u_num_less_15
	,if(m.b_c_did_u_num_all is null,0,b_c_did_u_num_all) as b_c_did_u_num_all
	,if(m.b_c_dis_no_u_num is null,0,b_c_dis_no_u_num) as b_c_dis_no_u_num
	
	,if(n.user_only_click_num is null,0,user_only_click_num) as user_only_click_num
	,if(n.user_buy_num is null,0,user_buy_num) as user_buy_num
	,if(n.user_only_get_num is null,0,user_only_get_num) as user_only_get_num
	,if(n.user_have_coupon_and_buy_num is null,0,user_have_coupon_and_buy_num) as user_have_coupon_and_buy_num
	,if(n.num_all is null,0,n.num_all) as on_num_all
	,if(n.ctr is null,0,ctr) as ctr
FROM featrue_label_2_flag_plus3 a
LEFT OUTER JOIN user_prior_month_1 b
ON b.user_id = a.user_id
left outer join c_prior_month_1 c on c.coupon_id =a.coupon_id
left outer join dis_prior_month_1 ddd on ddd.discount_rate=a.discount_rate
left outer join d_prior_month_1 e on e.distance =a.distance
left outer join user_b_prior_month_1 f on f.user_id =a.user_id and f.merchant_id =a.merchant_id
left outer join user_d_prior_month_1 g on g.user_id =a.user_id and g.distance = a.distance
left outer join user_c_prior_month_1 h on h.user_id =a.user_id and h.coupon_id =a.coupon_id
left outer join user_dis_prior_month_1 i on i.user_id =a.user_id and i.discount_rate =a.discount_rate
left outer join b_dis_prior_month_1 j on j.merchant_id =a.merchant_id and j.discount_rate =a.discount_rate
left outer join c_d_prior_month_1 k on k.coupon_id =a.coupon_id and k.distance =a.distance
left outer join b_d_prior_month_1 l on l.merchant_id =a.merchant_id and l.distance =a.distance
left outer join b_c_dis_prior_month_1 m on m.merchant_id =a.merchant_id and m.coupon_id =a.coupon_id and m.discount_rate =a.discount_rate
left outer join user_online_1 n on n.user_id =a.user_id

---------------3 month 
create table featrue_label_3_flag_plus4 as
SELECT a.*
	, IF(b.user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	,if(b.user_u_num_less_15 is null,0,user_u_num_less_15) as user_u_num_less_15
	,if(b.user_u_num_all is null,0,user_u_num_all) as user_u_num_all
	,if(b.user_no_u_num is null,0,user_no_u_num) as user_no_u_num
	,if(b.user_get_c_num is null,0,user_get_c_num) as user_get_c_num
	,if(b.user_use_c_all is null,0,user_use_c_all) as user_use_c_all
	
	,if(c.c_u_c_rate is null,0,c_u_c_rate) as c_u_c_rate
	,if(c.c_u_num_less_15 is null,0,c_u_num_less_15) as c_u_num_less_15
	,if(c.c_u_num_all is null,0,c_u_num_all) as c_u_num_all
	,if(c.c_no_u_num is null,0,c_no_u_num) as c_no_u_num
	,if(c.c_get_c_num is null,0,c_get_c_num) as c_get_c_num
	,if(c.c_use_c_all is null,0,c_use_c_all) as c_use_c_all
	
	,if(ddd.dis_u_c_rate is null,0,dis_u_c_rate) as dis_u_c_rate
	,if(ddd.dis_u_num_less_15 is null,0,dis_u_num_less_15) as dis_u_num_less_15
	,if(ddd.dis_u_num_all is null,0,dis_u_num_all) as dis_u_num_all
	,if(ddd.dis_no_u_num is null,0,dis_no_u_num) as dis_no_u_num
	,if(ddd.dis_use_c_all is null,0,dis_use_c_all) as dis_use_c_all
	
	,if(e.d_u_c_rate is null,0,d_u_c_rate) as d_u_c_rate
	,if(e.d_u_num_less_15 is null,0,d_u_num_less_15) as d_u_num_less_15
	,if(e.d_u_num_all is null,0,d_u_num_all) as d_u_num_all
	,if(e.d_no_u_num is null,0,d_no_u_num) as d_no_u_num
	,if(e.d_use_c_all is null,0,d_use_c_all) as d_use_c_all
	
	,if(f.user_b_u_c_rate is null ,0,user_b_u_c_rate) as user_b_u_c_rate
	,if(f.user_b_u_num_less_15 is null ,0,user_b_u_num_less_15) as user_b_u_num_less_15
	,if(f.user_b_u_num_all is null ,0,user_b_u_num_all) as user_b_u_num_all
	,if(f.user_b_no_u_num is null ,0,user_b_no_u_num) as user_b_no_u_num
	,if(f.user_b_use_c_all is null ,0,user_b_use_c_all) as user_b_use_c_all
	
	,if(g.user_d_u_c_rate is null,0,user_d_u_c_rate) as user_d_u_c_rate
	,if(g.user_d_u_num_less_15 is null,0,user_d_u_num_less_15) as user_d_u_num_less_15
	,if(g.user_d_u_num_all is null,0,user_d_u_num_all) as user_d_u_num_all
	,if(g.user_d_no_u_num is null,0,user_d_no_u_num) as user_d_no_u_num
	,if(g.user_d_use_c_all is null,0,user_d_use_c_all) as user_d_use_c_all
	
	,if(h.user_c_u_c_rate is null,0,user_c_u_c_rate) as user_c_u_c_rate
	,if(h.user_c_u_num_less_15 is null,0,user_c_u_num_less_15) as user_c_u_num_less_15
	,if(h.user_c_u_num_all is null,0,user_c_u_num_all) as user_c_u_num_all
	,if(h.user_c_no_u_num is null,0,user_c_no_u_num) as user_c_no_u_num
	
	,if(i.user_dis_u_c_rate is null,0,user_dis_u_c_rate) as user_dis_u_c_rate
	,if(i.user_dis_u_num_less_15 is null,0,user_dis_u_num_less_15) as user_dis_u_num_less_15
	,if(i.user_dis_u_num_all is null,0,user_dis_u_num_all) as user_dis_u_num_all
	,if(i.user_dis_no_u_num is null,0,user_dis_no_u_num) as user_dis_no_u_num
	
	,if(j.b_dis_u_c_rate is null,0,b_dis_u_c_rate) as b_dis_u_c_rate
	,if(j.b_dis_u_num_less_15 is null,0,b_dis_u_num_less_15) as b_dis_u_num_less_15
	,if(j.b_dis_u_num_all is null,0,b_dis_u_num_all) as b_dis_u_num_all
	,if(j.b_dis_no_u_num is null,0,b_dis_no_u_num) as b_dis_no_u_num
	
	,if(k.c_d_u_c_rate is null ,0,c_d_u_c_rate) as c_d_u_c_rate
	,if(k.c_d_u_num_less_15 is null ,0,c_d_u_num_less_15) as c_d_u_num_less_15
	,if(k.c_d_u_num_all is null ,0,c_d_u_num_all) as c_d_u_num_all
	,if(k.c_d_no_u_num is null ,0,c_d_u_c_rate) as c_d_no_u_num
	
	,if(l.b_d_u_c_rate is null,0,b_d_u_c_rate) as b_d_u_c_rate
	,if(l.b_d_u_num_less_15 is null,0,b_d_u_num_less_15) as b_d_u_num_less_15
	,if(l.b_d_u_num_all is null,0,b_d_u_num_all) as b_d_u_num_all
	,if(l.b_d_no_u_num is null,0,b_d_no_u_num) as b_d_no_u_num
	,if(l.b_d_use_c_all is null,0,b_d_use_c_all) as b_d_use_c_all
	
	,if(m.b_c_dis_u_c_rate is null,0,b_c_dis_u_c_rate) as b_c_dis_u_c_rate
	,if(m.b_c_dis_u_num_less_15 is null,0,b_c_dis_u_num_less_15) as b_c_dis_u_num_less_15
	,if(m.b_c_did_u_num_all is null,0,b_c_did_u_num_all) as b_c_did_u_num_all
	,if(m.b_c_dis_no_u_num is null,0,b_c_dis_no_u_num) as b_c_dis_no_u_num
	
	,if(n.user_only_click_num is null,0,user_only_click_num) as user_only_click_num
	,if(n.user_buy_num is null,0,user_buy_num) as user_buy_num
	,if(n.user_only_get_num is null,0,user_only_get_num) as user_only_get_num
	,if(n.user_have_coupon_and_buy_num is null,0,user_have_coupon_and_buy_num) as user_have_coupon_and_buy_num
	,if(n.num_all is null,0,n.num_all) as on_num_all
	,if(n.ctr is null,0,ctr) as ctr
FROM featrue_label_3_flag_plus3 a
LEFT OUTER JOIN user_prior_month_12 b
ON b.user_id = a.user_id
left outer join c_prior_month_12 c on c.coupon_id =a.coupon_id
left outer join dis_prior_month_12 ddd on ddd.discount_rate=a.discount_rate
left outer join d_prior_month_12 e on e.distance =a.distance
left outer join user_b_prior_month_12 f on f.user_id =a.user_id and f.merchant_id =a.merchant_id
left outer join user_d_prior_month_12 g on g.user_id =a.user_id and g.distance = a.distance
left outer join user_c_prior_month_12 h on h.user_id =a.user_id and h.coupon_id =a.coupon_id
left outer join user_dis_prior_month_12 i on i.user_id =a.user_id and i.discount_rate =a.discount_rate
left outer join b_dis_prior_month_12 j on j.merchant_id =a.merchant_id and j.discount_rate =a.discount_rate
left outer join c_d_prior_month_12 k on k.coupon_id =a.coupon_id and k.distance =a.distance
left outer join b_d_prior_month_12 l on l.merchant_id =a.merchant_id and l.distance =a.distance
left outer join b_c_dis_prior_month_12 m on m.merchant_id =a.merchant_id and m.coupon_id =a.coupon_id and m.discount_rate =a.discount_rate
left outer join user_online_2 n on n.user_id =a.user_id

------4 month
create table featrue_label_4_flag_plus4 as
SELECT a.*
	, IF(b.user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	,if(b.user_u_num_less_15 is null,0,user_u_num_less_15) as user_u_num_less_15
	,if(b.user_u_num_all is null,0,user_u_num_all) as user_u_num_all
	,if(b.user_no_u_num is null,0,user_no_u_num) as user_no_u_num
	,if(b.user_get_c_num is null,0,user_get_c_num) as user_get_c_num
	,if(b.user_use_c_all is null,0,user_use_c_all) as user_use_c_all
	
	,if(c.c_u_c_rate is null,0,c_u_c_rate) as c_u_c_rate
	,if(c.c_u_num_less_15 is null,0,c_u_num_less_15) as c_u_num_less_15
	,if(c.c_u_num_all is null,0,c_u_num_all) as c_u_num_all
	,if(c.c_no_u_num is null,0,c_no_u_num) as c_no_u_num
	,if(c.c_get_c_num is null,0,c_get_c_num) as c_get_c_num
	,if(c.c_use_c_all is null,0,c_use_c_all) as c_use_c_all
	
	,if(ddd.dis_u_c_rate is null,0,dis_u_c_rate) as dis_u_c_rate
	,if(ddd.dis_u_num_less_15 is null,0,dis_u_num_less_15) as dis_u_num_less_15
	,if(ddd.dis_u_num_all is null,0,dis_u_num_all) as dis_u_num_all
	,if(ddd.dis_no_u_num is null,0,dis_no_u_num) as dis_no_u_num
	,if(ddd.dis_use_c_all is null,0,dis_use_c_all) as dis_use_c_all
	
	,if(e.d_u_c_rate is null,0,d_u_c_rate) as d_u_c_rate
	,if(e.d_u_num_less_15 is null,0,d_u_num_less_15) as d_u_num_less_15
	,if(e.d_u_num_all is null,0,d_u_num_all) as d_u_num_all
	,if(e.d_no_u_num is null,0,d_no_u_num) as d_no_u_num
	,if(e.d_use_c_all is null,0,d_use_c_all) as d_use_c_all
	
	,if(f.user_b_u_c_rate is null ,0,user_b_u_c_rate) as user_b_u_c_rate
	,if(f.user_b_u_num_less_15 is null ,0,user_b_u_num_less_15) as user_b_u_num_less_15
	,if(f.user_b_u_num_all is null ,0,user_b_u_num_all) as user_b_u_num_all
	,if(f.user_b_no_u_num is null ,0,user_b_no_u_num) as user_b_no_u_num
	,if(f.user_b_use_c_all is null ,0,user_b_use_c_all) as user_b_use_c_all
	
	,if(g.user_d_u_c_rate is null,0,user_d_u_c_rate) as user_d_u_c_rate
	,if(g.user_d_u_num_less_15 is null,0,user_d_u_num_less_15) as user_d_u_num_less_15
	,if(g.user_d_u_num_all is null,0,user_d_u_num_all) as user_d_u_num_all
	,if(g.user_d_no_u_num is null,0,user_d_no_u_num) as user_d_no_u_num
	,if(g.user_d_use_c_all is null,0,user_d_use_c_all) as user_d_use_c_all
	
	,if(h.user_c_u_c_rate is null,0,user_c_u_c_rate) as user_c_u_c_rate
	,if(h.user_c_u_num_less_15 is null,0,user_c_u_num_less_15) as user_c_u_num_less_15
	,if(h.user_c_u_num_all is null,0,user_c_u_num_all) as user_c_u_num_all
	,if(h.user_c_no_u_num is null,0,user_c_no_u_num) as user_c_no_u_num
	
	,if(i.user_dis_u_c_rate is null,0,user_dis_u_c_rate) as user_dis_u_c_rate
	,if(i.user_dis_u_num_less_15 is null,0,user_dis_u_num_less_15) as user_dis_u_num_less_15
	,if(i.user_dis_u_num_all is null,0,user_dis_u_num_all) as user_dis_u_num_all
	,if(i.user_dis_no_u_num is null,0,user_dis_no_u_num) as user_dis_no_u_num
	
	,if(j.b_dis_u_c_rate is null,0,b_dis_u_c_rate) as b_dis_u_c_rate
	,if(j.b_dis_u_num_less_15 is null,0,b_dis_u_num_less_15) as b_dis_u_num_less_15
	,if(j.b_dis_u_num_all is null,0,b_dis_u_num_all) as b_dis_u_num_all
	,if(j.b_dis_no_u_num is null,0,b_dis_no_u_num) as b_dis_no_u_num
	
	,if(k.c_d_u_c_rate is null ,0,c_d_u_c_rate) as c_d_u_c_rate
	,if(k.c_d_u_num_less_15 is null ,0,c_d_u_num_less_15) as c_d_u_num_less_15
	,if(k.c_d_u_num_all is null ,0,c_d_u_num_all) as c_d_u_num_all
	,if(k.c_d_no_u_num is null ,0,c_d_u_c_rate) as c_d_no_u_num
	
	,if(l.b_d_u_c_rate is null,0,b_d_u_c_rate) as b_d_u_c_rate
	,if(l.b_d_u_num_less_15 is null,0,b_d_u_num_less_15) as b_d_u_num_less_15
	,if(l.b_d_u_num_all is null,0,b_d_u_num_all) as b_d_u_num_all
	,if(l.b_d_no_u_num is null,0,b_d_no_u_num) as b_d_no_u_num
	,if(l.b_d_use_c_all is null,0,b_d_use_c_all) as b_d_use_c_all
	
	,if(m.b_c_dis_u_c_rate is null,0,b_c_dis_u_c_rate) as b_c_dis_u_c_rate
	,if(m.b_c_dis_u_num_less_15 is null,0,b_c_dis_u_num_less_15) as b_c_dis_u_num_less_15
	,if(m.b_c_did_u_num_all is null,0,b_c_did_u_num_all) as b_c_did_u_num_all
	,if(m.b_c_dis_no_u_num is null,0,b_c_dis_no_u_num) as b_c_dis_no_u_num
	
	,if(n.user_only_click_num is null,0,user_only_click_num) as user_only_click_num
	,if(n.user_buy_num is null,0,user_buy_num) as user_buy_num
	,if(n.user_only_get_num is null,0,user_only_get_num) as user_only_get_num
	,if(n.user_have_coupon_and_buy_num is null,0,user_have_coupon_and_buy_num) as user_have_coupon_and_buy_num
	,if(n.num_all is null,0,n.num_all) as on_num_all
	,if(n.ctr is null,0,ctr) as ctr
FROM featrue_label_4_flag_plus3 a
LEFT OUTER JOIN user_prior_month_123 b
ON b.user_id = a.user_id
left outer join c_prior_month_123 c on c.coupon_id =a.coupon_id
left outer join dis_prior_month_123 ddd on ddd.discount_rate=a.discount_rate
left outer join d_prior_month_123 e on e.distance =a.distance
left outer join user_b_prior_month_123 f on f.user_id =a.user_id and f.merchant_id =a.merchant_id
left outer join user_d_prior_month_123 g on g.user_id =a.user_id and g.distance = a.distance
left outer join user_c_prior_month_123 h on h.user_id =a.user_id and h.coupon_id =a.coupon_id
left outer join user_dis_prior_month_123 i on i.user_id =a.user_id and i.discount_rate =a.discount_rate
left outer join b_dis_prior_month_123 j on j.merchant_id =a.merchant_id and j.discount_rate =a.discount_rate
left outer join c_d_prior_month_123 k on k.coupon_id =a.coupon_id and k.distance =a.distance
left outer join b_d_prior_month_123 l on l.merchant_id =a.merchant_id and l.distance =a.distance
left outer join b_c_dis_prior_month_123 m on m.merchant_id =a.merchant_id and m.coupon_id =a.coupon_id and m.discount_rate =a.discount_rate
left outer join user_online_3 n on n.user_id =a.user_id
------month 5

create table featrue_label_5_flag_plus4 as
SELECT a.*
	, IF(b.user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	,if(b.user_u_num_less_15 is null,0,user_u_num_less_15) as user_u_num_less_15
	,if(b.user_u_num_all is null,0,user_u_num_all) as user_u_num_all
	,if(b.user_no_u_num is null,0,user_no_u_num) as user_no_u_num
	,if(b.user_get_c_num is null,0,user_get_c_num) as user_get_c_num
	,if(b.user_use_c_all is null,0,user_use_c_all) as user_use_c_all
	
	,if(c.c_u_c_rate is null,0,c_u_c_rate) as c_u_c_rate
	,if(c.c_u_num_less_15 is null,0,c_u_num_less_15) as c_u_num_less_15
	,if(c.c_u_num_all is null,0,c_u_num_all) as c_u_num_all
	,if(c.c_no_u_num is null,0,c_no_u_num) as c_no_u_num
	,if(c.c_get_c_num is null,0,c_get_c_num) as c_get_c_num
	,if(c.c_use_c_all is null,0,c_use_c_all) as c_use_c_all
	
	,if(ddd.dis_u_c_rate is null,0,dis_u_c_rate) as dis_u_c_rate
	,if(ddd.dis_u_num_less_15 is null,0,dis_u_num_less_15) as dis_u_num_less_15
	,if(ddd.dis_u_num_all is null,0,dis_u_num_all) as dis_u_num_all
	,if(ddd.dis_no_u_num is null,0,dis_no_u_num) as dis_no_u_num
	,if(ddd.dis_use_c_all is null,0,dis_use_c_all) as dis_use_c_all
	
	,if(e.d_u_c_rate is null,0,d_u_c_rate) as d_u_c_rate
	,if(e.d_u_num_less_15 is null,0,d_u_num_less_15) as d_u_num_less_15
	,if(e.d_u_num_all is null,0,d_u_num_all) as d_u_num_all
	,if(e.d_no_u_num is null,0,d_no_u_num) as d_no_u_num
	,if(e.d_use_c_all is null,0,d_use_c_all) as d_use_c_all
	
	,if(f.user_b_u_c_rate is null ,0,user_b_u_c_rate) as user_b_u_c_rate
	,if(f.user_b_u_num_less_15 is null ,0,user_b_u_num_less_15) as user_b_u_num_less_15
	,if(f.user_b_u_num_all is null ,0,user_b_u_num_all) as user_b_u_num_all
	,if(f.user_b_no_u_num is null ,0,user_b_no_u_num) as user_b_no_u_num
	,if(f.user_b_use_c_all is null ,0,user_b_use_c_all) as user_b_use_c_all
	
	,if(g.user_d_u_c_rate is null,0,user_d_u_c_rate) as user_d_u_c_rate
	,if(g.user_d_u_num_less_15 is null,0,user_d_u_num_less_15) as user_d_u_num_less_15
	,if(g.user_d_u_num_all is null,0,user_d_u_num_all) as user_d_u_num_all
	,if(g.user_d_no_u_num is null,0,user_d_no_u_num) as user_d_no_u_num
	,if(g.user_d_use_c_all is null,0,user_d_use_c_all) as user_d_use_c_all
	
	,if(h.user_c_u_c_rate is null,0,user_c_u_c_rate) as user_c_u_c_rate
	,if(h.user_c_u_num_less_15 is null,0,user_c_u_num_less_15) as user_c_u_num_less_15
	,if(h.user_c_u_num_all is null,0,user_c_u_num_all) as user_c_u_num_all
	,if(h.user_c_no_u_num is null,0,user_c_no_u_num) as user_c_no_u_num
	
	,if(i.user_dis_u_c_rate is null,0,user_dis_u_c_rate) as user_dis_u_c_rate
	,if(i.user_dis_u_num_less_15 is null,0,user_dis_u_num_less_15) as user_dis_u_num_less_15
	,if(i.user_dis_u_num_all is null,0,user_dis_u_num_all) as user_dis_u_num_all
	,if(i.user_dis_no_u_num is null,0,user_dis_no_u_num) as user_dis_no_u_num
	
	,if(j.b_dis_u_c_rate is null,0,b_dis_u_c_rate) as b_dis_u_c_rate
	,if(j.b_dis_u_num_less_15 is null,0,b_dis_u_num_less_15) as b_dis_u_num_less_15
	,if(j.b_dis_u_num_all is null,0,b_dis_u_num_all) as b_dis_u_num_all
	,if(j.b_dis_no_u_num is null,0,b_dis_no_u_num) as b_dis_no_u_num
	
	,if(k.c_d_u_c_rate is null ,0,c_d_u_c_rate) as c_d_u_c_rate
	,if(k.c_d_u_num_less_15 is null ,0,c_d_u_num_less_15) as c_d_u_num_less_15
	,if(k.c_d_u_num_all is null ,0,c_d_u_num_all) as c_d_u_num_all
	,if(k.c_d_no_u_num is null ,0,c_d_u_c_rate) as c_d_no_u_num
	
	,if(l.b_d_u_c_rate is null,0,b_d_u_c_rate) as b_d_u_c_rate
	,if(l.b_d_u_num_less_15 is null,0,b_d_u_num_less_15) as b_d_u_num_less_15
	,if(l.b_d_u_num_all is null,0,b_d_u_num_all) as b_d_u_num_all
	,if(l.b_d_no_u_num is null,0,b_d_no_u_num) as b_d_no_u_num
	,if(l.b_d_use_c_all is null,0,b_d_use_c_all) as b_d_use_c_all
	
	,if(m.b_c_dis_u_c_rate is null,0,b_c_dis_u_c_rate) as b_c_dis_u_c_rate
	,if(m.b_c_dis_u_num_less_15 is null,0,b_c_dis_u_num_less_15) as b_c_dis_u_num_less_15
	,if(m.b_c_did_u_num_all is null,0,b_c_did_u_num_all) as b_c_did_u_num_all
	,if(m.b_c_dis_no_u_num is null,0,b_c_dis_no_u_num) as b_c_dis_no_u_num
	
	,if(n.user_only_click_num is null,0,user_only_click_num) as user_only_click_num
	,if(n.user_buy_num is null,0,user_buy_num) as user_buy_num
	,if(n.user_only_get_num is null,0,user_only_get_num) as user_only_get_num
	,if(n.user_have_coupon_and_buy_num is null,0,user_have_coupon_and_buy_num) as user_have_coupon_and_buy_num
	,if(n.num_all is null,0,n.num_all) as on_num_all
	,if(n.ctr is null,0,ctr) as ctr
FROM featrue_label_5_flag_plus3 a
LEFT OUTER JOIN user_prior_month_1234 b
ON b.user_id = a.user_id
left outer join c_prior_month_1234 c on c.coupon_id =a.coupon_id
left outer join dis_prior_month_1234 ddd on ddd.discount_rate=a.discount_rate
left outer join d_prior_month_1234 e on e.distance =a.distance
left outer join user_b_prior_month_1234 f on f.user_id =a.user_id and f.merchant_id =a.merchant_id
left outer join user_d_prior_month_1234 g on g.user_id =a.user_id and g.distance = a.distance
left outer join user_c_prior_month_1234 h on h.user_id =a.user_id and h.coupon_id =a.coupon_id
left outer join user_dis_prior_month_1234 i on i.user_id =a.user_id and i.discount_rate =a.discount_rate
left outer join b_dis_prior_month_1234 j on j.merchant_id =a.merchant_id and j.discount_rate =a.discount_rate
left outer join c_d_prior_month_1234 k on k.coupon_id =a.coupon_id and k.distance =a.distance
left outer join b_d_prior_month_1234 l on l.merchant_id =a.merchant_id and l.distance =a.distance
left outer join b_c_dis_prior_month_1234 m on m.merchant_id =a.merchant_id and m.coupon_id =a.coupon_id and m.discount_rate =a.discount_rate
left outer join user_online_4 n on n.user_id =a.user_id

------month 6

create table featrue_label_6_flag_plus4 as
SELECT a.*
	, IF(b.user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	,if(b.user_u_num_less_15 is null,0,user_u_num_less_15) as user_u_num_less_15
	,if(b.user_u_num_all is null,0,user_u_num_all) as user_u_num_all
	,if(b.user_no_u_num is null,0,user_no_u_num) as user_no_u_num
	,if(b.user_get_c_num is null,0,user_get_c_num) as user_get_c_num
	,if(b.user_use_c_all is null,0,user_use_c_all) as user_use_c_all
	
	,if(c.c_u_c_rate is null,0,c_u_c_rate) as c_u_c_rate
	,if(c.c_u_num_less_15 is null,0,c_u_num_less_15) as c_u_num_less_15
	,if(c.c_u_num_all is null,0,c_u_num_all) as c_u_num_all
	,if(c.c_no_u_num is null,0,c_no_u_num) as c_no_u_num
	,if(c.c_get_c_num is null,0,c_get_c_num) as c_get_c_num
	,if(c.c_use_c_all is null,0,c_use_c_all) as c_use_c_all
	
	,if(ddd.dis_u_c_rate is null,0,dis_u_c_rate) as dis_u_c_rate
	,if(ddd.dis_u_num_less_15 is null,0,dis_u_num_less_15) as dis_u_num_less_15
	,if(ddd.dis_u_num_all is null,0,dis_u_num_all) as dis_u_num_all
	,if(ddd.dis_no_u_num is null,0,dis_no_u_num) as dis_no_u_num
	,if(ddd.dis_use_c_all is null,0,dis_use_c_all) as dis_use_c_all
	
	,if(e.d_u_c_rate is null,0,d_u_c_rate) as d_u_c_rate
	,if(e.d_u_num_less_15 is null,0,d_u_num_less_15) as d_u_num_less_15
	,if(e.d_u_num_all is null,0,d_u_num_all) as d_u_num_all
	,if(e.d_no_u_num is null,0,d_no_u_num) as d_no_u_num
	,if(e.d_use_c_all is null,0,d_use_c_all) as d_use_c_all
	
	,if(f.user_b_u_c_rate is null ,0,user_b_u_c_rate) as user_b_u_c_rate
	,if(f.user_b_u_num_less_15 is null ,0,user_b_u_num_less_15) as user_b_u_num_less_15
	,if(f.user_b_u_num_all is null ,0,user_b_u_num_all) as user_b_u_num_all
	,if(f.user_b_no_u_num is null ,0,user_b_no_u_num) as user_b_no_u_num
	,if(f.user_b_use_c_all is null ,0,user_b_use_c_all) as user_b_use_c_all
	
	,if(g.user_d_u_c_rate is null,0,user_d_u_c_rate) as user_d_u_c_rate
	,if(g.user_d_u_num_less_15 is null,0,user_d_u_num_less_15) as user_d_u_num_less_15
	,if(g.user_d_u_num_all is null,0,user_d_u_num_all) as user_d_u_num_all
	,if(g.user_d_no_u_num is null,0,user_d_no_u_num) as user_d_no_u_num
	,if(g.user_d_use_c_all is null,0,user_d_use_c_all) as user_d_use_c_all
	
	,if(h.user_c_u_c_rate is null,0,user_c_u_c_rate) as user_c_u_c_rate
	,if(h.user_c_u_num_less_15 is null,0,user_c_u_num_less_15) as user_c_u_num_less_15
	,if(h.user_c_u_num_all is null,0,user_c_u_num_all) as user_c_u_num_all
	,if(h.user_c_no_u_num is null,0,user_c_no_u_num) as user_c_no_u_num
	
	,if(i.user_dis_u_c_rate is null,0,user_dis_u_c_rate) as user_dis_u_c_rate
	,if(i.user_dis_u_num_less_15 is null,0,user_dis_u_num_less_15) as user_dis_u_num_less_15
	,if(i.user_dis_u_num_all is null,0,user_dis_u_num_all) as user_dis_u_num_all
	,if(i.user_dis_no_u_num is null,0,user_dis_no_u_num) as user_dis_no_u_num
	
	,if(j.b_dis_u_c_rate is null,0,b_dis_u_c_rate) as b_dis_u_c_rate
	,if(j.b_dis_u_num_less_15 is null,0,b_dis_u_num_less_15) as b_dis_u_num_less_15
	,if(j.b_dis_u_num_all is null,0,b_dis_u_num_all) as b_dis_u_num_all
	,if(j.b_dis_no_u_num is null,0,b_dis_no_u_num) as b_dis_no_u_num
	
	,if(k.c_d_u_c_rate is null ,0,c_d_u_c_rate) as c_d_u_c_rate
	,if(k.c_d_u_num_less_15 is null ,0,c_d_u_num_less_15) as c_d_u_num_less_15
	,if(k.c_d_u_num_all is null ,0,c_d_u_num_all) as c_d_u_num_all
	,if(k.c_d_no_u_num is null ,0,c_d_u_c_rate) as c_d_no_u_num
	
	,if(l.b_d_u_c_rate is null,0,b_d_u_c_rate) as b_d_u_c_rate
	,if(l.b_d_u_num_less_15 is null,0,b_d_u_num_less_15) as b_d_u_num_less_15
	,if(l.b_d_u_num_all is null,0,b_d_u_num_all) as b_d_u_num_all
	,if(l.b_d_no_u_num is null,0,b_d_no_u_num) as b_d_no_u_num
	,if(l.b_d_use_c_all is null,0,b_d_use_c_all) as b_d_use_c_all
	
	,if(m.b_c_dis_u_c_rate is null,0,b_c_dis_u_c_rate) as b_c_dis_u_c_rate
	,if(m.b_c_dis_u_num_less_15 is null,0,b_c_dis_u_num_less_15) as b_c_dis_u_num_less_15
	,if(m.b_c_did_u_num_all is null,0,b_c_did_u_num_all) as b_c_did_u_num_all
	,if(m.b_c_dis_no_u_num is null,0,b_c_dis_no_u_num) as b_c_dis_no_u_num
	
	,if(n.user_only_click_num is null,0,user_only_click_num) as user_only_click_num
	,if(n.user_buy_num is null,0,user_buy_num) as user_buy_num
	,if(n.user_only_get_num is null,0,user_only_get_num) as user_only_get_num
	,if(n.user_have_coupon_and_buy_num is null,0,user_have_coupon_and_buy_num) as user_have_coupon_and_buy_num
	,if(n.num_all is null,0,n.num_all) as on_num_all
	,if(n.ctr is null,0,ctr) as ctr
FROM featrue_label_6_flag_plus3 a
LEFT OUTER JOIN user_prior_month_12345 b
ON b.user_id = a.user_id
left outer join c_prior_month_12345 c on c.coupon_id =a.coupon_id
left outer join dis_prior_month_12345 ddd on ddd.discount_rate=a.discount_rate
left outer join d_prior_month_12345 e on e.distance =a.distance
left outer join user_b_prior_month_12345 f on f.user_id =a.user_id and f.merchant_id =a.merchant_id
left outer join user_d_prior_month_12345 g on g.user_id =a.user_id and g.distance = a.distance
left outer join user_c_prior_month_12345 h on h.user_id =a.user_id and h.coupon_id =a.coupon_id
left outer join user_dis_prior_month_12345 i on i.user_id =a.user_id and i.discount_rate =a.discount_rate
left outer join b_dis_prior_month_12345 j on j.merchant_id =a.merchant_id and j.discount_rate =a.discount_rate
left outer join c_d_prior_month_12345 k on k.coupon_id =a.coupon_id and k.distance =a.distance
left outer join b_d_prior_month_12345 l on l.merchant_id =a.merchant_id and l.distance =a.distance
left outer join b_c_dis_prior_month_12345 m on m.merchant_id =a.merchant_id and m.coupon_id =a.coupon_id and m.discount_rate =a.discount_rate
left outer join user_online_5 n on n.user_id =a.user_id

------month 7

create table featrue_7_flag_plus4 as
SELECT a.*
	, IF(b.user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	,if(b.user_u_num_less_15 is null,0,user_u_num_less_15) as user_u_num_less_15
	,if(b.user_u_num_all is null,0,user_u_num_all) as user_u_num_all
	,if(b.user_no_u_num is null,0,user_no_u_num) as user_no_u_num
	,if(b.user_get_c_num is null,0,user_get_c_num) as user_get_c_num
	,if(b.user_use_c_all is null,0,user_use_c_all) as user_use_c_all
	
	,if(c.c_u_c_rate is null,0,c_u_c_rate) as c_u_c_rate
	,if(c.c_u_num_less_15 is null,0,c_u_num_less_15) as c_u_num_less_15
	,if(c.c_u_num_all is null,0,c_u_num_all) as c_u_num_all
	,if(c.c_no_u_num is null,0,c_no_u_num) as c_no_u_num
	,if(c.c_get_c_num is null,0,c_get_c_num) as c_get_c_num
	,if(c.c_use_c_all is null,0,c_use_c_all) as c_use_c_all
	
	,if(ddd.dis_u_c_rate is null,0,dis_u_c_rate) as dis_u_c_rate
	,if(ddd.dis_u_num_less_15 is null,0,dis_u_num_less_15) as dis_u_num_less_15
	,if(ddd.dis_u_num_all is null,0,dis_u_num_all) as dis_u_num_all
	,if(ddd.dis_no_u_num is null,0,dis_no_u_num) as dis_no_u_num
	,if(ddd.dis_use_c_all is null,0,dis_use_c_all) as dis_use_c_all
	
	,if(e.d_u_c_rate is null,0,d_u_c_rate) as d_u_c_rate
	,if(e.d_u_num_less_15 is null,0,d_u_num_less_15) as d_u_num_less_15
	,if(e.d_u_num_all is null,0,d_u_num_all) as d_u_num_all
	,if(e.d_no_u_num is null,0,d_no_u_num) as d_no_u_num
	,if(e.d_use_c_all is null,0,d_use_c_all) as d_use_c_all
	
	,if(f.user_b_u_c_rate is null ,0,user_b_u_c_rate) as user_b_u_c_rate
	,if(f.user_b_u_num_less_15 is null ,0,user_b_u_num_less_15) as user_b_u_num_less_15
	,if(f.user_b_u_num_all is null ,0,user_b_u_num_all) as user_b_u_num_all
	,if(f.user_b_no_u_num is null ,0,user_b_no_u_num) as user_b_no_u_num
	,if(f.user_b_use_c_all is null ,0,user_b_use_c_all) as user_b_use_c_all
	
	,if(g.user_d_u_c_rate is null,0,user_d_u_c_rate) as user_d_u_c_rate
	,if(g.user_d_u_num_less_15 is null,0,user_d_u_num_less_15) as user_d_u_num_less_15
	,if(g.user_d_u_num_all is null,0,user_d_u_num_all) as user_d_u_num_all
	,if(g.user_d_no_u_num is null,0,user_d_no_u_num) as user_d_no_u_num
	,if(g.user_d_use_c_all is null,0,user_d_use_c_all) as user_d_use_c_all
	
	,if(h.user_c_u_c_rate is null,0,user_c_u_c_rate) as user_c_u_c_rate
	,if(h.user_c_u_num_less_15 is null,0,user_c_u_num_less_15) as user_c_u_num_less_15
	,if(h.user_c_u_num_all is null,0,user_c_u_num_all) as user_c_u_num_all
	,if(h.user_c_no_u_num is null,0,user_c_no_u_num) as user_c_no_u_num
	
	,if(i.user_dis_u_c_rate is null,0,user_dis_u_c_rate) as user_dis_u_c_rate
	,if(i.user_dis_u_num_less_15 is null,0,user_dis_u_num_less_15) as user_dis_u_num_less_15
	,if(i.user_dis_u_num_all is null,0,user_dis_u_num_all) as user_dis_u_num_all
	,if(i.user_dis_no_u_num is null,0,user_dis_no_u_num) as user_dis_no_u_num
	
	,if(j.b_dis_u_c_rate is null,0,b_dis_u_c_rate) as b_dis_u_c_rate
	,if(j.b_dis_u_num_less_15 is null,0,b_dis_u_num_less_15) as b_dis_u_num_less_15
	,if(j.b_dis_u_num_all is null,0,b_dis_u_num_all) as b_dis_u_num_all
	,if(j.b_dis_no_u_num is null,0,b_dis_no_u_num) as b_dis_no_u_num
	
	,if(k.c_d_u_c_rate is null ,0,c_d_u_c_rate) as c_d_u_c_rate
	,if(k.c_d_u_num_less_15 is null ,0,c_d_u_num_less_15) as c_d_u_num_less_15
	,if(k.c_d_u_num_all is null ,0,c_d_u_num_all) as c_d_u_num_all
	,if(k.c_d_no_u_num is null ,0,c_d_u_c_rate) as c_d_no_u_num
	
	,if(l.b_d_u_c_rate is null,0,b_d_u_c_rate) as b_d_u_c_rate
	,if(l.b_d_u_num_less_15 is null,0,b_d_u_num_less_15) as b_d_u_num_less_15
	,if(l.b_d_u_num_all is null,0,b_d_u_num_all) as b_d_u_num_all
	,if(l.b_d_no_u_num is null,0,b_d_no_u_num) as b_d_no_u_num
	,if(l.b_d_use_c_all is null,0,b_d_use_c_all) as b_d_use_c_all
	
	,if(m.b_c_dis_u_c_rate is null,0,b_c_dis_u_c_rate) as b_c_dis_u_c_rate
	,if(m.b_c_dis_u_num_less_15 is null,0,b_c_dis_u_num_less_15) as b_c_dis_u_num_less_15
	,if(m.b_c_did_u_num_all is null,0,b_c_did_u_num_all) as b_c_did_u_num_all
	,if(m.b_c_dis_no_u_num is null,0,b_c_dis_no_u_num) as b_c_dis_no_u_num
	
	,if(n.user_only_click_num is null,0,user_only_click_num) as user_only_click_num
	,if(n.user_buy_num is null,0,user_buy_num) as user_buy_num
	,if(n.user_only_get_num is null,0,user_only_get_num) as user_only_get_num
	,if(n.user_have_coupon_and_buy_num is null,0,user_have_coupon_and_buy_num) as user_have_coupon_and_buy_num
	,if(n.num_all is null,0,n.num_all) as on_num_all
	,if(n.ctr is null,0,ctr) as ctr
FROM featrue_7_flag_plus3 a
LEFT OUTER JOIN user_prior_month_123456 b
ON b.user_id = a.user_id
left outer join c_prior_month_123456 c on c.coupon_id =a.coupon_id
left outer join dis_prior_month_123456 ddd on ddd.discount_rate=a.discount_rate
left outer join d_prior_month_123456 e on e.distance =a.distance
left outer join user_b_prior_month_123456 f on f.user_id =a.user_id and f.merchant_id =a.merchant_id
left outer join user_d_prior_month_123456 g on g.user_id =a.user_id and g.distance = a.distance
left outer join user_c_prior_month_123456 h on h.user_id =a.user_id and h.coupon_id =a.coupon_id
left outer join user_dis_prior_month_123456 i on i.user_id =a.user_id and i.discount_rate =a.discount_rate
left outer join b_dis_prior_month_123456 j on j.merchant_id =a.merchant_id and j.discount_rate =a.discount_rate
left outer join c_d_prior_month_123456 k on k.coupon_id =a.coupon_id and k.distance =a.distance
left outer join b_d_prior_month_123456 l on l.merchant_id =a.merchant_id and l.distance =a.distance
left outer join b_c_dis_prior_month_123456 m on m.merchant_id =a.merchant_id and m.coupon_id =a.coupon_id and m.discount_rate =a.discount_rate
left outer join user_online_6 n on n.user_id =a.user_id

----train data
drop table featrue_label_flag_plus4;
CREATE TABLE featrue_label_flag_plus4
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_flag_plus4
			UNION ALL
			SELECT *
			FROM featrue_label_3_flag_plus4
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_flag_plus4
			UNION ALL
			SELECT *
			FROM featrue_label_5_flag_plus4
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_flag_plus4
) t4;


----------month 2
create table featrue_label_2_flag_plus5 as
SELECT *
	,decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',200,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,50) AS dis_zhekou
	,  decode(a.discount_rate,'0.95',0.95,'0.9',0.9,'0.85',0.85,'0.8',0.8,'0.75',0.75,'0.7',0.7,'0.6',0.6,'0.5',0.5,'0.2',0.2,'50:30',30/50.0,'200:100',100/200.0,'300:10',10/300.0,'300:20',20/300.0,'200:5',5.0/200,'150:5',5.0/150,'30:20',20.0/30,'300:50',50.0/300,'150:50',50.0/150,'200:10',10.0/200,'100:1',1.0/100,'150:30',30.0/150,'150:10',10.0/150,'20:10',10.0/20,'200:50',50.0/200,'100:50',0.5,'150:20',20.0/150,'200:30',30.0/200,'100:5',5.0/100,'50:1',1.0/50,'30:10',10.0/30,'300:30',30.0/300,'50:20',20.0/50,'5:1',1.0/5,'100:30',30.0/100,'100:20',20.0/100,'50:10',10.0/50,'200:20',20.0/200,'30:1',1.0/30,'50:5',5.0/50,'10:5',5.0/10,'10:1',1.0/10,'100:10',10.0/100,'20:1',1.0/20,'20:5',5.0/20,'30:5',5.0/30,50.0/150) as dis_menkan
FROM featrue_label_2_flag_plus4 a
--------month 3
create table featrue_label_3_flag_plus5 as
SELECT *
	,decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',200,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,50) AS dis_zhekou
	,  decode(a.discount_rate,'0.95',0.95,'0.9',0.9,'0.85',0.85,'0.8',0.8,'0.75',0.75,'0.7',0.7,'0.6',0.6,'0.5',0.5,'0.2',0.2,'50:30',30/50.0,'200:100',100/200.0,'300:10',10/300.0,'300:20',20/300.0,'200:5',5.0/200,'150:5',5.0/150,'30:20',20.0/30,'300:50',50.0/300,'150:50',50.0/150,'200:10',10.0/200,'100:1',1.0/100,'150:30',30.0/150,'150:10',10.0/150,'20:10',10.0/20,'200:50',50.0/200,'100:50',0.5,'150:20',20.0/150,'200:30',30.0/200,'100:5',5.0/100,'50:1',1.0/50,'30:10',10.0/30,'300:30',30.0/300,'50:20',20.0/50,'5:1',1.0/5,'100:30',30.0/100,'100:20',20.0/100,'50:10',10.0/50,'200:20',20.0/200,'30:1',1.0/30,'50:5',5.0/50,'10:5',5.0/10,'10:1',1.0/10,'100:10',10.0/100,'20:1',1.0/20,'20:5',5.0/20,'30:5',5.0/30,50.0/150) as dis_menkan
FROM featrue_label_3_flag_plus4 a
-------month 4
create table featrue_label_4_flag_plus5 as
SELECT *
	,decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',200,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,50) AS dis_zhekou
	,  decode(a.discount_rate,'0.95',0.95,'0.9',0.9,'0.85',0.85,'0.8',0.8,'0.75',0.75,'0.7',0.7,'0.6',0.6,'0.5',0.5,'0.2',0.2,'50:30',30/50.0,'200:100',100/200.0,'300:10',10/300.0,'300:20',20/300.0,'200:5',5.0/200,'150:5',5.0/150,'30:20',20.0/30,'300:50',50.0/300,'150:50',50.0/150,'200:10',10.0/200,'100:1',1.0/100,'150:30',30.0/150,'150:10',10.0/150,'20:10',10.0/20,'200:50',50.0/200,'100:50',0.5,'150:20',20.0/150,'200:30',30.0/200,'100:5',5.0/100,'50:1',1.0/50,'30:10',10.0/30,'300:30',30.0/300,'50:20',20.0/50,'5:1',1.0/5,'100:30',30.0/100,'100:20',20.0/100,'50:10',10.0/50,'200:20',20.0/200,'30:1',1.0/30,'50:5',5.0/50,'10:5',5.0/10,'10:1',1.0/10,'100:10',10.0/100,'20:1',1.0/20,'20:5',5.0/20,'30:5',5.0/30,50.0/150) as dis_menkan
FROM featrue_label_4_flag_plus4 a
---------month 5
create table featrue_label_5_flag_plus5 as
SELECT *
	,decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',200,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,50) AS dis_zhekou
	,  decode(a.discount_rate,'0.95',0.95,'0.9',0.9,'0.85',0.85,'0.8',0.8,'0.75',0.75,'0.7',0.7,'0.6',0.6,'0.5',0.5,'0.2',0.2,'50:30',30/50.0,'200:100',100/200.0,'300:10',10/300.0,'300:20',20/300.0,'200:5',5.0/200,'150:5',5.0/150,'30:20',20.0/30,'300:50',50.0/300,'150:50',50.0/150,'200:10',10.0/200,'100:1',1.0/100,'150:30',30.0/150,'150:10',10.0/150,'20:10',10.0/20,'200:50',50.0/200,'100:50',0.5,'150:20',20.0/150,'200:30',30.0/200,'100:5',5.0/100,'50:1',1.0/50,'30:10',10.0/30,'300:30',30.0/300,'50:20',20.0/50,'5:1',1.0/5,'100:30',30.0/100,'100:20',20.0/100,'50:10',10.0/50,'200:20',20.0/200,'30:1',1.0/30,'50:5',5.0/50,'10:5',5.0/10,'10:1',1.0/10,'100:10',10.0/100,'20:1',1.0/20,'20:5',5.0/20,'30:5',5.0/30,50.0/150) as dis_menkan
FROM featrue_label_5_flag_plus4 a
---------month 6
create table featrue_label_6_flag_plus5 as
SELECT *
	,decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',200,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,50) AS dis_zhekou
	,  decode(a.discount_rate,'0.95',0.95,'0.9',0.9,'0.85',0.85,'0.8',0.8,'0.75',0.75,'0.7',0.7,'0.6',0.6,'0.5',0.5,'0.2',0.2,'50:30',30/50.0,'200:100',100/200.0,'300:10',10/300.0,'300:20',20/300.0,'200:5',5.0/200,'150:5',5.0/150,'30:20',20.0/30,'300:50',50.0/300,'150:50',50.0/150,'200:10',10.0/200,'100:1',1.0/100,'150:30',30.0/150,'150:10',10.0/150,'20:10',10.0/20,'200:50',50.0/200,'100:50',0.5,'150:20',20.0/150,'200:30',30.0/200,'100:5',5.0/100,'50:1',1.0/50,'30:10',10.0/30,'300:30',30.0/300,'50:20',20.0/50,'5:1',1.0/5,'100:30',30.0/100,'100:20',20.0/100,'50:10',10.0/50,'200:20',20.0/200,'30:1',1.0/30,'50:5',5.0/50,'10:5',5.0/10,'10:1',1.0/10,'100:10',10.0/100,'20:1',1.0/20,'20:5',5.0/20,'30:5',5.0/30,50.0/150) as dis_menkan
FROM featrue_label_6_flag_plus4 a
-------month 7
create table featrue_7_flag_plus5 as
SELECT *
	,decode(a.discount_rate,'0.95',0,'0.9',0,'0.85',0,'0.8',0,'0.75',0,'0.7',0,'0.6',0,'0.5',0,'0.2',0,'50:30',50,'200:100',200,'300:10',300,'300:20',300,'200:5',200,'150:5',150,'30:20',30,'300:50',300,'150:50',150,'200:10',200,'100:1',100,'150:30',150,'150:10',150,'20:10',20,'200:50',200,'100:50',100,'150:20',150,'200:30',200,'100:5',100,'50:1',50,'30:10',30,'300:30',300,'50:20',50,'5:1',5,'100:30',100,'100:20',100,'50:10',50,'200:20',200,'30:1',30,'50:5',50,'10:5',10,'10:1',10,'100:10',100,'20:1',20,'20:5',20,'30:5',30,50) AS dis_zhekou
	,  decode(a.discount_rate,'0.95',0.95,'0.9',0.9,'0.85',0.85,'0.8',0.8,'0.75',0.75,'0.7',0.7,'0.6',0.6,'0.5',0.5,'0.2',0.2,'50:30',30/50.0,'200:100',100/200.0,'300:10',10/300.0,'300:20',20/300.0,'200:5',5.0/200,'150:5',5.0/150,'30:20',20.0/30,'300:50',50.0/300,'150:50',50.0/150,'200:10',10.0/200,'100:1',1.0/100,'150:30',30.0/150,'150:10',10.0/150,'20:10',10.0/20,'200:50',50.0/200,'100:50',0.5,'150:20',20.0/150,'200:30',30.0/200,'100:5',5.0/100,'50:1',1.0/50,'30:10',10.0/30,'300:30',30.0/300,'50:20',20.0/50,'5:1',1.0/5,'100:30',30.0/100,'100:20',20.0/100,'50:10',10.0/50,'200:20',20.0/200,'30:1',1.0/30,'50:5',5.0/50,'10:5',5.0/10,'10:1',1.0/10,'100:10',10.0/100,'20:1',1.0/20,'20:5',5.0/20,'30:5',5.0/30,50.0/150) as dis_menkan
FROM featrue_7_flag_plus4 a

-----train data
----train data
drop table featrue_label_flag_plus5;
CREATE TABLE featrue_label_flag_plus5
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_flag_plus5
			UNION ALL
			SELECT *
			FROM featrue_label_3_flag_plus5
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_flag_plus5
			UNION ALL
			SELECT *
			FROM featrue_label_5_flag_plus5
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_flag_plus5
) t4;








