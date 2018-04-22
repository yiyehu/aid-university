package tech.yiyehu.modules.app.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.app.annotation.Login;
import tech.yiyehu.modules.app.entity.GoodsEntity;
import tech.yiyehu.modules.app.entity.GoodsInfoViewEntity;
import tech.yiyehu.modules.app.entity.MessageEntity;
import tech.yiyehu.modules.app.service.GoodsInfoViewService;
import tech.yiyehu.modules.app.service.GoodsService;
import tech.yiyehu.modules.app.service.MessageService;



/**
 * 商品
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@RestController
@RequestMapping("app/goodsInfo")
public class GoodsInfoViewController {
    @Autowired
    private GoodsInfoViewService goodsInfoViewService;

    @Autowired
    private GoodsService goodsService;
    
    @Autowired
    private MessageService messageService;
    /**
     * 列表
     */
    @SuppressWarnings("unchecked")
	@RequestMapping("/list")
    public R listOfApp(@RequestParam Map<String, Object> params){
        PageUtils page = goodsInfoViewService.queryPage(params);
        for(GoodsInfoViewEntity goodsInfoViewEntity :(List<GoodsInfoViewEntity>) page.getList()) {
        	
        	MessageEntity messageEntity = new MessageEntity();
        	messageEntity.setGoodsId(goodsInfoViewEntity.getGoodsId());
        	EntityWrapper<MessageEntity> wrapper = new EntityWrapper<MessageEntity>(messageEntity);
        	int count = messageService.selectCount(wrapper);
        	goodsInfoViewEntity.setMessageCount(count);
        	wrapper.last("limit 2");
        	List<MessageEntity> list = messageService.selectList(new EntityWrapper<MessageEntity>(messageEntity));
        	goodsInfoViewEntity.setMessagelist(list);
        	
        }
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{goodsId}")
    public R info(@PathVariable("goodsId") Long goodsId){
    	GoodsEntity goodsEntity = goodsService.selectById(goodsId);
        return R.ok().put("goods", goodsEntity);
    }



    /**
     * 列表
     */
    @Login
    @RequestMapping("/listOfLogin")
    public R listOfLogin(@RequestParam Map<String, Object> params,@RequestAttribute("userId") Long userId){
    	GoodsInfoViewEntity goodsInfoViewEntity = new GoodsInfoViewEntity();
    	goodsInfoViewEntity.setUserId(userId);
        PageUtils page = goodsInfoViewService.queryPage(params);

        return R.ok().put("page", page);
    }
}
