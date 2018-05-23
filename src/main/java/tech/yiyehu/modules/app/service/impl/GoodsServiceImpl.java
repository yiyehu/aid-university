package tech.yiyehu.modules.app.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

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
    	EntityWrapper<GoodsEntity> ew =  new EntityWrapper<GoodsEntity>();
    	if(params.get("status")!=null) {
    		ew.where("status = {0}",params.get("status").toString());
    	}
    	if(params.get("userId")!=null) {
    		ew.where("user_id = {0}",params.get("userId").toString());
    	}
    	if(params.get("categoryId")!=null) {
    		ew.where("category_id = {0}",params.get("categoryId").toString());
    	}
    	if(params.get("orderBy")!=null) {
        	ew.orderBy(params.get("orderBy").toString());
    	}
        Page<GoodsEntity> page = this.selectPage(
                new Query<GoodsEntity>(params).getPage(),
                ew
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
