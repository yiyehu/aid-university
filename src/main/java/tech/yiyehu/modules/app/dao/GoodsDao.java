package tech.yiyehu.modules.app.dao;

import tech.yiyehu.modules.app.entity.GoodsEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@Mapper
public interface GoodsDao extends BaseMapper<GoodsEntity> {
	
}
