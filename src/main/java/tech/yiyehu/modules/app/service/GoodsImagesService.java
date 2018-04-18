package tech.yiyehu.modules.app.service;

import java.util.Map;

import com.baomidou.mybatisplus.service.IService;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.app.entity.GoodsImagesEntity;

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

