package tech.yiyehu.modules.app.controller;

import java.io.IOException;
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
import tech.yiyehu.modules.aid.entity.GoodsImagesEntity;
import tech.yiyehu.modules.aid.service.GoodsImagesService;

/**
 * 商品图片
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-10 12:10:22
 * @date 2018-04-13 13:40:42
 */
@RestController("appGoodsImagesController")
@RequestMapping("app/goodsimages")
public class GoodsImagesController {
	@Autowired
	private GoodsImagesService goodsImagesService;




}
