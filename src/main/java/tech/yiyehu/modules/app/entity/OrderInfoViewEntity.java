package tech.yiyehu.modules.app.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
@TableName("tb_order_info_view")
public class OrderInfoViewEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 订单ID
	 */
	@TableId
	private Long orderId;
	/**
	 * 收货地址ID
	 */
	private Long addressId;
	/**
	 * 商品ID
	 */
	private Integer goodsId;
	/**
	 * 评价ID
	 */
	private Long commentId;
	/**
	 * 卖家ID
	 */
	private Long ownerId;
	private String ownerName;
	private String ownerImg;
	/**
	 * 买家ID
	 */
	private Long customerId;
	private String customerName;

	/**
	 * 订单状态
	 */
	private Integer status;
	/**
	 * 下单时间
	 */
	private Date createTime;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 商品金额
	 */
	private Integer goodsMoney;
	/**
	 * 收货方式
	 */
	private Integer deliverType;
	/**
	 * 快递费用
	 */
	private Integer deliverMoney;
	/**
	 * 订单总金额
	 */
	private Integer totalMoney;
	/**
	 * 实际订单总金额
	 */
	private Integer realTotalMoney;
	/**
	 * 付费方式
	 */
	private Integer paytype;
	/**
	 * 收货人姓名
	 */
	private String userName;
	/**
	 * 收货人地址
	 */
	private String userAdress;
	/**
	 * 收货人手机
	 */
	private String userMobile;
//---------------------------------------------------------------goods

	/**
	 * 价格
	 */
	private BigDecimal price;
	/**
	 * 商品地址
	 */
	private String goodsAddress;

	/**
	 * 商品名称
	 */
	private String goodsName;
	private String goodsImg;
	private String goodsImgKey;
	/**
	 * 商品描述
	 */
	private String description;
//----------------------------------------------------------------category	
	/**
	 * 分类ID
	 */
	private Long categoryId;
	private String categoryName;
	private String categoryIcon;
	
	/**
	 * 设置：订单ID
	 */
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	/**
	 * 获取：订单ID
	 */
	public Long getOrderId() {
		return orderId;
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
	 * 设置：评价ID
	 */
	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}
	/**
	 * 获取：评价ID
	 */
	public Long getCommentId() {
		return commentId;
	}
	/**
	 * 设置：收货地址ID
	 */
	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}
	/**
	 * 获取：收货地址ID
	 */
	public Long getAddressId() {
		return addressId;
	}


	/**
	 * 设置：订单状态
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：订单状态
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * 设置：下单时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：下单时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * 设置：备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：备注
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * 设置：商品金额
	 */
	public void setGoodsMoney(Integer goodsMoney) {
		this.goodsMoney = goodsMoney;
	}
	/**
	 * 获取：商品金额
	 */
	public Integer getGoodsMoney() {
		return goodsMoney;
	}
	/**
	 * 设置：收货方式
	 */
	public void setDeliverType(Integer deliverType) {
		this.deliverType = deliverType;
	}
	/**
	 * 获取：收货方式
	 */
	public Integer getDeliverType() {
		return deliverType;
	}
	/**
	 * 设置：快递费用
	 */
	public void setDeliverMoney(Integer deliverMoney) {
		this.deliverMoney = deliverMoney;
	}
	/**
	 * 获取：快递费用
	 */
	public Integer getDeliverMoney() {
		return deliverMoney;
	}
	/**
	 * 设置：订单总金额
	 */
	public void setTotalMoney(Integer totalMoney) {
		this.totalMoney = totalMoney;
	}
	/**
	 * 获取：订单总金额
	 */
	public Integer getTotalMoney() {
		return totalMoney;
	}
	/**
	 * 设置：实际订单总金额
	 */
	public void setRealTotalMoney(Integer realTotalMoney) {
		this.realTotalMoney = realTotalMoney;
	}
	/**
	 * 获取：实际订单总金额
	 */
	public Integer getRealTotalMoney() {
		return realTotalMoney;
	}
	/**
	 * 设置：付费方式
	 */
	public void setPaytype(Integer paytype) {
		this.paytype = paytype;
	}
	/**
	 * 获取：付费方式
	 */
	public Integer getPaytype() {
		return paytype;
	}
	/**
	 * 设置：收货人姓名
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * 获取：收货人姓名
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * 设置：收货人地址
	 */
	public void setUserAdress(String userAdress) {
		this.userAdress = userAdress;
	}
	/**
	 * 获取：收货人地址
	 */
	public String getUserAdress() {
		return userAdress;
	}
	/**
	 * 设置：收货人手机
	 */
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	/**
	 * 获取：收货人手机
	 */
	public String getUserMobile() {
		return userMobile;
	}
	public Long getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(Long ownerId) {
		this.ownerId = ownerId;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getOwnerImg() {
		return ownerImg;
	}
	public void setOwnerImg(String ownerImg) {
		this.ownerImg = ownerImg;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getGoodsAddress() {
		return goodsAddress;
	}
	public void setGoodsAddress(String goodsAddress) {
		this.goodsAddress = goodsAddress;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public String getGoodsImgKey() {
		return goodsImgKey;
	}
	public void setGoodsImgKey(String goodsImgKey) {
		this.goodsImgKey = goodsImgKey;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
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
	
	
}
