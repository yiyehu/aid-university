package tech.yiyehu.modules.aid.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import tech.yiyehu.modules.aid.entity.OrderInfoViewEntity;

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
