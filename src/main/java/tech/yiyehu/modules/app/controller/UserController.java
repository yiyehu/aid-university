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

import tech.yiyehu.modules.app.entity.UserEntity;
import tech.yiyehu.modules.app.service.UserService;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;



/**
 * 用户
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 16:58:42
 */
@RestController
@RequestMapping("app/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 列表
     */
//    @RequestMapping("/list")
//    @RequiresPermissions("app:user:list")
//    public R list(@RequestParam Map<String, Object> params){
//    	PageUtils page = null;
//        UserEntity userEntity = new UserEntity();
//        boolean change = false;
//        if(params.get("username")!=null && params.get("username")!="") {
//        	userEntity.setUsername(params.get("username").toString());
//        	change = true;
//        }
//        if(params.get("mobile")!=null&& params.get("mobile")!="") {
//        	userEntity.setMobile(params.get("mobile").toString());
//        	change = true;
//        }
//        if(change) {
//        	page = userService.queryPage(params,userEntity);
//        }else {
//            page = userService.queryPage(params);
//        }
//        return R.ok().put("page", page);
//    }

    
    @RequestMapping("/list")
    @RequiresPermissions("app:user:list")
    public R list(@RequestParam Map<String, Object> params){
    	PageUtils page = userService.queryPage(params);
        return R.ok().put("page", page);
    }
    

    /**
     * 信息
     */
    @RequestMapping("/info/{userId}")
    @RequiresPermissions("app:user:list")
    public R info(@PathVariable("userId") Long userId){
			UserEntity user = userService.selectById(userId);

        return R.ok().put("user", user);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:user:save")
    public R save(@RequestBody UserEntity user){
			userService.insert(user);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:user:update")
    public R update(@RequestBody UserEntity user){
			userService.updateById(user);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:user:delete")
    public R delete(@RequestBody Long[] userIds){
			userService.deleteBatchIds(Arrays.asList(userIds));

        return R.ok();
    }

}
