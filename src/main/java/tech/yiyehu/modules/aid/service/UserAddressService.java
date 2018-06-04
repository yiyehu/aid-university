package tech.yiyehu.modules.aid.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.aid.entity.UserAddressEntity;

import java.util.List;
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

	List<UserAddressEntity> queryUserAdresses(Map<String, Object> params);

	/**
	 * 设为默认
	 * @param addressId
	 * @param userId
	 */
	void setDefault(Long addressId, Long userId);
}

