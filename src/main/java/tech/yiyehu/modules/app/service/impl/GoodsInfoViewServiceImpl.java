package tech.yiyehu.modules.app.service.impl;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.app.dao.GoodsInfoViewDao;
import tech.yiyehu.modules.app.entity.GoodsInfoViewEntity;
import tech.yiyehu.modules.app.service.GoodsInfoViewService;
import tech.yiyehu.modules.oss.cloud.CloudStorageService;
import tech.yiyehu.modules.oss.cloud.OSSFactory;
import tech.yiyehu.modules.oss.utils.FileUtils;


@Service("goodsInfoViewService")
public class GoodsInfoViewServiceImpl extends ServiceImpl<GoodsInfoViewDao, GoodsInfoViewEntity> implements GoodsInfoViewService {
	
	@Autowired
	GoodsInfoViewDao goodsInfoViewDao;
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GoodsInfoViewEntity> page = this.selectPage(
                new Query<GoodsInfoViewEntity>(params).getPage(),
                new EntityWrapper<GoodsInfoViewEntity>()
        );
        File file=null;
        File image = new File(FileUtils.resoucePath+"image/");
		if(!image.exists()) {
			image.mkdirs();
		}
		String realPath;
        for(GoodsInfoViewEntity entity : page.getRecords()) {
			realPath = FileUtils.resoucePath+"image/"+FileUtils.getFileName(entity.getGoodsImg());
			file = new File(realPath);
			if(!file.exists()) {
				CloudStorageService cloudStorage  = OSSFactory.build();
				cloudStorage.download(entity.getPathKey(), realPath);
			}
			
		}
        return new PageUtils(page);
    }
}
