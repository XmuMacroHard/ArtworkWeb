package cn.edu.xmu.artwork.action;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.Payment;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ICustomizeService;
import cn.edu.xmu.artwork.service.ISaleService;
import cn.edu.xmu.artwork.service.IUserService;

@Scope("prototype")
@ParentPackage("json-default")
@Namespace(value="/")
public class CustomizationAction extends ActionSupport{
	private CustomizationOrder customization;
	private User user;
	private Artist artist;
	private Commodity commodity;
	private ShippingAddress address;
	private PurchaseOrder purchaseOrder;
	private JSONArray resultJsonArray;
	private JSONObject resultJsonObject;
	
	@Autowired
	private ICustomizeService customizeService;
	@Autowired
	private IUserService userService;
	@Autowired
	private ISaleService saleService;
	
	/**
	 * 发起定制，进入定制界面
	 * @return
	 */
	@Action(value="placeCustomization",results={@Result(name="success", location="/jsp/frontside/order/order.jsp")})
	public String placeCustomization()
	{
		customizeService.placeCustomization(artist);
		return SUCCESS;
	}
	
	@Action(value="CustomizationSubmitAction",results={@Result(name="success", location="/jsp/frontside/order/home_order.jsp")})
	public String CustomizationSubmitAction()
	{		
		customizeService.addCustomization(artist.getId(), address,commodity);
		return SUCCESS;
	}
	
	@Action(value="setCustomizationPaymentAction",results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String setCustomizationPayment()
	{
		long id = 2;
		List<Payment> payments = new ArrayList<Payment>();
		Payment payment = new Payment();
		payment.setMoney((float) 100);
		Payment payment2 = new Payment();
		payment2.setMoney((float) 100);
		payments.add(payment);
		payments.add(payment2);
		customizeService.setPaymentOfCustomization(id, payments);
		return SUCCESS;
	}
	
	@Action(value="getCustomizationsByUserAction",results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String getCustomizationsByUser(){
		int id = 1; // get from session;
		List<CustomizationOrder> lists = customizeService.getCustomizationsByUser(id);
		setAttributeByRequest("informationList", lists);
		return SUCCESS;
	}
	
	/**
	 * 根据前台需要，通过state来获取艺术家不同状态的买卖订单
	 */
	@Action(value="getArtistCusOrderByState",results={@Result(name="success", type="json", params={"root", "resultJsonArray"})})
	public String getPurchaseOrderBySate()
	{		
		resultJsonArray = customizeService.getAllOrderByState(IClientConstants.SESSION_VALUE_RANK_ARTIST, purchaseOrder.getState());
		return SUCCESS;
	}	
	
	/**
	 * 根据前台需要，通过state来获取普通用户不同状态的买卖订单
	 * @return
	 */
	@Action(value="getUserCusOrderByState",results={@Result(name="success", type="json", params={"root", "resultJsonArray"})})
	public String getUserPurchaseOrderBySate()
	{				
		resultJsonArray = customizeService.getAllOrderByState(IClientConstants.SESSION_VALUE_RANK_USER, purchaseOrder.getState());
		return SUCCESS;
	}

	@Action(value="acceptCustomizationAction",results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String acceptCustomization(){
		int id = 3; // get from session;
		boolean result = customizeService.accetpCustomization(id);
		if(result)
			return SUCCESS;
		else
			return ERROR;
	}
	
	@Action(value="rejectCustomizationAction",results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String rejectCustomization(){
		int id = 3; // get from session;
		boolean result = customizeService.rejuectCustomization(id);
		if(result)
			return SUCCESS;
		else
			return ERROR;
	}
	
	//转换定制品到普通商品
	@Action(value="changeCustomizationArtworkToCommodityAction",results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String changeCustomizationArtworkToCommodity(){
		int id = 2; // get from session;
		boolean result = customizeService.changeCustomizationArtworkToCommodity(id);
		if(result)
			return SUCCESS;
		else
			return ERROR;
	}
	
	private void setAttributeByRequest(String key, Object value)
	{
		ServletActionContext.getRequest().setAttribute(key, value);
	}
	
	public CustomizationOrder getCustomization() {
		return customization;
	}

	public void setCustomization(CustomizationOrder customization) {
		this.customization = customization;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Artist getArtist() {
		return artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public ShippingAddress getAddress() {
		return address;
	}

	public void setAddress(ShippingAddress address) {
		this.address = address;
	}

	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}

	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}

	public JSONArray getResultJsonArray() {
		return resultJsonArray;
	}

	public void setResultJsonArray(JSONArray resultJsonArray) {
		this.resultJsonArray = resultJsonArray;
	}

	public JSONObject getResultJsonObject() {
		return resultJsonObject;
	}

	public void setResultJsonObject(JSONObject resultJsonObject) {
		this.resultJsonObject = resultJsonObject;
	}
	
	
}
