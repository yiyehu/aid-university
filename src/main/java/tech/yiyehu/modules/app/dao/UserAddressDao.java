package tech.yiyehu.modules.app.dao;

import tech.yiyehu.modules.app.entity.UserAddressEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

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
