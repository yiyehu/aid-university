package tech.yiyehu.modules.app.controller;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.common.validator.ValidatorUtils;
import tech.yiyehu.modules.app.entity.UserEntity;
import tech.yiyehu.modules.app.form.LoginForm;
import tech.yiyehu.modules.app.service.UserService;
import tech.yiyehu.modules.app.utils.JwtUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * APP登录授权
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-23 15:31
 */
@RestController
@RequestMapping("/app")
@Api("APP登录接口")
public class AppLoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private JwtUtils jwtUtils;

    /**
     * 登录
     */
    @PostMapping("login")
    @ApiOperation("登录")
    public R login(@RequestBody LoginForm form){
        //表单校验
        ValidatorUtils.validateEntity(form);

        //用户登录
        UserEntity user = userService.login(form);

        //生成token
        String token = jwtUtils.generateToken(user.getUserId());

        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("userId", user.getUserId());
        map.put("name", user.getUsername());
        map.put("expire", jwtUtils.getExpire());

        return R.ok(map);
    }

}
