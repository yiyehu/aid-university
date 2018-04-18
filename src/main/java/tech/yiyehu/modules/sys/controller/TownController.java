package tech.yiyehu.modules.sys.controller;

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
import tech.yiyehu.modules.sys.entity.TownEntity;
import tech.yiyehu.modules.sys.service.TownService;



/**
 * 城镇
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@RestController
@RequestMapping("sys/town")
public class TownController {
    @Autowired
    private TownService townService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = null;
        TownEntity townEntity = new TownEntity();
        boolean change = false;
        if(params.get("name")!=null && params.get("name")!="") {
        	townEntity.setRegionId((Integer)params.get("name"));
        	change = true;
        }
        if(change) {
        	page = townService.queryPage(params,townEntity);
        }else {
            page = townService.queryPage(params);
        }
        return R.ok().put("page", page);
    }

    /**
     * 
     * @param params
     * @param regionId 根据regionId查找对应的townEntitys
     * @return
     */
    @RequestMapping("/list/{regionId}")
    public R list(@RequestParam Map<String, Object> params,@PathVariable Integer regionId){
        TownEntity townEntity = new TownEntity();
        townEntity.setRegionId(regionId);
        PageUtils page = townService.queryPage(params,townEntity);
        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{townId}")
    public R info(@PathVariable("townId") Integer townId){
			TownEntity town = townService.selectById(townId);

        return R.ok().put("town", town);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:town:save")
    public R save(@RequestBody TownEntity town){
			townService.insert(town);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:town:update")
    public R update(@RequestBody TownEntity town){
			townService.updateById(town);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:town:delete")
    public R delete(@RequestBody Integer[] townIds){
			townService.deleteBatchIds(Arrays.asList(townIds));

        return R.ok();
    }

}
