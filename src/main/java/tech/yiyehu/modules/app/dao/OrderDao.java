package tech.yiyehu.modules.app.dao;

import tech.yiyehu.modules.app.entity.OrderEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
@Mapper
public interface OrderDao extends BaseMapper<OrderEntity> {
	
}
