package cn.edu.xmu.artwork.entity;

import java.io.Serializable;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@DiscriminatorValue("auction_order")
@NamedQueries({
	@NamedQuery(
		name = "AuctionOrder.getOrdersByStateAndArtist",
		query = "from AuctionOrder p where artist_id = :id and state = :state"
),
		@NamedQuery(
		name = "AuctionOrder.getOrdersByStateAndUser",
		query = "from AuctionOrder p where user_id = :id and state = :state"
		)
})
public class AuctionOrder extends PurchaseOrder implements Serializable{

}
