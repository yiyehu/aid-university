package tech.yiyehu.modules.sys.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.sys.entity.CityEntity;

import java.util.Map;

/**
 * 城市
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
public interface CityService extends IService<CityEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 
     * @param params
     * @param cityEntity 添加查询条件 provinceId/province_id
     * @return
     */
	PageUtils queryPage(Map<String, Object> params, CityEntity cityEntity);
}

