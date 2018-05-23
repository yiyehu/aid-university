package tech.yiyehu.modules.app.service.impl;

import java.io.File;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.app.dao.OrderInfoViewDao;
import tech.yiyehu.modules.app.entity.OrderInfoViewEntity;
import tech.yiyehu.modules.app.service.OrderInfoViewService;
import tech.yiyehu.modules.oss.cloud.CloudStorageService;
import tech.yiyehu.modules.oss.cloud.OSSFactory;
import tech.yiyehu.modules.oss.utils.FileUtils;


@Service("orderInfoViewService")
public class OrderInfoViewServiceImpl extends ServiceImpl<OrderInfoViewDao, OrderInfoViewEntity> implements OrderInfoViewService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
    	EntityWrapper<OrderInfoViewEntity> ew =  new EntityWrapper<OrderInfoViewEntity>();
    	if(params.get("status")!=null) {
    		ew.where("status = {0}",params.get("status").toString());
    	}
    	if(params.get("customerId")!=null) {
    		ew.where("customer_id = {0}",params.get("customerId").toString());
    	}
    	if(params.get("categoryId")!=null) {
    		ew.where("category_id = {0}",params.get("categoryId").toString());
    	}
    	if(params.get("orderBy")!=null) {
        	ew.orderBy(params.get("orderBy").toString());
    	}
        Page<OrderInfoViewEntity> page = this.selectPage(
                new Query<OrderInfoViewEntity>(params).getPage(),
                ew
        );
        
        File file=null;
        FileUtils.makedir(FileUtils.resoucePath+"image/");//如果没有image文件夹，创建image文件夹
		String realPath;
        for(OrderInfoViewEntity entity : page.getRecords()) {
			realPath = FileUtils.resoucePath+"image/"+FileUtils.getFileName(entity.getGoodsImg());
			file = new File(realPath);
			if(!file.exists()) {
				CloudStorageService cloudStorage  = OSSFactory.build();
				cloudStorage.download(entity.getGoodsImgKey(), realPath);
			}
			
		}
        
        return new PageUtils(page);
    }

}
