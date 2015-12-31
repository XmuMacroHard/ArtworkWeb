package cn.edu.xmu.artwork.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
	private String url;
	private Commodity commodity;

	// Constructors

	/** default constructor */
	public CommodityPics() {
	}

	/** full constructor */
	public CommodityPics(String url) {
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

	@Column(name = "url", nullable = false, length = 40)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "commodityId", nullable = false)
	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	
}