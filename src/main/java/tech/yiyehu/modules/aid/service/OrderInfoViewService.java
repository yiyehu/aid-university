package tech.yiyehu.modules.aid.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.aid.entity.OrderInfoViewEntity;

import java.util.Map;

/**
 * 订单
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
public interface OrderInfoViewService extends IService<OrderInfoViewEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

