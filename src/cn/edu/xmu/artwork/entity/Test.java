package cn.edu.xmu.artwork.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.ManyToOne;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Test entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "test", catalog = "artworkdb")
public class Test implements java.io.Serializable {

	// Fields
	private Long id;
	private String account;
	private String password;
	private Htest htest;
	
	// Constructors
	/** default constructor */
	public Test() {
	}

	/** full constructor */
	public Test(String account, String password) {
		this.account = account;
		this.password = password;
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

	@Column(name = "account", length = 20)
	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	//@Column(name = "password", length = 20)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
  @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	public Htest getHtest() {
		return htest;
	}

	public void setHtest(Htest htest) {
		this.htest = htest;
	}
	
	
}