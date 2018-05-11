package tech.yiyehu.modules.app.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.app.entity.AidOrderEntity;

import java.util.Map;

/**
 * 帮帮订单
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-05-07 10:40:17
 */
public interface AidOrderService extends IService<AidOrderEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

