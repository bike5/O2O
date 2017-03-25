DROP TABLE IF EXISTS data1;

DROP TABLE IF EXISTS data2;

DROP TABLE IF EXISTS data3;

DROP TABLE IF EXISTS data4;

DROP TABLE IF EXISTS data5;

DROP TABLE IF EXISTS data6;

DROP TABLE IF EXISTS data7;

select * from featrue_label 

--first,there have 'null' coupon_id
CREATE TABLE data1
AS
SELECT *
FROM odps_tc_257100_f673506e024.train_offline_stage2
WHERE SUBSTR(date_received, 5, 2) = '01'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '01';

CREATE TABLE data2
AS
SELECT *
FROM odps_tc_257100_f673506e024.train_offline_stage2
WHERE SUBSTR(date_received, 5, 2) = '02'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '02';

CREATE TABLE data3
AS
SELECT *
FROM odps_tc_257100_f673506e024.train_offline_stage2
WHERE SUBSTR(date_received, 5, 2) = '03'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '03';

CREATE TABLE data4
AS
SELECT *
FROM odps_tc_257100_f673506e024.train_offline_stage2
WHERE SUBSTR(date_received, 5, 2) = '04'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '04';

CREATE TABLE data5
AS
SELECT *
FROM odps_tc_257100_f673506e024.train_offline_stage2
WHERE SUBSTR(date_received, 5, 2) = '05'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '05';

CREATE TABLE data6
AS
SELECT *
FROM odps_tc_257100_f673506e024.train_offline_stage2
WHERE SUBSTR(date_received, 5, 2) = '06'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '06';

CREATE TABLE data7
AS
SELECT *
FROM odps_tc_257100_f673506e024.prediction_stage2;


DROP TABLE data_label;


CREATE TABLE data_label_1
AS
SELECT *
	, IF(date_pay <> 'null'
	AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15, 1, 0) AS label
FROM data1
WHERE coupon_id <> 'null';

CREATE TABLE data_label_2
AS
SELECT *
	, IF(date_pay <> 'null'
	AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15, 1, 0) AS label
FROM data2
WHERE coupon_id <> 'null';

CREATE TABLE data_label_3
AS
SELECT *
	, IF(date_pay <> 'null'
	AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15, 1, 0) AS label
FROM data3
WHERE coupon_id <> 'null';

CREATE TABLE data_label_4
AS
SELECT *
	, IF(date_pay <> 'null'
	AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15, 1, 0) AS label
FROM data4
WHERE coupon_id <> 'null';

CREATE TABLE data_label_5
AS
SELECT *
	, IF(date_pay <> 'null'
	AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15, 1, 0) AS label
FROM data5
WHERE coupon_id <> 'null';

CREATE TABLE data_label_6
AS
SELECT *
	, IF(date_pay <> 'null'
	AND datediff(TO_DATE(date_pay, 'yyyymmdd'), TO_DATE(date_received, 'yyyymmdd'), 'dd') < 15, 1, 0) AS label
FROM data6
WHERE coupon_id <> 'null';

create table data_label_12 as
select * from
(select * from data_label_1 union all select * from data_label_2) t1;

create table data_label_123 as
select * from
(select * from data_label_12 union all select * from data_label_3) t1;

create table data_label_1234 as
select * from
(select * from data_label_123 union all select * from data_label_4) t1;

create table data_label_12345 as
select * from
(select * from data_label_1234 union all select * from data_label_5) t1;

create table data_label_123456 as
select * from
(select * from data_label_12345 union all select * from data_label_6) t1;


----分割线上数据

CREATE TABLE online_data
AS
SELECT a.*
FROM odps_tc_257100_f673506e024.train_online_stage2 a
JOIN (
	SELECT user_id
	FROM data7
	GROUP BY user_id
) b
ON a.user_id = b.user_id



CREATE TABLE online_data_1
AS
SELECT *
FROM online_data
WHERE SUBSTR(date_received, 5, 2) = '01'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '01';

CREATE TABLE online_data_2
AS
SELECT *
FROM online_data
WHERE SUBSTR(date_received, 5, 2) = '02'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '02';

CREATE TABLE online_data_3
AS
SELECT *
FROM online_data
WHERE SUBSTR(date_received, 5, 2) = '03'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '03';

CREATE TABLE online_data_4
AS
SELECT *
FROM online_data
WHERE SUBSTR(date_received, 5, 2) = '04'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '04';

CREATE TABLE online_data_5
AS
SELECT *
FROM online_data
WHERE SUBSTR(date_received, 5, 2) = '05'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '05';

CREATE TABLE online_data_6
AS
SELECT *
FROM online_data
WHERE SUBSTR(date_received, 5, 2) = '06'
	OR date_received = 'null'
	AND SUBSTR(date_pay, 5, 2) = '06';



