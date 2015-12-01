package com.macrohard.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Long id;
	private String account;
	private String password;
	private String email;
	private String nickname;
	private Float balance;
	private String identity;
	private Boolean isBanned;
	private Set<Information> informations = new HashSet<Information>(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String account, String password) {
		this.account = account;
		this.password = password;
	}

	/** full constructor */
	public User(String account, String password, String email, String nickname,
			Float balance, String identity, Boolean isBanned, Set<Information> informations) {
		this.account = account;
		this.password = password;
		this.email = email;
		this.nickname = nickname;
		this.balance = balance;
		this.identity = identity;
		this.isBanned = isBanned;
		this.informations = informations;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getIdentity() {
		return this.identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public Boolean getIsBanned() {
		return this.isBanned;
	}

	public void setIsBanned(Boolean isBanned) {
		this.isBanned = isBanned;
	}

	public Set<Information> getInformations() {
		return this.informations;
	}

	public void setInformations(Set<Information> informations) {
		this.informations = informations;
	}

}