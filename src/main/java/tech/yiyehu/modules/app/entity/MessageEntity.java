package tech.yiyehu.modules.app.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 留言
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-20 22:01:08
 */
@TableName("tb_message")
public class MessageEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 留言ID
	 */
	@TableId
	private Long messageId;
	/**
	 * 留言的上级ID
	 */
	private Long parentId;
	/**
	 * 商品ID
	 */
	private Integer goodsId;
	/**
	 * 留言内容
	 */
	private String content;
	/**
	 * 是否匿名
	 */
	private Integer isAnon;
	/**
	 * 添加时间
	 */
	private Date createTime;
	/**
	 * 留言人ID
	 */
	private String userId;
	/**
	 * 留言人姓名
	 */
	private String userName;

	/**
	 * 设置：留言ID
	 */
	public void setMessageId(Long messageId) {
		this.messageId = messageId;
	}
	/**
	 * 获取：留言ID
	 */
	public Long getMessageId() {
		return messageId;
	}
	/**
	 * 设置：留言的上级ID
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	/**
	 * 获取：留言的上级ID
	 */
	public Long getParentId() {
		return parentId;
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
	 * 设置：留言内容
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：留言内容
	 */
	public String getContent() {
		return content;
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
	 * 设置：留言人ID
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * 获取：留言人ID
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * 设置：留言人姓名
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * 获取：留言人姓名
	 */
	public String getUserName() {
		return userName;
	}
}
