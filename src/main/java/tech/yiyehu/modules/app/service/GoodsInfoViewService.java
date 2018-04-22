package tech.yiyehu.modules.app.service;

import java.util.Map;

import com.baomidou.mybatisplus.service.IService;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.app.entity.GoodsInfoViewEntity;

/**
 * 商品
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-21 18:06:12
 */
public interface GoodsInfoViewService extends IService<GoodsInfoViewEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

