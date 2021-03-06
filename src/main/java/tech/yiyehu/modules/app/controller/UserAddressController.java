package tech.yiyehu.modules.app.controller;

import java.util.Arrays;
import java.util.List;
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

import tech.yiyehu.modules.app.annotation.Login;
import tech.yiyehu.modules.aid.entity.UserAddressEntity;
import tech.yiyehu.modules.aid.service.UserAddressService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.common.validator.ValidatorUtils;

/**
 * 用户地址
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@RestController("appUserAddressController")
@RequestMapping("app/useraddress")
public class UserAddressController {
	@Autowired
	private UserAddressService userAddressService;

	/**
	 * 列表OfLogin
	 */
	@Login
	@RequestMapping("/listOfLogin")
	public R listOfLogin(@RequestParam Map<String, Object> params, @RequestAttribute("userId") Integer userId) {
		params.put("userId", userId);
		List<UserAddressEntity> userAddress = userAddressService.queryUserAdresses(params);
		return R.ok().put("list", userAddress);
	}

	/**
	 * 信息OfLogin
	 */
	@Login
	@GetMapping("/{addressId}")
	public R infoOfLogin(@PathVariable("addressId") Long addressId, @RequestAttribute("userId") Integer userId) {
		if(userAddressService.selectCount(new EntityWrapper<UserAddressEntity>().where("user_id={0}",userId).and("address_id={0}", addressId))!=0) {
			UserAddressEntity userAddress = userAddressService.selectById(addressId);
			return R.ok().put("userAddress", userAddress);
		}else {
			return R.error("此地址与用户不匹配");
		}
	}

	/**
	 * 默认地址
	 */
	@Login
	@GetMapping("/defaultUserAddress")
	public R defaultUserAddress(@RequestAttribute("userId") Long userId) {
		UserAddressEntity userAddress = new UserAddressEntity();
		userAddress.setDefaultAddr(1);
		userAddress.setUserId(userId);
		EntityWrapper<UserAddressEntity> wrapper  =  new EntityWrapper<UserAddressEntity>();
		wrapper.setEntity(userAddress);
		userAddress = userAddressService.selectOne(wrapper);
		return R.ok().put("userAddress", userAddress);
	}
	
	/**
	 * 保存OfLogin
	 */
	@Login
	@PostMapping("/saveOfLogin")
	public R saveOfLogin(@RequestBody UserAddressEntity userAddress, @RequestAttribute("userId") Long userId) {
		userAddress.setUserId(userId);
		//表单校验
        ValidatorUtils.validateEntity(userAddress);
		userAddressService.insert(userAddress);
		return R.ok();
	}

	/**
	 * 修改OfLogin
	 */
	@Login
	@PutMapping("/updateOfLogin")
	public R updateOfLogin(@RequestBody UserAddressEntity userAddress, @RequestAttribute("userId") Long userId) {
		if(userAddressService.selectCount(new EntityWrapper<UserAddressEntity>().where("user_id={0}",userId).and("address_id={0}", userAddress.getAddressId()))!=0) {
			userAddressService.updateById(userAddress);
			return R.ok();
		}else {
			return R.error("此地址与用户不匹配");
		}

	}
	
	/**
	 * 设为默认地址
	 */
	@Login
	@PutMapping("/setDefault")
	public R setDefault(@RequestParam("addressId")Long addressId, @RequestAttribute("userId") Long userId) {
		if(userAddressService.selectCount(new EntityWrapper<UserAddressEntity>().where("user_id={0}",userId).and("address_id={0}", addressId))!=0) {
			
			userAddressService.setDefault(addressId,userId);
			return R.ok();
		}else {
			return R.error("此地址与用户不匹配");
		}

	}
	
	/**
	 * 删除OfLogin
	 */
	@Login
	@DeleteMapping("/{addressId}")
	public R deleteOfLogin(@PathVariable("addressId")Long addressId,@RequestAttribute("userId") Long userId) {
		if(userAddressService.selectCount(new EntityWrapper<UserAddressEntity>().where("user_id={0}",userId).and("address_id={0}", addressId))!=0) {
			userAddressService.deleteById(addressId);
			return R.ok();
		}else {
			return R.error("此地址与用户不匹配");
		}
	}
}
