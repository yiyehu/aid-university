package tech.yiyehu.modules.app.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
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
	private Integer goodsId;
	/**
	 * 评价ID
	 */
	private Long commentId;
	/**
	 * 用户ID
	 */
	private Long userId;
	/**
	 * 订单时间
	 */
	private Date 订单时间;
	/**
	 * 是否评价
	 */
	private Integer isComment;
	/**
	 * 订单状态
	 */
	private Integer status;
	/**
	 * 备注
	 */
	private String remark;

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
	 * 设置：订单时间
	 */
	public void set订单时间(Date 订单时间) {
		this.订单时间 = 订单时间;
	}
	/**
	 * 获取：订单时间
	 */
	public Date get订单时间() {
		return 订单时间;
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
}
