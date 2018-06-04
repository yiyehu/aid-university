package tech.yiyehu.modules.aid.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import tech.yiyehu.modules.aid.entity.CartsEntity;

import java.util.List;

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
