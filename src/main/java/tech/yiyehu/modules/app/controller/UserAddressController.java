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

import tech.yiyehu.modules.app.entity.UserAddressEntity;
import tech.yiyehu.modules.app.service.UserAddressService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;



/**
 * 用户地址
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@RestController
@RequestMapping("app/useraddress")
public class UserAddressController {
    @Autowired
    private UserAddressService userAddressService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:useraddress:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userAddressService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{addressId}")
    @RequiresPermissions("app:useraddress:info")
    public R info(@PathVariable("addressId") Long addressId){
			UserAddressEntity userAddress = userAddressService.selectById(addressId);

        return R.ok().put("userAddress", userAddress);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:useraddress:save")
    public R save(@RequestBody UserAddressEntity userAddress){
			userAddressService.insert(userAddress);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:useraddress:update")
    public R update(@RequestBody UserAddressEntity userAddress){
			userAddressService.updateById(userAddress);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:useraddress:delete")
    public R delete(@RequestBody Long[] addressIds){
			userAddressService.deleteBatchIds(Arrays.asList(addressIds));

        return R.ok();
    }

}
