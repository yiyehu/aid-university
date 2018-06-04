package tech.yiyehu.modules.aid.controller;

import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.common.validator.ValidatorUtils;
import tech.yiyehu.modules.app.entity.UserEntity;
import tech.yiyehu.modules.app.service.UserService;

import java.util.Arrays;
import java.util.Map;

/**
 * 用户
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 16:58:42
 */
@RestController
@Api("用户接口")
@RequestMapping("app/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/list")
	@RequiresPermissions("app:user:list")
	public R list(@RequestParam Map<String, Object> params) {
		PageUtils page = userService.queryPage(params);
		return R.ok().put("page", page);
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{userId}")
	@RequiresPermissions("app:user:list")
	public R info(@PathVariable("userId") Long userId) {
		UserEntity user = userService.selectById(userId);

		return R.ok().put("user", user);
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("app:user:save")
	public R save(@RequestBody UserEntity user) {
		//表单校验
        ValidatorUtils.validateEntity(user);
        
		userService.insert(user);
		return R.ok();
	}

	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("app:user:update")
	public R update(@RequestBody UserEntity user) {
		userService.updateById(user);
		return R.ok();
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("app:user:delete")
	public R delete(@RequestBody Long[] userIds) {
		userService.deleteBatchIds(Arrays.asList(userIds));

		return R.ok();
	}
}
