package tech.yiyehu.modules.app.dao;

import tech.yiyehu.modules.app.entity.CartsEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * 购物车
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
@Mapper
public interface CartsDao extends BaseMapper<CartsEntity> {
	List<CartsEntity> queryCartsInfoList(Long userId);
	
	CartsEntity queryById(Long cartId);
}
