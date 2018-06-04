package tech.yiyehu.modules.aid.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

/**
 * 商品图片
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-10 22:54:19
 */
@TableName("tb_goods_images")
public class GoodsImagesEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 商品图片ID
	 */
	@TableId
	private Long goodImageId;
	/**
	 * 商品ID
	 */
	private Integer goodsId;
	/**
	 * 图片名称
	 */
	private String name;
	/**
	 * 图片类型
	 */
	private String type;
	/**
	 * 图片缓存地址
	 */
	private String localPath;
	/**
	 * 云存储key
	 */
	private String pathKey;

	/**
	 * 设置：商品图片ID
	 */
	public void setGoodImageId(Long goodImageId) {
		this.goodImageId = goodImageId;
	}
	/**
	 * 获取：商品图片ID
	 */
	public Long getGoodImageId() {
		return goodImageId;
	}
	/**
	 * 设置：商品ID
	 */
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	/**
	 * 获取：商品ID
	 */
	public Integer getGoodsId() {
		return goodsId;
	}
	/**
	 * 设置：图片名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：图片名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：图片类型
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 获取：图片类型
	 */
	public String getType() {
		return type;
	}
	/**
	 * 设置：图片缓存地址
	 */
	public void setLocalPath(String localPath) {
		this.localPath = localPath;
	}
	/**
	 * 获取：图片缓存地址
	 */
	public String getLocalPath() {
		return localPath;
	}
	/**
	 * 设置：云存储key
	 */
	public void setPathKey(String pathKey) {
		this.pathKey = pathKey;
	}
	/**
	 * 获取：云存储key
	 */
	public String getPathKey() {
		return pathKey;
	}
}
