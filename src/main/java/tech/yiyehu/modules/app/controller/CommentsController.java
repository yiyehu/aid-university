package tech.yiyehu.modules.app.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.aid.entity.CommentsEntity;
import tech.yiyehu.modules.aid.service.CommentsService;

import java.util.Arrays;
import java.util.Map;


/**
 * 评论
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-20 22:01:08
 */
@RestController("appCommentsController")
@RequestMapping("app/comments")
public class CommentsController {
    @Autowired
    private CommentsService commentsService;


}
