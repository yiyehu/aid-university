package tech.yiyehu.modules.app.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiOperation;
import tech.yiyehu.modules.app.annotation.Login;
import tech.yiyehu.modules.aid.entity.MessageEntity;
import tech.yiyehu.modules.aid.service.MessageService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;



/**
 * 留言
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-20 22:01:08
 */
@RestController("appMessageController")
@RequestMapping("app/message")
public class MessageController {
    @Autowired
    private MessageService messageService;


    
    /**
	 * 查询用户的所有相关的聊天对话
	 * @param userId  用户ID
	 * @Param talkTo  聊天对象
	 * @param categoryId 消息类型
	 */
    @Login
    @GetMapping("/queryRelevantMessages")
    @ApiOperation("查询用户的所有相关的聊天对话")
    public R queryRelevantMessages(@RequestAttribute("userId") Long userId,@RequestParam Long talkTo,@RequestParam Long categoryId) {
    	
    	return R.ok().put("messages", messageService.queryRelevantMessages(userId,talkTo,categoryId));
    }
}
