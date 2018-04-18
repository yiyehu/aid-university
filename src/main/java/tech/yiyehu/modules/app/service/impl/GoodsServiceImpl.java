package tech.yiyehu.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;

import tech.yiyehu.modules.app.dao.GoodsDao;
import tech.yiyehu.modules.app.entity.GoodsEntity;
import tech.yiyehu.modules.app.service.GoodsService;


@Service("goodsService")
public class GoodsServiceImpl extends ServiceImpl<GoodsDao, GoodsEntity> implements GoodsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GoodsEntity> page = this.selectPage(
                new Query<GoodsEntity>(params).getPage(),
                new EntityWrapper<GoodsEntity>()
        );

        return new PageUtils(page);
    }
    
    @Override
    public PageUtils queryPageWithSqlSelect(Map<String, Object> params,String[] sqlSelect) {
        Page<GoodsEntity> page = this.selectPage(
                new Query<GoodsEntity>(params).getPage(),
                new EntityWrapper<GoodsEntity>().setSqlSelect(sqlSelect)
        );

        return new PageUtils(page);
    }
    
    @Override
    public PageUtils queryPageWithWhere(Map<String, Object> params,GoodsEntity goodsEntity) {
        Page<GoodsEntity> page = this.selectPage(
                new Query<GoodsEntity>(params).getPage(),
                new EntityWrapper<GoodsEntity>(goodsEntity)
        );

        return new PageUtils(page);
    }

}
