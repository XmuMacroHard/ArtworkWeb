package cn.edu.xmu.artwork.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Inheritance(strategy=InheritanceType.JOINED)
@Table(name = "user", catalog = "artworkdb")
public class User implements java.io.Serializable {

	// Fields

	private Long id;
	private String email;
	private String password;
	private String nickname;
	private Float balance;
	private Boolean isBanned;
	private String phone;
	private Set<ShippingAddress> shippingAddresses = new HashSet<ShippingAddress>(
			0);
	private Set<Information> informations = new HashSet<Information>(0);
	private Set<ShoppingCart> shoppingCarts = new HashSet<ShoppingCart>(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}

	/** full constructor */
	public User(String email, String password, String nickname, Float balance,
			Boolean isBanned, String phone,
			Set<ShippingAddress> shippingAddresses,
			Set<Information> informations, Set<ShoppingCart> shoppingCarts) {
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.balance = balance;
		this.isBanned = isBanned;
		this.phone = phone;
		this.shippingAddresses = shippingAddresses;
		this.informations = informations;
		this.shoppingCarts = shoppingCarts;
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

	@Column(name = "email", nullable = false, length = 20)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "password", nullable = false, length = 20)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "nickname", length = 20)
	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Column(name = "balance", precision = 10)
	public Float getBalance() {
		return this.balance;
	}

	public void setBalance(Float balance) {
		this.balance = balance;
	}

	@Column(name = "isBanned")
	public Boolean getIsBanned() {
		return this.isBanned;
	}

	public void setIsBanned(Boolean isBanned) {
		this.isBanned = isBanned;
	}

	@Column(name = "phone", length = 20)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<ShippingAddress> getShippingAddresses() {
		return this.shippingAddresses;
	}

	public void setShippingAddresses(Set<ShippingAddress> shippingAddresses) {
		this.shippingAddresses = shippingAddresses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Information> getInformations() {
		return this.informations;
	}

	public void setInformations(Set<Information> informations) {
		this.informations = informations;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<ShoppingCart> getShoppingCarts() {
		return this.shoppingCarts;
	}

	public void setShoppingCarts(Set<ShoppingCart> shoppingCarts) {
		this.shoppingCarts = shoppingCarts;
	}

}