package tech.yiyehu.modules.sys.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.sys.entity.TownEntity;

import java.util.Map;

/**
 * 城镇
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
public interface TownService extends IService<TownEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 
     * @param params
     * @param townEntity 添加查询条件
     * @return
     */
	PageUtils queryPage(Map<String, Object> params, TownEntity townEntity);
}

