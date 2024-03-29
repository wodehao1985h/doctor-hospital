CREATE TABLE `patient` (
  `patient_id` bigint(20) NOT NULL COMMENT '主键ID',
  `user_id` bigint(20) DEFAULT NULL,
  `patient_card_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '患者CardID',
  `patient_name` varchar(128) DEFAULT NULL COMMENT '患者名',
  `gender` tinyint(2) DEFAULT '-1' COMMENT '-1未知，2女，1男',
  `medical_record_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '病历',
  `birthday` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出生日期',
  `nationality` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '国籍',
  `id_card_no` varchar(45) DEFAULT NULL COMMENT 'ID_card_no',
  `mi_card_no` varchar(45) DEFAULT NULL COMMENT 'MI_card_no',
  `phone_no` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '患者电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `occupation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职业',
  `linkman` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人',
  `payer` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '付款人',
  `pay_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '付款人类型',
  `hospital_id` bigint(20) DEFAULT NULL COMMENT '医院ID',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `patient_pinyin` varchar(128) DEFAULT NULL COMMENT '患者名拼音',
  `age` double DEFAULT NULL COMMENT '年龄',
  `age_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '年龄单位',
  `linkman_phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人手机',
  `comment` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论',
  `diagnosis_date` datetime DEFAULT NULL COMMENT '就诊时间',
  `flag` tinyint(2) DEFAULT '1' COMMENT '删除标志位: 0： 已废弃   1：正常',
  `target_patient_id` bigint(20) DEFAULT NULL COMMENT '患者合并到新的患者ID',
  `patient_description` varchar(1000) DEFAULT NULL COMMENT '患者端病情描述',
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='患者';

CREATE TABLE `prescription_base` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(32) NOT NULL DEFAULT '0' COMMENT '用户id',
  `image_url` varchar(2048) DEFAULT NULL COMMENT '处方图片URL',
  `prescription_number` varchar(50) DEFAULT NULL COMMENT '处方单号',
  `prescription_date` timestamp NULL DEFAULT NULL COMMENT '处方日期',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '-1:删除 0:正常',
  `business_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '连锁ID',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型1、特管药品信息 2、处方信息',
  `record_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否登记 0、新建 1、未登记  2、已登记',
  `customer` varchar(32) NOT NULL DEFAULT '' COMMENT '顾客姓名',
  `customer_sex` tinyint(3) NOT NULL DEFAULT '0' COMMENT '顾客性别:1=男 2=女 0=未登记',
  `customer_age` int(2) NOT NULL DEFAULT '0' COMMENT '顾客年龄',
  `customer_tel` varchar(16) NOT NULL DEFAULT '' COMMENT '顾客联系方式',
  `record_time` timestamp NULL DEFAULT NULL COMMENT '登记时间',
  `store_user_id` bigint(20) DEFAULT NULL COMMENT '店员id',
  `store_user_name` varchar(20) DEFAULT NULL COMMENT '店员姓名',
  `store_user_phone` varchar(16) DEFAULT NULL COMMENT '店员手机号',
  `approve_type` tinyint(3) DEFAULT NULL COMMENT '审核方式 1:系统 2:人工 ',
  `approve_status` tinyint(3) DEFAULT NULL COMMENT '审核状态0:未审核 1:审核中 2:审核通过 3:审核不通过',
  `incompatible_status` tinyint(3) DEFAULT NULL COMMENT '配伍禁忌审核状态0:不通过 1:通过 ',
  `button_status` tinyint(3) DEFAULT NULL,
  `reject_reason` varchar(1024) DEFAULT NULL COMMENT '拒绝原因',
  `incompatible_reject_reason` varchar(512) DEFAULT NULL COMMENT '配伍禁忌拒绝原因',
  `pharmacist_id` bigint(20) DEFAULT NULL COMMENT '药师id',
  `pharmacist_name` varchar(20) DEFAULT NULL COMMENT '药师姓名',
  `approve_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `approve_level` tinyint(3) DEFAULT NULL COMMENT '审核级别1:连锁 2:平台 3:总部',
  `comment` varchar(1024) DEFAULT NULL COMMENT '补充说明',
  `channle` tinyint(3) DEFAULT NULL COMMENT '处方渠道1:HIS 2:DTP 3:POS',
  `approve_channle` tinyint(3) DEFAULT NULL COMMENT '审核渠道：1PC，2智店通',
  `hospital_name` varchar(50) DEFAULT NULL COMMENT '处方医院',
  `doctor_name` varchar(50) DEFAULT NULL COMMENT '处方医生',
  `record_id` bigint(20) DEFAULT NULL COMMENT '问诊Id',
  `extend` varchar(5000) DEFAULT NULL COMMENT '扩展字段',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号 ',
  `created_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) unsigned DEFAULT '0' COMMENT '修改人',
  `gmt_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_biz_store_user_phone` (`business_id`,`store_user_phone`) USING BTREE,
  KEY `idx_biz_store_user_name` (`business_id`,`store_user_name`) USING BTREE,
  KEY `idx_biz_pharmacist_name` (`business_id`,`pharmacist_name`) USING BTREE,
  KEY `idx_biz_store` (`business_id`,`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='处方基础表';

CREATE TABLE `prescription_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `prescription_id` bigint(20) unsigned NOT NULL COMMENT 'base表id',
  `medicine_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `medicine_image` varchar(512) DEFAULT NULL COMMENT '药品图片',
  `medicine_name` varchar(100) DEFAULT NULL COMMENT '药品名称',
  `medicine_common_name` varchar(100) DEFAULT NULL COMMENT '药品通用名称',
  `medicine_code` varchar(50) DEFAULT NULL COMMENT '药品编码',
  `medicine_specification` varchar(100) DEFAULT NULL COMMENT '药品规格',
  `medicine_batch_no` varchar(100) DEFAULT NULL COMMENT '生产批次',
  `medicine_manufacturer` varchar(100) DEFAULT NULL COMMENT '生产厂家',
  `medicine_unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `quantity` int(11) DEFAULT NULL COMMENT '药品数量',
  `drug_type` tinyint(3) DEFAULT NULL COMMENT '1成药处方 2饮片处方',
  `prescription_no` varchar(32) DEFAULT NULL COMMENT '处方编号',
  `unit` varchar(15) DEFAULT NULL COMMENT '单位',
  `daily_dosage` int(11) unsigned DEFAULT NULL COMMENT '每日剂量',
  `requirement` varchar(45) DEFAULT NULL COMMENT '用法',
  `total_dosage_unit` varchar(45) DEFAULT NULL COMMENT '开药单位',
  `total_dosage` double DEFAULT NULL COMMENT '开药量',
  `dosage_unit` varchar(45) DEFAULT NULL COMMENT '剂量单位',
  `frequency` varchar(45) DEFAULT NULL COMMENT '用药频率',
  `usage` varchar(45) DEFAULT NULL COMMENT '用法',
  `dosage` varchar(45) DEFAULT NULL COMMENT '剂量',
  `created_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) unsigned DEFAULT '0' COMMENT '修改人',
  `gmt_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `extend` varchar(3000) DEFAULT NULL COMMENT '扩展字段',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  KEY `medicine_id` (`medicine_id`) USING BTREE,
  KEY `idx_presid` (`prescription_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3892 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='处方明细表';

