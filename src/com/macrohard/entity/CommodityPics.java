package com.macrohard.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * CommodityPics entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "commodity_pics", catalog = "artworkdb")
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
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "commodityId", nullable = false)
	public Long getCommodityId() {
		return this.commodityId;
	}

	public void setCommodityId(Long commodityId) {
		this.commodityId = commodityId;
	}

	@Column(name = "url", nullable = false, length = 40)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}