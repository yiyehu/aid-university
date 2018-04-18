package tech.yiyehu.modules.app.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 商品
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@TableName("tb_goods")
public class GoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 商品ID
	 */
	@TableId
	private Integer goodsId;
	/**
	 * 用户ID
	 */
	private Long userId;
	/**
	 * 分类ID
	 */
	private Long categoryId;
	/**
	 * 商品名称
	 */
	private String name;
	/**
	 * 价格
	 */
	private BigDecimal price;
	/**
	 * 新货价格
	 */
	private BigDecimal newprice;
	/**
	 * 状态
	 */
	private Integer status;
	/**
	 * 添加时间
	 */
	private Integer addtime;
	/**
	 * 更新时间
	 */
	private Integer updatetime;
	/**
	 * 商品描述
	 */
	private String description;

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
	 * 设置：分类ID
	 */
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	/**
	 * 获取：分类ID
	 */
	public Long getCategoryId() {
		return categoryId;
	}
	/**
	 * 设置：商品名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：商品名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：价格
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * 获取：价格
	 */
	public BigDecimal getPrice() {
		return price;
	}
	/**
	 * 设置：新货价格
	 */
	public void setNewprice(BigDecimal newprice) {
		this.newprice = newprice;
	}
	/**
	 * 获取：新货价格
	 */
	public BigDecimal getNewprice() {
		return newprice;
	}
	/**
	 * 设置：状态
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * 设置：添加时间
	 */
	public void setAddtime(Integer addtime) {
		this.addtime = addtime;
	}
	/**
	 * 获取：添加时间
	 */
	public Integer getAddtime() {
		return addtime;
	}
	/**
	 * 设置：更新时间
	 */
	public void setUpdatetime(Integer updatetime) {
		this.updatetime = updatetime;
	}
	/**
	 * 获取：更新时间
	 */
	public Integer getUpdatetime() {
		return updatetime;
	}
	/**
	 * 设置：商品描述
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * 获取：商品描述
	 */
	public String getDescription() {
		return description;
	}
}
