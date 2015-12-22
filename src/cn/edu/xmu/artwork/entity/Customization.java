package cn.edu.xmu.artwork.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;


@Entity
@Table(name="customization", catalog="artworkdb")
@NamedQueries({
	@NamedQuery(
			name = "getCustomizationByUser",
			query = "from Customization c where user_id = :user_id"
		),
	@NamedQuery(
			name = "getCustomizationByArtist",
			query = "from Customization c where artist_id = :artist_id"
		)
}
)
public class Customization  implements java.io.Serializable{
	private long id;
	
	public Customization(){
	}
	

	public Customization(long id) {
		super();
		this.id = id;
	}


	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name="id", nullable =false, unique=true)
	public Long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	

}
