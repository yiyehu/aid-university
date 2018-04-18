package tech.yiyehu.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;

import tech.yiyehu.modules.sys.dao.TownDao;
import tech.yiyehu.modules.sys.entity.TownEntity;
import tech.yiyehu.modules.sys.service.TownService;


@Service("townService")
public class TownServiceImpl extends ServiceImpl<TownDao, TownEntity> implements TownService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<TownEntity> page = this.selectPage(
                new Query<TownEntity>(params).getPage(),
                new EntityWrapper<TownEntity>()
        );

        return new PageUtils(page);
    }

	@Override
	public PageUtils queryPage(Map<String, Object> params, TownEntity townEntity) {
		Page<TownEntity> page = this.selectPage(
                new Query<TownEntity>(params).getPage(),
                new EntityWrapper<TownEntity>(townEntity)
        );

        return new PageUtils(page);
	}

}
