package cn.edu.xmu.artwork.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * DatePos entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "date_pos", catalog = "artworkdb")
public class DatePos implements java.io.Serializable {

	// Fields

	private Long id;
	private Information information;
	private Date date;
	private String colum;
	private Integer pos;			//record the concrete position of the location
	private String location;		//record the concrete location in the page  

	// Constructors

	/** default constructor */
	public DatePos() {
	}

	/** minimal constructor */
	public DatePos(Information information, Date date, String colum) {
		this.information = information;
		this.date = date;
		this.colum = colum;
	}

	/** full constructor */
	public DatePos(Information information, Date date, String colum, Integer pos) {
		this.information = information;
		this.date = date;
		this.colum = colum;
		this.pos = pos;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "infoId", nullable = false)
	public Information getInformation() {
		return this.information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}
	

	@Column(name = "colum", length = 10)
	public String getColum() {
		return this.colum;
	}


	public void setColum(String colum) {
		this.colum = colum;
	}

	@Column(name = "date")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Column(name = "pos")
	public Integer getPos() {
		return this.pos;
	}

	public void setPos(Integer pos) {
		this.pos = pos;
	}

	@Column(name = "location", length = 20)
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	
}