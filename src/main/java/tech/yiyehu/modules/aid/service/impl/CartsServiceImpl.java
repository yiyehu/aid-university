package tech.yiyehu.modules.aid.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.aid.dao.CartsDao;
import tech.yiyehu.modules.aid.entity.CartsEntity;
import tech.yiyehu.modules.aid.service.CartsService;

import java.util.List;
import java.util.Map;


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
