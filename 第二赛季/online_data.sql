
	
CREATE TABLE user_online_1
AS
SELECT user_id
	, SUM(IF(action = '0', 1, 0)) AS user_only_click_num
	, SUM(IF(action = '1', 1, 0)) AS user_buy_num
	, SUM(IF(action = '2', 1, 0)) AS user_only_get_num
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) AS user_have_coupon_and_buy_num
	, COUNT(action) AS num_all
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) / CAST(COUNT(action) AS DOUBLE) AS ctr
FROM online_data_1
GROUP BY user_id;

CREATE TABLE user_online_2
AS
SELECT user_id
	, SUM(IF(action = '0', 1, 0)) AS user_only_click_num
	, SUM(IF(action = '1', 1, 0)) AS user_buy_num
	, SUM(IF(action = '2', 1, 0)) AS user_only_get_num
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) AS user_have_coupon_and_buy_num
	, COUNT(action) AS num_all
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) / CAST(COUNT(action) AS DOUBLE) AS ctr
FROM online_data_2
GROUP BY user_id;

CREATE TABLE user_online_3
AS
SELECT user_id
	, SUM(IF(action = '0', 1, 0)) AS user_only_click_num
	, SUM(IF(action = '1', 1, 0)) AS user_buy_num
	, SUM(IF(action = '2', 1, 0)) AS user_only_get_num
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) AS user_have_coupon_and_buy_num
	, COUNT(action) AS num_all
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) / CAST(COUNT(action) AS DOUBLE) AS ctr
FROM online_data_3
GROUP BY user_id;

CREATE TABLE user_online_4
AS
SELECT user_id
	, SUM(IF(action = '0', 1, 0)) AS user_only_click_num
	, SUM(IF(action = '1', 1, 0)) AS user_buy_num
	, SUM(IF(action = '2', 1, 0)) AS user_only_get_num
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) AS user_have_coupon_and_buy_num
	, COUNT(action) AS num_all
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) / CAST(COUNT(action) AS DOUBLE) AS ctr
FROM online_data_4
GROUP BY user_id;

CREATE TABLE user_online_5
AS
SELECT user_id
	, SUM(IF(action = '0', 1, 0)) AS user_only_click_num
	, SUM(IF(action = '1', 1, 0)) AS user_buy_num
	, SUM(IF(action = '2', 1, 0)) AS user_only_get_num
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) AS user_have_coupon_and_buy_num
	, COUNT(action) AS num_all
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) / CAST(COUNT(action) AS DOUBLE) AS ctr
FROM online_data_5
GROUP BY user_id;

CREATE TABLE user_online_6
AS
SELECT user_id
	, SUM(IF(action = '0', 1, 0)) AS user_only_click_num
	, SUM(IF(action = '1', 1, 0)) AS user_buy_num
	, SUM(IF(action = '2', 1, 0)) AS user_only_get_num
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) AS user_have_coupon_and_buy_num
	, COUNT(action) AS num_all
	, SUM(IF(action = '1'
	AND date_received <> 'null', 1, 0)) / CAST(COUNT(action) AS DOUBLE) AS ctr
FROM online_data_6
GROUP BY user_id;
-----------------------------转化线上数据特征
--二月
CREATE TABLE featrue_label_2_have_online
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
	, IF(user_only_click_num IS NULL, 0, user_only_click_num) AS user_only_click_num
	, IF(user_buy_num IS NULL, 0, user_buy_num) AS user_buy_num
	, IF(user_only_get_num IS NULL, 0, user_only_get_num) AS user_only_get_num
	, IF(user_have_coupon_and_buy_num IS NULL, 0, user_have_coupon_and_buy_num) AS user_have_coupon_and_buy_num
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(ctr IS NULL, 0, ctr) AS ctr
FROM (
	SELECT a.*
		, b.user_only_click_num
		, b.user_buy_num
		, b.user_only_get_num
		, b.user_have_coupon_and_buy_num
		, b.num_all
		, b.ctr
	FROM featrue_label_2_statistic a
	LEFT OUTER JOIN user_online_1 b
	ON a.user_id = b.user_id
) t;

--三月
CREATE TABLE featrue_label_3_have_online
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
	, IF(user_only_click_num IS NULL, 0, user_only_click_num) AS user_only_click_num
	, IF(user_buy_num IS NULL, 0, user_buy_num) AS user_buy_num
	, IF(user_only_get_num IS NULL, 0, user_only_get_num) AS user_only_get_num
	, IF(user_have_coupon_and_buy_num IS NULL, 0, user_have_coupon_and_buy_num) AS user_have_coupon_and_buy_num
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(ctr IS NULL, 0, ctr) AS ctr
FROM (
	SELECT a.*
		, b.user_only_click_num
		, b.user_buy_num
		, b.user_only_get_num
		, b.user_have_coupon_and_buy_num
		, b.num_all
		, b.ctr
	FROM featrue_label_3_statistic a
	LEFT OUTER JOIN user_online_2 b
	ON a.user_id = b.user_id
) t;

