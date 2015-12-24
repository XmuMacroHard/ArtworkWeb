package cn.edu.xmu.artwork.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * PurchaseOrder entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "purchase_order", catalog = "artworkdb")
public class PurchaseOrder implements java.io.Serializable {

	// Fields
	private Long id;
	private String orderid;
	private String type;
	private String state;

	private User user;
	private Date date;
	private ShippingAddress shippingAddress;
	private Float totalprice;
	private Set<Commodity> commodity=new HashSet<Commodity>(0);
	
	// Constructors
	/** default constructor */
	public PurchaseOrder() {
	}

	/** full constructor */
	public PurchaseOrder(Long id, String orderid, String type, String state,
			User user, Date date,
			ShippingAddress shippingAddress, Set<Commodity> commodity) {
		super();
		this.id = id;
		this.orderid = orderid;
		this.type = type;
		this.state = state;
		this.user = user;
		this.date = date;
		this.shippingAddress = shippingAddress;
		this.commodity = commodity;
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

	@Column(name = "orderid", nullable = false, length = 20)
	public String getOrderid() {
		return this.orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	@Column(name = "type", nullable = false, length = 9)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "state", nullable = false, length = 10)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id", nullable=false)
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name = "date")
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Column(name = "address")
	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	
	@Column(name = "totalprice", nullable = true, precision = 15)
	public Float getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "purchaseOrder_id")
	public Set<Commodity> getCommodity() {
		return commodity;
	}

	public void setCommodity(Set<Commodity> commodity) {
		this.commodity = commodity;
	}
	
}