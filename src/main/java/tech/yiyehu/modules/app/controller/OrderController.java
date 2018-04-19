package tech.yiyehu.modules.app.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tech.yiyehu.modules.app.entity.OrderEntity;
import tech.yiyehu.modules.app.service.OrderService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;

/**
 * 订单
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
@RestController
@RequestMapping("app/order")
public class OrderController {
	@Autowired
	private OrderService orderService;

	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("app:order:list")
	public R list(@RequestParam Map<String, Object> params) {
		PageUtils page = orderService.queryPage(params);

		return R.ok().put("page", page);
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{orderId}")
	@RequiresPermissions("app:order:info")
	public R info(@PathVariable("orderId") Long orderId) {
		OrderEntity order = orderService.selectById(orderId);

		return R.ok().put("order", order);
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("app:order:save")
	public R save(@RequestBody OrderEntity order) {
		order.setIsComment(0);
		order.setStatus(0);
		order.setCreateTime(new Date());
		orderService.insert(order);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("app:order:update")
	public R update(@RequestBody OrderEntity order) {
		orderService.updateById(order);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("app:order:delete")
	public R delete(@RequestBody Long[] orderIds) {
		orderService.deleteBatchIds(Arrays.asList(orderIds));

		return R.ok();
	}

}
