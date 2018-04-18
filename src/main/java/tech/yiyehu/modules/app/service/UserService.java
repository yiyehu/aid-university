package tech.yiyehu.modules.app.service;


import java.util.Map;

import com.baomidou.mybatisplus.service.IService;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.app.entity.UserEntity;
import tech.yiyehu.modules.app.form.LoginForm;

/**
 * 用户
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-23 15:22:06
 * 
 * @author zhuangyuan
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-06 21:12:32
 */
public interface UserService extends IService<UserEntity> {

	UserEntity queryByMobile(String mobile);

	/**
	 * 用户登录
	 * @param form    登录表单
	 * @return        返回用户Entity
	 */
	UserEntity login(LoginForm form);
	
	PageUtils queryPage(Map<String, Object> params);

	PageUtils queryPage(Map<String, Object> params, UserEntity userEntity);
}
