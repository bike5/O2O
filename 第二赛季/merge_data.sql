DROP TABLE IF EXISTS data12;

DROP TABLE IF EXISTS data123;

DROP TABLE IF EXISTS data1234;

DROP TABLE IF EXISTS data12345;

DROP TABLE IF EXISTS data123456;

--data1 data2 data3....coupon_id must be have 'null',all data information;

CREATE TABLE data12
AS
SELECT *
FROM (
	SELECT *
	FROM data1
	UNION ALL
	SELECT *
	FROM data2
) a;

CREATE TABLE data123
AS
SELECT *
FROM (
	SELECT *
	FROM data12
	UNION ALL
	SELECT *
	FROM data3
) b;

CREATE TABLE data1234
AS
SELECT *
FROM (
	SELECT *
	FROM data123
	UNION ALL
	SELECT *
	FROM data4
) c;

CREATE TABLE data12345
AS
SELECT *
FROM (
	SELECT *
	FROM data1234
	UNION ALL
	SELECT *
	FROM data5
) d;

CREATE TABLE data123456
AS
SELECT *
FROM (
	SELECT *
	FROM data12345
	UNION ALL
	SELECT *
	FROM data6
) e;



select * from (select discount_rate,sum(if(date_pay<>'null',1,0)) as a from data12345 group by discount_rate) b order by a limit 1000



a.discount_rate, '0.2', 0, '0.5', 1, '0.6', 2, '0.7', 3, '0.75', 4, '0.8', 5, '0.85', 6, '0.9', 7, '0.95', 8, '100:1', 9, '100:10', 10, '100:20', 11, '100:30', 12, '100:5', 13, '100:50', 14, '10:1', 15, '10:5', 16, '150:10', 17, '150:20', 18, '200:10', 19, '200:20', 20, '200:30', 21, '200:5', 22, '200:50', 23, '20:1', 24, '20:10', 25, '20:5', 26, '300:30', 27, '30:1', 28, '30:10', 29, '30:20', 30, '30:5', 31, '50:1', 32, '50:10', 33, '50:20', 34, '50:5', 35, 36

















