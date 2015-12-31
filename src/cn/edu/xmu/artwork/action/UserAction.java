package cn.edu.xmu.artwork.action;

import java.io.File;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ISaleService;
import cn.edu.xmu.artwork.service.IUserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Scope("prototype")
@ParentPackage("custom-default")
@Namespace(value="/")
public class UserAction extends ActionSupport 
{
	private static final long serialVersionUID = 1L;
	
	public List<File> pic;
	public List<String> picFileName;
	public List<String> picContentType;
	private User user;
	private Artist artist;
	private PurchaseOrder purchaseOrder;
	private String newpassword;
	private ShippingAddress address;
	
	@Autowired
	private IUserService userService;
	@Autowired
	private ISaleService SaleService;
	
	
	private String result;
	
	private JSONArray resultJsonArray;
	private JSONObject resultJsonObject;

	private long orderid = 1;

	/**
	 * 用户登录
	 * @return
	 */
	@Action(value="loginAction", 
			results={@Result(name="success", type="json", params={"root", "result"})}
			)
	public String login()
	{
		result = userService.login(user);
		
		return SUCCESS;
	}
	
	/**
	 * 用户注册
	 * @return
	 */
	@Action(
			value="registerAction",
			results={
					@Result(name="success", type="json", params={"root", "result"})
					}		
			)
	public String register()  
	{
		result = userService.register(user);
		
		return SUCCESS;
	}
	
	/**
	 * 修改密码
	 * @return 修改成功或失败
	 */
	@Action(
			value="alterpasswordAction", 
			results={@Result(name="success", type="json", params={"root", "result"})},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")}
			)
	public String alterpassword()
	{
		result = userService.alterpassword(user,newpassword);
		
		return SUCCESS;
	}
	
	/**
	 * 修改个人信息
	 */
	@Action(
			value="alterinfoAction", 
			results={@Result(name="success", type="json", params={"root", "result"})},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")}
			)
	public String alterinfo()
	{
		result = userService.alterinfo(user,artist);
		
		return SUCCESS;
	}
	/**
	 * 用户登出
	 * @return
	 */
	@Action(value="logoutAction",results={@Result(name="success", location="/jsp/frontside/user/login.jsp")})
	public String logout()
	{
		userService.logout();
		return SUCCESS;
	}
	
	@Action(value="showArtist", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")})
	public String showArtist()
	{
		List<Artist> list = userService.getArtistList();
		ServletActionContext.getRequest().setAttribute("list", list);
		return SUCCESS;
	}
	

	
	
	/**
	 * 根据艺术家id查询一个艺术家的详细信息
	 * @return
	 */
	@Action(value="findArtist", results={@Result(name="success", location="/jsp/frontside/order/detailArtist.jsp")})
	public String findArtist()
	{
		long id =user.getId();
		Artist artist=userService.getArtist(id);
		ServletActionContext.getRequest().setAttribute("artist", artist);
		return SUCCESS;
	}
	
	/**
	 * 根据艺术家分类获取简要的艺术家信息列表
	 * */
	@Action(value="getBriefArtistBySort", results={@Result(name="success", type="json", params={"root", "resultJsonArray"})})
	public String getBriefArtistBySort()
	{
		String identification=artist.getIdentification();
		setResultJsonArray(userService.getBriefArtistBySort("%"+identification+"%"));
		System.out.println(resultJsonArray);
		
		
		return SUCCESS;
	}
	
	/**
	 * 通过艺术家姓名获取艺术家
	 * @return
	 */
	@Action(value="getArtistByName", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")})
	public String getArtistByName()
	{
		String realName=artist.getRealName();
		List<Artist> list = userService.getArtistByName("%"+realName+"%");
		ServletActionContext.getRequest().setAttribute("list", list);
		return SUCCESS;
	}
	
	/**
	 * 艺术家认证
	 * @return
	 */
	@Action(value="submitArtist", results={@Result(name="success", location="/jsp/frontside/user/profile.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String submitArtist()
	{
		userService.submitArtist(artist,pic,picFileName);
		return SUCCESS;
	}
	
	/**
	 * 显示艺术家自己发布的作品
	 * @author cz
	 * @return
	 */
	@Action(value="showMyCommodity", results={@Result(name="success", location="/jsp/frontside/artist/artistCommodity.jsp")}, 
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public  String showMyCommodity()
	{
		List<Commodity> myCommodities = userService.showMyCommodity();
		setAttributeByRequest("commodities", myCommodities);
		return SUCCESS;
	}
	
	
	/**
	 * 获取已完成的所有订单
	 */
	@Action(value="getArtistFinishedOrder",results={@Result(name="success", type="json", params={"root", "resultJsonArray"})},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String getFinishedOrder()
	{		
		resultJsonArray = userService.getArtistFinishedOrder(purchaseOrder.getState());
		return SUCCESS;
	}
	
	/**
	 * 用户充值
	 * @author sheng
	 */
	@Action(value="Userrecharge", results={@Result(name="success", location="/jsp/test/shengtest.jsp")},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public  String Userrecharge()
	{
		userService.recharge(user.getBalance());
		return SUCCESS;
	}
	
	/**
	 * 查看个人所有地址列表
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ShowAllAddressList",
			results = {
					@Result(name="success", location="/jsp/frontside/address/address_list.jsp")
			},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")}
			)
	public String ShowAllAddressList()
	{
		List<ShippingAddress> addressList = userService.ShowAllAddressList();
		
		ServletActionContext.getRequest().setAttribute("addressList", addressList);
		
		
		return "success";
	}
	
	/**
	 * 选择地址
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "SelectAddress",
			results = {
					@Result(name="success", location="#")
			},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")}
			)
	public String SelectAddress()
	{
		userService.SelectAddress(address.getId());
		
		return "success";
	}
	
	/**
	 * 新增地址
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "AddNewAddress",
			results = {
					@Result(name="success", location="/jsp/frontside/address/address_list.jsp")
			},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")}
			)
	public String AddNewAddress()
	{
		
		userService.AddNewAddress(address);
		
		return "success";
	}
	
	/**
	 * 删除地址
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "DeleteAddress",
			results = {
					@Result(name="success", location="/jsp/frontside/address/address_list.jsp")
			},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")}
			)
	public String DeleteAddress()
	{
		userService.DeleteAddress(address.getId());
		List<ShippingAddress> addressList = userService.ShowAllAddressList();
		ServletActionContext.getRequest().setAttribute("addressList", addressList);
		
		return "success";
	}
	
	
	private void setAttributeByRequest(String key, Object value)
	{
		ServletActionContext.getRequest().setAttribute(key, value);
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

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	

	public List<File> getPic() {
		return pic;
	}

	public void setPic(List<File> pic) {
		this.pic = pic;
	}

	public List<String> getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(List<String> picFileName) {
		this.picFileName = picFileName;
	}

	public List<String> getPicContentType() {
		return picContentType;
	}

	public void setPicContentType(List<String> picContentType) {
		this.picContentType = picContentType;
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
	
	
	public long getOrderid() {
		return orderid;
	}

	public void setOrderid(long orderid) {
		this.orderid = orderid;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}

	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}

	public ShippingAddress getAddress() {
		return address;
	}

	public void setAddress(ShippingAddress address) {
		this.address = address;
	}
	
	
	
}
