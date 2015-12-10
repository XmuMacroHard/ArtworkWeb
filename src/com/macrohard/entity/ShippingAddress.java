package com.macrohard.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ShippingAddress entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "shipping_address", catalog = "artworkdb")
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
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "consignee", nullable = false, length = 10)
	public String getConsignee() {
		return this.consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}

	@Column(name = "province", nullable = false, length = 10)
	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@Column(name = "city", nullable = false, length = 10)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "region", nullable = false, length = 10)
	public String getRegion() {
		return this.region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	@Column(name = "detailedAdress", nullable = false, length = 20)
	public String getDetailedAdress() {
		return this.detailedAdress;
	}

	public void setDetailedAdress(String detailedAdress) {
		this.detailedAdress = detailedAdress;
	}

	@Column(name = "phone", nullable = false, length = 20)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}