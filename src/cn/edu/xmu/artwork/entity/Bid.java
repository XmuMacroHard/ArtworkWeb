package cn.edu.xmu.artwork.entity;


import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@Table(name = "bid", catalog = "artworkdb")
@NamedQueries({
	@NamedQuery(
			name = "Bid.findById",
			query = "from Bid where id = :id"
			),
	@NamedQuery(
			name = "Bid.getBidsByAuctionId",
			query = "from Bid where auction_id = :id"
			)
})
public class Bid implements java.io.Serializable {
	private long id;
	private User user;
	private float price;
	private Date date;
	private Auction auction;
	
	public Bid(){
		
	}
	
	public Bid(long id, User user, float price, Date date, Auction auction) {
		super();
		this.id = id;
		this.user = user;
		this.price = price;
		this.date = date;
		this.auction = auction;
	}
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

	@Column(name ="price", length = 20)
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	

	@Column(name ="date", length = 20)
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	


	@ManyToOne( fetch = FetchType.LAZY)
	@JoinColumn(name="auction_id")
	public Auction getAuction() {
		return auction;
	}
	public void setAuction(Auction auction) {
		this.auction = auction;
	}
	
	
}
