package tech.yiyehu.modules.app.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.app.entity.OrderEntity;

import java.util.Map;

/**
 * 订单
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
public interface OrderService extends IService<OrderEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

