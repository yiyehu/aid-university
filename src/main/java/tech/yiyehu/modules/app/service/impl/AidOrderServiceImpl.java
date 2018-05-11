package tech.yiyehu.modules.app.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.app.dao.AidOrderDao;
import tech.yiyehu.modules.app.entity.AidOrderEntity;
import tech.yiyehu.modules.app.service.AidOrderService;


@Service("aidOrderService")
public class AidOrderServiceImpl extends ServiceImpl<AidOrderDao, AidOrderEntity> implements AidOrderService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
    	EntityWrapper<AidOrderEntity> ew =  new EntityWrapper<AidOrderEntity>();
    	if(params.get("status")!=null) {
    		ew.where("status = {0}",params.get("status").toString());
    	}
    	if(params.get("logStatus")!=null) {
    		if(1==Integer.parseInt(params.get("logStatus").toString())) {
    	    	if(params.get("userId")!=null) {
    	    		ew.where("creator_id = {0}",params.get("userId").toString());
    	    	}
    		}else {
    	    	if(params.get("userId")!=null) {
    	    		ew.where("receiver_id = {0}",params.get("userId").toString());
    	    	}
    		}
    	}
    	if(params.get("categoryId")!=null) {
    		ew.where("category_id = {0}",params.get("categoryId").toString());
    	}
    	if(params.get("orderBy")!=null) {
        	ew.orderBy(params.get("orderBy").toString());
    	}
        Page<AidOrderEntity> page = this.selectPage(
                new Query<AidOrderEntity>(params).getPage(),
                ew
        );

        return new PageUtils(page);
    }

}
