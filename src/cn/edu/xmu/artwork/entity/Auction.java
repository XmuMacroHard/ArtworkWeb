package cn.edu.xmu.artwork.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.apache.commons.validator.routines.DateValidator;

@Entity
@Table(name = "auction", catalog = "artworkdb")
public class Auction implements java.io.Serializable {
	private Long id;
	private Date startTime;
	private Date endTime;
	private Commodity commodity;
	private Float startPrice;
	private Float currentPrice;
	private Float limitPerBid;
	private User user;
	private String state;   //拍卖状态
	
	public Auction(){
	}
	



	public Auction(Long id, Date startTime, Date endTime, Commodity commodity,
			Float startPrice, Float currentPrice, Float limitPerBid, User user,
			String state) {
		super();
		this.id = id;
		this.startTime = startTime;
		this.endTime = endTime;
		this.commodity = commodity;
		this.startPrice = startPrice;
		this.currentPrice = currentPrice;
		this.limitPerBid = limitPerBid;
		this.user = user;
		this.state = state;
	}




	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "startTime", length=20)
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@Column(name = "endTime", length=20)
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="commodity_id")
	public Commodity getCommodity() {
		return commodity;
	}
	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	@Column(name = "startPrice", length=20)
	public Float getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(Float startPrice) {
		this.startPrice = startPrice;
	}
	

	@Column(name = "currentPrice", length=20)
	public Float getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(Float currentPrice) {
		this.currentPrice = currentPrice;
	}

	@Column(name = "limitPerBid", length=20)
	public Float getLimitPerBid() {
		return limitPerBid;
	}


	public void setLimitPerBid(Float limitPerBid) {
		this.limitPerBid = limitPerBid;
	}


	@ManyToOne( fetch = FetchType.LAZY)
	@JoinColumn(name ="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name = "state", length=20)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
