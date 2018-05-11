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
 * @date 2018-04-28 12:38:44
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
	 * 留言内容
	 */
	private String content;
	/**
	 * 是否匿名
	 */
	private Integer anon;
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
	 * 对面聊天人的ID
	 */
	private Long talkTo;
	/**
	 * 对面聊天人的姓名
	 */
	private String talkToName;
	/**
	 * 消息类型ID
	 */
	private Long categoryId;
	/**
	 * 消息类型对应的服务ID
	 */
	private Long categoryMessageId;

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
	public void setAnon(Integer anon) {
		this.anon = anon;
	}
	/**
	 * 获取：是否匿名
	 */
	public Integer getAnon() {
		return anon;
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
	/**
	 * 设置：对面聊天人的ID
	 */
	public void setTalkTo(Long talkTo) {
		this.talkTo = talkTo;
	}
	/**
	 * 获取：对面聊天人的ID
	 */
	public Long getTalkTo() {
		return talkTo;
	}
	/**
	 * 设置：对面聊天人的姓名
	 */
	public void setTalkToName(String talkToName) {
		this.talkToName = talkToName;
	}
	/**
	 * 获取：对面聊天人的姓名
	 */
	public String getTalkToName() {
		return talkToName;
	}
	/**
	 * 设置：消息类型ID
	 */
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	/**
	 * 获取：消息类型ID
	 */
	public Long getCategoryId() {
		return categoryId;
	}
	/**
	 * 设置：消息类型对应的服务ID
	 */
	public void setCategoryMessageId(Long categoryMessageId) {
		this.categoryMessageId = categoryMessageId;
	}
	/**
	 * 获取：消息类型对应的服务ID
	 */
	public Long getCategoryMessageId() {
		return categoryMessageId;
	}
}
