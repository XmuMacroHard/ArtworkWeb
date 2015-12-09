package com.macrohard.entity;

/**
 * ShippingAddress entity. @author MyEclipse Persistence Tools
 */

public class ShippingAddress implements java.io.Serializable {

	// Fields

	private Long id;
	private User user;
	private String consignee;
	private String province;
	private String city;
	private String region;
	private String detailedAdress;
	private String phone;

	// Constructors

	/** default constructor */
	public ShippingAddress() {
	}

	/** full constructor */
	public ShippingAddress(User user, String consignee, String province,
			String city, String region, String detailedAdress, String phone) {
		this.user = user;
		this.consignee = consignee;
		this.province = province;
		this.city = city;
		this.region = region;
		this.detailedAdress = detailedAdress;
		this.phone = phone;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getConsignee() {
		return this.consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegion() {
		return this.region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getDetailedAdress() {
		return this.detailedAdress;
	}

	public void setDetailedAdress(String detailedAdress) {
		this.detailedAdress = detailedAdress;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}