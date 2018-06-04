package tech.yiyehu.modules.aid.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.aid.entity.GoodsImagesEntity;

import java.util.Map;

/**
 * 商品图片
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
public interface GoodsImagesService extends IService<GoodsImagesEntity> {

    PageUtils queryPage(Map<String, Object> params);

	PageUtils queryPageWithWhere(Map<String, Object> params, GoodsImagesEntity goodsImagesEntity);
}

