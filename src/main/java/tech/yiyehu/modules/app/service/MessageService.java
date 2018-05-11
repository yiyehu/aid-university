package tech.yiyehu.modules.app.service;

import com.baomidou.mybatisplus.service.IService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.modules.app.entity.MessageEntity;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * 留言
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-20 22:01:08
 */
public interface MessageService extends IService<MessageEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
    List<MessageEntity> queryRelevantMessages(@Param("userId")Long userId, @Param("talkTo")Long talkTo, @Param("categoryId")Long categoryId);
}

