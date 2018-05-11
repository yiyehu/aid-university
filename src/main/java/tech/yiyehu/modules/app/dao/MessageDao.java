package tech.yiyehu.modules.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import tech.yiyehu.modules.app.entity.MessageEntity;

/**
 * 留言
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-20 22:01:08
 */
@Mapper
public interface MessageDao extends BaseMapper<MessageEntity> {
	/**
	 * 查询用户的所有相关的聊天对话
	 * @param userId  用户ID
	 * @Param talkTo  聊天对象
	 * @param categoryId 消息类型
	 */
	List<MessageEntity> queryRelevantMessages(@Param("userId")Long userId, @Param("talkTo")Long talkTo, @Param("categoryId")Long categoryId);
}
