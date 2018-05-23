package tech.yiyehu.modules.app.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.app.utils.Constant;

@RestController
@RequestMapping("/app/constant")
public class ConstantController {

	/**
	 * 商品状态
	 */
	@RequestMapping("/goodsStatus")
	public R goodsStatus() {
		return R.ok().put("goodsStatus", Constant.GoodsStatusEnum.getAllStatus());
	}
	
	/**
	 * 帮帮订单状态
	 */
	@RequestMapping("/bangBangStatus")
	public R bangBangStatus() {
		return R.ok().put("bangBangStatus", Constant.BangBangStatusEnum.getAllStatus());
	}
	
	/**
	 * 商品订单状态
	 */
	@RequestMapping("/goodsOrderStatus")
	public R GoodsOrderStatus() {
		return R.ok().put("goodsOrderStatus", Constant.GoodsOrderStatusEnum.getAllStatus());
	}
	
	/**
	 * 支付方式
	 */
	@RequestMapping("/paymentMethod")
	public R paymentMethod() {
		return R.ok().put("paymentMethod", Constant.PaymentMethod.getAllStatus());
	}
	
	/**
	 * 配送方式
	 */
	@RequestMapping("/deliveryMethod")
	public R deliveryMethod() {
		return R.ok().put("deliveryMethod", Constant.DeliveryMethod.getAllStatus());
	}
}
