package tech.yiyehu.modules.app.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiOperation;
import tech.yiyehu.common.exception.RRException;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.app.annotation.Login;
import tech.yiyehu.modules.app.annotation.LoginUser;
import tech.yiyehu.modules.app.entity.UserEntity;
import tech.yiyehu.modules.app.service.UserService;

/**
 * 用户
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 16:58:42
 */
@RestController
@RequestMapping("app/user")
public class UserController {
	@Autowired
	private UserService userService;

	/**
	 * 列表
	 */
	// @RequestMapping("/list")
	// @RequiresPermissions("app:user:list")
	// public R list(@RequestParam Map<String, Object> params){
	// PageUtils page = null;
	// UserEntity userEntity = new UserEntity();
	// boolean change = false;
	// if(params.get("username")!=null && params.get("username")!="") {
	// userEntity.setUsername(params.get("username").toString());
	// change = true;
	// }
	// if(params.get("mobile")!=null&& params.get("mobile")!="") {
	// userEntity.setMobile(params.get("mobile").toString());
	// change = true;
	// }
	// if(change) {
	// page = userService.queryPage(params,userEntity);
	// }else {
	// page = userService.queryPage(params);
	// }
	// return R.ok().put("page", page);
	// }

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

	/**
	 * 查询用户的所有相关聊天的人员
	 * 
	 * @param userId
	 *            用户ID
	 */
	@Login
	@GetMapping("/queryRelevantChatUsers")
	@ApiOperation("查询用户的所有相关聊天的人员")
	public R queryRelevantChatUsers(@RequestAttribute("userId") Long userId, @RequestParam Long categoryId) {

		return R.ok().put("users", userService.queryRelevantChatUsers(userId, categoryId));
	}

	/**
	 * pre:已登录,获取用户自己的信息
	 * 
	 * @param user
	 * @return
	 */
	@Login
	@GetMapping("InfoOfLogin")
	@ApiOperation("获取用户信息")
	public R InfoOfLogin(@LoginUser UserEntity user) {
		return R.ok().put("user", user);
	}

	/**
	 * 修改
	 */
	@Login
	@RequestMapping("/changePasswordOfLogin")
	public R changePasswordOfLogin(@LoginUser UserEntity user, @RequestParam String oldPassword,
			@RequestParam String newPassword) {
		if (!user.getPassword().equals(DigestUtils.sha256Hex(oldPassword))) {
			throw new RRException("手机号或密码错误");
		}
		user.setPassword(DigestUtils.sha256Hex(newPassword));
		userService.updateById(user);
		return R.ok();
	}
}
