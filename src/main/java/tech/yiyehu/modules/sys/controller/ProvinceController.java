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
import tech.yiyehu.modules.sys.entity.ProvinceEntity;
import tech.yiyehu.modules.sys.service.ProvinceService;



/**
 * 省份
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@RestController
@RequestMapping("sys/province")
public class ProvinceController {
    @Autowired
    private ProvinceService provinceService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = null;
    	ProvinceEntity provinceEntity = new ProvinceEntity();
        boolean change = false;
        if(params.get("provinceId")!=null && params.get("provinceId")!="") {
        	provinceEntity.setProvinceId((Integer)params.get("provinceId"));
        	change = true;
        }
        if(params.get("name")!=null && params.get("name")!="") {
        	provinceEntity.setName(params.get("name").toString());
        	change = true;
        }
        if(change) {
        	page = provinceService.queryPage(params,provinceEntity);
        }else {
            page = provinceService.queryPage(params);
        }
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{provinceId}")
    public R info(@PathVariable("provinceId") Integer provinceId){
			ProvinceEntity province = provinceService.selectById(provinceId);

        return R.ok().put("province", province);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:province:save")
    public R save(@RequestBody ProvinceEntity province){
			provinceService.insert(province);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:province:update")
    public R update(@RequestBody ProvinceEntity province){
			provinceService.updateById(province);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:province:delete")
    public R delete(@RequestBody Integer[] provinceIds){
			provinceService.deleteBatchIds(Arrays.asList(provinceIds));

        return R.ok();
    }

}
