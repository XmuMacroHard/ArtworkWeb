package com.macrohard.entity;

/**
 * Commodity entity. @author MyEclipse Persistence Tools
 */

public class Commodity implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private String introduction;
	private Float price;
	private Long authorId;
	private String type;
	private Boolean isBought;

	// Constructors

	/** default constructor */
	public Commodity() {
	}

	/** full constructor */
	public Commodity(String name, String introduction, Float price,
			Long authorId, String type, Boolean isBought) {
		this.name = name;
		this.introduction = introduction;
		this.price = price;
		this.authorId = authorId;
		this.type = type;
		this.isBought = isBought;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Long getAuthorId() {
		return this.authorId;
	}

	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getIsBought() {
		return this.isBought;
	}

	public void setIsBought(Boolean isBought) {
		this.isBought = isBought;
	}

}