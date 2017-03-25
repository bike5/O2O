
----------------------month 1
--user

CREATE TABLE user_prior_month_1
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.user_u_c_rate
		, t1.user_u_num_less_15
		, t1.user_u_num_all
		, t1.user_no_u_num
		, t1.user_get_c_num
		, t2.user_use_c_all
	FROM (
		SELECT user_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS user_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS user_get_c_num
		FROM data_label_1
		GROUP BY user_id
	) t1
	JOIN (
		SELECT user_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_use_c_all
		FROM data1
		GROUP BY user_id
	) t2
	ON t1.user_id = t2.user_id
) t;

--merchant
drop table b_prior_month_1;
CREATE TABLE b_prior_month_1
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.b_u_c_rate
		, t1.b_u_num_less_15
		, t1.b_u_num_all
		, t1.b_no_u_num
		, t1.b_get_c_num
		, t2.b_use_c_all
	FROM (
		SELECT merchant_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS b_get_c_num
		FROM data_label_1
		GROUP BY merchant_id
	) t1
	JOIN (
		SELECT merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_use_c_all
		FROM data1
		GROUP BY merchant_id
	) t2
	ON t1.merchant_id = t2.merchant_id
) t;

--coupon
drop table c_prior_month_1;
CREATE TABLE c_prior_month_1
AS
SELECT *
FROM (
	SELECT t1.coupon_id
		, t1.c_u_c_rate
		, t1.c_u_num_less_15
		, t1.c_u_num_all
		, t1.c_no_u_num
		,t1.c_get_c_num
		, t2.c_use_c_all
	FROM (
		SELECT coupon_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS c_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS c_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS c_get_c_num
		FROM data_label_1
		GROUP BY coupon_id
	) t1
	JOIN (
		SELECT coupon_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_use_c_all
		FROM data1
		GROUP BY coupon_id
	) t2
	ON t1.coupon_id = t2.coupon_id
) t;

--discount
CREATE TABLE dis_prior_month_1
AS
SELECT *
FROM (
	SELECT t1.discount_rate
		, t1.dis_u_c_rate
		, t1.dis_u_num_less_15
		, t1.dis_u_num_all
		, t1.dis_no_u_num
		, t2.dis_use_c_all
	FROM (
		SELECT discount_rate
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS dis_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS dis_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS dis_no_u_num
		FROM data_label_1
		GROUP BY discount_rate
	) t1
	JOIN (
		SELECT discount_rate
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_use_c_all
		FROM data1
		GROUP BY discount_rate
	) t2
	ON t1.discount_rate = t2.discount_rate
) t;

--distance
CREATE TABLE d_prior_month_1
AS
SELECT *
FROM (
	SELECT t1.distance
		, t1.d_u_c_rate
		, t1.d_u_num_less_15
		, t1.d_u_num_all
		, t1.d_no_u_num
		, t2.d_use_c_all
	FROM (
		SELECT distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS d_no_u_num
		FROM data_label_1
		GROUP BY distance
	) t1
	JOIN (
		SELECT distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_use_c_all
		FROM data1
		GROUP BY distance
	) t2
	ON t1.distance = t2.distance
) t;

--user_b
CREATE TABLE user_b_prior_month_1
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.merchant_id
		, t1.user_b_u_c_rate
		, t1.user_b_u_num_less_15
		, t1.user_b_u_num_all
		, t1.user_b_no_u_num
		, t2.user_b_use_c_all
	FROM (
		SELECT user_id
			, merchant_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_b_no_u_num
		FROM data_label_1
		GROUP BY user_id, 
			merchant_id
	) t1
	JOIN (
		SELECT user_id
			, merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_use_c_all
		FROM data1
		GROUP BY user_id, 
			merchant_id
	) t2
	ON t1.user_id = t2.user_id
		AND t1.merchant_id = t2.merchant_id
) t;

--user_d
CREATE TABLE user_d_prior_month_1 
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.distance
		, t1.user_d_u_c_rate
		, t1.user_d_u_num_less_15
		, t1.user_d_u_num_all
		, t1.user_d_no_u_num
		, t2.user_d_use_c_all
	FROM (
		SELECT user_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_d_no_u_num
		FROM data_label_1
		GROUP BY user_id, 
			distance
	) t1
	JOIN (
		SELECT user_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_use_c_all
		FROM data1
		GROUP BY user_id, 
			distance
	) t2
	ON t1.user_id = t2.user_id
		AND t1.distance = t2.distance
) t;

--user_c
CREATE TABLE user_c_prior_month_1 
AS
SELECT *
FROM (
	SELECT user_id
		, coupon_id
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_c_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_c_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_c_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_c_no_u_num
	FROM data_label_1
	GROUP BY user_id, 
		coupon_id
) t;

--user_dis
CREATE TABLE user_dis_prior_month_1
AS
SELECT *
FROM (
	SELECT user_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_dis_no_u_num
	FROM data_label_1
	GROUP BY user_id, 
		discount_rate
) t;

