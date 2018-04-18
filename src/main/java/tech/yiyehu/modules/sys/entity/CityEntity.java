package tech.yiyehu.modules.sys.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 城市
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@TableName("tb_city")
public class CityEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 城市ID
	 */
	@TableId
	private Integer cityId;
	/**
	 * 省份ID
	 */
	private Integer provinceId;
	/**
	 * 城市名称
	 */
	private String name;
	/**
	 * 邮政编码
	 */
	private String zipcode;
	
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
	 * 设置：省份ID
	 */
	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}
	/**
	 * 获取：省份ID
	 */
	public Integer getProvinceId() {
		return provinceId;
	}
	/**
	 * 设置：城市名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：城市名称
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 获取：邮政编码
	 */
	public String getZipcode() {
		return zipcode;
	}
	

	/**
	 * 设置：邮政编码
	 */
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
}
