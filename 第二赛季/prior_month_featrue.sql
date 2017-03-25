
----最后一次消费时间

--month 2
CREATE TABLE featrue_label_2_last_time
AS
SELECT *
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_last_time, 'yyyymmdd'), 'dd')) AS user_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(b_last_time, 'yyyymmdd'), 'dd')) AS b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(c_last_time, 'yyyymmdd'), 'dd')) AS c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(dis_last_time, 'yyyymmdd'), 'dd')) AS dis_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_b_last_time, 'yyyymmdd'), 'dd')) AS user_b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_c_last_time, 'yyyymmdd'), 'dd')) AS user_c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_dis_last_time, 'yyyymmdd'), 'dd')) AS user_dis_diff
FROM (
	SELECT a.*
		, IF(t.user_last_time IS NULL, '20160101', t.user_last_time) AS user_last_time
		, IF(t1.b_last_time IS NULL, '20160101', t1.b_last_time) AS b_last_time
		, IF(t2.c_last_time IS NULL, '20160101', t2.c_last_time) AS c_last_time
		, IF(t3.dis_last_time IS NULL, '20160101', t3.dis_last_time) AS dis_last_time
		, IF(t4.user_b_last_time IS NULL, '20160101', t4.user_b_last_time) AS user_b_last_time
		, IF(t5.user_c_last_time IS NULL, '20160101', t5.user_c_last_time) AS user_c_last_time
		, IF(t6.user_dis_last_time IS NULL, '20160101', t6.user_dis_last_time) AS user_dis_last_time
	FROM featrue_label_2_more a
	LEFT OUTER JOIN (
		SELECT user_id
			, MAX(date_pay) AS user_last_time
		FROM data1
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id
	) t
	ON a.user_id = t.user_id
	LEFT OUTER JOIN (
		SELECT merchant_id
			, MAX(date_pay) AS b_last_time
		FROM data1
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY merchant_id
	) t1
	ON a.merchant_id = t1.merchant_id
	LEFT OUTER JOIN (
		SELECT coupon_id
			, MAX(date_pay) AS c_last_time
		FROM data1
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY coupon_id
	) t2
	ON a.coupon_id = t2.coupon_id
	LEFT OUTER JOIN (
		SELECT discount_rate
			, MAX(date_pay) AS dis_last_time
		FROM data1
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY discount_rate
	) t3
	ON a.discount_rate = t3.discount_rate
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, MAX(date_pay) AS user_b_last_time
		FROM data1
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			merchant_id
	) t4
	ON a.user_id = t4.user_id
		AND a.merchant_id = t4.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, MAX(date_pay) AS user_c_last_time
		FROM data1
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			coupon_id
	) t5
	ON a.user_id = t5.user_id
		AND a.coupon_id = t5.coupon_id
	LEFT OUTER JOIN (
		SELECT user_id
			, discount_rate
			, MAX(date_pay) AS user_dis_last_time
		FROM data1
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			discount_rate
	) t6
	ON a.user_id = t6.user_id
		AND a.discount_rate = t6.discount_rate
	
	
) c;

--month 3
CREATE TABLE featrue_label_3_last_time
AS
SELECT *
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_last_time, 'yyyymmdd'), 'dd')) AS user_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(b_last_time, 'yyyymmdd'), 'dd')) AS b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(c_last_time, 'yyyymmdd'), 'dd')) AS c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(dis_last_time, 'yyyymmdd'), 'dd')) AS dis_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_b_last_time, 'yyyymmdd'), 'dd')) AS user_b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_c_last_time, 'yyyymmdd'), 'dd')) AS user_c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_dis_last_time, 'yyyymmdd'), 'dd')) AS user_dis_diff
FROM (
	SELECT a.*
		, IF(t.user_last_time IS NULL, '20160101', t.user_last_time) AS user_last_time
		, IF(t1.b_last_time IS NULL, '20160101', t1.b_last_time) AS b_last_time
		, IF(t2.c_last_time IS NULL, '20160101', t2.c_last_time) AS c_last_time
		, IF(t3.dis_last_time IS NULL, '20160101', t3.dis_last_time) AS dis_last_time
		, IF(t4.user_b_last_time IS NULL, '20160101', t4.user_b_last_time) AS user_b_last_time
		, IF(t5.user_c_last_time IS NULL, '20160101', t5.user_c_last_time) AS user_c_last_time
		, IF(t6.user_dis_last_time IS NULL, '20160101', t6.user_dis_last_time) AS user_dis_last_time
	FROM featrue_label_3_more a
	LEFT OUTER JOIN (
		SELECT user_id
			, MAX(date_pay) AS user_last_time
		FROM data12
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id
	) t
	ON a.user_id = t.user_id
	LEFT OUTER JOIN (
		SELECT merchant_id
			, MAX(date_pay) AS b_last_time
		FROM data12
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY merchant_id
	) t1
	ON a.merchant_id = t1.merchant_id
	LEFT OUTER JOIN (
		SELECT coupon_id
			, MAX(date_pay) AS c_last_time
		FROM data12
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY coupon_id
	) t2
	ON a.coupon_id = t2.coupon_id
	LEFT OUTER JOIN (
		SELECT discount_rate
			, MAX(date_pay) AS dis_last_time
		FROM data12
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY discount_rate
	) t3
	ON a.discount_rate = t3.discount_rate
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, MAX(date_pay) AS user_b_last_time
		FROM data12
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			merchant_id
	) t4
	ON a.user_id = t4.user_id
		AND a.merchant_id = t4.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, MAX(date_pay) AS user_c_last_time
		FROM data12
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			coupon_id
	) t5
	ON a.user_id = t5.user_id
		AND a.coupon_id = t5.coupon_id
	LEFT OUTER JOIN (
		SELECT user_id
			, discount_rate
			, MAX(date_pay) AS user_dis_last_time
		FROM data12
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			discount_rate
	) t6
	ON a.user_id = t6.user_id
		AND a.discount_rate = t6.discount_rate
) c;

---month 4
CREATE TABLE featrue_label_4_last_time
AS
SELECT *
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_last_time, 'yyyymmdd'), 'dd')) AS user_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(b_last_time, 'yyyymmdd'), 'dd')) AS b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(c_last_time, 'yyyymmdd'), 'dd')) AS c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(dis_last_time, 'yyyymmdd'), 'dd')) AS dis_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_b_last_time, 'yyyymmdd'), 'dd')) AS user_b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_c_last_time, 'yyyymmdd'), 'dd')) AS user_c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_dis_last_time, 'yyyymmdd'), 'dd')) AS user_dis_diff
FROM (
	SELECT a.*
		, IF(t.user_last_time IS NULL, '20160101', t.user_last_time) AS user_last_time
		, IF(t1.b_last_time IS NULL, '20160101', t1.b_last_time) AS b_last_time
		, IF(t2.c_last_time IS NULL, '20160101', t2.c_last_time) AS c_last_time
		, IF(t3.dis_last_time IS NULL, '20160101', t3.dis_last_time) AS dis_last_time
		, IF(t4.user_b_last_time IS NULL, '20160101', t4.user_b_last_time) AS user_b_last_time
		, IF(t5.user_c_last_time IS NULL, '20160101', t5.user_c_last_time) AS user_c_last_time
		, IF(t6.user_dis_last_time IS NULL, '20160101', t6.user_dis_last_time) AS user_dis_last_time
	FROM featrue_label_4_more a
	LEFT OUTER JOIN (
		SELECT user_id
			, MAX(date_pay) AS user_last_time
		FROM data123
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id
	) t
	ON a.user_id = t.user_id
	LEFT OUTER JOIN (
		SELECT merchant_id
			, MAX(date_pay) AS b_last_time
		FROM data123
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY merchant_id
	) t1
	ON a.merchant_id = t1.merchant_id
	LEFT OUTER JOIN (
		SELECT coupon_id
			, MAX(date_pay) AS c_last_time
		FROM data123
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY coupon_id
	) t2
	ON a.coupon_id = t2.coupon_id
	LEFT OUTER JOIN (
		SELECT discount_rate
			, MAX(date_pay) AS dis_last_time
		FROM data123
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY discount_rate
	) t3
	ON a.discount_rate = t3.discount_rate
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, MAX(date_pay) AS user_b_last_time
		FROM data123
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			merchant_id
	) t4
	ON a.user_id = t4.user_id
		AND a.merchant_id = t4.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, MAX(date_pay) AS user_c_last_time
		FROM data123
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			coupon_id
	) t5
	ON a.user_id = t5.user_id
		AND a.coupon_id = t5.coupon_id
	LEFT OUTER JOIN (
		SELECT user_id
			, discount_rate
			, MAX(date_pay) AS user_dis_last_time
		FROM data123
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			discount_rate
	) t6
	ON a.user_id = t6.user_id
		AND a.discount_rate = t6.discount_rate
) c;

