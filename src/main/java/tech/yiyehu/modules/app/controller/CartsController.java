package tech.yiyehu.modules.app.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.app.annotation.Login;
import tech.yiyehu.modules.app.entity.CartsEntity;
import tech.yiyehu.modules.app.service.CartsService;

/**
 * 购物车
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
@RestController
@RequestMapping("app/carts")
public class CartsController {
	@Autowired
	private CartsService cartsService;
	
	/**
	 * 信息
	 */
	@Login
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params, @RequestAttribute("userId") Long userId) {
		List<CartsEntity> list = new ArrayList<CartsEntity>();
		list = cartsService.queryCartsInfoList(userId);
		return R.ok().put("list", list);
	}

	/**
	 * 信息
	 */
	@Login
	@RequestMapping("/info/{cartId}")
	public R info(@PathVariable("cartId") Long cartId) {
		CartsEntity cartsEntity = cartsService.selectById(cartId);
		return R.ok().put("cartsEntity", cartsEntity);
	}

	/**
	 * 保存
	 */
	@Login
	@RequestMapping("/save")
	public R save(@RequestBody CartsEntity carts) {
		cartsService.insert(carts);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@Login
	@RequestMapping("/delete")
	public R delete(@RequestBody Long[] cartIds) {
		cartsService.deleteBatchIds(Arrays.asList(cartIds));

		return R.ok();
	}

}
