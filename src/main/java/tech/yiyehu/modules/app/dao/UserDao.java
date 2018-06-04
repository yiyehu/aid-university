package tech.yiyehu.modules.app.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import tech.yiyehu.modules.app.entity.UserEntity;

import java.util.List;

/**
 * 用户
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@Mapper
public interface UserDao extends BaseMapper<UserEntity> {
	
	/**
	 * 查询用户的所有相关聊天的人员
	 * @param userId  用户ID
	 * @param categoryId 消息类型
	 */
	List<UserEntity> queryRelevantChatUsers(@Param("userId") Long userId, @Param("categoryId") Long categoryId);
}
