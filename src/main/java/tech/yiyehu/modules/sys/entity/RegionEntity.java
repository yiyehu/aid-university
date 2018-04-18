package tech.yiyehu.modules.sys.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 县区
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@TableName("tb_region")
public class RegionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 县区ID
	 */
	@TableId
	private Integer regionId;
	/**
	 * 城市ID
	 */
	private Integer cityId;
	/**
	 * 县区名称
	 */
	private String name;

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
	 * 设置：城市ID
	 */
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	/**
	 * 获取：城市ID
	 */
	public Integer getCityId() {
		return cityId;
	}
	/**
	 * 设置：县区名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：县区名称
	 */
	public String getName() {
		return name;
	}
}
