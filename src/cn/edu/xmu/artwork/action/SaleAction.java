package cn.edu.xmu.artwork.action;


import java.io.File;
import java.lang.Thread.State;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShoppingCart;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IFileService;
import cn.edu.xmu.artwork.service.ISaleService;

import com.opensymphony.xwork2.ActionSupport;

@Scope("prototype")
@ParentPackage("custom-default")
@Namespace(value="/")
public class SaleAction extends ActionSupport 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Commodity commodity = new Commodity();
	private User user;
	private PurchaseOrder purchaseOrder;
	private List<Long> purchaseOrderIdList;
	
	//use to store commodity and address in order
	private List<Long> commodityid = new ArrayList<Long>();
	private ShippingAddress shippingAddress;
	
	//used to store the json result
	private String result;
	private JSONArray resultJsonArray;
	private JSONObject resultJsonObject;
	

	//used to deal with uploading the pictures
	private List<File> pictures;
	private List<String> picturesContentType;
	private List<String> picturesFileName;
	private long pid;
	private int nowpage;
	private String detailToWho;										//决定订单详情跳转的界面

	@Autowired
	private ISaleService saleService;

	@Autowired
	private IFileService fileService;
	
	/*
	 * 根据商品类型获取商品列表
	 * @return success
	 * */
	@Action(value="showCommodityList", results={@Result(name="success", type="json", params={"root", "resultJsonArray"})})
	public String showCommListByType()
	{
		System.out.println(commodity.getType());
		JSONArray commoditiesJsonArray = saleService.getCommodityListByType(commodity.getType());
		setResultJsonArray(commoditiesJsonArray);
		System.out.println(commoditiesJsonArray);
		return SUCCESS;
	}
	
	/**
	 * 获取商品的详细信息
	 * */
	@Action(value="getDetailedCommodity", results={@Result(name="success", location="/jsp/frontside/sale/detailCommodity.jsp")})
	public String getDetailedComm()
	{
		Commodity comm = saleService.getCommodityById(commodity.getId());
		setAttributeByRequest("commodity", comm);
		
		return IResultCode.SUCCESS;
	}
	
	/*
	 * 艺术家获取商品的详细信息
	 * */
	@Action(value="getDetailedCommodityByArtist", results={@Result(name="success", location="/jsp/frontside/artist/profile.jsp")})
	public String getDetailedCommByArtist()
	{
		Commodity comm = saleService.getCommodityById(commodity.getId());
		setAttributeByRequest("commodity", comm);	
		return SUCCESS;
	}
	
	/*
	 * 艺术家删除未售出的商品
	 * */
	@Action(value="deleteCommodity", results={@Result(name="success", type="chain",location="showMyCommodity")})
	public String deleteComm()
	{
		saleService.deleteCommodityById(commodity.getId());
		
		return SUCCESS;
	}
	
	/*
	 * 艺术家修改商品信息
	 * */
	@Action(value="altercommodityAction", 
			results={@Result(name="success", type="json", params={"root", "result"})},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String altercommodity()
	{
		
		result = saleService.altercommodity(commodity.getId(),commodity);
		return SUCCESS;
	}
	
	/**
	 * 艺术家上传商品
	 * */
	@Action(value="uploadCommodity", results={@Result(name="success",type="chain",location="showMyCommodity")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String uploadCommodity()
	{
		System.out.println("commodity.name" + commodity.getName());
		List<String> picPaths = fileService.uploadPicture(pictures, picturesFileName);
		saleService.uploadCommodity(commodity, picPaths);
		
		return SUCCESS;
	}
	
	/**
	 * 添加商品到购物车
	 * */
	@Action(value="addToCart", results={@Result(name="success", type="json", params={"root", "resultJsonObject"})},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String AddToCart()
	{
		JSONObject resultJO = saleService.addToCart(commodity, user);
		setResultJsonObject(resultJO);
		
		return SUCCESS;
	}
	
	/**
	 * 删除购物车中的商品
	 * @return
	 */
	@Action(value="deleteFromCart",results={@Result(name="success", type="chain" , location="viewCart")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String deleteFromCart()
	{
		saleService.deleteFromCart(commodity);
		
		return SUCCESS;
	}
	
	/**
	 * 订单支付
	 * @return
	 */
	@Action(value="payPurchaseOrderListAction", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String payPurchaseOrderList()
	{
		for (Long id : purchaseOrderIdList) {
			saleService.payPurchaseOrder(id);
		}
		//System.out.println(" pid : " + pid);
		return SUCCESS;
	}
	
	/**
	 * 订单支付
	 * @return
	 */
	@Action(value="payPurchaseOrderAction", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String payPurchaseOrder()
	{
		saleService.payPurchaseOrder(purchaseOrder.getId());
		return SUCCESS;
	}
	
	/**
	 * 用户确认收货
	 * @return
	 */
	@Action(value="confirmCommodity", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String confirmCommodity()
	{
		saleService.confirmCommodity(purchaseOrder);
		
		return SUCCESS;
	}
	
	
	/**
	 *显示购物车列表 
	 * */
	@Action(value="viewCart", results={@Result(name="success", location="/jsp/frontside/user/shoppingCart.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String viewCart()
	{
		List<ShoppingCart> list = saleService.getShoppingCart();
		setAttributeByRequest(IClientConstants.REQUEST_SHOPPING_CART, list);
		return IResultCode.SUCCESS;
	}
	
	/**
	 *提交买卖订单 
	 **/
	@Action(value="SubmitsaleOrder", results={@Result(name="success", location="/jsp/frontside/pay/pay.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String SubmitsaleOrder()
	{	
		saleService.SubmitsaleOrder(commodityid,shippingAddress);
		
		return SUCCESS;
	}
	
	/**
	 * 用户发起订单
	 **/
	@Action(value="placeOrder", results={@Result(name="success", location="/jsp/frontside/pay/place_order.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String placeOrder()
	{
		System.out.println(commodityid.size());
		saleService.placeOrder(commodityid);
		
		return SUCCESS;
	}
	
	
	/**
	 * 根据前台需要，通过state来获取艺术家不同状态的买卖订单
	 */
	@Action(value="getArtistPurchaseOrderByState",results={@Result(name="success", type="json", params={"root", "resultJsonArray"})},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String getPurchaseOrderBySate()
	{		
		resultJsonArray = saleService.getAllOrderByState(IClientConstants.SESSION_VALUE_RANK_ARTIST, purchaseOrder.getState());
		return SUCCESS;
	}	
	
	/**
	 * 根据前台需要，通过state来获取普通用户不同状态的买卖订单
	 * @return
	 */
	@Action(value="getUserPurchaseOrderByState",results={@Result(name="success", type="json", params={"root", "resultJsonArray"})},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String getUserPurchaseOrderBySate()
	{				
		resultJsonArray = saleService.getAllOrderByState(IClientConstants.SESSION_VALUE_RANK_USER, purchaseOrder.getState());
		return SUCCESS;
	}
	
	/**
	 * 根据订单id获取详细订单
	 * @return
	 */
	@Action(value="getDetailPuchaseOrderToArtist", results={@Result(name="success", location="/jsp/frontside/artist/detail_purchase_order.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String getDetailPuchaseOrderToArtist()
	{		
		saleService.getDetailPurchaseOrder(purchaseOrder);
		
		return SUCCESS;
	}	
	
	/**
	 * 根据订单id获取详细订单
	 * @return
	 */
	@Action(value="getDetailPuchaseOrderToUser", results={@Result(name="success", location="/jsp/frontside/user/detail_purchase_order.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String getDetailPuchaseOrderToUser()
	{		
		saleService.getDetailPurchaseOrder(purchaseOrder);
		
		return SUCCESS;
	}	
	
	/**
	 * 艺术家发货
	 */
	@Action(value="dispatch", results={@Result(name="success", location="/jsp/frontside/artist/my_purchase_order.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String dispatch()
	{		
		saleService.dispatch(purchaseOrder);		
		return SUCCESS;
	}	
	
	/**
	 * 设置request的attribute值，返回数据给前台
	 * @param key
	 * @param value
	 */
	private void setAttributeByRequest(String key, Object value)
	{
		ServletActionContext.getRequest().setAttribute(key, value);
	}
	
	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

/*	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}*/

	public List<File> getPictures() {
		return pictures;
	}

	public void setPictures(List<File> pictures) {
		this.pictures = pictures;
	}

	public List<String> getPicturesContentType() {
		return picturesContentType;
	}

	public void setPicturesContentType(List<String> picturesContentType) {
		this.picturesContentType = picturesContentType;
	}

	public List<String> getPicturesFileName() {
		return picturesFileName;
	}

	public void setPicturesFileName(List<String> picturesFileName) {
		this.picturesFileName = picturesFileName;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Long> getCommodityid() {
		return commodityid;
	}

	public void setCommodityid(List<Long> commodityid) {
		this.commodityid = commodityid;
	}

	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	
	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}

	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}


	public String getDetailToWho() {
		return detailToWho;
	}

	public void setDetailToWho(String detailToWho) {
		this.detailToWho = detailToWho;
	}
	
	
	public List<Long> getPurchaseOrderIdList() {
		return purchaseOrderIdList;
	}

	public void setPurchaseOrderIdList(List<Long> purchaseOrderIdList) {
		this.purchaseOrderIdList = purchaseOrderIdList;
	}
	
}
