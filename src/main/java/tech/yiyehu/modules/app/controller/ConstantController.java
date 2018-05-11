package tech.yiyehu.modules.app.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.app.utils.Constant;

@RestController
@RequestMapping("/app/constant")
public class ConstantController {

	/**
	 * goods状态的map
	 */
	@RequestMapping("/goodsStatus")
	public R goodsStatus() {
		return R.ok().put("goodsStatus", Constant.GoodsStatusEnum.getAllStatus());
	}
	
	/**
	 * goods状态的map
	 */
	@RequestMapping("/bangBangStatus")
	public R bangBangStatus() {
		return R.ok().put("bangBangStatus", Constant.BangBangStatusEnum.getAllStatus());
	}
	
	/**
	 * goods状态的map
	 */
	@RequestMapping("/GoodsOrderStatus")
	public R GoodsOrderStatus() {
		return R.ok().put("GoodsOrderStatus", Constant.GoodsOrderStatusEnum.getAllStatus());
	}
	
	/**
	 * goods状态的map
	 */
	@RequestMapping("/paymentMethod")
	public R paymentMethod() {
		return R.ok().put("paymentMethod", Constant.PaymentMethod.getAllStatus());
	}
}
