package tech.yiyehu.modules.aid.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import tech.yiyehu.common.utils.PageUtils;
import tech.yiyehu.common.utils.Query;
import tech.yiyehu.modules.aid.dao.GoodsImagesDao;
import tech.yiyehu.modules.aid.entity.GoodsImagesEntity;
import tech.yiyehu.modules.aid.service.GoodsImagesService;
import tech.yiyehu.modules.oss.cloud.CloudStorageService;
import tech.yiyehu.modules.oss.cloud.OSSFactory;
import tech.yiyehu.modules.oss.utils.FileUtils;

import java.io.File;
import java.util.Map;

@Service("goodsImagesService")
public class GoodsImagesServiceImpl extends ServiceImpl<GoodsImagesDao, GoodsImagesEntity>
		implements GoodsImagesService {

	private final static Logger logger = LoggerFactory.getLogger(GoodsImagesServiceImpl.class);

	GoodsImagesDao goodsImagesDao;

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		Page<GoodsImagesEntity> page = this.selectPage(new Query<GoodsImagesEntity>(params).getPage(),
				new EntityWrapper<GoodsImagesEntity>());

		downloadImages(page);
		return new PageUtils(page);
	}

	@Override
	public PageUtils queryPageWithWhere(Map<String, Object> params, GoodsImagesEntity goodsImagesEntity) {

		Page<GoodsImagesEntity> page = this.selectPage(new Query<GoodsImagesEntity>(params).getPage(),
				new EntityWrapper<GoodsImagesEntity>(goodsImagesEntity));
		downloadImages(page);
		return new PageUtils(page);
	}

	private void downloadImages (Page<GoodsImagesEntity> page){
		File file = null;
		File image = new File(FileUtils.resoucePath + "image/");
		if (!image.exists()) {
			image.mkdirs();
		}
		String realPath;
		for (GoodsImagesEntity entity : page.getRecords()) {
			realPath = FileUtils.resoucePath + "image/" + FileUtils.getFileName(entity.getLocalPath());
			logger.debug(realPath);
			logger.info(realPath);
			logger.error(realPath);
			file = new File(realPath);
			if (!file.exists()) {
				CloudStorageService cloudStorage = OSSFactory.build();
				cloudStorage.download(entity.getPathKey(), realPath);
			}

		}
	}
}
