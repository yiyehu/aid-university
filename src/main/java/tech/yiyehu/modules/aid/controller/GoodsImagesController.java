package tech.yiyehu.modules.aid.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.R;
import tech.yiyehu.modules.aid.entity.GoodsImagesEntity;
import tech.yiyehu.modules.aid.service.GoodsImagesService;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

/**
 * 商品图片
 *
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-10 12:10:22
 * @date 2018-04-13 13:40:42
 */
@RestController
@RequestMapping("app/goodsimages")
public class GoodsImagesController {
	@Autowired
	private GoodsImagesService goodsImagesService;


	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("app:goodsimages:list")
	public R list(@RequestParam Map<String, Object> params) {
		PageUtils page = goodsImagesService.queryPage(params);

		return R.ok().put("page", page);
	}

	/**
	 * 列表
	 * @param params
	 * @param goodsId 查找指定商品的图片
	 * @return R
	 */
	@RequestMapping("/list/{goodsId}")
	public R listWithGoodsId(@RequestParam Map<String, Object> params,@PathVariable Integer goodsId) {
		GoodsImagesEntity goodsImages = new GoodsImagesEntity();
		goodsImages.setGoodsId(goodsId);
		PageUtils page = goodsImagesService.queryPageWithWhere(params, goodsImages);
		return R.ok().put("page", page);
	}
	/**
	 * 
	 * 信息
	 */
	@RequestMapping("/info/{goodImageId}")
	@RequiresPermissions("app:goodsimages:info")
	public R info(@PathVariable("goodImageId") Long goodImageId) {
		GoodsImagesEntity goodsImages = goodsImagesService.selectById(goodImageId);

		return R.ok().put("goodsImages", goodsImages);
	}

	/**
	 * 保存
	 * @throws IOException 
	 */
	@RequestMapping("/save")
	@RequiresPermissions("app:goodsimages:save")
	public R save(@RequestBody GoodsImagesEntity goodsImages) throws IOException {
		goodsImagesService.insert(goodsImages);
		return R.ok();
	}
	
	

	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("app:goodsimages:update")
	public R update(@RequestBody GoodsImagesEntity goodsImages) {
		goodsImagesService.updateById(goodsImages);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("app:goodsimages:delete")
	public R delete(@RequestBody Long[] goodImageIds) {
		goodsImagesService.deleteBatchIds(Arrays.asList(goodImageIds));

		return R.ok();
	}

}
