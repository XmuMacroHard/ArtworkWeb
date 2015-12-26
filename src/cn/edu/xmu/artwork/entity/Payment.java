package cn.edu.xmu.artwork.entity;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;


@Entity
@Table(name = "payment", catalog = "artworkdb")
@NamedQueries({
			@NamedQuery(
					name = "Payment.getById",
					query = "from Payment p where p.id = :id"
					),
			@NamedQuery(
					name = "Payment.getByUserId",
					query = "from Payment p where p.user_id = :user_id"
					),
			@NamedQuery(
					name = "Payment.getAllByOrderId",
					query = "from Payment p where purchaseOrder_id = :id"
					),
			@NamedQuery(
					name = "Payment.getUnPaiedByOrderId",
					query = "from Payment p where purchaseOrder_id = :id and state = 0 "
							+ "order by date"
					)
			
					
}
)
public class Payment {
	private Long id;
	private Long user_id;					//付款人
	private Long artist_id; 				//收款人
	private PurchaseOrder purchaseOrder;    //付款订单
	private Float money;	 				//付款额度
	private int state;      				//付款状态  0未付款 1 已付款
	private Date date;      				//付款时间
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	

	@Column(name = "user_id", nullable= false)
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	
	@Column(name = "artist_id", nullable= false)
	public Long getArtist_id() {
		return artist_id;
	}
	public void setArtist_id(Long artist_id) {
		this.artist_id = artist_id;
	}
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "purchaseOrder_id", nullable= false)
	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}
	
	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}
	

	@Column(name="money", nullable= false)
	public Float getMoney() {
		return money;
	}
	public void setMoney(Float money) {
		this.money = money;
	}
	
	@Column(name="state", nullable= false)
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
