package tech.yiyehu.modules.aid.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.aid.dao.MessageDao;
import tech.yiyehu.modules.aid.entity.MessageEntity;
import tech.yiyehu.modules.aid.service.MessageService;

import java.util.List;
import java.util.Map;


@Service("messageService")
public class MessageServiceImpl extends ServiceImpl<MessageDao, MessageEntity> implements MessageService {

	@Autowired
    MessageDao messageDao;
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<MessageEntity> page = this.selectPage(
                new Query<MessageEntity>(params).getPage(),
                new EntityWrapper<MessageEntity>()
        );

        return new PageUtils(page);
    }

	@Override
	public List<MessageEntity> queryRelevantMessages(Long userId, Long talkTo, Long categoryId) {
		return messageDao.queryRelevantMessages(userId, talkTo, categoryId);
	}
}
