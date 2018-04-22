package tech.yiyehu.modules.app.dao;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import tech.yiyehu.modules.app.entity.GoodsInfoViewEntity;

/**
 * 商品
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-21 18:06:12
 */
@Mapper
public interface GoodsInfoViewDao extends BaseMapper<GoodsInfoViewEntity> {
	
}
