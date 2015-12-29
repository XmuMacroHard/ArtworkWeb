package cn.edu.xmu.artwork.entity;



import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

import cn.edu.xmu.artwork.constants.IStrings;


@Entity
@DiscriminatorValue("customization_order")
@NamedQueries({
	@NamedQuery(
			name = "CustomizationOrder.getByUser",
			query = "from CustomizationOrder c where user_id = :user_id"
		),
	@NamedQuery(
			name = "CustomizationOrder.getById",
			query = "from CustomizationOrder c where id = :cus_id"
			),
	@NamedQuery(
			name = "CustomizationOrder.getOrdersByStateAndArtist",
			query = "from CustomizationOrder p where artist_id = :id and state = :state"
			),
	@NamedQuery(
			name = "CustomizationOrder.getOrdersByStateAndUser",
			query = "from CustomizationOrder p where user_id = :id and state = :state"
			)	
}
)

public class CustomizationOrder extends PurchaseOrder implements java.io.Serializable
{

	private String acceptState;
	//private long id;
	public CustomizationOrder(){
		acceptState = IStrings.Customization_State_Uncheck;
	}

	public CustomizationOrder(String acceptState) {
		super();
		this.acceptState = acceptState;
	}



	@Column(name="acceptState", length = 20)
	public String getAcceptState() {
		return acceptState;
	}

	public void setAcceptState(String acceptState) {
		this.acceptState = acceptState;
	}

}
