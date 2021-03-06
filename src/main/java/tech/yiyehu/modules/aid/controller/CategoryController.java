package tech.yiyehu.modules.aid.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.aid.entity.CategoryEntity;
import tech.yiyehu.modules.aid.service.CategoryService;
import tech.yiyehu.modules.app.utils.Constant;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 分类
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@RestController
@RequestMapping("app/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = categoryService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{categoryId}")
    public R info(@PathVariable("categoryId") Long categoryId) {
        CategoryEntity category = categoryService.selectById(categoryId);

        return R.ok().put("category", category);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:category:save")
    public R save(@RequestBody CategoryEntity category) {
        categoryService.insert(category);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:category:update")
    public R update(@RequestBody CategoryEntity category) {
        categoryService.updateById(category);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:category:delete")
    public R delete(@RequestBody Long[] categoryIds) {
        categoryService.deleteBatchIds(Arrays.asList(categoryIds));

        return R.ok();
    }
}
