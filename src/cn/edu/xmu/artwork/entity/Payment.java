package cn.edu.xmu.artwork.entity;

import java.util.Date;

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

public class Payment implements java.io.Serializable , Comparable<Payment>{
	private Long id;
	private PurchaseOrder purchaseOrder;    //付款订单
	private Float money;	 				//付款额度
	private int state;      				//付款状态  0未付款 1 已付款 
	private Date date;      				//付款时间
	
	public Payment() {
		state = 0;
	}
	

	public Payment(Long id, PurchaseOrder purchaseOrder, Float money,
			int state, Date date) {
		super();
		this.id = id;
		this.purchaseOrder = purchaseOrder;
		this.money = money;
		this.state = state;
		this.date = date;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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


	@Override
	public int compareTo(Payment o) {
		if(date.before(o.date))
			return 1;
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