--b_dis
CREATE TABLE b_dis_prior_month_1 
AS
SELECT *
FROM (
	SELECT merchant_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_dis_no_u_num
	FROM data_label_1
	GROUP BY merchant_id, 
		discount_rate
) t;

--c_d
CREATE TABLE c_d_prior_month_1 
AS
SELECT *
FROM (
	SELECT coupon_id
		, distance
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_d_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS c_d_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS c_d_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS c_d_no_u_num
	FROM data_label_1
	GROUP BY coupon_id, 
		distance
) t;

--b_d
CREATE TABLE b_d_prior_month_1 
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.distance
		, t1.b_d_u_c_rate
		, t1.b_d_u_num_less_15
		, t1.b_d_u_num_all
		, t1.b_d_no_u_num
		, t2.b_d_use_c_all
	FROM (
		SELECT merchant_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_d_no_u_num
		FROM data_label_1
		GROUP BY merchant_id, 
			distance
	) t1
	JOIN (
		SELECT merchant_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_use_c_all
		FROM data1
		GROUP BY merchant_id, 
			distance
	) t2
	ON t1.merchant_id = t2.merchant_id
		AND t1.distance = t2.distance
) t;

--b_c_dis
CREATE TABLE b_c_dis_prior_month_1
AS
SELECT *
FROM (
	SELECT merchant_id
		, coupon_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_c_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_c_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_c_did_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_c_dis_no_u_num
	FROM data_label_1
	GROUP BY coupon_id, 
		merchant_id, 
		discount_rate
) t;


----------------month 12
--user
drop table user_prior_month_12;
CREATE TABLE user_prior_month_12
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.user_u_c_rate
		, t1.user_u_num_less_15
		, t1.user_u_num_all
		, t1.user_no_u_num
		,t1.user_get_c_num
		, t2.user_use_c_all
	FROM (
		SELECT user_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS user_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS user_get_c_num
		FROM data_label_12
		GROUP BY user_id
	) t1
	JOIN (
		SELECT user_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_use_c_all
		FROM data12
		GROUP BY user_id
	) t2
	ON t1.user_id = t2.user_id
) t;

--merchant
drop table b_prior_month_12;
CREATE TABLE b_prior_month_12
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.b_u_c_rate
		, t1.b_u_num_less_15
		, t1.b_u_num_all
		, t1.b_no_u_num
		,t1.b_get_c_num
		, t2.b_use_c_all
	FROM (
		SELECT merchant_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS b_get_c_num
		FROM data_label_12
		GROUP BY merchant_id
	) t1
	JOIN (
		SELECT merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_use_c_all
		FROM data12
		GROUP BY merchant_id
	) t2
	ON t1.merchant_id = t2.merchant_id
) t;

--coupon
drop table c_prior_month_12;
CREATE TABLE c_prior_month_12
AS
SELECT *
FROM (
	SELECT t1.coupon_id
		, t1.c_u_c_rate
		, t1.c_u_num_less_15
		, t1.c_u_num_all
		, t1.c_no_u_num
		,t1.c_get_c_num
		, t2.c_use_c_all
	FROM (
		SELECT coupon_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS c_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS c_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS c_get_c_num
		FROM data_label_12
		GROUP BY coupon_id
	) t1
	JOIN (
		SELECT coupon_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_use_c_all
		FROM data12
		GROUP BY coupon_id
	) t2
	ON t1.coupon_id = t2.coupon_id
) t;

--discount
CREATE TABLE dis_prior_month_12
AS
SELECT *
FROM (
	SELECT t1.discount_rate
		, t1.dis_u_c_rate
		, t1.dis_u_num_less_15
		, t1.dis_u_num_all
		, t1.dis_no_u_num
		, t2.dis_use_c_all
	FROM (
		SELECT discount_rate
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS dis_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS dis_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS dis_no_u_num
		FROM data_label_12
		GROUP BY discount_rate
	) t1
	JOIN (
		SELECT discount_rate
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_use_c_all
		FROM data12
		GROUP BY discount_rate
	) t2
	ON t1.discount_rate = t2.discount_rate
) t;

--distance
CREATE TABLE d_prior_month_12
AS
SELECT *
FROM (
	SELECT t1.distance
		, t1.d_u_c_rate
		, t1.d_u_num_less_15
		, t1.d_u_num_all
		, t1.d_no_u_num
		, t2.d_use_c_all
	FROM (
		SELECT distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS d_no_u_num
		FROM data_label_12
		GROUP BY distance
	) t1
	JOIN (
		SELECT distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_use_c_all
		FROM data12
		GROUP BY distance
	) t2
	ON t1.distance = t2.distance
) t;

--user_b
CREATE TABLE user_b_prior_month_12
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.merchant_id
		, t1.user_b_u_c_rate
		, t1.user_b_u_num_less_15
		, t1.user_b_u_num_all
		, t1.user_b_no_u_num
		, t2.user_b_use_c_all
	FROM (
		SELECT user_id
			, merchant_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_b_no_u_num
		FROM data_label_12
		GROUP BY user_id, 
			merchant_id
	) t1
	JOIN (
		SELECT user_id
			, merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_use_c_all
		FROM data12
		GROUP BY user_id, 
			merchant_id
	) t2
	ON t1.user_id = t2.user_id
		AND t1.merchant_id = t2.merchant_id
) t;

