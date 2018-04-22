package tech.yiyehu.modules.app.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 商品
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@TableName("tb_goods_info_view")
public class GoodsInfoViewEntity implements Serializable {
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
	private String goodsName;
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
	private Date addtime;
	/**
	 * 更新时间
	 */
	private Integer updatetime;
	

	/**
	 * 商品地址
	 */
	private String goodsAddress;
	/**
	 * 商品地址
	 */
	@JsonIgnore
	private String pathKey;
	/**
	 * 商品描述
	 */
	private String description;

	/**
	 * 商品地址
	 */
	@TableField(exist = false)
	private String decoration;
	
	/**
	 * 用户姓名
	 */
	private String username;
	/**
	 * 用户Icon
	 */
	private String userImg;
	
	/**
	 * 分类名称
	 */
	private String categoryName;
	
	/**
	 * 分类图标
	 */
	private String categoryIcon;
	
	/**
	 * 商品图片
	 */
	private String goodsImg;
	/**
	 * 评论
	 */
	@TableField(exist = false)
	private List<MessageEntity> messagelist;
	/**
	 * 评论总数
	 */
	@TableField(exist = false)
	private Integer messageCount;
	
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
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getNewprice() {
		return newprice;
	}
	public void setNewprice(BigDecimal newprice) {
		this.newprice = newprice;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	public Integer getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Integer updatetime) {
		this.updatetime = updatetime;
	}
	public String getGoodsAddress() {
		return goodsAddress;
	}
	public void setGoodsAddress(String goodsAddress) {
		this.goodsAddress = goodsAddress;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDecoration() {
		return decoration;
	}
	public void setDecoration(String decoration) {
		this.decoration = decoration;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryIcon() {
		return categoryIcon;
	}
	public void setCategoryIcon(String categoryIcon) {
		this.categoryIcon = categoryIcon;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public List<MessageEntity> getMessagelist() {
		return messagelist;
	}
	public void setMessagelist(List<MessageEntity> messagelist) {
		this.messagelist = messagelist;
	}
	public Integer getMessageCount() {
		return messageCount;
	}
	public void setMessageCount(Integer messageCount) {
		this.messageCount = messageCount;
	}
	public String getPathKey() {
		return pathKey;
	}
	public void setPathKey(String pathKey) {
		this.pathKey = pathKey;
	}
	

}
