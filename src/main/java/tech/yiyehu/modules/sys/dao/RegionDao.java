package tech.yiyehu.modules.sys.dao;

import tech.yiyehu.modules.sys.entity.RegionEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 县区
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@Mapper
public interface RegionDao extends BaseMapper<RegionEntity> {
	
}
