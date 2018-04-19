package tech.yiyehu.modules.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;

import tech.yiyehu.modules.app.dao.CartsDao;
import tech.yiyehu.modules.app.entity.CartsEntity;
import tech.yiyehu.modules.app.service.CartsService;


@Service("cartsService")
public class CartsServiceImpl extends ServiceImpl<CartsDao, CartsEntity> implements CartsService {

	@Autowired
	private CartsDao cartsDao;
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CartsEntity> page = this.selectPage(
                new Query<CartsEntity>(params).getPage(),
                new EntityWrapper<CartsEntity>()
        );

        return new PageUtils(page);
    }

	@Override
	public List<CartsEntity> queryCartsInfoList(Long userId) {
		
		return cartsDao.queryCartsInfoList(userId);
	}

	@Override
	public CartsEntity queryById(Long cartId) {
		return cartsDao.queryById(cartId);
	}

}