--month 5
CREATE TABLE featrue_label_5_last_time
AS
SELECT *
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_last_time, 'yyyymmdd'), 'dd')) AS user_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(b_last_time, 'yyyymmdd'), 'dd')) AS b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(c_last_time, 'yyyymmdd'), 'dd')) AS c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(dis_last_time, 'yyyymmdd'), 'dd')) AS dis_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_b_last_time, 'yyyymmdd'), 'dd')) AS user_b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_c_last_time, 'yyyymmdd'), 'dd')) AS user_c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_dis_last_time, 'yyyymmdd'), 'dd')) AS user_dis_diff
FROM (
	SELECT a.*
		, IF(t.user_last_time IS NULL, '20160101', t.user_last_time) AS user_last_time
		, IF(t1.b_last_time IS NULL, '20160101', t1.b_last_time) AS b_last_time
		, IF(t2.c_last_time IS NULL, '20160101', t2.c_last_time) AS c_last_time
		, IF(t3.dis_last_time IS NULL, '20160101', t3.dis_last_time) AS dis_last_time
		, IF(t4.user_b_last_time IS NULL, '20160101', t4.user_b_last_time) AS user_b_last_time
		, IF(t5.user_c_last_time IS NULL, '20160101', t5.user_c_last_time) AS user_c_last_time
		, IF(t6.user_dis_last_time IS NULL, '20160101', t6.user_dis_last_time) AS user_dis_last_time
	FROM featrue_label_5_more a
	LEFT OUTER JOIN (
		SELECT user_id
			, MAX(date_pay) AS user_last_time
		FROM data1234
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id
	) t
	ON a.user_id = t.user_id
	LEFT OUTER JOIN (
		SELECT merchant_id
			, MAX(date_pay) AS b_last_time
		FROM data1234
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY merchant_id
	) t1
	ON a.merchant_id = t1.merchant_id
	LEFT OUTER JOIN (
		SELECT coupon_id
			, MAX(date_pay) AS c_last_time
		FROM data1234
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY coupon_id
	) t2
	ON a.coupon_id = t2.coupon_id
	LEFT OUTER JOIN (
		SELECT discount_rate
			, MAX(date_pay) AS dis_last_time
		FROM data1234
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY discount_rate
	) t3
	ON a.discount_rate = t3.discount_rate
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, MAX(date_pay) AS user_b_last_time
		FROM data1234
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			merchant_id
	) t4
	ON a.user_id = t4.user_id
		AND a.merchant_id = t4.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, MAX(date_pay) AS user_c_last_time
		FROM data1234
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			coupon_id
	) t5
	ON a.user_id = t5.user_id
		AND a.coupon_id = t5.coupon_id
	LEFT OUTER JOIN (
		SELECT user_id
			, discount_rate
			, MAX(date_pay) AS user_dis_last_time
		FROM data1234
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			discount_rate
	) t6
	ON a.user_id = t6.user_id
		AND a.discount_rate = t6.discount_rate
) c;

--month6
CREATE TABLE featrue_label_6_last_time
AS
SELECT *
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_last_time, 'yyyymmdd'), 'dd')) AS user_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(b_last_time, 'yyyymmdd'), 'dd')) AS b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(c_last_time, 'yyyymmdd'), 'dd')) AS c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(dis_last_time, 'yyyymmdd'), 'dd')) AS dis_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_b_last_time, 'yyyymmdd'), 'dd')) AS user_b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_c_last_time, 'yyyymmdd'), 'dd')) AS user_c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_dis_last_time, 'yyyymmdd'), 'dd')) AS user_dis_diff
FROM (
	SELECT a.*
		, IF(t.user_last_time IS NULL, '20160101', t.user_last_time) AS user_last_time
		, IF(t1.b_last_time IS NULL, '20160101', t1.b_last_time) AS b_last_time
		, IF(t2.c_last_time IS NULL, '20160101', t2.c_last_time) AS c_last_time
		, IF(t3.dis_last_time IS NULL, '20160101', t3.dis_last_time) AS dis_last_time
		, IF(t4.user_b_last_time IS NULL, '20160101', t4.user_b_last_time) AS user_b_last_time
		, IF(t5.user_c_last_time IS NULL, '20160101', t5.user_c_last_time) AS user_c_last_time
		, IF(t6.user_dis_last_time IS NULL, '20160101', t6.user_dis_last_time) AS user_dis_last_time
	FROM featrue_label_6_more a
	LEFT OUTER JOIN (
		SELECT user_id
			, MAX(date_pay) AS user_last_time
		FROM data12345
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id
	) t
	ON a.user_id = t.user_id
	LEFT OUTER JOIN (
		SELECT merchant_id
			, MAX(date_pay) AS b_last_time
		FROM data12345
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY merchant_id
	) t1
	ON a.merchant_id = t1.merchant_id
	LEFT OUTER JOIN (
		SELECT coupon_id
			, MAX(date_pay) AS c_last_time
		FROM data12345
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY coupon_id
	) t2
	ON a.coupon_id = t2.coupon_id
	LEFT OUTER JOIN (
		SELECT discount_rate
			, MAX(date_pay) AS dis_last_time
		FROM data12345
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY discount_rate
	) t3
	ON a.discount_rate = t3.discount_rate
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, MAX(date_pay) AS user_b_last_time
		FROM data12345
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			merchant_id
	) t4
	ON a.user_id = t4.user_id
		AND a.merchant_id = t4.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, MAX(date_pay) AS user_c_last_time
		FROM data12345
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			coupon_id
	) t5
	ON a.user_id = t5.user_id
		AND a.coupon_id = t5.coupon_id
	LEFT OUTER JOIN (
		SELECT user_id
			, discount_rate
			, MAX(date_pay) AS user_dis_last_time
		FROM data12345
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			discount_rate
	) t6
	ON a.user_id = t6.user_id
		AND a.discount_rate = t6.discount_rate
) c;

--month 7

drop table featrue_label_7_last_time;

CREATE TABLE featrue_7_last_time
AS
SELECT *
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_last_time, 'yyyymmdd'), 'dd')) AS user_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(b_last_time, 'yyyymmdd'), 'dd')) AS b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(c_last_time, 'yyyymmdd'), 'dd')) AS c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(dis_last_time, 'yyyymmdd'), 'dd')) AS dis_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_b_last_time, 'yyyymmdd'), 'dd')) AS user_b_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_c_last_time, 'yyyymmdd'), 'dd')) AS user_c_diff
	, abs(datediff(TO_DATE(date_received, 'yyyymmdd'), TO_DATE(user_dis_last_time, 'yyyymmdd'), 'dd')) AS user_dis_diff
FROM (
	SELECT a.*
		, IF(t.user_last_time IS NULL, '20160101', t.user_last_time) AS user_last_time
		, IF(t1.b_last_time IS NULL, '20160101', t1.b_last_time) AS b_last_time
		, IF(t2.c_last_time IS NULL, '20160101', t2.c_last_time) AS c_last_time
		, IF(t3.dis_last_time IS NULL, '20160101', t3.dis_last_time) AS dis_last_time
		, IF(t4.user_b_last_time IS NULL, '20160101', t4.user_b_last_time) AS user_b_last_time
		, IF(t5.user_c_last_time IS NULL, '20160101', t5.user_c_last_time) AS user_c_last_time
		, IF(t6.user_dis_last_time IS NULL, '20160101', t6.user_dis_last_time) AS user_dis_last_time
	FROM featrue_7_more a
	LEFT OUTER JOIN (
		SELECT user_id
			, MAX(date_pay) AS user_last_time
		FROM data123456
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id
	) t
	ON a.user_id = t.user_id
	LEFT OUTER JOIN (
		SELECT merchant_id
			, MAX(date_pay) AS b_last_time
		FROM data123456
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY merchant_id
	) t1
	ON a.merchant_id = t1.merchant_id
	LEFT OUTER JOIN (
		SELECT coupon_id
			, MAX(date_pay) AS c_last_time
		FROM data123456
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY coupon_id
	) t2
	ON a.coupon_id = t2.coupon_id
	LEFT OUTER JOIN (
		SELECT discount_rate
			, MAX(date_pay) AS dis_last_time
		FROM data123456
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY discount_rate
	) t3
	ON a.discount_rate = t3.discount_rate
	LEFT OUTER JOIN (
		SELECT user_id
			, merchant_id
			, MAX(date_pay) AS user_b_last_time
		FROM data123456
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			merchant_id
	) t4
	ON a.user_id = t4.user_id
		AND a.merchant_id = t4.merchant_id
	LEFT OUTER JOIN (
		SELECT user_id
			, coupon_id
			, MAX(date_pay) AS user_c_last_time
		FROM data123456
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			coupon_id
	) t5
	ON a.user_id = t5.user_id
		AND a.coupon_id = t5.coupon_id
	LEFT OUTER JOIN (
		SELECT user_id
			, discount_rate
			, MAX(date_pay) AS user_dis_last_time
		FROM data123456
		WHERE date_received <> 'null'
			AND date_pay <> 'null'
			AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15
		GROUP BY user_id, 
			discount_rate
	) t6
	ON a.user_id = t6.user_id
		AND a.discount_rate = t6.discount_rate
) c;

