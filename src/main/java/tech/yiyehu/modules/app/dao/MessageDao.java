package tech.yiyehu.modules.app.dao;

import tech.yiyehu.modules.app.entity.MessageEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 留言
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-20 22:01:08
 */
@Mapper
public interface MessageDao extends BaseMapper<MessageEntity> {
	
}
