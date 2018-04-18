package tech.yiyehu.modules.app.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.app.entity.UserAddressEntity;

import java.util.Map;

/**
 * 用户地址
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
public interface UserAddressService extends IService<UserAddressEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

