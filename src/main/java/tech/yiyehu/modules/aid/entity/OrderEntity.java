package tech.yiyehu.modules.aid.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Date;

/**
 * 订单
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-18 14:41:52
 */
@TableName("tb_order")
public class OrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 订单ID
	 */
	@TableId
	private Long orderId;
	/**
	 * 商品ID
	 */
	@NotNull(message="商品ID不存在")
	private Long goodsId;
	/**
	 * 评价ID
	 */
	private Long commentId;
	/**
	 * 收货地址ID
	 */
	private Long addressId;
	/**
	 * 用户ID
	 */
	@NotNull
	private Long userId;
	/**
	 * 是否评价
	 */
	private Integer isComment;
	/**
	 * 订单状态
	 */
	@DecimalMin("0")
	@DecimalMax("4")
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
	@DecimalMin("0")
	private Integer goodsMoney;
	/**
	 * 收货方式
	 */
	private Integer deliverType;
	/**
	 * 快递费用
	 */
	@DecimalMin("0")
	private Integer deliverMoney;
	/**
	 * 订单总金额
	 */
	@DecimalMin("0")
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
	 * 支付来源
	 */
	private Integer payfrom;
	/**
	 * 收货人姓名
	 */
	@Length(max=20, message="用户名长度超出20")
	private String userName;
	/**
	 * 收货人地址
	 */
	@Length(max=200, message="收货人地址长度超出200")
	private String userAdress;
	/**
	 * 收货人手机
	 */
	@Pattern(regexp="^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$", message="手机号格式不正确")
	private String userMobile;

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
	public void setGoodsId(Long goodsId) {
		this.goodsId = goodsId;
	}
	/**
	 * 获取：商品ID
	 */
	public Long getGoodsId() {
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
	 * 设置：是否评价
	 */
	public void setIsComment(Integer isComment) {
		this.isComment = isComment;
	}
	/**
	 * 获取：是否评价
	 */
	public Integer getIsComment() {
		return isComment;
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
	 * 设置：支付来源
	 */
	public void setPayfrom(Integer payfrom) {
		this.payfrom = payfrom;
	}
	/**
	 * 获取：支付来源
	 */
	public Integer getPayfrom() {
		return payfrom;
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
}