CREATE TABLE `prescription_extend` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `prescription_id` bigint(20) DEFAULT NULL COMMENT 'base表id',
  `order_id` varchar(64) DEFAULT NULL COMMENT '订单id（DTP,POS）',
  `pos_record_id` bigint(32) DEFAULT NULL COMMENT '顾客基本信息id（POS）',
  `hospital_id` bigint(255) DEFAULT NULL COMMENT '处方医院id（DTP）',
  `doctor_id` bigint(255) DEFAULT NULL COMMENT '处方医生id（DTP）',
  `disease_description` varchar(255) DEFAULT NULL COMMENT '疾病描述（DTP）',
  `env` varchar(50) DEFAULT NULL COMMENT '环境（DTP）',
  `department` varchar(255) DEFAULT NULL COMMENT '科室（DTP）',
  `doctor_advice` varchar(1024) DEFAULT NULL COMMENT '医嘱 (HIS)',
  `disease_name` varchar(1024) DEFAULT NULL COMMENT '疾病名 (HIS)',
  `previous_history` varchar(255) DEFAULT NULL COMMENT '过敏史 (HIS)',
  `allergy_history` varchar(255) DEFAULT NULL COMMENT '继往史 (HIS)',
  `symptom` varchar(255) DEFAULT NULL COMMENT '主诉/现病史 (HIS)',
  `doctor_title` varchar(255) DEFAULT NULL COMMENT '职称 (HIS)',
  `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单是否完成 0：新建，1：已完成 （POS）',
  `customer_identity` varchar(32) NOT NULL DEFAULT '' COMMENT '顾客身份证（POS）',
  `customer_address` varchar(256) NOT NULL DEFAULT '' COMMENT '顾客地址（POS）',
  `created_by_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人name （POS）',
  `created_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) unsigned DEFAULT '0' COMMENT '修改人',
  `gmt_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_hospital_id` (`hospital_id`) USING BTREE,
  KEY `idx_presid` (`prescription_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='处方扩展表';