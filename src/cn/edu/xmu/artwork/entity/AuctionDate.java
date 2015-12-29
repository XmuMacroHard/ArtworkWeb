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
@Table(name = "auction_date", catalog = "artworkdb")
@NamedQueries({
	@NamedQuery(
			name = "AuctionDate.getAucitionDateByDate",
			query = "from AuctionDate where date = :date"
			),
	@NamedQuery(
			name = "AuctionDate.getAucitionByDate",
			query = "select auction from AuctionDate where date = :date"
			)
})
public class AuctionDate implements java.io.Serializable {
	private long id;
	private Date date;
	private Auction auction;
	
	public AuctionDate(){
		
	}
	public AuctionDate(long id, Date date, Auction auction) {
		super();
		this.id = id;
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
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	

	@ManyToOne(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name="auction_id")
	public Auction getAuction() {
		return auction;
	}
	public void setAuction(Auction auction) {
		this.auction = auction;
	}
	
	
}
