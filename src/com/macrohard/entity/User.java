package com.macrohard.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Long id;
	private String email;
	private String password;
	private String nickname;
	private Float balance;
	private Boolean isBanned;
	private String phone;
	private Set shippingAddresses = new HashSet(0);
	private Set informations = new HashSet(0);
	private Set shoppingCarts = new HashSet(0);

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
			Boolean isBanned, String phone, Set shippingAddresses,
			Set informations, Set shoppingCarts) {
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

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Float getBalance() {
		return this.balance;
	}

	public void setBalance(Float balance) {
		this.balance = balance;
	}

	public Boolean getIsBanned() {
		return this.isBanned;
	}

	public void setIsBanned(Boolean isBanned) {
		this.isBanned = isBanned;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Set getShippingAddresses() {
		return this.shippingAddresses;
	}

	public void setShippingAddresses(Set shippingAddresses) {
		this.shippingAddresses = shippingAddresses;
	}

	public Set getInformations() {
		return this.informations;
	}

	public void setInformations(Set informations) {
		this.informations = informations;
	}

	public Set getShoppingCarts() {
		return this.shoppingCarts;
	}

	public void setShoppingCarts(Set shoppingCarts) {
		this.shoppingCarts = shoppingCarts;
	}

}