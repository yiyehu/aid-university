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
   path_key				varchar(200) COMMENT '云存储key',
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
   addtime              datetime COMMENT '添加时间',
   updatetime           datetime COMMENT '更新时间',
   goods_address		varchar(200) COMMENT '商品地址',
   description          varchar(200) COMMENT '商品描述',
   decoration           text COMMENT '商品装潢',
   primary key (goods_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品' AUTO_INCREMENT=1;


drop table if exists tb_comments;

/*==============================================================*/
/* Table: tb_comments                                           */
/*==============================================================*/
create table tb_comments
(
   comment_id           bigint not null AUTO_INCREMENT COMMENT '评价ID',
   order_id             bigint COMMENT '订单ID',
   content              varchar(1000) COMMENT '评价内容',
   star                 smallint COMMENT '星级',
   is_anon              smallint COMMENT '是否匿名',
   create_time          datetime COMMENT '添加时间',
   primary key (comment_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='评论' AUTO_INCREMENT=1;


drop table if exists tb_message;

/*==============================================================*/
/* Table: tb_comments                                           */
/*==============================================================*/
create table tb_message
(
   message_id           bigint not null AUTO_INCREMENT COMMENT '留言ID',
   parent_id            bigint COMMENT '留言的上级ID',
   content              varchar(1000) COMMENT '留言内容',
   anon              smallint COMMENT '是否匿名',
   create_time          datetime COMMENT '添加时间',
   user_id              char(10) COMMENT '留言人ID',
   user_name            varchar(30) COMMENT '留言人姓名',
   category_id          bigint  COMMENT '消息类型',
   category__message_id     bigint COMMENT '消息类型对应服务的ID',
   primary key (message_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='留言' AUTO_INCREMENT=1;


alter table tb_message add constraint FK_category_message foreign key (category_id)
      references tb_category (category_id) on delete restrict on update restrict;

drop table if exists tb_order;

/*==============================================================*/
/* Table: tb_order                                              */
/*==============================================================*/
create table tb_order
(
   order_id             bigint not null AUTO_INCREMENT COMMENT '订单ID',
   goods_id             int COMMENT '商品ID',
   comment_id           bigint COMMENT '评价ID',
   address_id           bigint COMMENT '收货地址ID',
   user_id              bigint COMMENT '用户ID',
   is_comment           smallint COMMENT '是否评价',
   status               smallint COMMENT '订单状态',
   create_time          datetime not null COMMENT '下单时间',
   remark               varchar(200) COMMENT '备注',
   goods_money          int COMMENT '商品金额',
   deliver_type         smallint COMMENT '收货方式',
   deliver_money        int COMMENT '快递费用',
   total_money          int COMMENT '订单总金额',
   real_total_money     int COMMENT '实际订单总金额',
   payType              smallint COMMENT '付费方式',
   payFrom              smallint COMMENT '支付来源',
   user_name            varchar(30) COMMENT '收货人姓名',
   user_adress          varchar(50) COMMENT '收货人地址',
   user_mobile          varchar(20) COMMENT '收货人手机',
   primary key (order_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='订单' AUTO_INCREMENT=1;

alter table tb_order add constraint FK_Relationship_7 foreign key (comment_id)
      references tb_comments (comment_id) on delete restrict on update restrict;

alter table tb_order add constraint FK_goods_many foreign key (goods_id)
      references tb_goods (goods_id) on delete restrict on update restrict;

alter table tb_order add constraint FK_order_deliver_address foreign key (address_id)
      references tb_user_address (address_id) on delete restrict on update restrict;

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


drop table if exists tb_carts;

/*==============================================================*/
/* Table: carts                                                 */
/*==============================================================*/
create table tb_carts
(
   cart_id              bigint not null AUTO_INCREMENT COMMENT '购物车ID',
   user_id              bigint COMMENT '用户ID',
   goods_id             int COMMENT '商品ID',
   primary key (cart_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8  COMMENT='购物车' AUTO_INCREMENT=1;

alter table carts add constraint FK_cart_goods foreign key (goods_id)
      references tb_goods (goods_id) on delete restrict on update restrict;

alter table carts add constraint FK_cart_user foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;



create view tb_goods_info_view
as
select
   a.goods_id,
   a.user_id,
   a.category_id,
   a.name as goods_name,
   a.price,
   a.newprice,
   a.status,
   a.addtime,
   a.updatetime,
   a.description,
   a.goods_address,
   a.decoration,
   b.username,
   b.img as user_img,
   c.name as category_name,
   c.icon as category_icon,
   d.local_path as goods_img
   d.path_key as path_key
from
   tb_goods as a 
   left join tb_user as b on a.user_id=b.user_id
   left join tb_category as c on a.category_id=c.category_id
   left join tb_goods_images as d on a.goods_id=d.goods_id
group by a.goods_id;



drop table if exists tb_aid_order;

/*==============================================================*/
/* Table: tb_aid_order                                          */
/*==============================================================*/
create table tb_aid_order
(
   aid_id               bigint not null AUTO_INCREMENT COMMENT '帮帮订单ID',
   category_id          bigint COMMENT '分类ID',
   create_time          datetime not null COMMENT '创建时间',
   deadline             datetime COMMENT '截至时间',
   finish_time          datetime COMMENT '完成时间',
   title          		varchar(200) COMMENT '标题',
   description          varchar(1000) COMMENT '订单描述',
   status               smallint COMMENT '订单状态',
   order_address        varchar(200) COMMENT '订单地址',
   remuneration         int COMMENT '接单报酬',
   payment_method       int COMMENT '付款方式',
   receiver_id          bigint COMMENT '接单人ID',
   receiver_contact     varchar(20) COMMENT '接单人联系方式',
   creator_id           bigint COMMENT '创建人ID',
   creator_contact      varchar(20) COMMENT '创建人联系方式',
   comment_thing        varchar(200) COMMENT '评价',
   comment_star         smallint  COMMENT '星级',
   received_info        varchar(200) COMMENT '接单后信息',
   primary key (aid_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8  COMMENT='帮帮订单' AUTO_INCREMENT=1;