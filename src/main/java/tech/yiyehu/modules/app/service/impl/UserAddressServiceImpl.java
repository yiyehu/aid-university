package tech.yiyehu.modules.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;

import tech.yiyehu.modules.app.dao.UserAddressDao;
import tech.yiyehu.modules.app.entity.UserAddressEntity;
import tech.yiyehu.modules.app.service.UserAddressService;


@Service("userAddressService")
public class UserAddressServiceImpl extends ServiceImpl<UserAddressDao, UserAddressEntity> implements UserAddressService {

	@Autowired
	UserAddressDao userAddressDao;
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<UserAddressEntity> page = this.selectPage(
                new Query<UserAddressEntity>(params).getPage(),
                new EntityWrapper<UserAddressEntity>()
        );

        return new PageUtils(page);
    }

	@Override
	public List<UserAddressEntity> queryUserAdresses(Map<String, Object> params) {
		EntityWrapper<UserAddressEntity> ew = new EntityWrapper<UserAddressEntity>();
		if(params.get("userId") != null) {
			ew.where("user_id={0}", params.get("userId").toString());
		}
		return this.selectList(ew);
	}

	@Override
	@Transactional
	public void setDefault(Long addressId, Long userId) {
		UserAddressEntity userAddress  = new UserAddressEntity();
		userAddress.setDefaultAddr(0);
		userAddressDao.update(userAddress,new EntityWrapper<UserAddressEntity>().where("user_id={0}",userId));
		userAddress.setDefaultAddr(1);
		userAddress.setAddressId(addressId);
		userAddressDao.updateById(userAddress);
	}

}