--user_d
CREATE TABLE user_d_prior_month_12
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.distance
		, t1.user_d_u_c_rate
		, t1.user_d_u_num_less_15
		, t1.user_d_u_num_all
		, t1.user_d_no_u_num
		, t2.user_d_use_c_all
	FROM (
		SELECT user_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_d_no_u_num
		FROM data_label_12
		GROUP BY user_id, 
			distance
	) t1
	JOIN (
		SELECT user_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_use_c_all
		FROM data12
		GROUP BY user_id, 
			distance
	) t2
	ON t1.user_id = t2.user_id
		AND t1.distance = t2.distance
) t;

--user_c
CREATE TABLE user_c_prior_month_12
AS
SELECT *
FROM (
	SELECT user_id
		, coupon_id
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_c_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_c_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_c_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_c_no_u_num
	FROM data_label_12
	GROUP BY user_id, 
		coupon_id
) t;

--user_dis
CREATE TABLE user_dis_prior_month_12
AS
SELECT *
FROM (
	SELECT user_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_dis_no_u_num
	FROM data_label_12
	GROUP BY user_id, 
		discount_rate
) t;

--b_dis
CREATE TABLE b_dis_prior_month_12
AS
SELECT *
FROM (
	SELECT merchant_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_dis_no_u_num
	FROM data_label_12
	GROUP BY merchant_id, 
		discount_rate
) t;

--c_d
CREATE TABLE c_d_prior_month_12
AS
SELECT *
FROM (
	SELECT coupon_id
		, distance
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_d_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS c_d_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS c_d_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS c_d_no_u_num
	FROM data_label_12
	GROUP BY coupon_id, 
		distance
) t;

--b_d
CREATE TABLE b_d_prior_month_12
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.distance
		, t1.b_d_u_c_rate
		, t1.b_d_u_num_less_15
		, t1.b_d_u_num_all
		, t1.b_d_no_u_num
		, t2.b_d_use_c_all
	FROM (
		SELECT merchant_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_d_no_u_num
		FROM data_label_12
		GROUP BY merchant_id, 
			distance
	) t1
	JOIN (
		SELECT merchant_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_use_c_all
		FROM data12
		GROUP BY merchant_id, 
			distance
	) t2
	ON t1.merchant_id = t2.merchant_id
		AND t1.distance = t2.distance
) t;

--b_c_dis
CREATE TABLE b_c_dis_prior_month_12
AS
SELECT *
FROM (
	SELECT merchant_id
		, coupon_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_c_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_c_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_c_did_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_c_dis_no_u_num
	FROM data_label_12
	GROUP BY coupon_id, 
		merchant_id, 
		discount_rate
) t;


----------------month 123
--user
drop table user_prior_month_123;
CREATE TABLE user_prior_month_123
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.user_u_c_rate
		, t1.user_u_num_less_15
		, t1.user_u_num_all
		, t1.user_no_u_num
		,t1.user_get_c_num
		, t2.user_use_c_all
	FROM (
		SELECT user_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS user_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS user_get_c_num
		FROM data_label_123
		GROUP BY user_id
	) t1
	JOIN (
		SELECT user_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_use_c_all
		FROM data123
		GROUP BY user_id
	) t2
	ON t1.user_id = t2.user_id
) t;

--merchant
drop table b_prior_month_123;
CREATE TABLE b_prior_month_123
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.b_u_c_rate
		, t1.b_u_num_less_15
		, t1.b_u_num_all
		, t1.b_no_u_num
		,t1.b_get_c_num
		, t2.b_use_c_all
	FROM (
		SELECT merchant_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS b_get_c_num
		FROM data_label_123
		GROUP BY merchant_id
	) t1
	JOIN (
		SELECT merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_use_c_all
		FROM data123
		GROUP BY merchant_id
	) t2
	ON t1.merchant_id = t2.merchant_id
) t;

--coupon
drop table c_prior_month_123;
CREATE TABLE c_prior_month_123
AS
SELECT *
FROM (
	SELECT t1.coupon_id
		, t1.c_u_c_rate
		, t1.c_u_num_less_15
		, t1.c_u_num_all
		, t1.c_no_u_num
		,t1.c_get_c_num
		, t2.c_use_c_all
	FROM (
		SELECT coupon_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS c_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS c_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS c_get_c_num
		FROM data_label_123
		GROUP BY coupon_id
	) t1
	JOIN (
		SELECT coupon_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_use_c_all
		FROM data123
		GROUP BY coupon_id
	) t2
	ON t1.coupon_id = t2.coupon_id
) t;

