package tech.yiyehu.modules.sys.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 城镇
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@TableName("tb_town")
public class TownEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 城镇ID
	 */
	@TableId
	private Integer townId;
	/**
	 * 县区ID
	 */
	private Integer regionId;
	/**
	 * 城镇名称
	 */
	private String name;

	/**
	 * 设置：城镇ID
	 */
	public void setTownId(Integer townId) {
		this.townId = townId;
	}
	/**
	 * 获取：城镇ID
	 */
	public Integer getTownId() {
		return townId;
	}
	/**
	 * 设置：县区ID
	 */
	public void setRegionId(Integer regionId) {
		this.regionId = regionId;
	}
	/**
	 * 获取：县区ID
	 */
	public Integer getRegionId() {
		return regionId;
	}
	/**
	 * 设置：城镇名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：城镇名称
	 */
	public String getName() {
		return name;
	}
}
