package tech.yiyehu.modules.app.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Constant {
	/**
	 * 系统分类
	 */
	public static final int CATEGORY_SYSTEM = 1;
	/**
	 * 帮帮订单总分类
	 */
	public static final int CATEGORY_AID = 2;
	/**
	 * 二手商品总分类
	 */
	public static final int CATEGORY_MARKET = 3;
	/**
	 * 书籍总分类
	 */
	public static final int CATEGORY_BOOK = 6;
	
	public enum BangBangStatusEnum {
		/**
		 * 用户创建需求订单
		 */
		CREATED,
		
		/**
		 * 其他接单用户接单
		 */
		RECEIVED,
		
		/**
		 * 其他接单用户完成订单
		 */
		FINISHED,
		
		/**
		 *  评价
		 */
		COMMENTED,
		
		/**
		 *  在其他接单用户接单之前，创建需求订单的用户取消
		 */
		CANCELED;
		public static List<Map<String,Object>> getAllStatus() {
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("name", "已创建");
			map.put("status",0);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "进行中");
			map.put("status",1);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "已完成");
			map.put("status",2);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "已评价");
			map.put("status",3);
			list.add(map);
			return list;
		}
	}

	public enum GoodsStatusEnum {
		CREATED, SOLD, FEEDBACK;
		
		public static List<Map<String,Object>> getAllStatus() {
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("name", "已创建");
			map.put("status",0);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "已卖出");
			map.put("status",1);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "已评价");
			map.put("status",2);
			list.add(map);
			return list;
		}
	}

	public enum GoodsOrderStatusEnum {
		OBLIGATION,WAITFORSENDING,WAITFORRECEIVING,WAITFORFEEDBACK,FINISHED,CANCELED;
		
		public static List<Map<String,Object>> getAllStatus() {
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("name", "待付款");
			map.put("status",0);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "待发货");
			map.put("status",1);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "待收货");
			map.put("status",2);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "待评价");
			map.put("status",3);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "已完成");
			map.put("status",4);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "已取消");
			map.put("status",5);
			list.add(map);
			return list;
		}
	}
	
	public enum PaymentMethod {
		/**
		 * 货到付款，或事成付款
		 */
		 CASHONDELIVERY ,
		
		/**
		 * 支付宝
		 */
		 Alipay,
		
		/**
		 * 微信
		 */
		 WECHAT;
		public static List<Map<String,Object>> getAllStatus() {
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("name", "事成付款");
			map.put("status",0);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "支付宝");
			map.put("status",1);
			list.add(map);
			map = new HashMap<String,Object>();
			map.put("name", "微信");
			map.put("status",2);
			list.add(map);
			return list;
		}
	}
}
