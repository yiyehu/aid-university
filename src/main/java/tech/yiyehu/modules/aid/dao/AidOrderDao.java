package tech.yiyehu.modules.aid.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import tech.yiyehu.modules.aid.entity.AidOrderEntity;

/**
 * 帮帮订单
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-05-07 10:40:17
 */
@Mapper
public interface AidOrderDao extends BaseMapper<AidOrderEntity> {
	
}
