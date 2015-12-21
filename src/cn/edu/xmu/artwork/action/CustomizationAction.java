package cn.edu.xmu.artwork.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Scope;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.Customization;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ICustomizeService;
import cn.edu.xmu.artwork.service.ISaleService;
import cn.edu.xmu.artwork.service.IUserService;

@Scope("prototype")
@ParentPackage("struts-default")
@Namespace(value="/")
public class CustomizationAction extends ActionSupport{
	private Customization customization;
	private User user;
	private Artist artist;
	private Commodity commodity;
	@Autowired
	private ICustomizeService customizeService;
	@Autowired
	private IUserService userService;
	@Autowired
	private ISaleService saleService;
	
	@Action(value="CustomizationSubmitAction",results={@Result(name="success", location="/jsp/test/shengtest.jsp", type="redirect")})
	public String CustomizationSubmitAction()
	{
		user.setId(1L);//这里的user_id需要从session获取
		artist=userService.getArtist(3L);//从界面传值
		
		commodity.setAuthorId(3L);//同样需要艺术家id,这里没有往下传，因为直接用你的service方法了
		commodity.setCategory("customization");
		saleService.uploadCommodity(commodity,new ArrayList<String>());
		customizeService.addCustomization(customization);
		return SUCCESS;
	}

	public Customization getCustomization() {
		return customization;
	}

	public void setCustomization(Customization customization) {
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
