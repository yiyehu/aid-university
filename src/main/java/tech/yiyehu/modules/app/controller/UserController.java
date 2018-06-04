package tech.yiyehu.modules.app.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import tech.yiyehu.common.exception.RRException;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.common.validator.ValidatorUtils;
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
@RestController("appUserController")
@Api("用户接口")
@RequestMapping("app/user")
public class UserController {
	@Autowired
	private UserService userService;

	/**
	 * 查询用户的所有相关聊天的人员
	 * 
	 * @param userId
	 *            用户ID
	 */
	@Login
	@ApiOperation("查询用户的所有相关聊天的人员")
	@GetMapping("/queryRelevantChatUsers")
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
	@ApiOperation("获取用户信息")
	@GetMapping("InfoOfLogin")
	public R InfoOfLogin(@LoginUser UserEntity user) {
		return R.ok().put("user", user);
	}

	/**
	 * 修改
	 */
	@Login
	@ApiOperation("用户修改密码")
	@PostMapping("/changePasswordOfLogin")
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
