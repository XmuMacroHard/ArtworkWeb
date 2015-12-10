package com.macrohard.entity;

/**
 * PurchaseOrder entity. @author MyEclipse Persistence Tools
 */

public class PurchaseOrder implements java.io.Serializable {

	// Fields

	private Long id;
	private String orderid;
	private String type;
	private String state;

	// Constructors

	/** default constructor */
	public PurchaseOrder() {
	}

	/** full constructor */
	public PurchaseOrder(String orderid, String type, String state) {
		this.orderid = orderid;
		this.type = type;
		this.state = state;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOrderid() {
		return this.orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}