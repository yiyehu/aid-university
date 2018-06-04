package tech.yiyehu.modules.aid.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

/**
 * 分类
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-07 18:06:12
 */
@TableName("tb_category")
public class CategoryEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 分类ID
	 */
	@TableId
	private Long categoryId;
	/**
	 * 分类名
	 */
	private String name;
	/**
	 * 父类ID
	 */
	private Long parentId;
	/**
	 * url路径
	 */
	private String urlname;
	/**
	 * 等级
	 */
	private Integer level;
	/**
	 * 图标
	 */
	private String icon;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 关键字
	 */
	private String keywords;

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
	 * 设置：分类名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：分类名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：父类ID
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	/**
	 * 获取：父类ID
	 */
	public Long getParentId() {
		return parentId;
	}
	/**
	 * 设置：url路径
	 */
	public void setUrlname(String urlname) {
		this.urlname = urlname;
	}
	/**
	 * 获取：url路径
	 */
	public String getUrlname() {
		return urlname;
	}
	/**
	 * 设置：等级
	 */
	public void setLevel(Integer level) {
		this.level = level;
	}
	/**
	 * 获取：等级
	 */
	public Integer getLevel() {
		return level;
	}
	/**
	 * 设置：图标
	 */
	public void setIcon(String icon) {
		this.icon = icon;
	}
	/**
	 * 获取：图标
	 */
	public String getIcon() {
		return icon;
	}
	/**
	 * 设置：描述
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * 获取：描述
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * 设置：关键字
	 */
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	/**
	 * 获取：关键字
	 */
	public String getKeywords() {
		return keywords;
	}
}
