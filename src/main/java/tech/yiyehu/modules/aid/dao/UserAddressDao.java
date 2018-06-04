package tech.yiyehu.modules.aid.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import tech.yiyehu.modules.aid.entity.UserAddressEntity;

/**
 * 用户地址
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@Mapper
public interface UserAddressDao extends BaseMapper<UserAddressEntity> {
	
}
