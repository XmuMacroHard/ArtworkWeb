package cn.edu.xmu.artwork.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ShoppingCart entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "shopping_cart", catalog = "artworkdb")
@NamedQueries({
		@NamedQuery(
			name = "ShoppingCart.getAllByUserId",
			query = "from ShoppingCart"
		)
})
public class ShoppingCart implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private User user;
	private Commodity commodity;

	// Constructors

	/** default constructor */
	public ShoppingCart() {
	}

	/** full constructor */
	public ShoppingCart(User user, Commodity commodity) {
		this.user = user;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "commodityid", nullable = false)		
	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

}