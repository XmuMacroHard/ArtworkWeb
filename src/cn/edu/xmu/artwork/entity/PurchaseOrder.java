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

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * PurchaseOrder entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "purchase_order", catalog = "artworkdb")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="order_type")
@DiscriminatorValue("purchase_order")
@NamedQueries({
	@NamedQuery(
			name = "PurchaseOrder.getById",
			query = "from PurchaseOrder p where p.id = :id"
			),
}
)
public class PurchaseOrder implements java.io.Serializable {

	// Fields
	private Long id;
	private String orderid;
	private String state;

	private User user;
	private Date date;
	private String address;
	private Float totalprice;				//应付款
	private Float leftprice;       			//未付款
	private Set<Commodity> commodity=new HashSet<Commodity>(0);
	private Set<Payment> payments = new HashSet<Payment>(0);
	// Constructors
	/** default constructor */
	public PurchaseOrder() {
	}

	/** full constructor */
	public PurchaseOrder(Long id, String orderid, String state, User user,
			Date date, String address, Float totalprice, Float leftprice,
			Set<Commodity> commodity, Set<Payment> payments) {
		super();
		this.id = id;
		this.orderid = orderid;
		this.state = state;
		this.user = user;
		this.date = date;
		this.address = address;
		this.totalprice = totalprice;
		this.leftprice = leftprice;
		this.commodity = commodity;
		this.payments = payments;
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
	
	@Column(name = "address", nullable = true, precision = 200)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "totalprice", nullable = true, precision = 15)
	public Float getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
	}

	@Column(name = "leftprice", nullable = true, precision = 15)
	public Float getLeftprice() {
		return leftprice;
	}

	public void setLeftprice(Float leftprice) {
		this.leftprice = leftprice;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "purchaseOrder")
	public Set<Commodity> getCommodity() {
		return commodity;
	}

	public void setCommodity(Set<Commodity> commodity) {
		this.commodity = commodity;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "purchaseOrder")
	public Set<Payment> getPayments() {
		return payments;
	}

	public void setPayments(Set<Payment> payments) {
		this.payments = payments;
	}
	
	
}