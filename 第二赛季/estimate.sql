drop table o2o_result ;
select * from o2o_result ;

select count(*) from  odps_tc_257100_f673506e024.train_offline_stage2 where coupon_id<>'null' group by user_id,coupon_id;

select * from featrue_7



alter table o2o_result rename to o2o_result_next;

alter table o2o_result_2 rename to o2o_result;

--去掉重复特征且参数为
--树的数目：500 学习率：0.05 样本抽样：1 特征采样：1 最大叶子数：200 测试数据比例：0 数最大深度：6 叶节点最少样本数：500 种子数：0 特征分类：500
--0.70015

--有重复特征且无调参
--线下：0.65615
--0.70509088 

--有重复特征且无调参,加上1月份统计
--线下：0.6563981027965156

--去掉重复特征且无调参，加上1月份统计
--线下：0.6565580556439823
--0.70580071

--加上时间，两个字段联合
--线下：0.7194215800001517
--线上：0.7154

--加时间，无两个字段和时间的联合
--线下：0.7206294348650938
--0.71857

--加上最后消费时间，且当月有两个字段和时间的联合,去掉 b_c_d、 b_dis_d、 c_dis_d
--线下： 0.7337647718668434
--0.73355

--加上最后消费时间，且当月有两个字段和时间的联合,去掉 b_c_d、 b_dis_d、 c_dis_d、前几个月统计信息
--线下： 0.736019020365392
--0.73660

--加上最后消费时间，且当月有两个字段和时间的联合,去掉 b_c_d、 b_dis_d、 c_dis_d、前几个月统计信息（只有user、b、c的信息）
--线下：0.7360594625579183
--

--0.7572562976925336
--0.7585231417699347 null距离设为11

-----0.7566928906436764 discount_rate转成阈值
-----0.7579742948865807
----0.758991846552562

------0.761098093418025

select count(*) from data_label_123456 a join data7 b on a.coupon_id =b.coupon_id 


--estimate:  feature_label_2345   --feature_label_6


select count(label) from featrue_label where label=1;
select count(label) from featrue_label where label=0;
--负样本：	5721980 正样本：485378 不均衡
select count(label) from featrue_label_1  where label=1;
select count(label) from featrue_label_1 where label=0;
--负样本：	3309489 正样本：87844 不均衡


select user_id,date_received,count(label)  from data_label_1 where label = 1 group by date_received,user_id;
select user_id,date_received,count(label)  from data_label_2 where label = 1 group by date_received,user_id;
select user_id,date_received,count(label)  from data_label_3 where label = 1 group by date_received,user_id;
select user_id,date_received,count(label)  from data_label_4 where label = 1 group by date_received,user_id;
select user_id,date_received,count(label)  from data_label_5 where label = 1 group by date_received,user_id;
select user_id,date_received,count(label)  from data_label_6 where label = 1 group by date_received,user_id;

--看特征的个数或者大小和label有没有正相关
SELECT SUM(IF(label = 1, 1, 0)) AS num_1
	, SUM(IF(label = 1, 0, 1)) AS num_0
FROM (
	SELECT user_b_u_c_rate
		, label
	FROM featrue_label_statistic
	ORDER BY 
	user_b_u_c_rate
	LIMIT 1000000
) t;


select * from pai_temp_17333_330588_1 order by feature_importance limit 89;



select * from data_label_2 order by user_id limit 10000
select * from data_label_5 order by user_id limit 10000
select * from featrue_label_5_flag_plus2 order by user_id limit 10000
select * from prj_tc_53354_8884afb138a2.feats_3_5_old_v12