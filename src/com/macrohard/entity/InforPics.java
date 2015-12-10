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
 * InforPics entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "infor_pics", catalog = "artworkdb")
public class InforPics implements java.io.Serializable {

	// Fields

	private Long id;
	private Information information;
	private String url;

	// Constructors

	/** default constructor */
	public InforPics() {
	}

	/** full constructor */
	public InforPics(Information information, String url) {
		this.information = information;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "inforId")
	public Information getInformation() {
		return this.information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}

	@Column(name = "url", length = 40)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}