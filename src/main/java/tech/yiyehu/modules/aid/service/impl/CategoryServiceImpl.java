package tech.yiyehu.modules.aid.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.aid.dao.CategoryDao;
import tech.yiyehu.modules.aid.entity.CategoryEntity;
import tech.yiyehu.modules.aid.service.CategoryService;

import java.util.List;
import java.util.Map;


@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CategoryEntity> page = this.selectPage(
                new Query<CategoryEntity>(params).getPage(),
                new EntityWrapper<CategoryEntity>()
        );

        return new PageUtils(page);
    }

	@Override
	public List<CategoryEntity> queryCategoryByParentId(long parentId) {
		
		EntityWrapper<CategoryEntity> wrapper  = new EntityWrapper<CategoryEntity>();
		wrapper.where("parent_id={0}", parentId);
		return this.selectList(wrapper);
	}

}
