package tech.yiyehu.modules.app.dao;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import tech.yiyehu.modules.app.entity.OrderInfoViewEntity;

/**
 * 订单
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
@Mapper
public interface OrderInfoViewDao extends BaseMapper<OrderInfoViewEntity> {
	
}
