package tech.yiyehu.modules.sys.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 省份
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@TableName("tb_province")
public class ProvinceEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 省份ID
	 */
	@TableId
	private Integer provinceId;
	/**
	 * 省份名称
	 */
	private String name;

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
	 * 设置：省份名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：省份名称
	 */
	public String getName() {
		return name;
	}
}
