package tech.yiyehu.modules.aid.controller;

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
@RestController
@RequestMapping("app/comments")
public class CommentsController {
    @Autowired
    private CommentsService commentsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:comments:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = commentsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{commentId}")
    @RequiresPermissions("app:comments:info")
    public R info(@PathVariable("commentId") Long commentId) {
        CommentsEntity comments = commentsService.selectById(commentId);

        return R.ok().put("comments", comments);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:comments:save")
    public R save(@RequestBody CommentsEntity comments) {
        commentsService.insert(comments);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:comments:update")
    public R update(@RequestBody CommentsEntity comments) {
        commentsService.updateById(comments);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:comments:delete")
    public R delete(@RequestBody Long[] commentIds) {
        commentsService.deleteBatchIds(Arrays.asList(commentIds));

        return R.ok();
    }

}