--discount
CREATE TABLE dis_prior_month_123
AS
SELECT *
FROM (
	SELECT t1.discount_rate
		, t1.dis_u_c_rate
		, t1.dis_u_num_less_15
		, t1.dis_u_num_all
		, t1.dis_no_u_num
		, t2.dis_use_c_all
	FROM (
		SELECT discount_rate
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS dis_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS dis_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS dis_no_u_num
		FROM data_label_123
		GROUP BY discount_rate
	) t1
	JOIN (
		SELECT discount_rate
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_use_c_all
		FROM data123
		GROUP BY discount_rate
	) t2
	ON t1.discount_rate = t2.discount_rate
) t;

--distance
CREATE TABLE d_prior_month_123
AS
SELECT *
FROM (
	SELECT t1.distance
		, t1.d_u_c_rate
		, t1.d_u_num_less_15
		, t1.d_u_num_all
		, t1.d_no_u_num
		, t2.d_use_c_all
	FROM (
		SELECT distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS d_no_u_num
		FROM data_label_123
		GROUP BY distance
	) t1
	JOIN (
		SELECT distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_use_c_all
		FROM data123
		GROUP BY distance
	) t2
	ON t1.distance = t2.distance
) t;

--user_b
CREATE TABLE user_b_prior_month_123
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.merchant_id
		, t1.user_b_u_c_rate
		, t1.user_b_u_num_less_15
		, t1.user_b_u_num_all
		, t1.user_b_no_u_num
		, t2.user_b_use_c_all
	FROM (
		SELECT user_id
			, merchant_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_b_no_u_num
		FROM data_label_123
		GROUP BY user_id, 
			merchant_id
	) t1
	JOIN (
		SELECT user_id
			, merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_use_c_all
		FROM data123
		GROUP BY user_id, 
			merchant_id
	) t2
	ON t1.user_id = t2.user_id
		AND t1.merchant_id = t2.merchant_id
) t;

--user_d
CREATE TABLE user_d_prior_month_123
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.distance
		, t1.user_d_u_c_rate
		, t1.user_d_u_num_less_15
		, t1.user_d_u_num_all
		, t1.user_d_no_u_num
		, t2.user_d_use_c_all
	FROM (
		SELECT user_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_d_no_u_num
		FROM data_label_123
		GROUP BY user_id, 
			distance
	) t1
	JOIN (
		SELECT user_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_use_c_all
		FROM data123
		GROUP BY user_id, 
			distance
	) t2
	ON t1.user_id = t2.user_id
		AND t1.distance = t2.distance
) t;

--user_c
CREATE TABLE user_c_prior_month_123
AS
SELECT *
FROM (
	SELECT user_id
		, coupon_id
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_c_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_c_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_c_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_c_no_u_num
	FROM data_label_123
	GROUP BY user_id, 
		coupon_id
) t;

--user_dis
CREATE TABLE user_dis_prior_month_123
AS
SELECT *
FROM (
	SELECT user_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_dis_no_u_num
	FROM data_label_123
	GROUP BY user_id, 
		discount_rate
) t;

--b_dis
CREATE TABLE b_dis_prior_month_123
AS
SELECT *
FROM (
	SELECT merchant_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_dis_no_u_num
	FROM data_label_123
	GROUP BY merchant_id, 
		discount_rate
) t;

--c_d
CREATE TABLE c_d_prior_month_123
AS
SELECT *
FROM (
	SELECT coupon_id
		, distance
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_d_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS c_d_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS c_d_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS c_d_no_u_num
	FROM data_label_123
	GROUP BY coupon_id, 
		distance
) t;

--b_d
CREATE TABLE b_d_prior_month_123
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.distance
		, t1.b_d_u_c_rate
		, t1.b_d_u_num_less_15
		, t1.b_d_u_num_all
		, t1.b_d_no_u_num
		, t2.b_d_use_c_all
	FROM (
		SELECT merchant_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_d_no_u_num
		FROM data_label_123
		GROUP BY merchant_id, 
			distance
	) t1
	JOIN (
		SELECT merchant_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_use_c_all
		FROM data123
		GROUP BY merchant_id, 
			distance
	) t2
	ON t1.merchant_id = t2.merchant_id
		AND t1.distance = t2.distance
) t;

--b_c_dis
CREATE TABLE b_c_dis_prior_month_123
AS
SELECT *
FROM (
	SELECT merchant_id
		, coupon_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_c_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_c_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_c_did_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_c_dis_no_u_num
	FROM data_label_123
	GROUP BY coupon_id, 
		merchant_id, 
		discount_rate
) t;
---------month 1234	
--user
drop table user_prior_month_1234;
CREATE TABLE user_prior_month_1234
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.user_u_c_rate
		, t1.user_u_num_less_15
		, t1.user_u_num_all
		, t1.user_no_u_num
		,t1.user_get_c_num
		, t2.user_use_c_all
	FROM (
		SELECT user_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS user_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS user_get_c_num
		FROM data_label_1234
		GROUP BY user_id
	) t1
	JOIN (
		SELECT user_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_use_c_all
		FROM data1234
		GROUP BY user_id
	) t2
	ON t1.user_id = t2.user_id
) t;

