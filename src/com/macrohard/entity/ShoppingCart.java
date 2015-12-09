package com.macrohard.entity;

/**
 * ShoppingCart entity. @author MyEclipse Persistence Tools
 */

public class ShoppingCart implements java.io.Serializable {

	// Fields

	private Long id;
	private User user;
	private Long commodityid;

	// Constructors

	/** default constructor */
	public ShoppingCart() {
	}

	/** full constructor */
	public ShoppingCart(User user, Long commodityid) {
		this.user = user;
		this.commodityid = commodityid;
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

	public Long getCommodityid() {
		return this.commodityid;
	}

	public void setCommodityid(Long commodityid) {
		this.commodityid = commodityid;
	}

}