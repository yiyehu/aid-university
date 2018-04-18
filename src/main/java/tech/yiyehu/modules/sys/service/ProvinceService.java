package tech.yiyehu.modules.sys.service;

import java.util.Map;

import com.baomidou.mybatisplus.service.IService;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.sys.entity.ProvinceEntity;

/**
 * 省份
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
public interface ProvinceService extends IService<ProvinceEntity> {

    PageUtils queryPage(Map<String, Object> params);

	PageUtils queryPage(Map<String, Object> params, ProvinceEntity provinceEntity);
}

