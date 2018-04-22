package tech.yiyehu.modules.app.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.app.entity.GoodsEntity;
import tech.yiyehu.modules.app.service.GoodsService;



/**
 * 商品
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@RestController
@RequestMapping("app/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:goods:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = goodsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{goodsId}")
    @RequiresPermissions("app:goods:info")
    public R info(@PathVariable("goodsId") Integer goodsId){
			GoodsEntity goods = goodsService.selectById(goodsId);

        return R.ok().put("goods", goods);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:goods:save")
    public R save(@RequestBody GoodsEntity goods){
			goodsService.insert(goods);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:goods:update")
    public R update(@RequestBody GoodsEntity goods){
			goodsService.updateById(goods);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:goods:delete")
    public R delete(@RequestBody Integer[] goodsIds){
			goodsService.deleteBatchIds(Arrays.asList(goodsIds));

        return R.ok();
    }

    /**
     * 列表
     */
    @RequestMapping("/list/{userId}")
    public R listWithUserId(@RequestParam Map<String, Object> params,@PathVariable("userId") long userId){
    	GoodsEntity goodsEntity = new GoodsEntity();
    	goodsEntity.setUserId(userId);
        PageUtils page = goodsService.queryPageWithWhere(params,goodsEntity);

        return R.ok().put("page", page);
    }
}
