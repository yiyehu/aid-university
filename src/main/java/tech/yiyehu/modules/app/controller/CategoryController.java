package tech.yiyehu.modules.app.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.aid.entity.CategoryEntity;
import tech.yiyehu.modules.aid.service.CategoryService;
import tech.yiyehu.modules.app.utils.Constant;



/**
 * 分类
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@RestController("appCategoryController")
@RequestMapping("app/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    
    /**
	 * 信息
	 */
	@GetMapping("/queryTopCategory")
	public R queryTopCategory() {
		List<CategoryEntity> list = new ArrayList<CategoryEntity>();
		list = categoryService.queryCategoryByParentId(0l);
		return R.ok().put("topCategory", list);
	}
	

	
	/**
	 * 返回所有父类ID（parentID）为书籍（Constant.CATEGORY_BOOK）的所有书籍的分类
	 * @return
	 */
	@GetMapping("/bookCategorys")
	public R bookCategorys() {
		EntityWrapper<CategoryEntity> ew = new EntityWrapper<CategoryEntity>();
		ew.where("parent_id = {0}",Constant.CATEGORY_BOOK);
		List<CategoryEntity> list = categoryService.selectList(ew);
		return R.ok().put("bookCategorys",list);
	}
	
	/**
	 * 返回所有父类ID（parentID）为帮帮订单（Constant.CATEGORY_AID）的所有帮帮订单的分类
	 * @return
	 */
	@GetMapping("/aidCategorys")
	public R aidCategorys() {
		EntityWrapper<CategoryEntity> ew = new EntityWrapper<CategoryEntity>();
		ew.where("parent_id = {0}",Constant.CATEGORY_AID);
		List<CategoryEntity> list = categoryService.selectList(ew);
		return R.ok().put("aidCategorys",list);
	}
}
