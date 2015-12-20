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
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="customization", catalog="artworkdb")
public class Customization implements java.io.Serializable{
	private long id;
	private User user;
	private Artist artist;
	private Commodity commodity;
	private Date date;
	private ShippingAddress shippingAddress;
	
	public Customization(){	
	}
	
	public Customization(long id, User user, Artist artist,
			Commodity commodity, Date date, ShippingAddress shippingAddress) {
		super();
		this.id = id;
		this.user = user;
		this.artist = artist;
		this.commodity = commodity;
		this.date = date;
		this.shippingAddress = shippingAddress;
	}
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name="id", nullable =false, unique=true)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id", nullable=false)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "artist_id", nullable = false)
	public Artist getArtist() {
		return artist;
	}
	public void setArtist(Artist artist) {
		this.artist = artist;
	}
	
	@OneToOne(cascade = CascadeType.ALL)  
	@JoinColumn(name = "commodity_id")  
	public Commodity getCommodity() {
		return commodity;
	}
	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
	
	@Column(name = "date")
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Column(name = "address")
	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
}
