package tech.yiyehu.modules.sys.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.sys.dao.ProvinceDao;
import tech.yiyehu.modules.sys.entity.ProvinceEntity;
import tech.yiyehu.modules.sys.service.ProvinceService;


@Service("provinceService")
public class ProvinceServiceImpl extends ServiceImpl<ProvinceDao, ProvinceEntity> implements ProvinceService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ProvinceEntity> page = this.selectPage(
                new Query<ProvinceEntity>(params).getPage(),
                new EntityWrapper<ProvinceEntity>()
        );

        return new PageUtils(page);
    }

	@Override
	public PageUtils queryPage(Map<String, Object> params, ProvinceEntity provinceEntity) {
		 Page<ProvinceEntity> page = this.selectPage(
	                new Query<ProvinceEntity>(params).getPage(),
	                new EntityWrapper<ProvinceEntity>(provinceEntity)
	        );
	        return new PageUtils(page);
	}

}
