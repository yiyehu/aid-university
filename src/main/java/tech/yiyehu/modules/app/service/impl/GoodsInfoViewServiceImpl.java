package tech.yiyehu.modules.app.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.app.dao.GoodsInfoViewDao;
import tech.yiyehu.modules.app.entity.GoodsInfoViewEntity;
import tech.yiyehu.modules.app.service.GoodsInfoViewService;


@Service("goodsInfoViewService")
public class GoodsInfoViewServiceImpl extends ServiceImpl<GoodsInfoViewDao, GoodsInfoViewEntity> implements GoodsInfoViewService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GoodsInfoViewEntity> page = this.selectPage(
                new Query<GoodsInfoViewEntity>(params).getPage(),
                new EntityWrapper<GoodsInfoViewEntity>()
        );

        return new PageUtils(page);
    }

}
