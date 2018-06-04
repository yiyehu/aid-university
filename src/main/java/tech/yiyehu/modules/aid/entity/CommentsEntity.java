package tech.yiyehu.modules.aid.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 评论
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-20 22:01:08
 */
@TableName("tb_comments")
public class CommentsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 评价ID
	 */
	@TableId
	private Long commentId;
	/**
	 * 评价内容
	 */
	private String content;
	/**
	 * 星级
	 */
	private Integer star;
	/**
	 * 是否匿名
	 */
	private Integer isAnon;
	/**
	 * 添加时间
	 */
	private Date createTime;
	/**
	 * 订单id
	 */
	private Long orderId;

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
	 * 设置：评价内容
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：评价内容
	 */
	public String getContent() {
		return content;
	}
	/**
	 * 设置：星级
	 */
	public void setStar(Integer star) {
		this.star = star;
	}
	/**
	 * 获取：星级
	 */
	public Integer getStar() {
		return star;
	}
	/**
	 * 设置：是否匿名
	 */
	public void setIsAnon(Integer isAnon) {
		this.isAnon = isAnon;
	}
	/**
	 * 获取：是否匿名
	 */
	public Integer getIsAnon() {
		return isAnon;
	}
	/**
	 * 设置：添加时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：添加时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * 设置：订单id
	 */
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	/**
	 * 获取：订单id
	 */
	public Long getOrderId() {
		return orderId;
	}
}
