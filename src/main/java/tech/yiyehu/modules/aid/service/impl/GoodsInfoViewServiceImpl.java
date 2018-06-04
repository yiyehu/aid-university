package tech.yiyehu.modules.aid.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.aid.dao.GoodsInfoViewDao;
import tech.yiyehu.modules.aid.entity.GoodsInfoViewEntity;
import tech.yiyehu.modules.aid.service.GoodsInfoViewService;
import tech.yiyehu.modules.oss.cloud.CloudStorageService;
import tech.yiyehu.modules.oss.cloud.OSSFactory;
import tech.yiyehu.modules.oss.utils.FileUtils;

import java.io.File;
import java.util.Map;


@Service("goodsInfoViewService")
public class GoodsInfoViewServiceImpl extends ServiceImpl<GoodsInfoViewDao, GoodsInfoViewEntity> implements GoodsInfoViewService {
	
	@Autowired
    GoodsInfoViewDao goodsInfoViewDao;
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
    	EntityWrapper<GoodsInfoViewEntity> ew =  new EntityWrapper<GoodsInfoViewEntity>();
    	if(params.get("status")!=null) {
    		ew.where("status = {0}",params.get("status").toString());
    	}
    	if(params.get("userId")!=null) {
    		ew.where("user_id = {0}",params.get("userId").toString());
    	}
    	if(params.get("categoryId")!=null) {
    		ew.where("category_id = {0}",params.get("categoryId").toString());
    	}
    	if(params.get("orderBy")!=null) {
        	ew.orderBy(params.get("orderBy").toString());
    	}
        Page<GoodsInfoViewEntity> page = this.selectPage(
                new Query<GoodsInfoViewEntity>(params).getPage(),
                ew
        );
        File file=null;
        FileUtils.makedir(FileUtils.resoucePath+"image/");//如果没有image文件夹，创建image文件夹
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
