package tech.yiyehu.modules.aid.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.aid.dao.CommentsDao;
import tech.yiyehu.modules.aid.entity.CommentsEntity;
import tech.yiyehu.modules.aid.service.CommentsService;

import java.util.Map;


@Service("commentsService")
public class CommentsServiceImpl extends ServiceImpl<CommentsDao, CommentsEntity> implements CommentsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CommentsEntity> page = this.selectPage(
                new Query<CommentsEntity>(params).getPage(),
                new EntityWrapper<CommentsEntity>()
        );

        return new PageUtils(page);
    }

}
