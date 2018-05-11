package tech.yiyehu.modules.app.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-10 10:37:53
 */
@TableName("tb_user")
public class UserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户ID
	 */
	@TableId
	private Long userId;
	/**
	 * 用户姓名
	 */
	private String username;
	/**
	 * 手机号
	 */
	private String mobile;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 密码
	 */
	@JsonIgnore
	private String password;
	/**
	 * 小图标
	 */
	private String img;
	/**
	 * 默认地址
	 */
	private Long address;
	/**
	 * 云存储key
	 */
	private String pathKey;

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
	 * 设置：用户姓名
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * 获取：用户姓名
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * 设置：手机号
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 获取：手机号
	 */
	public String getMobile() {
		return mobile;
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
	 * 设置：密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * 获取：密码
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * 设置：小图标
	 */
	public void setImg(String img) {
		this.img = img;
	}
	/**
	 * 获取：小图标
	 */
	public String getImg() {
		return img;
	}
	/**
	 * 设置：默认地址
	 */
	public void setAddress(Long address) {
		this.address = address;
	}
	/**
	 * 获取：默认地址
	 */
	public Long getAddress() {
		return address;
	}
	/**
	 * 设置：云存储key
	 */
	public void setPathKey(String pathKey) {
		this.pathKey = pathKey;
	}
	/**
	 * 获取：云存储key
	 */
	public String getPathKey() {
		return pathKey;
	}
}
