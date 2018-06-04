package tech.yiyehu.modules.aid.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.aid.entity.CartsEntity;

import java.util.List;
import java.util.Map;

/**
 * 购物车
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
public interface CartsService extends IService<CartsEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
    List<CartsEntity> queryCartsInfoList(Long userId);
    CartsEntity queryById(Long cartId);
}

