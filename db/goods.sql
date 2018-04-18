drop table if exists tb_category;

/*==============================================================*/
/* Table: tb_category                                           */
/*==============================================================*/
create table tb_category
(
   category_id          bigint not null AUTO_INCREMENT COMMENT '分类ID',
   name                 varchar(20) COMMENT '分类名',
   parent_id            bigint COMMENT '父类ID',
   urlname              varchar(100) COMMENT 'url路径',
   level                smallint COMMENT '等级',
   icon                  varchar(20) COMMENT '小图标',
   description          varchar(200) COMMENT '描述',
   keywords             varchar(200) COMMENT '关键字',
   primary key (category_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='分类' AUTO_INCREMENT=1;


drop table if exists tb_user;

/*==============================================================*/
/* Table: tb_user                                               */
/*==============================================================*/
create table tb_user
(
   user_id              bigint not null AUTO_INCREMENT COMMENT '用户ID',
   username             varchar(50) not null COMMENT '用户姓名',
   mobile               varchar(20) not null COMMENT '手机号',
   create_time          datetime COMMENT '创建时间',
   password             varchar(64) COMMENT '密码',
   img                  varchar(200) COMMENT '小图标',
   address              bigint COMMENT '默认地址',
   primary key (user_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户' AUTO_INCREMENT=1;

drop table if exists tb_province;

/*==============================================================*/
/* Table: tb_province     省份表                                      */
/*==============================================================*/
create table tb_province
(
   province_id          int not null AUTO_INCREMENT COMMENT '省份ID',
   name                 varchar(30) COMMENT '省份名称',
   primary key (province_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='省份' AUTO_INCREMENT=1;

drop table if exists tb_city;

/*==============================================================*/
/* Table: tb_city   城市表                                            */
/*==============================================================*/
create table tb_city
(
   city_id              int not null AUTO_INCREMENT COMMENT '城市ID',
   province_id          int COMMENT '省份ID',
   name                 varchar(30) COMMENT '城市名称',
   zipcode              varchar(50) COMMENT '邮政编码',
   primary key (city_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='城市' AUTO_INCREMENT=1;

alter table tb_city add constraint FK_Relationship_8 foreign key (province_id)
      references tb_province (province_id) on delete restrict on update restrict;

	  
drop table if exists tb_region;

/*==============================================================*/
/* Table: tb_region        县区                                     */
/*==============================================================*/
create table tb_region
(
   region_id            int not null AUTO_INCREMENT COMMENT '县区ID',
   city_id              int COMMENT '城市ID',
   name                 varchar(30) COMMENT '县区名称',
   primary key (region_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='县区' AUTO_INCREMENT=1;

alter table tb_region add constraint FK_Relationship_9 foreign key (city_id)
      references tb_city (city_id) on delete restrict on update restrict;
	  
drop table if exists tb_town;

/*==============================================================*/
/* Table: tb_town                                               */
/*==============================================================*/
create table tb_town
(
   town_id              int not null AUTO_INCREMENT COMMENT '城镇ID',
   region_id            int COMMENT '县区ID',
   name                 varchar(30) COMMENT '城镇名称',
   primary key (town_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='城镇' AUTO_INCREMENT=1;

alter table tb_town add constraint FK_Relationship_10 foreign key (region_id)
      references tb_region (region_id) on delete restrict on update restrict;
	  
	  
	  
drop table if exists tb_user_address;

/*==============================================================*/
/* Table: tb_user_address                                       */
/*==============================================================*/
create table tb_user_address
(
   address_id           bigint not null AUTO_INCREMENT COMMENT '地址ID',
   user_id              bigint COMMENT '用户ID',
   name                 varchar(50) COMMENT '用户姓名',
   province_id          int COMMENT '省份ID',
   city_id              int COMMENT '城市ID',
   region_id            int COMMENT '县区ID',
   town_id              int COMMENT '城镇ID',
   province_name        varchar(50) COMMENT '省份名称',
   city_name            varchar(50) COMMENT '城市名称',
   region_name          varchar(50) COMMENT '县区名称',
   town_name            varchar(50) COMMENT '城镇名称',
   address              varchar(255) COMMENT '详细地址',
   telephone            varchar(30) COMMENT '电话号',
   mobile               varchar(30) COMMENT '手机号',
   default_addr         int COMMENT '是否为默认地址',
   primary key (address_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户地址' AUTO_INCREMENT=1;

alter table tb_user_address add constraint FK_tb_user_addr foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;
	  
alter table tb_user_address add constraint FK_tb_user_address_province foreign key (province_id)
      references tb_province (province_id) on delete restrict on update restrict;

alter table tb_user_address add constraint FK_tb_user_address_city foreign key (city_id)
      references tb_city (city_id) on delete restrict on update restrict;


alter table tb_user_address add constraint FK_tb_user_address_region foreign key (region_id)
      references tb_region (region_id) on delete restrict on update restrict;

alter table tb_user_address add constraint FK_tb_user_address_town foreign key (town_id)
      references tb_town (town_id) on delete restrict on update restrict;


	  
drop table if exists tb_goods;

/*==============================================================*/
/* Table: tb_goods                                              */
/*==============================================================*/
create table tb_goods
(
   goods_id             int not null AUTO_INCREMENT COMMENT '商品ID',
   user_id              bigint COMMENT '用户ID',
   category_id          bigint COMMENT '分类ID',
   name                 varchar(200) not null COMMENT '商品名称',
   price                numeric(10,2) not null COMMENT '价格',
   newprice             numeric(10,2) COMMENT '新货价格',
   status               smallint not null COMMENT '状态',
   addtime              int COMMENT '添加时间',
   updatetime           int COMMENT '更新时间',
   description          text COMMENT '商品描述',
   primary key (goods_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品' AUTO_INCREMENT=1;


drop table if exists tb_comments;

/*==============================================================*/
/* Table: tb_comments                                           */
/*==============================================================*/
create table tb_comments
(
   comment_id           bigint not null AUTO_INCREMENT COMMENT '评价ID',
   content              varchar(1000) COMMENT '评价内容',
   star                 smallint COMMENT '星级',
   is_anon              smallint COMMENT '是否匿名',
   create_time          datetime COMMENT '添加时间',
   primary key (comment_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='评论' AUTO_INCREMENT=1;

drop table if exists tb_order;

/*==============================================================*/
/* Table: tb_order                                              */
/*==============================================================*/
create table tb_order
(
   order_id             bigint not null AUTO_INCREMENT COMMENT '订单ID',
   goods_id             int COMMENT '商品ID',
   comment_id           bigint COMMENT '评价ID',
   user_id              bigint COMMENT '用户ID',
   订单时间                 datetime not null COMMENT '订单时间',
   is_comment           smallint COMMENT '是否评价',
   status               smallint COMMENT '订单状态',
   remark               varchar(200) COMMENT '备注',
   primary key (order_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='订单' AUTO_INCREMENT=1;

alter table tb_order add constraint FK_Relationship_7 foreign key (comment_id)
      references tb_comments (comment_id) on delete restrict on update restrict;

alter table tb_order add constraint FK_goods_many foreign key (goods_id)
      references tb_goods (goods_id) on delete restrict on update restrict;

alter table tb_order add constraint FK_tb_user_order foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

	  

drop table if exists tb_goods_images;

/*==============================================================*/
/* Table: tb_goods_images                                       */
/*==============================================================*/
create table tb_goods_images
(
   good_image_id        bigint not null AUTO_INCREMENT COMMENT '商品图片ID',
   goods_id             int COMMENT '商品ID',
   name					varchar(50) COMMENT '图片名称',
   type                 varchar(20) COMMENT '图片类型',
   local_path           varchar(200) COMMENT'图片缓存地址',
   path_key             varchar(200) COMMENT '云存储key',
   primary key (good_image_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8  COMMENT='商品图片' AUTO_INCREMENT=1;


	  
	  