package cn.edu.xmu.artwork.entity;

import java.io.Serializable;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("auction_order")
public class AuctionOrder extends PurchaseOrder implements Serializable{

}