--merchant
drop table b_prior_month_1234;
CREATE TABLE b_prior_month_1234
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.b_u_c_rate
		, t1.b_u_num_less_15
		, t1.b_u_num_all
		, t1.b_no_u_num
		,t1.b_get_c_num
		, t2.b_use_c_all
	FROM (
		SELECT merchant_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS b_get_c_num
		FROM data_label_1234
		GROUP BY merchant_id
	) t1
	JOIN (
		SELECT merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_use_c_all
		FROM data1234
		GROUP BY merchant_id
	) t2
	ON t1.merchant_id = t2.merchant_id
) t;

--coupon
drop table c_prior_month_1234;
CREATE TABLE c_prior_month_1234
AS
SELECT *
FROM (
	SELECT t1.coupon_id
		, t1.c_u_c_rate
		, t1.c_u_num_less_15
		, t1.c_u_num_all
		, t1.c_no_u_num
		,t1.c_get_c_num
		, t2.c_use_c_all
	FROM (
		SELECT coupon_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS c_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS c_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS c_get_c_num
		FROM data_label_1234
		GROUP BY coupon_id
	) t1
	JOIN (
		SELECT coupon_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_use_c_all
		FROM data1234
		GROUP BY coupon_id
	) t2
	ON t1.coupon_id = t2.coupon_id
) t;

--discount
CREATE TABLE dis_prior_month_1234
AS
SELECT *
FROM (
	SELECT t1.discount_rate
		, t1.dis_u_c_rate
		, t1.dis_u_num_less_15
		, t1.dis_u_num_all
		, t1.dis_no_u_num
		, t2.dis_use_c_all
	FROM (
		SELECT discount_rate
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS dis_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS dis_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS dis_no_u_num
		FROM data_label_1234
		GROUP BY discount_rate
	) t1
	JOIN (
		SELECT discount_rate
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_use_c_all
		FROM data1234
		GROUP BY discount_rate
	) t2
	ON t1.discount_rate = t2.discount_rate
) t;

--distance
CREATE TABLE d_prior_month_1234
AS
SELECT *
FROM (
	SELECT t1.distance
		, t1.d_u_c_rate
		, t1.d_u_num_less_15
		, t1.d_u_num_all
		, t1.d_no_u_num
		, t2.d_use_c_all
	FROM (
		SELECT distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS d_no_u_num
		FROM data_label_1234
		GROUP BY distance
	) t1
	JOIN (
		SELECT distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_use_c_all
		FROM data1234
		GROUP BY distance
	) t2
	ON t1.distance = t2.distance
) t;

--user_b
CREATE TABLE user_b_prior_month_1234
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.merchant_id
		, t1.user_b_u_c_rate
		, t1.user_b_u_num_less_15
		, t1.user_b_u_num_all
		, t1.user_b_no_u_num
		, t2.user_b_use_c_all
	FROM (
		SELECT user_id
			, merchant_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_b_no_u_num
		FROM data_label_1234
		GROUP BY user_id, 
			merchant_id
	) t1
	JOIN (
		SELECT user_id
			, merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_use_c_all
		FROM data1234
		GROUP BY user_id, 
			merchant_id
	) t2
	ON t1.user_id = t2.user_id
		AND t1.merchant_id = t2.merchant_id
) t;

--user_d
CREATE TABLE user_d_prior_month_1234
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.distance
		, t1.user_d_u_c_rate
		, t1.user_d_u_num_less_15
		, t1.user_d_u_num_all
		, t1.user_d_no_u_num
		, t2.user_d_use_c_all
	FROM (
		SELECT user_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_d_no_u_num
		FROM data_label_1234
		GROUP BY user_id, 
			distance
	) t1
	JOIN (
		SELECT user_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_use_c_all
		FROM data1234
		GROUP BY user_id, 
			distance
	) t2
	ON t1.user_id = t2.user_id
		AND t1.distance = t2.distance
) t;

--user_c
CREATE TABLE user_c_prior_month_1234
AS
SELECT *
FROM (
	SELECT user_id
		, coupon_id
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_c_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_c_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_c_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_c_no_u_num
	FROM data_label_1234
	GROUP BY user_id, 
		coupon_id
) t;

--user_dis
CREATE TABLE user_dis_prior_month_1234
AS
SELECT *
FROM (
	SELECT user_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_dis_no_u_num
	FROM data_label_1234
	GROUP BY user_id, 
		discount_rate
) t;

--b_dis
CREATE TABLE b_dis_prior_month_1234
AS
SELECT *
FROM (
	SELECT merchant_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_dis_no_u_num
	FROM data_label_1234
	GROUP BY merchant_id, 
		discount_rate
) t;

--c_d
CREATE TABLE c_d_prior_month_1234
AS
SELECT *
FROM (
	SELECT coupon_id
		, distance
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_d_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS c_d_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS c_d_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS c_d_no_u_num
	FROM data_label_1234
	GROUP BY coupon_id, 
		distance
) t;

