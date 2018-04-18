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
import tech.yiyehu.modules.sys.entity.CityEntity;
import tech.yiyehu.modules.sys.service.CityService;



/**
 * 城市
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@RestController
@RequestMapping("sys/city")
public class CityController {
    @Autowired
    private CityService cityService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
    	PageUtils page = null;
    	CityEntity cityEntity = new CityEntity();
        boolean change = false;
        if(params.get("name")!=null && params.get("name")!="") {
        	cityEntity.setProvinceId((Integer)params.get("name"));
        	change = true;
        }
        if(change) {
        	page = cityService.queryPage(params,cityEntity);
        }else {
            page = cityService.queryPage(params);
        }
        return R.ok().put("page", page);
    }
    

    /**
     * 
     * @param params page用
     * @param provinceId 根据provinceID查找对应的cityEntitys
     * @return R
     */
    @RequestMapping("/list/{provinceId}")
    public R list(@RequestParam Map<String, Object> params,@PathVariable Integer provinceId){
    	CityEntity cityEntity = new CityEntity();
    	cityEntity.setProvinceId(provinceId);
    	PageUtils page = cityService.queryPage(params,cityEntity);
        return R.ok().put("page", page);
    }
    
    /**
     * 信息
     */
    @RequestMapping("/info/{cityId}")
    public R info(@PathVariable("cityId") Integer cityId){
			CityEntity city = cityService.selectById(cityId);

        return R.ok().put("city", city);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:city:save")
    public R save(@RequestBody CityEntity city){
			cityService.insert(city);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:city:update")
    public R update(@RequestBody CityEntity city){
			cityService.updateById(city);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:city:delete")
    public R delete(@RequestBody Integer[] cityIds){
			cityService.deleteBatchIds(Arrays.asList(cityIds));

        return R.ok();
    }

}
