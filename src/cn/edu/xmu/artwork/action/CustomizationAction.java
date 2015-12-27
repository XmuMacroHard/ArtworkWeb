package cn.edu.xmu.artwork.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Scope;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.xmu.artwork.dao.IArtistDao;
import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.dao.impl.UserDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.Htest;
import cn.edu.xmu.artwork.entity.Payment;
import cn.edu.xmu.artwork.entity.Test;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ICustomizeService;
import cn.edu.xmu.artwork.service.ISaleService;
import cn.edu.xmu.artwork.service.IUserService;

@Scope("prototype")
@ParentPackage("struts-default")
@Namespace(value="/")
public class CustomizationAction extends ActionSupport{
	private CustomizationOrder customization;
	private User user;
	private Artist artist;
	private Commodity commodity;
	@Autowired
	private ICustomizeService customizeService;
	@Autowired
	private IUserService userService;
	@Autowired
	private ISaleService saleService;
	@Autowired
	private ICustomizationDao customizationDao;
	
	@Action(value="CustomizationSubmitAction",results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String CustomizationSubmitAction()
	{
		long user_id = 1L;
		long artist_id = 4L;
		Commodity commodity = new Commodity();
		commodity.setAuthorId(4L);
		commodity.setIntroduction("good");
		commodity.setPrice((float)100);
		commodity.setName("test com");
		commodity.setType("picture");
		customizeService.addCustomization(user_id, artist_id, commodity);
		return SUCCESS;
	}
	
	@Action(value="setCustomizationPaymentAction",results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String setCustomizationPaymentAction()
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
	
	@Action(value="getCustomizationsByArtistAction",results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String getCustomizationsByArtist(){
		int id = 1; // get from session;
		List<CustomizationOrder> lists = customizeService.getCustomizationsByArtist(id);
		setAttributeByRequest("informationList", lists);
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
}
