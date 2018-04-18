package tech.yiyehu.modules.sys.service;

import java.util.Map;

import com.baomidou.mybatisplus.service.IService;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.sys.entity.RegionEntity;

/**
 * 县区
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
public interface RegionService extends IService<RegionEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 
     * @param params   page查询条件
     * @param regionEntity 添加查询条件 cityId
     * @return
     */

	PageUtils queryPage(Map<String, Object> params, RegionEntity regionEntity);
}

