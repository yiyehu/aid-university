package tech.yiyehu.modules.app.service.impl;

import java.io.File;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.app.dao.GoodsImagesDao;
import tech.yiyehu.modules.app.entity.GoodsImagesEntity;
import tech.yiyehu.modules.app.service.GoodsImagesService;
import tech.yiyehu.modules.oss.cloud.CloudStorageService;
import tech.yiyehu.modules.oss.cloud.OSSFactory;
import tech.yiyehu.modules.oss.utils.FileUtils;


@Service("goodsImagesService")
public class GoodsImagesServiceImpl extends ServiceImpl<GoodsImagesDao, GoodsImagesEntity> implements GoodsImagesService {

	
	GoodsImagesDao goodsImagesDao;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GoodsImagesEntity> page = this.selectPage(
                new Query<GoodsImagesEntity>(params).getPage(),
                new EntityWrapper<GoodsImagesEntity>()
        );

        return new PageUtils(page);
    }
	@Override
	public PageUtils queryPageWithWhere(Map<String, Object> params, GoodsImagesEntity goodsImagesEntity) {
		
		Page<GoodsImagesEntity> page = this.selectPage(
                new Query<GoodsImagesEntity>(params).getPage(),
                new EntityWrapper<GoodsImagesEntity>(goodsImagesEntity)
        );
		File file=null;
		String realPath;
		for(GoodsImagesEntity entity : page.getRecords()) {
			realPath = FileUtils.resoucePath+"image/"+FileUtils.getFileName(entity.getLocalPath());
			file = new File(realPath);
			if(!file.exists()) {
				CloudStorageService cloudStorage  = OSSFactory.build();
				cloudStorage.download(entity.getPathKey(), realPath);
			}
			
		}
        return new PageUtils(page);
	}


}
