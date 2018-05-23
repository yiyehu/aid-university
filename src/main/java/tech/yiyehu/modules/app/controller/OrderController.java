package tech.yiyehu.modules.app.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import tech.yiyehu.modules.app.annotation.Login;
import tech.yiyehu.modules.app.annotation.LoginUser;
import tech.yiyehu.modules.app.entity.GoodsEntity;
import tech.yiyehu.modules.app.entity.OrderEntity;
import tech.yiyehu.modules.app.entity.UserEntity;
import tech.yiyehu.modules.app.service.GoodsService;
import tech.yiyehu.modules.app.service.OrderService;
import tech.yiyehu.modules.app.utils.Constant;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.common.validator.ValidatorUtils;

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
	
	@Autowired
	private GoodsService goodsService;
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
	
	/**
	 * 保存OfLogin
	 */
	@Login
	@RequestMapping("/saveOfLogin")
	public R saveOfLogin(@RequestBody OrderEntity order,@LoginUser UserEntity user) {
		//表单校验

		order.setUserId(user.getUserId());
		order.setIsComment(0);
		order.setStatus(Constant.GoodsOrderStatusEnum.WAITFORSENDING.ordinal());
		order.setCreateTime(new Date());
        ValidatorUtils.validateEntity(order);
		orderService.insert(order);
		
		//设置goods status为1，表示goods已卖出
		GoodsEntity goodsEntity = new GoodsEntity();
		goodsEntity.setGoodsId(order.getGoodsId());
		goodsEntity.setStatus(Constant.GoodsStatusEnum.SOLD.ordinal());
		goodsService.updateById(goodsEntity);
		return R.ok();
	}
	
	/**
	 * 卖家确认发货
	 */
	@Login
	@PutMapping("/confirmTheDelivery")
	public R confirmTheDelivery(@RequestParam Long goodsId,@RequestAttribute("userId")Long userId) {
		EntityWrapper<OrderEntity> ew = new EntityWrapper<OrderEntity>();
		ew.where("goods_id={0}", goodsId);
		OrderEntity order = new OrderEntity();
		order.setStatus(Constant.GoodsOrderStatusEnum.WAITFORRECEIVING.ordinal());
		boolean bool = orderService.update(order, ew);
		if(bool) {
			return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 买家确认收货
	 */
	@Login
	@PutMapping("/confirmTheReceived")
	public R confirmTheReceived(@RequestParam Long goodsId,@RequestAttribute("userId")Long userId) {
		EntityWrapper<OrderEntity> ew = new EntityWrapper<OrderEntity>();
		ew.where("goods_id={0}", goodsId).and("user_id={0}",userId);
		OrderEntity order = new OrderEntity();
		order.setStatus(Constant.GoodsOrderStatusEnum.WAITFORFEEDBACK.ordinal());
		boolean bool = orderService.update(order, ew);
		if(bool) {
			return R.ok();
		}
		return R.error();
	}
}
