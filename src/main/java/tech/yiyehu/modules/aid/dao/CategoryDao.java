package tech.yiyehu.modules.aid.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import tech.yiyehu.modules.aid.entity.CategoryEntity;

/**
 * 分类
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@Mapper
public interface CategoryDao extends BaseMapper<CategoryEntity> {
	
}
