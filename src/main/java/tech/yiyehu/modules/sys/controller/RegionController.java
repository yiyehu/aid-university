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
import tech.yiyehu.modules.sys.entity.RegionEntity;
import tech.yiyehu.modules.sys.service.RegionService;



/**
 * 县区
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@RestController
@RequestMapping("sys/region")
public class RegionController {
    @Autowired
    private RegionService regionService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
    	PageUtils page = null;
    	RegionEntity regionEntity = new RegionEntity();
        boolean change = false;
        if(params.get("name")!=null && params.get("name")!="") {
        	regionEntity.setCityId((Integer)params.get("name"));
        	change = true;
        }
        if(change) {
        	page = regionService.queryPage(params,regionEntity);
        }else {
            page = regionService.queryPage(params);
        }
        return R.ok().put("page", page);
    }

    /**
     * 
     * @param params
     * @param cityId 根据cityId查找对应的regionEntitys
     * @return
     */
    @RequestMapping("/list/{cityId}")
    public R list(@RequestParam Map<String, Object> params,@PathVariable Integer cityId){
    	RegionEntity regionEntity = new RegionEntity();
    	regionEntity.setCityId(cityId);
    	PageUtils page = regionService.queryPage(params,regionEntity);
        return R.ok().put("page", page);
    }
    
    /**
     * 信息
     */
    @RequestMapping("/info/{regionId}")
    public R info(@PathVariable("regionId") Integer regionId){
			RegionEntity region = regionService.selectById(regionId);

        return R.ok().put("region", region);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:region:save")
    public R save(@RequestBody RegionEntity region){
			regionService.insert(region);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:region:update")
    public R update(@RequestBody RegionEntity region){
			regionService.updateById(region);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:region:delete")
    public R delete(@RequestBody Integer[] regionIds){
			regionService.deleteBatchIds(Arrays.asList(regionIds));

        return R.ok();
    }

}