--四月
CREATE TABLE featrue_label_4_have_online
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
	, IF(user_only_click_num IS NULL, 0, user_only_click_num) AS user_only_click_num
	, IF(user_buy_num IS NULL, 0, user_buy_num) AS user_buy_num
	, IF(user_only_get_num IS NULL, 0, user_only_get_num) AS user_only_get_num
	, IF(user_have_coupon_and_buy_num IS NULL, 0, user_have_coupon_and_buy_num) AS user_have_coupon_and_buy_num
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(ctr IS NULL, 0, ctr) AS ctr
FROM (
	SELECT a.*
		, b.user_only_click_num
		, b.user_buy_num
		, b.user_only_get_num
		, b.user_have_coupon_and_buy_num
		, b.num_all
		, b.ctr
	FROM featrue_label_4_statistic a
	LEFT OUTER JOIN user_online_3 b
	ON a.user_id = b.user_id
) t;

--五月
CREATE TABLE featrue_label_5_have_online
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
	, IF(user_only_click_num IS NULL, 0, user_only_click_num) AS user_only_click_num
	, IF(user_buy_num IS NULL, 0, user_buy_num) AS user_buy_num
	, IF(user_only_get_num IS NULL, 0, user_only_get_num) AS user_only_get_num
	, IF(user_have_coupon_and_buy_num IS NULL, 0, user_have_coupon_and_buy_num) AS user_have_coupon_and_buy_num
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(ctr IS NULL, 0, ctr) AS ctr
FROM (
	SELECT a.*
		, b.user_only_click_num
		, b.user_buy_num
		, b.user_only_get_num
		, b.user_have_coupon_and_buy_num
		, b.num_all
		, b.ctr
	FROM featrue_label_5_statistic a
	LEFT OUTER JOIN user_online_4 b
	ON a.user_id = b.user_id
) t;

--六月
CREATE TABLE featrue_label_6_have_online
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
	, IF(user_only_click_num IS NULL, 0, user_only_click_num) AS user_only_click_num
	, IF(user_buy_num IS NULL, 0, user_buy_num) AS user_buy_num
	, IF(user_only_get_num IS NULL, 0, user_only_get_num) AS user_only_get_num
	, IF(user_have_coupon_and_buy_num IS NULL, 0, user_have_coupon_and_buy_num) AS user_have_coupon_and_buy_num
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(ctr IS NULL, 0, ctr) AS ctr
FROM (
	SELECT a.*
		, b.user_only_click_num
		, b.user_buy_num
		, b.user_only_get_num
		, b.user_have_coupon_and_buy_num
		, b.num_all
		, b.ctr
	FROM featrue_label_6_statistic a
	LEFT OUTER JOIN user_online_5 b
	ON a.user_id = b.user_id
) t;

--七月
CREATE TABLE featrue_7_have_online
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
	, IF(user_only_click_num IS NULL, 0, user_only_click_num) AS user_only_click_num
	, IF(user_buy_num IS NULL, 0, user_buy_num) AS user_buy_num
	, IF(user_only_get_num IS NULL, 0, user_only_get_num) AS user_only_get_num
	, IF(user_have_coupon_and_buy_num IS NULL, 0, user_have_coupon_and_buy_num) AS user_have_coupon_and_buy_num
	, IF(num_all IS NULL, 0, num_all) AS num_all
	, IF(ctr IS NULL, 0, ctr) AS ctr
FROM (
	SELECT a.*
		, b.user_only_click_num
		, b.user_buy_num
		, b.user_only_get_num
		, b.user_have_coupon_and_buy_num
		, b.num_all
		, b.ctr
	FROM featrue_7_statistic a
	LEFT OUTER JOIN user_online_6 b
	ON a.user_id = b.user_id
) t;



---train data

CREATE TABLE featrue_label_have_online
AS
SELECT *
FROM (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_2_have_online
			UNION ALL
			SELECT *
			FROM featrue_label_3_have_online
		) t1
		UNION ALL
		SELECT *
		FROM (
			SELECT *
			FROM featrue_label_4_have_online
			UNION ALL
			SELECT *
			FROM featrue_label_5_have_online
		) t2
	) t3
	UNION ALL
	SELECT *
	FROM featrue_label_6_have_online
) t4;