-------------------加上前几个月的统计信息
--month 2
drop table featrue_label_2_statistic;
CREATE TABLE featrue_label_2_statistic
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
	, IF(user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	, IF(user_u_num_less_15 IS NULL, 0, user_u_num_less_15) AS user_u_num_less_15
	, IF(user_u_num_all IS NULL, 0, user_u_num_all) AS user_u_num_all
	, IF(user_no_u_num IS NULL, 0, user_no_u_num) AS user_no_u_num
	, IF(user_use_c_all IS NULL, 0, user_use_c_all) AS user_use_c_all
	, IF(user_get_c_num IS NULL, 0, user_get_c_num) AS user_get_c_num
	
	, IF(b_u_c_rate IS NULL, 0, b_u_c_rate) AS b_u_c_rate
	, IF(b_u_num_less_15 IS NULL, 0, b_u_num_less_15) AS b_u_num_less_15
	, IF(b_u_num_all IS NULL, 0, b_u_num_all) AS b_u_num_all
	, IF(b_no_u_num IS NULL, 0, b_no_u_num) AS b_no_u_num
	, IF(b_use_c_all IS NULL, 0, b_use_c_all) AS b_use_c_all
	, IF(b_get_c_num IS NULL, 0, b_get_c_num) AS b_get_c_num
	
	, IF(d_u_c_rate IS NULL, 0, d_u_c_rate) AS d_u_c_rate
	, IF(d_u_num_less_15 IS NULL, 0, d_u_num_less_15) AS d_u_num_less_15
	, IF(d_u_num_all IS NULL, 0, d_u_num_all) AS d_u_num_all
	, IF(d_no_u_num IS NULL, 0, d_no_u_num) AS d_no_u_num
	, IF(d_use_c_all IS NULL, 0, d_use_c_all) AS d_use_c_all
	, IF(dis_u_c_rate IS NULL, 0, dis_u_c_rate) AS dis_u_c_rate
	, IF(dis_u_num_less_15 IS NULL, 0, dis_u_num_less_15) AS dis_u_num_less_15
	, IF(dis_u_num_all IS NULL, 0, dis_u_num_all) AS dis_u_num_all
	, IF(dis_no_u_num IS NULL, 0, dis_no_u_num) AS dis_no_u_num
	, IF(dis_use_c_all IS NULL, 0, dis_use_c_all) AS dis_use_c_all
	, IF(c_u_c_rate IS NULL, 0, c_u_c_rate) AS c_u_c_rate
	, IF(c_u_num_less_15 IS NULL, 0, c_u_num_less_15) AS c_u_num_less_15
	, IF(c_u_num_all IS NULL, 0, c_u_num_all) AS c_u_num_all
	, IF(c_no_u_num IS NULL, 0, c_no_u_num) AS c_no_u_num
	, IF(c_use_c_all IS NULL, 0, c_use_c_all) AS c_use_c_all
	, IF(c_get_c_num IS NULL, 0, c_get_c_num) AS c_get_c_num
	
	, IF(b_d_u_c_rate IS NULL, 0, b_d_u_c_rate) AS b_d_u_c_rate
	, IF(b_d_u_num_less_15 IS NULL, 0, b_d_u_num_less_15) AS b_d_u_num_less_15
	, IF(b_d_u_num_all IS NULL, 0, b_d_u_num_all) AS b_d_u_num_all
	, IF(b_d_no_u_num IS NULL, 0, b_d_no_u_num) AS b_d_no_u_num
	, IF(b_d_use_c_all IS NULL, 0, b_d_use_c_all) AS b_d_use_c_all
	, IF(c_d_u_c_rate IS NULL, 0, c_d_u_c_rate) AS c_d_u_c_rate
	, IF(c_d_u_num_less_15 IS NULL, 0, c_d_u_num_less_15) AS c_d_u_num_less_15
	, IF(c_d_u_num_all IS NULL, 0, c_d_u_num_all) AS c_d_u_num_all
	, IF(c_d_no_u_num IS NULL, 0, c_d_no_u_num) AS c_d_no_u_num
	, IF(b_dis_u_c_rate IS NULL, 0, b_dis_u_c_rate) AS b_dis_u_c_rate
	, IF(b_dis_u_num_less_15 IS NULL, 0, b_dis_u_num_less_15) AS b_dis_u_num_less_15
	, IF(b_dis_u_num_all IS NULL, 0, b_dis_u_num_all) AS b_dis_u_num_all
	, IF(b_dis_no_u_num IS NULL, 0, b_dis_no_u_num) AS b_dis_no_u_num
	, IF(user_dis_u_c_rate IS NULL, 0, user_dis_u_c_rate) AS user_dis_u_c_rate
	, IF(user_dis_u_num_less_15 IS NULL, 0, user_dis_u_num_less_15) AS user_dis_u_num_less_15
	, IF(user_dis_u_num_all IS NULL, 0, user_dis_u_num_all) AS user_dis_u_num_all
	, IF(user_dis_no_u_num IS NULL, 0, user_dis_no_u_num) AS user_dis_no_u_num
	, IF(user_c_u_c_rate IS NULL, 0, user_c_u_c_rate) AS user_c_u_c_rate
	, IF(user_c_u_num_less_15 IS NULL, 0, user_c_u_num_less_15) AS user_c_u_num_less_15
	, IF(user_c_u_num_all IS NULL, 0, user_c_u_num_all) AS user_c_u_num_all
	, IF(user_c_no_u_num IS NULL, 0, user_c_no_u_num) AS user_c_no_u_num
	, IF(user_d_u_c_rate IS NULL, 0, user_d_u_c_rate) AS user_d_u_c_rate
	, IF(user_d_u_num_less_15 IS NULL, 0, user_d_u_num_less_15) AS user_d_u_num_less_15
	, IF(user_d_u_num_all IS NULL, 0, user_d_u_num_all) AS user_d_u_num_all
	, IF(user_d_no_u_num IS NULL, 0, user_d_no_u_num) AS user_d_no_u_num
	, IF(user_d_use_c_all IS NULL, 0, user_d_use_c_all) AS user_d_use_c_all
	, IF(user_b_u_c_rate IS NULL, 0, user_b_u_c_rate) AS user_b_u_c_rate
	, IF(user_b_u_num_less_15 IS NULL, 0, user_b_u_num_less_15) AS user_b_u_num_less_15
	, IF(user_b_u_num_all IS NULL, 0, user_b_u_num_all) AS user_b_u_num_all
	, IF(user_b_no_u_num IS NULL, 0, user_b_no_u_num) AS user_b_no_u_num
	, IF(user_b_use_c_all IS NULL, 0, user_b_use_c_all) AS user_b_use_c_all
FROM (
	SELECT a.*
		, b.user_u_c_rate
		, b.user_u_num_less_15
		, b.user_u_num_all
		, b.user_no_u_num
		, b.user_use_c_all
		,b.user_get_c_num 
		, c.b_u_c_rate
		, c.b_u_num_less_15
		, c.b_u_num_all
		, c.b_no_u_num
		, c.b_use_c_all
		,c.b_get_c_num 
		, n.d_u_c_rate
		, n.d_u_num_less_15
		, n.d_u_num_all
		, n.d_no_u_num
		, n.d_use_c_all
		, e.dis_u_c_rate
		, e.dis_u_num_less_15
		, e.dis_u_num_all
		, e.dis_no_u_num
		, e.dis_use_c_all
		, f.c_u_c_rate
		, f.c_u_num_less_15
		, f.c_u_num_all
		, f.c_no_u_num
		, f.c_use_c_all
		,f.c_get_c_num 
		, j.b_d_u_c_rate
		, j.b_d_u_num_less_15
		, j.b_d_u_num_all
		, j.b_d_no_u_num
		, j.b_d_use_c_all
		, h.c_d_u_c_rate
		, h.c_d_u_num_less_15
		, h.c_d_u_num_all
		, h.c_d_no_u_num
		, i.b_dis_u_c_rate
		, i.b_dis_u_num_less_15
		, i.b_dis_u_num_all
		, i.b_dis_no_u_num
		, g.user_dis_u_c_rate
		, g.user_dis_u_num_less_15
		, g.user_dis_u_num_all
		, g.user_dis_no_u_num
		, k.user_c_u_c_rate
		, k.user_c_u_num_less_15
		, k.user_c_u_num_all
		, k.user_c_no_u_num
		, l.user_d_u_c_rate
		, l.user_d_u_num_less_15
		, l.user_d_u_num_all
		, l.user_d_no_u_num
		, l.user_d_use_c_all
		, m.user_b_u_c_rate
		, m.user_b_u_num_less_15
		, m.user_b_u_num_all
		, m.user_b_no_u_num
		, m.user_b_use_c_all
	FROM featrue_label_2_last_time a
	LEFT OUTER JOIN user_prior_month_1 b
	ON a.user_id = b.user_id
	LEFT OUTER JOIN b_prior_month_1 c
	ON c.merchant_id = a.merchant_id
	LEFT OUTER JOIN d_prior_month_1 n
	ON n.distance = a.distance
	LEFT OUTER JOIN dis_prior_month_1 e
	ON e.discount_rate = a.discount_rate
	LEFT OUTER JOIN c_prior_month_1 f
	ON f.coupon_id = a.coupon_id
	LEFT OUTER JOIN b_d_prior_month_1 j
	ON j.merchant_id = a.merchant_id
		AND j.distance = a.distance
	LEFT OUTER JOIN c_d_prior_month_1 h
	ON h.coupon_id = a.coupon_id
		AND h.distance = a.distance
	LEFT OUTER JOIN b_dis_prior_month_1 i
	ON i.merchant_id = a.merchant_id
		AND i.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_dis_prior_month_1 g
	ON g.user_id = a.user_id
		AND g.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_c_prior_month_1 k
	ON k.user_id = a.user_id
		AND k.coupon_id = a.coupon_id
	LEFT OUTER JOIN user_d_prior_month_1 l
	ON l.user_id = a.user_id
		AND l.distance = l.distance
	LEFT OUTER JOIN user_b_prior_month_1 m
	ON m.user_id = a.user_id
		AND m.merchant_id = a.merchant_id
	
	
) t
--三月
drop table featrue_label_3_statistic;
CREATE TABLE featrue_label_3_statistic
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
	, IF(user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	, IF(user_u_num_less_15 IS NULL, 0, user_u_num_less_15) AS user_u_num_less_15
	, IF(user_u_num_all IS NULL, 0, user_u_num_all) AS user_u_num_all
	, IF(user_no_u_num IS NULL, 0, user_no_u_num) AS user_no_u_num
	, IF(user_use_c_all IS NULL, 0, user_use_c_all) AS user_use_c_all
	, IF(user_get_c_num IS NULL, 0, user_get_c_num) AS user_get_c_num
	
	, IF(b_u_c_rate IS NULL, 0, b_u_c_rate) AS b_u_c_rate
	, IF(b_u_num_less_15 IS NULL, 0, b_u_num_less_15) AS b_u_num_less_15
	, IF(b_u_num_all IS NULL, 0, b_u_num_all) AS b_u_num_all
	, IF(b_no_u_num IS NULL, 0, b_no_u_num) AS b_no_u_num
	, IF(b_use_c_all IS NULL, 0, b_use_c_all) AS b_use_c_all
	, IF(b_get_c_num IS NULL, 0, b_get_c_num) AS b_get_c_num
	
	, IF(d_u_c_rate IS NULL, 0, d_u_c_rate) AS d_u_c_rate
	, IF(d_u_num_less_15 IS NULL, 0, d_u_num_less_15) AS d_u_num_less_15
	, IF(d_u_num_all IS NULL, 0, d_u_num_all) AS d_u_num_all
	, IF(d_no_u_num IS NULL, 0, d_no_u_num) AS d_no_u_num
	, IF(d_use_c_all IS NULL, 0, d_use_c_all) AS d_use_c_all
	, IF(dis_u_c_rate IS NULL, 0, dis_u_c_rate) AS dis_u_c_rate
	, IF(dis_u_num_less_15 IS NULL, 0, dis_u_num_less_15) AS dis_u_num_less_15
	, IF(dis_u_num_all IS NULL, 0, dis_u_num_all) AS dis_u_num_all
	, IF(dis_no_u_num IS NULL, 0, dis_no_u_num) AS dis_no_u_num
	, IF(dis_use_c_all IS NULL, 0, dis_use_c_all) AS dis_use_c_all
	, IF(c_u_c_rate IS NULL, 0, c_u_c_rate) AS c_u_c_rate
	, IF(c_u_num_less_15 IS NULL, 0, c_u_num_less_15) AS c_u_num_less_15
	, IF(c_u_num_all IS NULL, 0, c_u_num_all) AS c_u_num_all
	, IF(c_no_u_num IS NULL, 0, c_no_u_num) AS c_no_u_num
	, IF(c_use_c_all IS NULL, 0, c_use_c_all) AS c_use_c_all
	, IF(c_get_c_num IS NULL, 0, c_get_c_num) AS c_get_c_num
	
	, IF(b_d_u_c_rate IS NULL, 0, b_d_u_c_rate) AS b_d_u_c_rate
	, IF(b_d_u_num_less_15 IS NULL, 0, b_d_u_num_less_15) AS b_d_u_num_less_15
	, IF(b_d_u_num_all IS NULL, 0, b_d_u_num_all) AS b_d_u_num_all
	, IF(b_d_no_u_num IS NULL, 0, b_d_no_u_num) AS b_d_no_u_num
	, IF(b_d_use_c_all IS NULL, 0, b_d_use_c_all) AS b_d_use_c_all
	, IF(c_d_u_c_rate IS NULL, 0, c_d_u_c_rate) AS c_d_u_c_rate
	, IF(c_d_u_num_less_15 IS NULL, 0, c_d_u_num_less_15) AS c_d_u_num_less_15
	, IF(c_d_u_num_all IS NULL, 0, c_d_u_num_all) AS c_d_u_num_all
	, IF(c_d_no_u_num IS NULL, 0, c_d_no_u_num) AS c_d_no_u_num
	, IF(b_dis_u_c_rate IS NULL, 0, b_dis_u_c_rate) AS b_dis_u_c_rate
	, IF(b_dis_u_num_less_15 IS NULL, 0, b_dis_u_num_less_15) AS b_dis_u_num_less_15
	, IF(b_dis_u_num_all IS NULL, 0, b_dis_u_num_all) AS b_dis_u_num_all
	, IF(b_dis_no_u_num IS NULL, 0, b_dis_no_u_num) AS b_dis_no_u_num
	, IF(user_dis_u_c_rate IS NULL, 0, user_dis_u_c_rate) AS user_dis_u_c_rate
	, IF(user_dis_u_num_less_15 IS NULL, 0, user_dis_u_num_less_15) AS user_dis_u_num_less_15
	, IF(user_dis_u_num_all IS NULL, 0, user_dis_u_num_all) AS user_dis_u_num_all
	, IF(user_dis_no_u_num IS NULL, 0, user_dis_no_u_num) AS user_dis_no_u_num
	, IF(user_c_u_c_rate IS NULL, 0, user_c_u_c_rate) AS user_c_u_c_rate
	, IF(user_c_u_num_less_15 IS NULL, 0, user_c_u_num_less_15) AS user_c_u_num_less_15
	, IF(user_c_u_num_all IS NULL, 0, user_c_u_num_all) AS user_c_u_num_all
	, IF(user_c_no_u_num IS NULL, 0, user_c_no_u_num) AS user_c_no_u_num
	, IF(user_d_u_c_rate IS NULL, 0, user_d_u_c_rate) AS user_d_u_c_rate
	, IF(user_d_u_num_less_15 IS NULL, 0, user_d_u_num_less_15) AS user_d_u_num_less_15
	, IF(user_d_u_num_all IS NULL, 0, user_d_u_num_all) AS user_d_u_num_all
	, IF(user_d_no_u_num IS NULL, 0, user_d_no_u_num) AS user_d_no_u_num
	, IF(user_d_use_c_all IS NULL, 0, user_d_use_c_all) AS user_d_use_c_all
	, IF(user_b_u_c_rate IS NULL, 0, user_b_u_c_rate) AS user_b_u_c_rate
	, IF(user_b_u_num_less_15 IS NULL, 0, user_b_u_num_less_15) AS user_b_u_num_less_15
	, IF(user_b_u_num_all IS NULL, 0, user_b_u_num_all) AS user_b_u_num_all
	, IF(user_b_no_u_num IS NULL, 0, user_b_no_u_num) AS user_b_no_u_num
	, IF(user_b_use_c_all IS NULL, 0, user_b_use_c_all) AS user_b_use_c_all
FROM (
	SELECT a.*
		, b.user_u_c_rate
		, b.user_u_num_less_15
		, b.user_u_num_all
		, b.user_no_u_num
		, b.user_use_c_all
		,b.user_get_c_num 
		, c.b_u_c_rate
		, c.b_u_num_less_15
		, c.b_u_num_all
		, c.b_no_u_num
		, c.b_use_c_all
		,c.b_get_c_num 
		, n.d_u_c_rate
		, n.d_u_num_less_15
		, n.d_u_num_all
		, n.d_no_u_num
		, n.d_use_c_all
		, e.dis_u_c_rate
		, e.dis_u_num_less_15
		, e.dis_u_num_all
		, e.dis_no_u_num
		, e.dis_use_c_all
		, f.c_u_c_rate
		, f.c_u_num_less_15
		, f.c_u_num_all
		, f.c_no_u_num
		, f.c_use_c_all
		,f.c_get_c_num 
		, j.b_d_u_c_rate
		, j.b_d_u_num_less_15
		, j.b_d_u_num_all
		, j.b_d_no_u_num
		, j.b_d_use_c_all
		, h.c_d_u_c_rate
		, h.c_d_u_num_less_15
		, h.c_d_u_num_all
		, h.c_d_no_u_num
		, i.b_dis_u_c_rate
		, i.b_dis_u_num_less_15
		, i.b_dis_u_num_all
		, i.b_dis_no_u_num
		, g.user_dis_u_c_rate
		, g.user_dis_u_num_less_15
		, g.user_dis_u_num_all
		, g.user_dis_no_u_num
		, k.user_c_u_c_rate
		, k.user_c_u_num_less_15
		, k.user_c_u_num_all
		, k.user_c_no_u_num
		, l.user_d_u_c_rate
		, l.user_d_u_num_less_15
		, l.user_d_u_num_all
		, l.user_d_no_u_num
		, l.user_d_use_c_all
		, m.user_b_u_c_rate
		, m.user_b_u_num_less_15
		, m.user_b_u_num_all
		, m.user_b_no_u_num
		, m.user_b_use_c_all
	FROM featrue_label_3_last_time a
	LEFT OUTER JOIN user_prior_month_12 b
	ON a.user_id = b.user_id
	LEFT OUTER JOIN b_prior_month_12 c
	ON c.merchant_id = a.merchant_id
	LEFT OUTER JOIN d_prior_month_12 n
	ON n.distance = a.distance
	LEFT OUTER JOIN dis_prior_month_12 e
	ON e.discount_rate = a.discount_rate
	LEFT OUTER JOIN c_prior_month_12 f
	ON f.coupon_id = a.coupon_id
	LEFT OUTER JOIN b_d_prior_month_12 j
	ON j.merchant_id = a.merchant_id
		AND j.distance = a.distance
	LEFT OUTER JOIN c_d_prior_month_12 h
	ON h.coupon_id = a.coupon_id
		AND h.distance = a.distance
	LEFT OUTER JOIN b_dis_prior_month_12 i
	ON i.merchant_id = a.merchant_id
		AND i.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_dis_prior_month_12 g
	ON g.user_id = a.user_id
		AND g.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_c_prior_month_12 k
	ON k.user_id = a.user_id
		AND k.coupon_id = a.coupon_id
	LEFT OUTER JOIN user_d_prior_month_12 l
	ON l.user_id = a.user_id
		AND l.distance = l.distance
	LEFT OUTER JOIN user_b_prior_month_12 m
	ON m.user_id = a.user_id
		AND m.merchant_id = a.merchant_id
) t
--四月
--month 4
drop table featrue_label_4_statistic;
CREATE TABLE featrue_label_4_statistic
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
	, IF(user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	, IF(user_u_num_less_15 IS NULL, 0, user_u_num_less_15) AS user_u_num_less_15
	, IF(user_u_num_all IS NULL, 0, user_u_num_all) AS user_u_num_all
	, IF(user_no_u_num IS NULL, 0, user_no_u_num) AS user_no_u_num
	, IF(user_use_c_all IS NULL, 0, user_use_c_all) AS user_use_c_all
	, IF(user_get_c_num IS NULL, 0, user_get_c_num) AS user_get_c_num
	
	, IF(b_u_c_rate IS NULL, 0, b_u_c_rate) AS b_u_c_rate
	, IF(b_u_num_less_15 IS NULL, 0, b_u_num_less_15) AS b_u_num_less_15
	, IF(b_u_num_all IS NULL, 0, b_u_num_all) AS b_u_num_all
	, IF(b_no_u_num IS NULL, 0, b_no_u_num) AS b_no_u_num
	, IF(b_use_c_all IS NULL, 0, b_use_c_all) AS b_use_c_all
	, IF(b_get_c_num IS NULL, 0, b_get_c_num) AS b_get_c_num
	
	, IF(d_u_c_rate IS NULL, 0, d_u_c_rate) AS d_u_c_rate
	, IF(d_u_num_less_15 IS NULL, 0, d_u_num_less_15) AS d_u_num_less_15
	, IF(d_u_num_all IS NULL, 0, d_u_num_all) AS d_u_num_all
	, IF(d_no_u_num IS NULL, 0, d_no_u_num) AS d_no_u_num
	, IF(d_use_c_all IS NULL, 0, d_use_c_all) AS d_use_c_all
	, IF(dis_u_c_rate IS NULL, 0, dis_u_c_rate) AS dis_u_c_rate
	, IF(dis_u_num_less_15 IS NULL, 0, dis_u_num_less_15) AS dis_u_num_less_15
	, IF(dis_u_num_all IS NULL, 0, dis_u_num_all) AS dis_u_num_all
	, IF(dis_no_u_num IS NULL, 0, dis_no_u_num) AS dis_no_u_num
	, IF(dis_use_c_all IS NULL, 0, dis_use_c_all) AS dis_use_c_all
	, IF(c_u_c_rate IS NULL, 0, c_u_c_rate) AS c_u_c_rate
	, IF(c_u_num_less_15 IS NULL, 0, c_u_num_less_15) AS c_u_num_less_15
	, IF(c_u_num_all IS NULL, 0, c_u_num_all) AS c_u_num_all
	, IF(c_no_u_num IS NULL, 0, c_no_u_num) AS c_no_u_num
	, IF(c_use_c_all IS NULL, 0, c_use_c_all) AS c_use_c_all
	, IF(c_get_c_num IS NULL, 0, c_get_c_num) AS c_get_c_num
	
	, IF(b_d_u_c_rate IS NULL, 0, b_d_u_c_rate) AS b_d_u_c_rate
	, IF(b_d_u_num_less_15 IS NULL, 0, b_d_u_num_less_15) AS b_d_u_num_less_15
	, IF(b_d_u_num_all IS NULL, 0, b_d_u_num_all) AS b_d_u_num_all
	, IF(b_d_no_u_num IS NULL, 0, b_d_no_u_num) AS b_d_no_u_num
	, IF(b_d_use_c_all IS NULL, 0, b_d_use_c_all) AS b_d_use_c_all
	, IF(c_d_u_c_rate IS NULL, 0, c_d_u_c_rate) AS c_d_u_c_rate
	, IF(c_d_u_num_less_15 IS NULL, 0, c_d_u_num_less_15) AS c_d_u_num_less_15
	, IF(c_d_u_num_all IS NULL, 0, c_d_u_num_all) AS c_d_u_num_all
	, IF(c_d_no_u_num IS NULL, 0, c_d_no_u_num) AS c_d_no_u_num
	, IF(b_dis_u_c_rate IS NULL, 0, b_dis_u_c_rate) AS b_dis_u_c_rate
	, IF(b_dis_u_num_less_15 IS NULL, 0, b_dis_u_num_less_15) AS b_dis_u_num_less_15
	, IF(b_dis_u_num_all IS NULL, 0, b_dis_u_num_all) AS b_dis_u_num_all
	, IF(b_dis_no_u_num IS NULL, 0, b_dis_no_u_num) AS b_dis_no_u_num
	, IF(user_dis_u_c_rate IS NULL, 0, user_dis_u_c_rate) AS user_dis_u_c_rate
	, IF(user_dis_u_num_less_15 IS NULL, 0, user_dis_u_num_less_15) AS user_dis_u_num_less_15
	, IF(user_dis_u_num_all IS NULL, 0, user_dis_u_num_all) AS user_dis_u_num_all
	, IF(user_dis_no_u_num IS NULL, 0, user_dis_no_u_num) AS user_dis_no_u_num
	, IF(user_c_u_c_rate IS NULL, 0, user_c_u_c_rate) AS user_c_u_c_rate
	, IF(user_c_u_num_less_15 IS NULL, 0, user_c_u_num_less_15) AS user_c_u_num_less_15
	, IF(user_c_u_num_all IS NULL, 0, user_c_u_num_all) AS user_c_u_num_all
	, IF(user_c_no_u_num IS NULL, 0, user_c_no_u_num) AS user_c_no_u_num
	, IF(user_d_u_c_rate IS NULL, 0, user_d_u_c_rate) AS user_d_u_c_rate
	, IF(user_d_u_num_less_15 IS NULL, 0, user_d_u_num_less_15) AS user_d_u_num_less_15
	, IF(user_d_u_num_all IS NULL, 0, user_d_u_num_all) AS user_d_u_num_all
	, IF(user_d_no_u_num IS NULL, 0, user_d_no_u_num) AS user_d_no_u_num
	, IF(user_d_use_c_all IS NULL, 0, user_d_use_c_all) AS user_d_use_c_all
	, IF(user_b_u_c_rate IS NULL, 0, user_b_u_c_rate) AS user_b_u_c_rate
	, IF(user_b_u_num_less_15 IS NULL, 0, user_b_u_num_less_15) AS user_b_u_num_less_15
	, IF(user_b_u_num_all IS NULL, 0, user_b_u_num_all) AS user_b_u_num_all
	, IF(user_b_no_u_num IS NULL, 0, user_b_no_u_num) AS user_b_no_u_num
	, IF(user_b_use_c_all IS NULL, 0, user_b_use_c_all) AS user_b_use_c_all
FROM (
	SELECT a.*
		, b.user_u_c_rate
		, b.user_u_num_less_15
		, b.user_u_num_all
		, b.user_no_u_num
		, b.user_use_c_all
		,b.user_get_c_num 
		, c.b_u_c_rate
		, c.b_u_num_less_15
		, c.b_u_num_all
		, c.b_no_u_num
		, c.b_use_c_all
		,c.b_get_c_num 
		, n.d_u_c_rate
		, n.d_u_num_less_15
		, n.d_u_num_all
		, n.d_no_u_num
		, n.d_use_c_all
		, e.dis_u_c_rate
		, e.dis_u_num_less_15
		, e.dis_u_num_all
		, e.dis_no_u_num
		, e.dis_use_c_all
		, f.c_u_c_rate
		, f.c_u_num_less_15
		, f.c_u_num_all
		, f.c_no_u_num
		, f.c_use_c_all
		,f.c_get_c_num 
		, j.b_d_u_c_rate
		, j.b_d_u_num_less_15
		, j.b_d_u_num_all
		, j.b_d_no_u_num
		, j.b_d_use_c_all
		, h.c_d_u_c_rate
		, h.c_d_u_num_less_15
		, h.c_d_u_num_all
		, h.c_d_no_u_num
		, i.b_dis_u_c_rate
		, i.b_dis_u_num_less_15
		, i.b_dis_u_num_all
		, i.b_dis_no_u_num
		, g.user_dis_u_c_rate
		, g.user_dis_u_num_less_15
		, g.user_dis_u_num_all
		, g.user_dis_no_u_num
		, k.user_c_u_c_rate
		, k.user_c_u_num_less_15
		, k.user_c_u_num_all
		, k.user_c_no_u_num
		, l.user_d_u_c_rate
		, l.user_d_u_num_less_15
		, l.user_d_u_num_all
		, l.user_d_no_u_num
		, l.user_d_use_c_all
		, m.user_b_u_c_rate
		, m.user_b_u_num_less_15
		, m.user_b_u_num_all
		, m.user_b_no_u_num
		, m.user_b_use_c_all
	FROM featrue_label_4_last_time a
	LEFT OUTER JOIN user_prior_month_123 b
	ON a.user_id = b.user_id
	LEFT OUTER JOIN b_prior_month_123 c
	ON c.merchant_id = a.merchant_id
	LEFT OUTER JOIN d_prior_month_123 n
	ON n.distance = a.distance
	LEFT OUTER JOIN dis_prior_month_123 e
	ON e.discount_rate = a.discount_rate
	LEFT OUTER JOIN c_prior_month_123 f
	ON f.coupon_id = a.coupon_id
	LEFT OUTER JOIN b_d_prior_month_123 j
	ON j.merchant_id = a.merchant_id
		AND j.distance = a.distance
	LEFT OUTER JOIN c_d_prior_month_123 h
	ON h.coupon_id = a.coupon_id
		AND h.distance = a.distance
	LEFT OUTER JOIN b_dis_prior_month_123 i
	ON i.merchant_id = a.merchant_id
		AND i.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_dis_prior_month_123 g
	ON g.user_id = a.user_id
		AND g.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_c_prior_month_123 k
	ON k.user_id = a.user_id
		AND k.coupon_id = a.coupon_id
	LEFT OUTER JOIN user_d_prior_month_123 l
	ON l.user_id = a.user_id
		AND l.distance = l.distance
	LEFT OUTER JOIN user_b_prior_month_123 m
	ON m.user_id = a.user_id
		AND m.merchant_id = a.merchant_id
) t
--五月
--month 5
drop table featrue_label_5_statistic;
CREATE TABLE featrue_label_5_statistic
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
	, IF(user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	, IF(user_u_num_less_15 IS NULL, 0, user_u_num_less_15) AS user_u_num_less_15
	, IF(user_u_num_all IS NULL, 0, user_u_num_all) AS user_u_num_all
	, IF(user_no_u_num IS NULL, 0, user_no_u_num) AS user_no_u_num
	, IF(user_use_c_all IS NULL, 0, user_use_c_all) AS user_use_c_all
	, IF(user_get_c_num IS NULL, 0, user_get_c_num) AS user_get_c_num
	
	, IF(b_u_c_rate IS NULL, 0, b_u_c_rate) AS b_u_c_rate
	, IF(b_u_num_less_15 IS NULL, 0, b_u_num_less_15) AS b_u_num_less_15
	, IF(b_u_num_all IS NULL, 0, b_u_num_all) AS b_u_num_all
	, IF(b_no_u_num IS NULL, 0, b_no_u_num) AS b_no_u_num
	, IF(b_use_c_all IS NULL, 0, b_use_c_all) AS b_use_c_all
	, IF(b_get_c_num IS NULL, 0, b_get_c_num) AS b_get_c_num
	
	, IF(d_u_c_rate IS NULL, 0, d_u_c_rate) AS d_u_c_rate
	, IF(d_u_num_less_15 IS NULL, 0, d_u_num_less_15) AS d_u_num_less_15
	, IF(d_u_num_all IS NULL, 0, d_u_num_all) AS d_u_num_all
	, IF(d_no_u_num IS NULL, 0, d_no_u_num) AS d_no_u_num
	, IF(d_use_c_all IS NULL, 0, d_use_c_all) AS d_use_c_all
	, IF(dis_u_c_rate IS NULL, 0, dis_u_c_rate) AS dis_u_c_rate
	, IF(dis_u_num_less_15 IS NULL, 0, dis_u_num_less_15) AS dis_u_num_less_15
	, IF(dis_u_num_all IS NULL, 0, dis_u_num_all) AS dis_u_num_all
	, IF(dis_no_u_num IS NULL, 0, dis_no_u_num) AS dis_no_u_num
	, IF(dis_use_c_all IS NULL, 0, dis_use_c_all) AS dis_use_c_all
	, IF(c_u_c_rate IS NULL, 0, c_u_c_rate) AS c_u_c_rate
	, IF(c_u_num_less_15 IS NULL, 0, c_u_num_less_15) AS c_u_num_less_15
	, IF(c_u_num_all IS NULL, 0, c_u_num_all) AS c_u_num_all
	, IF(c_no_u_num IS NULL, 0, c_no_u_num) AS c_no_u_num
	, IF(c_use_c_all IS NULL, 0, c_use_c_all) AS c_use_c_all
	, IF(c_get_c_num IS NULL, 0, c_get_c_num) AS c_get_c_num
	
	, IF(b_d_u_c_rate IS NULL, 0, b_d_u_c_rate) AS b_d_u_c_rate
	, IF(b_d_u_num_less_15 IS NULL, 0, b_d_u_num_less_15) AS b_d_u_num_less_15
	, IF(b_d_u_num_all IS NULL, 0, b_d_u_num_all) AS b_d_u_num_all
	, IF(b_d_no_u_num IS NULL, 0, b_d_no_u_num) AS b_d_no_u_num
	, IF(b_d_use_c_all IS NULL, 0, b_d_use_c_all) AS b_d_use_c_all
	, IF(c_d_u_c_rate IS NULL, 0, c_d_u_c_rate) AS c_d_u_c_rate
	, IF(c_d_u_num_less_15 IS NULL, 0, c_d_u_num_less_15) AS c_d_u_num_less_15
	, IF(c_d_u_num_all IS NULL, 0, c_d_u_num_all) AS c_d_u_num_all
	, IF(c_d_no_u_num IS NULL, 0, c_d_no_u_num) AS c_d_no_u_num
	, IF(b_dis_u_c_rate IS NULL, 0, b_dis_u_c_rate) AS b_dis_u_c_rate
	, IF(b_dis_u_num_less_15 IS NULL, 0, b_dis_u_num_less_15) AS b_dis_u_num_less_15
	, IF(b_dis_u_num_all IS NULL, 0, b_dis_u_num_all) AS b_dis_u_num_all
	, IF(b_dis_no_u_num IS NULL, 0, b_dis_no_u_num) AS b_dis_no_u_num
	, IF(user_dis_u_c_rate IS NULL, 0, user_dis_u_c_rate) AS user_dis_u_c_rate
	, IF(user_dis_u_num_less_15 IS NULL, 0, user_dis_u_num_less_15) AS user_dis_u_num_less_15
	, IF(user_dis_u_num_all IS NULL, 0, user_dis_u_num_all) AS user_dis_u_num_all
	, IF(user_dis_no_u_num IS NULL, 0, user_dis_no_u_num) AS user_dis_no_u_num
	, IF(user_c_u_c_rate IS NULL, 0, user_c_u_c_rate) AS user_c_u_c_rate
	, IF(user_c_u_num_less_15 IS NULL, 0, user_c_u_num_less_15) AS user_c_u_num_less_15
	, IF(user_c_u_num_all IS NULL, 0, user_c_u_num_all) AS user_c_u_num_all
	, IF(user_c_no_u_num IS NULL, 0, user_c_no_u_num) AS user_c_no_u_num
	, IF(user_d_u_c_rate IS NULL, 0, user_d_u_c_rate) AS user_d_u_c_rate
	, IF(user_d_u_num_less_15 IS NULL, 0, user_d_u_num_less_15) AS user_d_u_num_less_15
	, IF(user_d_u_num_all IS NULL, 0, user_d_u_num_all) AS user_d_u_num_all
	, IF(user_d_no_u_num IS NULL, 0, user_d_no_u_num) AS user_d_no_u_num
	, IF(user_d_use_c_all IS NULL, 0, user_d_use_c_all) AS user_d_use_c_all
	, IF(user_b_u_c_rate IS NULL, 0, user_b_u_c_rate) AS user_b_u_c_rate
	, IF(user_b_u_num_less_15 IS NULL, 0, user_b_u_num_less_15) AS user_b_u_num_less_15
	, IF(user_b_u_num_all IS NULL, 0, user_b_u_num_all) AS user_b_u_num_all
	, IF(user_b_no_u_num IS NULL, 0, user_b_no_u_num) AS user_b_no_u_num
	, IF(user_b_use_c_all IS NULL, 0, user_b_use_c_all) AS user_b_use_c_all
FROM (
	SELECT a.*
		, b.user_u_c_rate
		, b.user_u_num_less_15
		, b.user_u_num_all
		, b.user_no_u_num
		, b.user_use_c_all
		,b.user_get_c_num 
		, c.b_u_c_rate
		, c.b_u_num_less_15
		, c.b_u_num_all
		, c.b_no_u_num
		, c.b_use_c_all
		,c.b_get_c_num 
		, n.d_u_c_rate
		, n.d_u_num_less_15
		, n.d_u_num_all
		, n.d_no_u_num
		, n.d_use_c_all
		, e.dis_u_c_rate
		, e.dis_u_num_less_15
		, e.dis_u_num_all
		, e.dis_no_u_num
		, e.dis_use_c_all
		, f.c_u_c_rate
		, f.c_u_num_less_15
		, f.c_u_num_all
		, f.c_no_u_num
		, f.c_use_c_all
		,f.c_get_c_num 
		, j.b_d_u_c_rate
		, j.b_d_u_num_less_15
		, j.b_d_u_num_all
		, j.b_d_no_u_num
		, j.b_d_use_c_all
		, h.c_d_u_c_rate
		, h.c_d_u_num_less_15
		, h.c_d_u_num_all
		, h.c_d_no_u_num
		, i.b_dis_u_c_rate
		, i.b_dis_u_num_less_15
		, i.b_dis_u_num_all
		, i.b_dis_no_u_num
		, g.user_dis_u_c_rate
		, g.user_dis_u_num_less_15
		, g.user_dis_u_num_all
		, g.user_dis_no_u_num
		, k.user_c_u_c_rate
		, k.user_c_u_num_less_15
		, k.user_c_u_num_all
		, k.user_c_no_u_num
		, l.user_d_u_c_rate
		, l.user_d_u_num_less_15
		, l.user_d_u_num_all
		, l.user_d_no_u_num
		, l.user_d_use_c_all
		, m.user_b_u_c_rate
		, m.user_b_u_num_less_15
		, m.user_b_u_num_all
		, m.user_b_no_u_num
		, m.user_b_use_c_all
	FROM featrue_label_5_last_time a
	LEFT OUTER JOIN user_prior_month_1234 b
	ON a.user_id = b.user_id
	LEFT OUTER JOIN b_prior_month_1234 c
	ON c.merchant_id = a.merchant_id
	LEFT OUTER JOIN d_prior_month_1234 n
	ON n.distance = a.distance
	LEFT OUTER JOIN dis_prior_month_1234 e
	ON e.discount_rate = a.discount_rate
	LEFT OUTER JOIN c_prior_month_1234 f
	ON f.coupon_id = a.coupon_id
	LEFT OUTER JOIN b_d_prior_month_1234 j
	ON j.merchant_id = a.merchant_id
		AND j.distance = a.distance
	LEFT OUTER JOIN c_d_prior_month_1234 h
	ON h.coupon_id = a.coupon_id
		AND h.distance = a.distance
	LEFT OUTER JOIN b_dis_prior_month_1234 i
	ON i.merchant_id = a.merchant_id
		AND i.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_dis_prior_month_1234 g
	ON g.user_id = a.user_id
		AND g.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_c_prior_month_1234 k
	ON k.user_id = a.user_id
		AND k.coupon_id = a.coupon_id
	LEFT OUTER JOIN user_d_prior_month_1234 l
	ON l.user_id = a.user_id
		AND l.distance = l.distance
	LEFT OUTER JOIN user_b_prior_month_1234 m
	ON m.user_id = a.user_id
		AND m.merchant_id = a.merchant_id
) t
---六月
--month 6
drop table featrue_label_6_statistic;
CREATE TABLE featrue_label_6_statistic
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
	, IF(user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	, IF(user_u_num_less_15 IS NULL, 0, user_u_num_less_15) AS user_u_num_less_15
	, IF(user_u_num_all IS NULL, 0, user_u_num_all) AS user_u_num_all
	, IF(user_no_u_num IS NULL, 0, user_no_u_num) AS user_no_u_num
	, IF(user_use_c_all IS NULL, 0, user_use_c_all) AS user_use_c_all
	, IF(user_get_c_num IS NULL, 0, user_get_c_num) AS user_get_c_num
	
	, IF(b_u_c_rate IS NULL, 0, b_u_c_rate) AS b_u_c_rate
	, IF(b_u_num_less_15 IS NULL, 0, b_u_num_less_15) AS b_u_num_less_15
	, IF(b_u_num_all IS NULL, 0, b_u_num_all) AS b_u_num_all
	, IF(b_no_u_num IS NULL, 0, b_no_u_num) AS b_no_u_num
	, IF(b_use_c_all IS NULL, 0, b_use_c_all) AS b_use_c_all
	, IF(b_get_c_num IS NULL, 0, b_get_c_num) AS b_get_c_num
	
	, IF(d_u_c_rate IS NULL, 0, d_u_c_rate) AS d_u_c_rate
	, IF(d_u_num_less_15 IS NULL, 0, d_u_num_less_15) AS d_u_num_less_15
	, IF(d_u_num_all IS NULL, 0, d_u_num_all) AS d_u_num_all
	, IF(d_no_u_num IS NULL, 0, d_no_u_num) AS d_no_u_num
	, IF(d_use_c_all IS NULL, 0, d_use_c_all) AS d_use_c_all
	, IF(dis_u_c_rate IS NULL, 0, dis_u_c_rate) AS dis_u_c_rate
	, IF(dis_u_num_less_15 IS NULL, 0, dis_u_num_less_15) AS dis_u_num_less_15
	, IF(dis_u_num_all IS NULL, 0, dis_u_num_all) AS dis_u_num_all
	, IF(dis_no_u_num IS NULL, 0, dis_no_u_num) AS dis_no_u_num
	, IF(dis_use_c_all IS NULL, 0, dis_use_c_all) AS dis_use_c_all
	, IF(c_u_c_rate IS NULL, 0, c_u_c_rate) AS c_u_c_rate
	, IF(c_u_num_less_15 IS NULL, 0, c_u_num_less_15) AS c_u_num_less_15
	, IF(c_u_num_all IS NULL, 0, c_u_num_all) AS c_u_num_all
	, IF(c_no_u_num IS NULL, 0, c_no_u_num) AS c_no_u_num
	, IF(c_use_c_all IS NULL, 0, c_use_c_all) AS c_use_c_all
	, IF(c_get_c_num IS NULL, 0, c_get_c_num) AS c_get_c_num
	
	, IF(b_d_u_c_rate IS NULL, 0, b_d_u_c_rate) AS b_d_u_c_rate
	, IF(b_d_u_num_less_15 IS NULL, 0, b_d_u_num_less_15) AS b_d_u_num_less_15
	, IF(b_d_u_num_all IS NULL, 0, b_d_u_num_all) AS b_d_u_num_all
	, IF(b_d_no_u_num IS NULL, 0, b_d_no_u_num) AS b_d_no_u_num
	, IF(b_d_use_c_all IS NULL, 0, b_d_use_c_all) AS b_d_use_c_all
	, IF(c_d_u_c_rate IS NULL, 0, c_d_u_c_rate) AS c_d_u_c_rate
	, IF(c_d_u_num_less_15 IS NULL, 0, c_d_u_num_less_15) AS c_d_u_num_less_15
	, IF(c_d_u_num_all IS NULL, 0, c_d_u_num_all) AS c_d_u_num_all
	, IF(c_d_no_u_num IS NULL, 0, c_d_no_u_num) AS c_d_no_u_num
	, IF(b_dis_u_c_rate IS NULL, 0, b_dis_u_c_rate) AS b_dis_u_c_rate
	, IF(b_dis_u_num_less_15 IS NULL, 0, b_dis_u_num_less_15) AS b_dis_u_num_less_15
	, IF(b_dis_u_num_all IS NULL, 0, b_dis_u_num_all) AS b_dis_u_num_all
	, IF(b_dis_no_u_num IS NULL, 0, b_dis_no_u_num) AS b_dis_no_u_num
	, IF(user_dis_u_c_rate IS NULL, 0, user_dis_u_c_rate) AS user_dis_u_c_rate
	, IF(user_dis_u_num_less_15 IS NULL, 0, user_dis_u_num_less_15) AS user_dis_u_num_less_15
	, IF(user_dis_u_num_all IS NULL, 0, user_dis_u_num_all) AS user_dis_u_num_all
	, IF(user_dis_no_u_num IS NULL, 0, user_dis_no_u_num) AS user_dis_no_u_num
	, IF(user_c_u_c_rate IS NULL, 0, user_c_u_c_rate) AS user_c_u_c_rate
	, IF(user_c_u_num_less_15 IS NULL, 0, user_c_u_num_less_15) AS user_c_u_num_less_15
	, IF(user_c_u_num_all IS NULL, 0, user_c_u_num_all) AS user_c_u_num_all
	, IF(user_c_no_u_num IS NULL, 0, user_c_no_u_num) AS user_c_no_u_num
	, IF(user_d_u_c_rate IS NULL, 0, user_d_u_c_rate) AS user_d_u_c_rate
	, IF(user_d_u_num_less_15 IS NULL, 0, user_d_u_num_less_15) AS user_d_u_num_less_15
	, IF(user_d_u_num_all IS NULL, 0, user_d_u_num_all) AS user_d_u_num_all
	, IF(user_d_no_u_num IS NULL, 0, user_d_no_u_num) AS user_d_no_u_num
	, IF(user_d_use_c_all IS NULL, 0, user_d_use_c_all) AS user_d_use_c_all
	, IF(user_b_u_c_rate IS NULL, 0, user_b_u_c_rate) AS user_b_u_c_rate
	, IF(user_b_u_num_less_15 IS NULL, 0, user_b_u_num_less_15) AS user_b_u_num_less_15
	, IF(user_b_u_num_all IS NULL, 0, user_b_u_num_all) AS user_b_u_num_all
	, IF(user_b_no_u_num IS NULL, 0, user_b_no_u_num) AS user_b_no_u_num
	, IF(user_b_use_c_all IS NULL, 0, user_b_use_c_all) AS user_b_use_c_all
FROM (
	SELECT a.*
		, b.user_u_c_rate
		, b.user_u_num_less_15
		, b.user_u_num_all
		, b.user_no_u_num
		, b.user_use_c_all
		,b.user_get_c_num 
		, c.b_u_c_rate
		, c.b_u_num_less_15
		, c.b_u_num_all
		, c.b_no_u_num
		, c.b_use_c_all
		,c.b_get_c_num 
		, n.d_u_c_rate
		, n.d_u_num_less_15
		, n.d_u_num_all
		, n.d_no_u_num
		, n.d_use_c_all
		, e.dis_u_c_rate
		, e.dis_u_num_less_15
		, e.dis_u_num_all
		, e.dis_no_u_num
		, e.dis_use_c_all
		, f.c_u_c_rate
		, f.c_u_num_less_15
		, f.c_u_num_all
		, f.c_no_u_num
		, f.c_use_c_all
		,f.c_get_c_num 
		, j.b_d_u_c_rate
		, j.b_d_u_num_less_15
		, j.b_d_u_num_all
		, j.b_d_no_u_num
		, j.b_d_use_c_all
		, h.c_d_u_c_rate
		, h.c_d_u_num_less_15
		, h.c_d_u_num_all
		, h.c_d_no_u_num
		, i.b_dis_u_c_rate
		, i.b_dis_u_num_less_15
		, i.b_dis_u_num_all
		, i.b_dis_no_u_num
		, g.user_dis_u_c_rate
		, g.user_dis_u_num_less_15
		, g.user_dis_u_num_all
		, g.user_dis_no_u_num
		, k.user_c_u_c_rate
		, k.user_c_u_num_less_15
		, k.user_c_u_num_all
		, k.user_c_no_u_num
		, l.user_d_u_c_rate
		, l.user_d_u_num_less_15
		, l.user_d_u_num_all
		, l.user_d_no_u_num
		, l.user_d_use_c_all
		, m.user_b_u_c_rate
		, m.user_b_u_num_less_15
		, m.user_b_u_num_all
		, m.user_b_no_u_num
		, m.user_b_use_c_all
	FROM featrue_label_6_last_time a
	LEFT OUTER JOIN user_prior_month_12345 b
	ON a.user_id = b.user_id
	LEFT OUTER JOIN b_prior_month_12345 c
	ON c.merchant_id = a.merchant_id
	LEFT OUTER JOIN d_prior_month_12345 n
	ON n.distance = a.distance
	LEFT OUTER JOIN dis_prior_month_12345 e
	ON e.discount_rate = a.discount_rate
	LEFT OUTER JOIN c_prior_month_12345 f
	ON f.coupon_id = a.coupon_id
	LEFT OUTER JOIN b_d_prior_month_12345 j
	ON j.merchant_id = a.merchant_id
		AND j.distance = a.distance
	LEFT OUTER JOIN c_d_prior_month_12345 h
	ON h.coupon_id = a.coupon_id
		AND h.distance = a.distance
	LEFT OUTER JOIN b_dis_prior_month_12345 i
	ON i.merchant_id = a.merchant_id
		AND i.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_dis_prior_month_12345 g
	ON g.user_id = a.user_id
		AND g.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_c_prior_month_12345 k
	ON k.user_id = a.user_id
		AND k.coupon_id = a.coupon_id
	LEFT OUTER JOIN user_d_prior_month_12345 l
	ON l.user_id = a.user_id
		AND l.distance = l.distance
	LEFT OUTER JOIN user_b_prior_month_12345 m
	ON m.user_id = a.user_id
		AND m.merchant_id = a.merchant_id
) t
---七月
drop table featrue_7_statistic;
CREATE TABLE featrue_7_statistic
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
	, IF(user_u_c_rate IS NULL, 0, user_u_c_rate) AS user_u_c_rate
	, IF(user_u_num_less_15 IS NULL, 0, user_u_num_less_15) AS user_u_num_less_15
	, IF(user_u_num_all IS NULL, 0, user_u_num_all) AS user_u_num_all
	, IF(user_no_u_num IS NULL, 0, user_no_u_num) AS user_no_u_num
	, IF(user_use_c_all IS NULL, 0, user_use_c_all) AS user_use_c_all
	, IF(user_get_c_num IS NULL, 0, user_get_c_num) AS user_get_c_num
	
	, IF(b_u_c_rate IS NULL, 0, b_u_c_rate) AS b_u_c_rate
	, IF(b_u_num_less_15 IS NULL, 0, b_u_num_less_15) AS b_u_num_less_15
	, IF(b_u_num_all IS NULL, 0, b_u_num_all) AS b_u_num_all
	, IF(b_no_u_num IS NULL, 0, b_no_u_num) AS b_no_u_num
	, IF(b_use_c_all IS NULL, 0, b_use_c_all) AS b_use_c_all
	, IF(b_get_c_num IS NULL, 0, b_get_c_num) AS b_get_c_num
	
	, IF(d_u_c_rate IS NULL, 0, d_u_c_rate) AS d_u_c_rate
	, IF(d_u_num_less_15 IS NULL, 0, d_u_num_less_15) AS d_u_num_less_15
	, IF(d_u_num_all IS NULL, 0, d_u_num_all) AS d_u_num_all
	, IF(d_no_u_num IS NULL, 0, d_no_u_num) AS d_no_u_num
	, IF(d_use_c_all IS NULL, 0, d_use_c_all) AS d_use_c_all
	, IF(dis_u_c_rate IS NULL, 0, dis_u_c_rate) AS dis_u_c_rate
	, IF(dis_u_num_less_15 IS NULL, 0, dis_u_num_less_15) AS dis_u_num_less_15
	, IF(dis_u_num_all IS NULL, 0, dis_u_num_all) AS dis_u_num_all
	, IF(dis_no_u_num IS NULL, 0, dis_no_u_num) AS dis_no_u_num
	, IF(dis_use_c_all IS NULL, 0, dis_use_c_all) AS dis_use_c_all
	, IF(c_u_c_rate IS NULL, 0, c_u_c_rate) AS c_u_c_rate
	, IF(c_u_num_less_15 IS NULL, 0, c_u_num_less_15) AS c_u_num_less_15
	, IF(c_u_num_all IS NULL, 0, c_u_num_all) AS c_u_num_all
	, IF(c_no_u_num IS NULL, 0, c_no_u_num) AS c_no_u_num
	, IF(c_use_c_all IS NULL, 0, c_use_c_all) AS c_use_c_all
	, IF(c_get_c_num IS NULL, 0, c_get_c_num) AS c_get_c_num
	
	, IF(b_d_u_c_rate IS NULL, 0, b_d_u_c_rate) AS b_d_u_c_rate
	, IF(b_d_u_num_less_15 IS NULL, 0, b_d_u_num_less_15) AS b_d_u_num_less_15
	, IF(b_d_u_num_all IS NULL, 0, b_d_u_num_all) AS b_d_u_num_all
	, IF(b_d_no_u_num IS NULL, 0, b_d_no_u_num) AS b_d_no_u_num
	, IF(b_d_use_c_all IS NULL, 0, b_d_use_c_all) AS b_d_use_c_all
	, IF(c_d_u_c_rate IS NULL, 0, c_d_u_c_rate) AS c_d_u_c_rate
	, IF(c_d_u_num_less_15 IS NULL, 0, c_d_u_num_less_15) AS c_d_u_num_less_15
	, IF(c_d_u_num_all IS NULL, 0, c_d_u_num_all) AS c_d_u_num_all
	, IF(c_d_no_u_num IS NULL, 0, c_d_no_u_num) AS c_d_no_u_num
	, IF(b_dis_u_c_rate IS NULL, 0, b_dis_u_c_rate) AS b_dis_u_c_rate
	, IF(b_dis_u_num_less_15 IS NULL, 0, b_dis_u_num_less_15) AS b_dis_u_num_less_15
	, IF(b_dis_u_num_all IS NULL, 0, b_dis_u_num_all) AS b_dis_u_num_all
	, IF(b_dis_no_u_num IS NULL, 0, b_dis_no_u_num) AS b_dis_no_u_num
	, IF(user_dis_u_c_rate IS NULL, 0, user_dis_u_c_rate) AS user_dis_u_c_rate
	, IF(user_dis_u_num_less_15 IS NULL, 0, user_dis_u_num_less_15) AS user_dis_u_num_less_15
	, IF(user_dis_u_num_all IS NULL, 0, user_dis_u_num_all) AS user_dis_u_num_all
	, IF(user_dis_no_u_num IS NULL, 0, user_dis_no_u_num) AS user_dis_no_u_num
	, IF(user_c_u_c_rate IS NULL, 0, user_c_u_c_rate) AS user_c_u_c_rate
	, IF(user_c_u_num_less_15 IS NULL, 0, user_c_u_num_less_15) AS user_c_u_num_less_15
	, IF(user_c_u_num_all IS NULL, 0, user_c_u_num_all) AS user_c_u_num_all
	, IF(user_c_no_u_num IS NULL, 0, user_c_no_u_num) AS user_c_no_u_num
	, IF(user_d_u_c_rate IS NULL, 0, user_d_u_c_rate) AS user_d_u_c_rate
	, IF(user_d_u_num_less_15 IS NULL, 0, user_d_u_num_less_15) AS user_d_u_num_less_15
	, IF(user_d_u_num_all IS NULL, 0, user_d_u_num_all) AS user_d_u_num_all
	, IF(user_d_no_u_num IS NULL, 0, user_d_no_u_num) AS user_d_no_u_num
	, IF(user_d_use_c_all IS NULL, 0, user_d_use_c_all) AS user_d_use_c_all
	, IF(user_b_u_c_rate IS NULL, 0, user_b_u_c_rate) AS user_b_u_c_rate
	, IF(user_b_u_num_less_15 IS NULL, 0, user_b_u_num_less_15) AS user_b_u_num_less_15
	, IF(user_b_u_num_all IS NULL, 0, user_b_u_num_all) AS user_b_u_num_all
	, IF(user_b_no_u_num IS NULL, 0, user_b_no_u_num) AS user_b_no_u_num
	, IF(user_b_use_c_all IS NULL, 0, user_b_use_c_all) AS user_b_use_c_all
FROM (
	SELECT a.*
		, b.user_u_c_rate
		, b.user_u_num_less_15
		, b.user_u_num_all
		, b.user_no_u_num
		, b.user_use_c_all
		,b.user_get_c_num 
		, c.b_u_c_rate
		, c.b_u_num_less_15
		, c.b_u_num_all
		, c.b_no_u_num
		, c.b_use_c_all
		,c.b_get_c_num 
		, n.d_u_c_rate
		, n.d_u_num_less_15
		, n.d_u_num_all
		, n.d_no_u_num
		, n.d_use_c_all
		, e.dis_u_c_rate
		, e.dis_u_num_less_15
		, e.dis_u_num_all
		, e.dis_no_u_num
		, e.dis_use_c_all
		, f.c_u_c_rate
		, f.c_u_num_less_15
		, f.c_u_num_all
		, f.c_no_u_num
		, f.c_use_c_all
		,f.c_get_c_num 
		, j.b_d_u_c_rate
		, j.b_d_u_num_less_15
		, j.b_d_u_num_all
		, j.b_d_no_u_num
		, j.b_d_use_c_all
		, h.c_d_u_c_rate
		, h.c_d_u_num_less_15
		, h.c_d_u_num_all
		, h.c_d_no_u_num
		, i.b_dis_u_c_rate
		, i.b_dis_u_num_less_15
		, i.b_dis_u_num_all
		, i.b_dis_no_u_num
		, g.user_dis_u_c_rate
		, g.user_dis_u_num_less_15
		, g.user_dis_u_num_all
		, g.user_dis_no_u_num
		, k.user_c_u_c_rate
		, k.user_c_u_num_less_15
		, k.user_c_u_num_all
		, k.user_c_no_u_num
		, l.user_d_u_c_rate
		, l.user_d_u_num_less_15
		, l.user_d_u_num_all
		, l.user_d_no_u_num
		, l.user_d_use_c_all
		, m.user_b_u_c_rate
		, m.user_b_u_num_less_15
		, m.user_b_u_num_all
		, m.user_b_no_u_num
		, m.user_b_use_c_all
	FROM featrue_7_last_time a
	LEFT OUTER JOIN user_prior_month_123456 b
	ON a.user_id = b.user_id
	LEFT OUTER JOIN b_prior_month_123456 c
	ON c.merchant_id = a.merchant_id
	LEFT OUTER JOIN d_prior_month_123456 n
	ON n.distance = a.distance
	LEFT OUTER JOIN dis_prior_month_123456 e
	ON e.discount_rate = a.discount_rate
	LEFT OUTER JOIN c_prior_month_123456 f
	ON f.coupon_id = a.coupon_id
	LEFT OUTER JOIN b_d_prior_month_123456 j
	ON j.merchant_id = a.merchant_id
		AND j.distance = a.distance
	LEFT OUTER JOIN c_d_prior_month_123456 h
	ON h.coupon_id = a.coupon_id
		AND h.distance = a.distance
	LEFT OUTER JOIN b_dis_prior_month_123456 i
	ON i.merchant_id = a.merchant_id
		AND i.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_dis_prior_month_123456 g
	ON g.user_id = a.user_id
		AND g.discount_rate = a.discount_rate
	LEFT OUTER JOIN user_c_prior_month_123456 k
	ON k.user_id = a.user_id
		AND k.coupon_id = a.coupon_id
	LEFT OUTER JOIN user_d_prior_month_123456 l
	ON l.user_id = a.user_id
		AND l.distance = l.distance
	LEFT OUTER JOIN user_b_prior_month_123456 m
	ON m.user_id = a.user_id
		AND m.merchant_id = a.merchant_id
) t


--trian data

CREATE TABLE featrue_label_last_time
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_last_time
			UNION ALL
			SELECT *
			FROM featrue_label_3_last_time
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_last_time
			UNION ALL
			SELECT *
			FROM featrue_label_5_last_time
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_last_time
) t4;

drop table featrue_label_statistic;
CREATE TABLE featrue_label_statistic
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_statistic
			UNION ALL
			SELECT *
			FROM featrue_label_3_statistic
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_statistic
			UNION ALL
			SELECT *
			FROM featrue_label_5_statistic
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_statistic
) t4;


----------判断是否为当月最后一次领券

-----2-----
CREATE TABLE featrue_label_2_flag
AS
SELECT a.*
	, IF(a.date_received = b.last_received_time, 1, 0) AS flag
FROM featrue_label_2_last_time a
LEFT OUTER JOIN user_c_last_received_time_2 b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
------------3-------
CREATE TABLE featrue_label_3_flag
AS
SELECT a.*
	, IF(a.date_received = b.last_received_time, 1, 0) AS flag
FROM featrue_label_3_last_time a
LEFT OUTER JOIN user_c_last_received_time_3 b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id

-------4---------
CREATE TABLE featrue_label_4_flag
AS
SELECT a.*
	, IF(a.date_received = b.last_received_time, 1, 0) AS flag
FROM featrue_label_4_last_time a
LEFT OUTER JOIN user_c_last_received_time_4 b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
--------5
CREATE TABLE featrue_label_5_flag
AS
SELECT a.*
	, IF(a.date_received = b.last_received_time, 1, 0) AS flag
FROM featrue_label_5_last_time a
LEFT OUTER JOIN user_c_last_received_time_5 b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
------6------
CREATE TABLE featrue_label_6_flag
AS
SELECT a.*
	, IF(a.date_received = b.last_received_time, 1, 0) AS flag
FROM featrue_label_6_last_time a
LEFT OUTER JOIN user_c_last_received_time_6 b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id
--------7-------
CREATE TABLE featrue_7_flag
AS
SELECT a.*
	, IF(a.date_received = b.last_received_time, 1, 0) AS flag
FROM featrue_7_last_time a
LEFT OUTER JOIN user_c_last_received_time_7 b
ON a.user_id = b.user_id
	AND a.coupon_id = b.coupon_id

----train_data
CREATE TABLE featrue_label_flag
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_flag
			UNION ALL
			SELECT *
			FROM featrue_label_3_flag
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_flag
			UNION ALL
			SELECT *
			FROM featrue_label_5_flag
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_flag
) t4;


