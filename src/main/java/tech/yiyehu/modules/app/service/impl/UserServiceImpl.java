package tech.yiyehu.modules.app.service.impl;

import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import tech.yiyehu.common.exception.RRException;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.common.utils.SqlUtils;
import tech.yiyehu.common.validator.Assert;
import tech.yiyehu.modules.app.dao.UserDao;
import tech.yiyehu.modules.app.entity.UserEntity;
import tech.yiyehu.modules.app.form.LoginForm;
import tech.yiyehu.modules.app.service.UserService;


@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements UserService {

	@Override
	public UserEntity queryByMobile(String mobile) {
		UserEntity userEntity = new UserEntity();
		userEntity.setMobile(mobile);
		return baseMapper.selectOne(userEntity);
	}

	@Override
	public UserEntity login(LoginForm form) {
		UserEntity user = queryByMobile(form.getMobile());
		Assert.isNull(user, "手机号或密码错误");

		 //密码错误
		if (!user.getPassword().equals(DigestUtils.sha256Hex(form.getPassword()))) {
			throw new RRException("手机号或密码错误");
		}
		return user;
	}
	
	@Override
    public PageUtils queryPage(Map<String, Object> params) {
		EntityWrapper<UserEntity> ew = new EntityWrapper<UserEntity>();
		if(Boolean.parseBoolean(params.get("_search").toString())) {
			 ew.setEntity(new UserEntity());
			 ew = SqlUtils.AddSearchOper(ew, params);
			 
		}
        Page<UserEntity> page = this.selectPage(
                new Query<UserEntity>(params).getPage(),
                ew
        );

        return new PageUtils(page);
    }
	
	@Override
    public PageUtils queryPage(Map<String, Object> params,UserEntity userEntity) {
        Page<UserEntity> page = this.selectPage(
                new Query<UserEntity>(params).getPage(),
                new EntityWrapper<UserEntity>(userEntity)
        );

        return new PageUtils(page);
    }
}