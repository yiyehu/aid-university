package tech.yiyehu.modules.aid.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

/**
 * 购物车
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
@TableName("tb_carts")
public class CartsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 购物车ID
	 */
	@TableId
	private Long cartId;
	/**
	 * 用户ID
	 */
	private Long userId;
	/**
	 * 商品ID
	 */
	private Integer goodsId;
	
	private String name;
	
	private Integer price;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getLocalPath() {
		return localPath;
	}
	public void setLocalPath(String localPath) {
		this.localPath = localPath;
	}
	public String getPathKey() {
		return pathKey;
	}
	public void setPathKey(String pathKey) {
		this.pathKey = pathKey;
	}
	/**
	 * 图片缓存地址
	 */
	private String localPath;
	/**
	 * 云存储key
	 */
	private String pathKey;

	/**
	 * 设置：购物车ID
	 */
	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}
	/**
	 * 获取：购物车ID
	 */
	public Long getCartId() {
		return cartId;
	}
	/**
	 * 设置：用户ID
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：用户ID
	 */
	public Long getUserId() {
		return userId;
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
}