--b_d
CREATE TABLE b_d_prior_month_1234
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.distance
		, t1.b_d_u_c_rate
		, t1.b_d_u_num_less_15
		, t1.b_d_u_num_all
		, t1.b_d_no_u_num
		, t2.b_d_use_c_all
	FROM (
		SELECT merchant_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_d_no_u_num
		FROM data_label_1234
		GROUP BY merchant_id, 
			distance
	) t1
	JOIN (
		SELECT merchant_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_use_c_all
		FROM data1234
		GROUP BY merchant_id, 
			distance
	) t2
	ON t1.merchant_id = t2.merchant_id
		AND t1.distance = t2.distance
) t;


--b_c_dis
CREATE TABLE b_c_dis_prior_month_1234
AS
SELECT *
FROM (
	SELECT merchant_id
		, coupon_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_c_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_c_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_c_did_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_c_dis_no_u_num
	FROM data_label_1234
	GROUP BY coupon_id, 
		merchant_id, 
		discount_rate
) t;

-----------------month 12345
--user
drop table user_prior_month_12345;
CREATE TABLE user_prior_month_12345
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.user_u_c_rate
		, t1.user_u_num_less_15
		, t1.user_u_num_all
		, t1.user_no_u_num
		,t1.user_get_c_num
		, t2.user_use_c_all
	FROM (
		SELECT user_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS user_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS user_get_c_num
		FROM data_label_12345
		GROUP BY user_id
	) t1
	JOIN (
		SELECT user_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_use_c_all
		FROM data12345
		GROUP BY user_id
	) t2
	ON t1.user_id = t2.user_id
) t;

--merchant
drop table b_prior_month_12345;
CREATE TABLE b_prior_month_12345
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.b_u_c_rate
		, t1.b_u_num_less_15
		, t1.b_u_num_all
		, t1.b_no_u_num
		,t1.b_get_c_num
		, t2.b_use_c_all
	FROM (
		SELECT merchant_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS b_get_c_num
		FROM data_label_12345
		GROUP BY merchant_id
	) t1
	JOIN (
		SELECT merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_use_c_all
		FROM data12345
		GROUP BY merchant_id
	) t2
	ON t1.merchant_id = t2.merchant_id
) t;

--coupon
drop table c_prior_month_12345;
CREATE TABLE c_prior_month_12345
AS
SELECT *
FROM (
	SELECT t1.coupon_id
		, t1.c_u_c_rate
		, t1.c_u_num_less_15
		, t1.c_u_num_all
		, t1.c_no_u_num
		,t1.c_get_c_num
		, t2.c_use_c_all
	FROM (
		SELECT coupon_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS c_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS c_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS c_get_c_num
		FROM data_label_12345
		GROUP BY coupon_id
	) t1
	JOIN (
		SELECT coupon_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_use_c_all
		FROM data12345
		GROUP BY coupon_id
	) t2
	ON t1.coupon_id = t2.coupon_id
) t;

--discount
CREATE TABLE dis_prior_month_12345
AS
SELECT *
FROM (
	SELECT t1.discount_rate
		, t1.dis_u_c_rate
		, t1.dis_u_num_less_15
		, t1.dis_u_num_all
		, t1.dis_no_u_num
		, t2.dis_use_c_all
	FROM (
		SELECT discount_rate
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS dis_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS dis_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS dis_no_u_num
		FROM data_label_12345
		GROUP BY discount_rate
	) t1
	JOIN (
		SELECT discount_rate
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_use_c_all
		FROM data12345
		GROUP BY discount_rate
	) t2
	ON t1.discount_rate = t2.discount_rate
) t;

--distance
CREATE TABLE d_prior_month_12345
AS
SELECT *
FROM (
	SELECT t1.distance
		, t1.d_u_c_rate
		, t1.d_u_num_less_15
		, t1.d_u_num_all
		, t1.d_no_u_num
		, t2.d_use_c_all
	FROM (
		SELECT distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS d_no_u_num
		FROM data_label_12345
		GROUP BY distance
	) t1
	JOIN (
		SELECT distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_use_c_all
		FROM data12345
		GROUP BY distance
	) t2
	ON t1.distance = t2.distance
) t;

--user_b
CREATE TABLE user_b_prior_month_12345
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.merchant_id
		, t1.user_b_u_c_rate
		, t1.user_b_u_num_less_15
		, t1.user_b_u_num_all
		, t1.user_b_no_u_num
		, t2.user_b_use_c_all
	FROM (
		SELECT user_id
			, merchant_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_b_no_u_num
		FROM data_label_12345
		GROUP BY user_id, 
			merchant_id
	) t1
	JOIN (
		SELECT user_id
			, merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_use_c_all
		FROM data12345
		GROUP BY user_id, 
			merchant_id
	) t2
	ON t1.user_id = t2.user_id
		AND t1.merchant_id = t2.merchant_id
) t;

--user_d
CREATE TABLE user_d_prior_month_12345
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.distance
		, t1.user_d_u_c_rate
		, t1.user_d_u_num_less_15
		, t1.user_d_u_num_all
		, t1.user_d_no_u_num
		, t2.user_d_use_c_all
	FROM (
		SELECT user_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_d_no_u_num
		FROM data_label_12345
		GROUP BY user_id, 
			distance
	) t1
	JOIN (
		SELECT user_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_use_c_all
		FROM data12345
		GROUP BY user_id, 
			distance
	) t2
	ON t1.user_id = t2.user_id
		AND t1.distance = t2.distance
) t;

