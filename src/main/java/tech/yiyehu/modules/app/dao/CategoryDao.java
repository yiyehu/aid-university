package tech.yiyehu.modules.app.dao;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import tech.yiyehu.modules.app.entity.CategoryEntity;

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
