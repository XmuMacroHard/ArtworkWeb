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

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;


@Entity
@Table(name="customizationorder", catalog="artworkdb")
@NamedQueries({
	@NamedQuery(
			name = "CustomizationOrder.getByUser",
			query = "from CustomizationOrder c where user_id = :user_id"
		),
	@NamedQuery(
			name = "CustomizationOrder.getByArtist",
			query = "from CustomizationOrder c where artist_id = :artist_id"
		),
	@NamedQuery(
			name = "CustomizationOrder.getById",
			query = "from CustomizationOrder c where id = :cus_id"
			)
}
)

public class CustomizationOrder extends PurchaseOrder implements java.io.Serializable{

	private Artist artist;
	private String acceptState;
	//private long id;
	public CustomizationOrder(){
	}

	public CustomizationOrder(Artist artist) {
		super();
		this.artist = artist;
	}


	@Column(name="acceptState", length = 20)
	public String getAcceptState() {
		return acceptState;
	}

	public void setAcceptState(String acceptState) {
		this.acceptState = acceptState;
	}
	

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "artist_id", nullable = false)
	public Artist getArtist() {
		return artist;
	}
	public void setArtist(Artist artist) {
		this.artist = artist;
	}


}
