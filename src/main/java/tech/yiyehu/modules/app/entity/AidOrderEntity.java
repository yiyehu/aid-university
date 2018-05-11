package tech.yiyehu.modules.app.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 帮帮订单
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-05-07 16:20:14
 */
@TableName("tb_aid_order")
public class AidOrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 帮帮订单ID
	 */
	@TableId
	private Long aidId;
	/**
	 * 分类ID
	 */
	private Long categoryId;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 截至时间
	 */
	private Date deadline;
	/**
	 * 完成时间
	 */
	private Date finishTime;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 订单描述
	 */
	private String description;
	/**
	 * 订单状态
	 */
	private Integer status;
	/**
	 * 订单地址
	 */
	private String orderAddress;
	/**
	 * 接单报酬
	 */
	private Integer remuneration;
	/**
	 * 付款方式
	 */
	private Integer paymentMethod;
	/**
	 * 接单人ID
	 */
	private Long receiverId;
	/**
	 * 接单人联系方式
	 */
	private String receiverContact;
	/**
	 * 创建人ID
	 */
	private Long creatorId;
	/**
	 * 创建人联系方式
	 */
	private String creatorContact;
	/**
	 * 评价
	 */
	private String commentThing;
	/**
	 * 星级
	 */
	private Integer commentStar;
	/**
	 * 接单后信息
	 */
	private String receivedInfo;

	/**
	 * 设置：帮帮订单ID
	 */
	public void setAidId(Long aidId) {
		this.aidId = aidId;
	}
	/**
	 * 获取：帮帮订单ID
	 */
	public Long getAidId() {
		return aidId;
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
	 * 设置：创建时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * 设置：截至时间
	 */
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	/**
	 * 获取：截至时间
	 */
	public Date getDeadline() {
		return deadline;
	}
	/**
	 * 设置：完成时间
	 */
	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
	/**
	 * 获取：完成时间
	 */
	public Date getFinishTime() {
		return finishTime;
	}
	/**
	 * 设置：标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 获取：标题
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * 设置：订单描述
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * 获取：订单描述
	 */
	public String getDescription() {
		return description;
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
	 * 设置：订单地址
	 */
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	/**
	 * 获取：订单地址
	 */
	public String getOrderAddress() {
		return orderAddress;
	}
	/**
	 * 设置：接单报酬
	 */
	public void setRemuneration(Integer remuneration) {
		this.remuneration = remuneration;
	}
	/**
	 * 获取：接单报酬
	 */
	public Integer getRemuneration() {
		return remuneration;
	}
	/**
	 * 设置：付款方式
	 */
	public void setPaymentMethod(Integer paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	/**
	 * 获取：付款方式
	 */
	public Integer getPaymentMethod() {
		return paymentMethod;
	}
	/**
	 * 设置：接单人ID
	 */
	public void setReceiverId(Long receiverId) {
		this.receiverId = receiverId;
	}
	/**
	 * 获取：接单人ID
	 */
	public Long getReceiverId() {
		return receiverId;
	}
	/**
	 * 设置：接单人联系方式
	 */
	public void setReceiverContact(String receiverContact) {
		this.receiverContact = receiverContact;
	}
	/**
	 * 获取：接单人联系方式
	 */
	public String getReceiverContact() {
		return receiverContact;
	}
	/**
	 * 设置：创建人ID
	 */
	public void setCreatorId(Long creatorId) {
		this.creatorId = creatorId;
	}
	/**
	 * 获取：创建人ID
	 */
	public Long getCreatorId() {
		return creatorId;
	}
	/**
	 * 设置：创建人联系方式
	 */
	public void setCreatorContact(String creatorContact) {
		this.creatorContact = creatorContact;
	}
	/**
	 * 获取：创建人联系方式
	 */
	public String getCreatorContact() {
		return creatorContact;
	}
	/**
	 * 设置：评价
	 */
	public void setCommentThing(String commentThing) {
		this.commentThing = commentThing;
	}
	/**
	 * 获取：评价
	 */
	public String getCommentThing() {
		return commentThing;
	}
	/**
	 * 设置：星级
	 */
	public void setCommentStar(Integer commentStar) {
		this.commentStar = commentStar;
	}
	/**
	 * 获取：星级
	 */
	public Integer getCommentStar() {
		return commentStar;
	}
	/**
	 * 设置：接单后信息
	 */
	public void setReceivedInfo(String receivedInfo) {
		this.receivedInfo = receivedInfo;
	}
	/**
	 * 获取：接单后信息
	 */
	public String getReceivedInfo() {
		return receivedInfo;
	}
}
