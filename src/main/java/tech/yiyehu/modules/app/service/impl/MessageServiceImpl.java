package tech.yiyehu.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;

import tech.yiyehu.modules.app.dao.MessageDao;
import tech.yiyehu.modules.app.entity.MessageEntity;
import tech.yiyehu.modules.app.service.MessageService;


@Service("messageService")
public class MessageServiceImpl extends ServiceImpl<MessageDao, MessageEntity> implements MessageService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<MessageEntity> page = this.selectPage(
                new Query<MessageEntity>(params).getPage(),
                new EntityWrapper<MessageEntity>()
        );

        return new PageUtils(page);
    }

}
