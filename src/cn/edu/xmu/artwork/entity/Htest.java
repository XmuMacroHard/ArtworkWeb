package cn.edu.xmu.artwork.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;


@Entity
@Table(name = "HHtest", catalog = "artworkdb")
@NamedQueries(
		@NamedQuery(
				name ="findById",
				query = "from Htest c where c.id = :id"
				)
		)
public class Htest {
	private long id;
	private String sd;
	private Set<Test> tests = new HashSet<Test>(0);
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name = "id", length = 20, nullable = false, unique= true)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	
	@Column(name="sd")
	public String getSd() {
		return sd;
	}
	public void setSd(String sd) {
		this.sd = sd;
	}
	
	@OneToMany(cascade = CascadeType.ALL,  fetch = FetchType.LAZY, mappedBy = "htest")
	public Set<Test> getTests() {
		return tests;
	}
	public void setTests(Set<Test> tests) {
		this.tests = tests;
	}
	
	
}
