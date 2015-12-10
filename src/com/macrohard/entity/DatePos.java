package com.macrohard.entity;

/**
 * DatePos entity. @author MyEclipse Persistence Tools
 */

public class DatePos implements java.io.Serializable {

	// Fields

	private Long id;
	private Information information;
	private Long date;
	private String colum;
	private Integer pos;

	// Constructors

	/** default constructor */
	public DatePos() {
	}

	/** minimal constructor */
	public DatePos(Information information, Long date, String colum) {
		this.information = information;
		this.date = date;
		this.colum = colum;
	}

	/** full constructor */
	public DatePos(Information information, Long date, String colum, Integer pos) {
		this.information = information;
		this.date = date;
		this.colum = colum;
		this.pos = pos;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Information getInformation() {
		return this.information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}

	public Long getDate() {
		return this.date;
	}

	public void setDate(Long date) {
		this.date = date;
	}

	public String getColum() {
		return this.colum;
	}

	public void setColum(String colum) {
		this.colum = colum;
	}

	public Integer getPos() {
		return this.pos;
	}

	public void setPos(Integer pos) {
		this.pos = pos;
	}

}