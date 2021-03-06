package tech.yiyehu.modules.aid.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * 用户地址
 * 
 * @author yiyehu
 * @email zhuangyuan.k@gmail.com
 * @date 2018-04-13 23:29:51
 */
@TableName("tb_user_address")
public class UserAddressEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 地址ID
	 */
	@TableId
	private Long addressId;
	/**
	 * 用户ID
	 */
	@NotNull(message="用户ID不存在")
	private Long userId;
	/**
	 * 收件人姓名
	 */
	@NotBlank(message="用户名不能为空")
	@Length(max=20, message="用户名长度超出20")
	private String name;
	/**
	 * 省份ID
	 */
	private Integer provinceId;
	/**
	 * 城市ID
	 */
	private Integer cityId;
	/**
	 * 县区ID
	 */
	private Integer regionId;
	/**
	 * 城镇ID
	 */
	private Integer townId;
	/**
	 * 省份名称
	 */
	@NotBlank(message="省份名不能为空")
	@Length(max=20, message="省份名长度超出20")
	private String provinceName;
	/**
	 * 城市名称
	 */
	@NotBlank(message="城市名不能为空")
	@Length(max=20, message="城市名长度超出20")
	private String cityName;
	/**
	 * 县区名称
	 */
	@NotBlank(message="县区名称不能为空")
	@Length(max=20, message="县区名称长度超出20")
	private String regionName;
	/**
	 * 城镇名称
	 */
	@Length(max=20, message="用户名长度超出20")
	private String townName;
	/**
	 * 详细地址
	 */
	@NotBlank(message="详细地址不能为空")
	@Length(max=200, message="详细地址长度超出200")
	private String address;
	/**
	 * 电话号
	 */
	private String telephone;
	/**
	 * 手机号
	 */
	@Pattern(regexp="^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$", message="手机号格式不正确")
	private String mobile;
	/**
	 * 是否为默认地址
	 */
	private Integer defaultAddr;

	/**
	 * 设置：地址ID
	 */
	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}
	/**
	 * 获取：地址ID
	 */
	public Long getAddressId() {
		return addressId;
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
	 * 设置：收件人姓名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：收件人姓名
	 */
	public String getName() {
		return name;
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
	 * 设置：省份名称
	 */
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	/**
	 * 获取：省份名称
	 */
	public String getProvinceName() {
		return provinceName;
	}
	/**
	 * 设置：城市名称
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	/**
	 * 获取：城市名称
	 */
	public String getCityName() {
		return cityName;
	}
	/**
	 * 设置：县区名称
	 */
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	/**
	 * 获取：县区名称
	 */
	public String getRegionName() {
		return regionName;
	}
	/**
	 * 设置：城镇名称
	 */
	public void setTownName(String townName) {
		this.townName = townName;
	}
	/**
	 * 获取：城镇名称
	 */
	public String getTownName() {
		return townName;
	}
	/**
	 * 设置：详细地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取：详细地址
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置：电话号
	 */
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	/**
	 * 获取：电话号
	 */
	public String getTelephone() {
		return telephone;
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
	 * 设置：是否为默认地址
	 */
	public void setDefaultAddr(Integer defaultAddr) {
		this.defaultAddr = defaultAddr;
	}
	/**
	 * 获取：是否为默认地址
	 */
	public Integer getDefaultAddr() {
		return defaultAddr;
	}
}