--user_c
CREATE TABLE user_c_prior_month_12345
AS
SELECT *
FROM (
	SELECT user_id
		, coupon_id
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_c_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_c_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_c_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_c_no_u_num
	FROM data_label_12345
	GROUP BY user_id, 
		coupon_id
) t;

--user_dis
CREATE TABLE user_dis_prior_month_12345
AS
SELECT *
FROM (
	SELECT user_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_dis_no_u_num
	FROM data_label_12345
	GROUP BY user_id, 
		discount_rate
) t;

--b_dis
CREATE TABLE b_dis_prior_month_12345
AS
SELECT *
FROM (
	SELECT merchant_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_dis_no_u_num
	FROM data_label_12345
	GROUP BY merchant_id, 
		discount_rate
) t;

--c_d
CREATE TABLE c_d_prior_month_12345
AS
SELECT *
FROM (
	SELECT coupon_id
		, distance
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_d_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS c_d_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS c_d_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS c_d_no_u_num
	FROM data_label_12345
	GROUP BY coupon_id, 
		distance
) t;

--b_d
CREATE TABLE b_d_prior_month_12345
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.distance
		, t1.b_d_u_c_rate
		, t1.b_d_u_num_less_15
		, t1.b_d_u_num_all
		, t1.b_d_no_u_num
		, t2.b_d_use_c_all
	FROM (
		SELECT merchant_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_d_no_u_num
		FROM data_label_12345
		GROUP BY merchant_id, 
			distance
	) t1
	JOIN (
		SELECT merchant_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_use_c_all
		FROM data12345
		GROUP BY merchant_id, 
			distance
	) t2
	ON t1.merchant_id = t2.merchant_id
		AND t1.distance = t2.distance
) t;
--b_c_dis
CREATE TABLE b_c_dis_prior_month_12345
AS
SELECT *
FROM (
	SELECT merchant_id
		, coupon_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_c_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_c_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_c_did_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_c_dis_no_u_num
	FROM data_label_12345
	GROUP BY coupon_id, 
		merchant_id, 
		discount_rate
) t;


--------------------------------------month 123456
--user
drop table user_prior_month_123456;
CREATE TABLE user_prior_month_123456
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.user_u_c_rate
		, t1.user_u_num_less_15
		, t1.user_u_num_all
		, t1.user_no_u_num
		,t1.user_get_c_num
		, t2.user_use_c_all
	FROM (
		SELECT user_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS user_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS user_get_c_num
		FROM data_label_123456
		GROUP BY user_id
	) t1
	JOIN (
		SELECT user_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_use_c_all
		FROM data123456
		GROUP BY user_id
	) t2
	ON t1.user_id = t2.user_id
) t;

--merchant
drop table b_prior_month_123456;
CREATE TABLE b_prior_month_123456
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.b_u_c_rate
		, t1.b_u_num_less_15
		, t1.b_u_num_all
		, t1.b_no_u_num
		,t1.b_get_c_num
		, t2.b_use_c_all
	FROM (
		SELECT merchant_id
			, IF(COUNT(coupon_id) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(coupon_id) AS DOUBLE), 0) AS b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS b_get_c_num
		FROM data_label_123456
		GROUP BY merchant_id
	) t1
	JOIN (
		SELECT merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_use_c_all
		FROM data123456
		GROUP BY merchant_id
	) t2
	ON t1.merchant_id = t2.merchant_id
) t;

--coupon
drop table c_prior_month_123456;
CREATE TABLE c_prior_month_123456
AS
SELECT *
FROM (
	SELECT t1.coupon_id
		, t1.c_u_c_rate
		, t1.c_u_num_less_15
		, t1.c_u_num_all
		, t1.c_no_u_num
		,t1.c_get_c_num
		, t2.c_use_c_all
	FROM (
		SELECT coupon_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS c_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS c_no_u_num
			, SUM(IF(date_received <> 'null', 1, 0)) AS c_get_c_num
		FROM data_label_123456
		GROUP BY coupon_id
	) t1
	JOIN (
		SELECT coupon_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS c_use_c_all
		FROM data123456
		GROUP BY coupon_id
	) t2
	ON t1.coupon_id = t2.coupon_id
) t;

--discount
CREATE TABLE dis_prior_month_123456
AS
SELECT *
FROM (
	SELECT t1.discount_rate
		, t1.dis_u_c_rate
		, t1.dis_u_num_less_15
		, t1.dis_u_num_all
		, t1.dis_no_u_num
		, t2.dis_use_c_all
	FROM (
		SELECT discount_rate
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS dis_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS dis_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS dis_no_u_num
		FROM data_label_123456
		GROUP BY discount_rate
	) t1
	JOIN (
		SELECT discount_rate
			, SUM(IF(date_pay <> 'null', 1, 0)) AS dis_use_c_all
		FROM data123456
		GROUP BY discount_rate
	) t2
	ON t1.discount_rate = t2.discount_rate
) t;

