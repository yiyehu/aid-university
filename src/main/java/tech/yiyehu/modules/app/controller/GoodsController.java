package tech.yiyehu.modules.app.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.app.annotation.Login;
import tech.yiyehu.modules.aid.entity.GoodsEntity;
import tech.yiyehu.modules.aid.service.GoodsService;
import tech.yiyehu.modules.app.utils.Constant;

/**
 * 商品
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@RestController("appGoodsController")
@RequestMapping("app/goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;

	/**
	 * 列表OfLogin
	 */
	@Login
	@RequestMapping("/listOfLogin")
	public R listOfLogin(@RequestParam Map<String, Object> params, @RequestAttribute("userId") long userId) {
		GoodsEntity goodsEntity = new GoodsEntity();
		goodsEntity.setUserId(userId);
		PageUtils page = goodsService.queryPageWithWhere(params, goodsEntity);

		return R.ok().put("page", page);
	}

	/**
	 * 信息OfLogin
	 */
	@Login
	@GetMapping("/{goodsId}")
	public R infoOfLogin(@PathVariable("goodsId") long goodsId) {
		GoodsEntity goods = goodsService.selectById(goodsId);

		return R.ok().put("goods", goods);
	}

	/**
	 * 保存OfLogin
	 */
	@Login
	@PostMapping("/saveOfLogin")
	public R saveOfLogin(@RequestBody GoodsEntity goods) {
		goodsService.insert(goods);

		return R.ok();
	}

	/**
	 * 修改OfLogin
	 */
	@Login
	@PutMapping("/{goodsId}")
	public R updateOfLogin(@RequestBody GoodsEntity goods, @PathVariable("goodsId") long goodsId) {
		goodsService.updateById(goods);

		return R.ok();
	}

	/**
	 * 删除OfLogin
	 */
	@Login
	@DeleteMapping("/{goodsId}")
	public R deleteOfLogin(@PathVariable("goodsId") long goodsId,@RequestAttribute("userId") long userId) {
		EntityWrapper<GoodsEntity> ew = new EntityWrapper<GoodsEntity>();
		ew.where("goods_id = {0} and user_id = {1}", goodsId,userId);
		if(goodsService.delete(ew)){
			return R.ok();
		}else {
			return R.error("商品所属人错误");
		}
	}

	/**
	 * goods状态的map
	 */
	@Login
	@RequestMapping("/goodsStatus")
	public R goodsStatus() {
		return R.ok().put("goodsStatus", Constant.GoodsStatusEnum.getAllStatus());
	}
}
