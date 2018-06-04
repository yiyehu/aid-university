package tech.yiyehu.modules.aid.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.aid.entity.GoodsEntity;

import java.util.Map;

/**
 * 商品
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
public interface GoodsService extends IService<GoodsEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
    PageUtils queryPageWithSqlSelect(Map<String, Object> params, String[] sqlSelect);

	PageUtils queryPageWithWhere(Map<String, Object> params, GoodsEntity goodsEntity);
}

