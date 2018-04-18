package tech.yiyehu.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;

import tech.yiyehu.modules.sys.dao.RegionDao;
import tech.yiyehu.modules.sys.entity.RegionEntity;
import tech.yiyehu.modules.sys.service.RegionService;


@Service("regionService")
public class RegionServiceImpl extends ServiceImpl<RegionDao, RegionEntity> implements RegionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<RegionEntity> page = this.selectPage(
                new Query<RegionEntity>(params).getPage(),
                new EntityWrapper<RegionEntity>()
        );

        return new PageUtils(page);
    }

	@Override
	public PageUtils queryPage(Map<String, Object> params, RegionEntity regionEntity) {
		 Page<RegionEntity> page = this.selectPage(
	                new Query<RegionEntity>(params).getPage(),
	                new EntityWrapper<RegionEntity>(regionEntity)
	        );

	        return new PageUtils(page);
	}

}
