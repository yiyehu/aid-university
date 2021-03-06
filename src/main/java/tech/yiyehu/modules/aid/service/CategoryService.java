package tech.yiyehu.modules.aid.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.aid.entity.CategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 分类
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);

	List<CategoryEntity> queryCategoryByParentId(long parentId);
}