--distance
CREATE TABLE d_prior_month_123456
AS
SELECT *
FROM (
	SELECT t1.distance
		, t1.d_u_c_rate
		, t1.d_u_num_less_15
		, t1.d_u_num_all
		, t1.d_no_u_num
		, t2.d_use_c_all
	FROM (
		SELECT distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS d_no_u_num
		FROM data_label_123456
		GROUP BY distance
	) t1
	JOIN (
		SELECT distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS d_use_c_all
		FROM data123456
		GROUP BY distance
	) t2
	ON t1.distance = t2.distance
) t;

--user_b
CREATE TABLE user_b_prior_month_123456
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.merchant_id
		, t1.user_b_u_c_rate
		, t1.user_b_u_num_less_15
		, t1.user_b_u_num_all
		, t1.user_b_no_u_num
		, t2.user_b_use_c_all
	FROM (
		SELECT user_id
			, merchant_id
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_b_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_b_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_b_no_u_num
		FROM data_label_123456
		GROUP BY user_id, 
			merchant_id
	) t1
	JOIN (
		SELECT user_id
			, merchant_id
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_b_use_c_all
		FROM data123456
		GROUP BY user_id, 
			merchant_id
	) t2
	ON t1.user_id = t2.user_id
		AND t1.merchant_id = t2.merchant_id
) t;

--user_d
CREATE TABLE user_d_prior_month_123456
AS
SELECT *
FROM (
	SELECT t1.user_id
		, t1.distance
		, t1.user_d_u_c_rate
		, t1.user_d_u_num_less_15
		, t1.user_d_u_num_all
		, t1.user_d_no_u_num
		, t2.user_d_use_c_all
	FROM (
		SELECT user_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS user_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS user_d_no_u_num
		FROM data_label_123456
		GROUP BY user_id, 
			distance
	) t1
	JOIN (
		SELECT user_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS user_d_use_c_all
		FROM data123456
		GROUP BY user_id, 
			distance
	) t2
	ON t1.user_id = t2.user_id
		AND t1.distance = t2.distance
) t;

--user_c
CREATE TABLE user_c_prior_month_123456
AS
SELECT *
FROM (
	SELECT user_id
		, coupon_id
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_c_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_c_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_c_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_c_no_u_num
	FROM data_label_123456
	GROUP BY user_id, 
		coupon_id
) t;

--user_dis
CREATE TABLE user_dis_prior_month_123456
AS
SELECT *
FROM (
	SELECT user_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS user_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS user_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS user_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS user_dis_no_u_num
	FROM data_label_123456
	GROUP BY user_id, 
		discount_rate
) t;

--b_dis
CREATE TABLE b_dis_prior_month_123456
AS
SELECT *
FROM (
	SELECT merchant_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_dis_no_u_num
	FROM data_label_123456
	GROUP BY merchant_id, 
		discount_rate
) t;

--c_d
CREATE TABLE c_d_prior_month_123456
AS
SELECT *
FROM (
	SELECT coupon_id
		, distance
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS c_d_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS c_d_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS c_d_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS c_d_no_u_num
	FROM data_label_123456
	GROUP BY coupon_id, 
		distance
) t;

--b_d
CREATE TABLE b_d_prior_month_123456
AS
SELECT *
FROM (
	SELECT t1.merchant_id
		, t1.distance
		, t1.b_d_u_c_rate
		, t1.b_d_u_num_less_15
		, t1.b_d_u_num_all
		, t1.b_d_no_u_num
		, t2.b_d_use_c_all
	FROM (
		SELECT merchant_id
			, distance
			, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_d_u_c_rate
			, SUM(IF(label = 1, 1, 0)) AS b_d_u_num_less_15
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_u_num_all
			, SUM(IF(date_pay = 'null', 1, 0)) AS b_d_no_u_num
		FROM data_label_123456
		GROUP BY merchant_id, 
			distance
	) t1
	JOIN (
		SELECT merchant_id
			, distance
			, SUM(IF(date_pay <> 'null', 1, 0)) AS b_d_use_c_all
		FROM data123456
		GROUP BY merchant_id, 
			distance
	) t2
	ON t1.merchant_id = t2.merchant_id
		AND t1.distance = t2.distance
) t;

--b_c_dis
CREATE TABLE b_c_dis_prior_month_123456
AS
SELECT *
FROM (
	SELECT merchant_id
		, coupon_id
		, discount_rate
		, IF(COUNT(date_received) <> 0, SUM(IF(label = 1, 1, 0)) / CAST(COUNT(date_received) AS DOUBLE), 0) AS b_c_dis_u_c_rate
		, SUM(IF(label = 1, 1, 0)) AS b_c_dis_u_num_less_15
		, SUM(IF(date_pay <> 'null', 1, 0)) AS b_c_dis_u_num_all
		, SUM(IF(date_pay = 'null', 1, 0)) AS b_c_dis_no_u_num
	FROM data_label_123456
	GROUP BY coupon_id, 
		merchant_id, 
		discount_rate
) t;

