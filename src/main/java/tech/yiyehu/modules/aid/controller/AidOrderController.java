package tech.yiyehu.modules.aid.controller;

import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.aid.entity.AidOrderEntity;
import tech.yiyehu.modules.aid.service.AidOrderService;
import tech.yiyehu.modules.app.service.UserService;

import java.util.Arrays;
import java.util.Map;

/**
 * 帮帮订单
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-05-07 10:40:17
 */
@RestController
@Api(value = "帮帮订单后台管理接口",tags = "帮帮订单后台管理接口")
@RequestMapping("app/aidorder")
public class AidOrderController {
	@Autowired
	private AidOrderService aidOrderService;
	@Autowired
	private UserService userService;

	/**
	 * 列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params) {
		params.put("orderBy", "create_time desc");
		PageUtils page = aidOrderService.queryPage(params);

		return R.ok().put("page", page);
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{aidId}")
	@RequiresPermissions("app:aidorder:info")
	public R info(@PathVariable("aidId") Long aidId) {
		AidOrderEntity aidOrder = aidOrderService.selectById(aidId);

		return R.ok().put("aidOrder", aidOrder);
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("app:aidorder:save")
	public R save(@RequestBody AidOrderEntity aidOrder) {
		aidOrderService.insert(aidOrder);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("app:aidorder:update")
	public R update(@RequestBody AidOrderEntity aidOrder) {
		aidOrderService.updateById(aidOrder);
		return R.ok();
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("app:aidorder:delete")
	public R delete(@RequestBody Long[] aidIds) {
		aidOrderService.deleteBatchIds(Arrays.asList(aidIds));

		return R.ok();
	}

}
