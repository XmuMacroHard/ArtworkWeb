package cn.edu.xmu.artwork.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * Commodity entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "commodity", catalog = "artworkdb")
@NamedQueries({
		@NamedQuery(
			name = "Commodity.getAllByType",
			query = "from Commodity c where c.type = :commType"
		),		
		@NamedQuery(
				name = "Commodity.getById",
				query = "from Commodity c where c.id = :commId"
			),
		@NamedQuery(
					name = "Commodity.getByAuthorId",
					query = "from Commodity c where c.authorId = :authorid"
				)
			
})
public class Commodity implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private String introduction;
	private Float price;
	private Long authorId;
	private String type;									//商品所属种类,如书法等
	private Boolean isBought;
	private Set<CommodityPics> commodityPices = new HashSet<CommodityPics>(0);
	private Customization customization;
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

	
	public void addPictures(List<String> picPaths)
	{
		CommodityPics commodityPic = new CommodityPics();
		for(String path : picPaths)
		{
//			commodityPic.setCommodity(this);
			commodityPic.setUrl(path);
			commodityPices.add(commodityPic);
		}
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

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "introduction", nullable = false, length = 500)
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "price", nullable = false, precision = 15)
	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	@Column(name = "authorId", nullable = false)
	public Long getAuthorId() {
		return this.authorId;
	}

	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}

	@Column(name = "type", nullable = false, length = 40)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "isBought", nullable = false)
	public Boolean getIsBought() {
		return this.isBought;
	}

	public void setIsBought(Boolean isBought) {
		this.isBought = isBought;
	}
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name="commodityId")
	public Set<CommodityPics> getCommodityPices() {
		return commodityPices;
	}

	public void setCommodityPices(Set<CommodityPics> commodityPices) {
		this.commodityPices = commodityPices;
	}

	@OneToOne(mappedBy = "commodity")
	public Customization getCustomization() {
		return customization;
	}

	public void setCustomization(Customization customization) {
		this.customization = customization;
	}
	
	

}