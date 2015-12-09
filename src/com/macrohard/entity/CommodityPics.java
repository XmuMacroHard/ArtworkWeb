package com.macrohard.entity;

/**
 * CommodityPics entity. @author MyEclipse Persistence Tools
 */

public class CommodityPics implements java.io.Serializable {

	// Fields

	private Long id;
	private Long commodityId;
	private String url;

	// Constructors

	/** default constructor */
	public CommodityPics() {
	}

	/** full constructor */
	public CommodityPics(Long commodityId, String url) {
		this.commodityId = commodityId;
		this.url = url;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCommodityId() {
		return this.commodityId;
	}

	public void setCommodityId(Long commodityId) {
		this.commodityId = commodityId;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}