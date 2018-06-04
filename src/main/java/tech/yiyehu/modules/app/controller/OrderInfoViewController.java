package tech.yiyehu.modules.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.app.annotation.Login;
import tech.yiyehu.modules.aid.entity.OrderInfoViewEntity;
import tech.yiyehu.modules.aid.service.OrderInfoViewService;

/**
 * 订单
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
@RestController("appOrderInfoViewController")
@RequestMapping("app/orderinfoview")
public class OrderInfoViewController {
	@Autowired
	private OrderInfoViewService orderInfoViewService;

	/**
	 * 列表
	 */
	@Login
	@RequestMapping("/listOfLogin")
	public R listOfLogin(@RequestParam Map<String, Object> params, @RequestAttribute("userId") Long userId) {
		params.put("customerId", userId);
		params.put("orderBy", "create_time desc");
		PageUtils page = orderInfoViewService.queryPage(params);
		return R.ok().put("page", page);
	}

	/**
	 * 信息
	 */
	@GetMapping("/{orderId}")
	public R info(@PathVariable("orderId") Long orderId, @RequestAttribute("userId") Long userId) {
		OrderInfoViewEntity orderInfoView = orderInfoViewService.selectById(orderId);
		if(orderInfoView.getCustomerId() == userId) {
			return R.ok().put("orderInfoView", orderInfoView);
		}
		return R.error("用户与订单不匹配");
	}

}
