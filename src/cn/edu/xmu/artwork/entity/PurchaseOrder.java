package cn.edu.xmu.artwork.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
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

}