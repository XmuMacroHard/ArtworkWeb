package cn.edu.xmu.artwork.action;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IUserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Scope("prototype")
@ParentPackage("json-default")
@Namespace(value="/")
public class UserAction extends ActionSupport 
{
	private static final long serialVersionUID = 1L;
	@Autowired
	private User user;
	private Artist artist;
	@Autowired
	private IUserService userService;
	
	private String result;
	
	@Action(
			value="loginAction", 
			results={
					@Result(name="success", type="json", params={"root", "result"})
					}
			)
	public String login()
	{
		result = userService.login(user);
		
		return SUCCESS;
	}
	
	@Action(
			value="registerAction",
			results={
					@Result(name="success", location="/jsp/success.jsp"),
					@Result(name="fail", location="/jsp/fail.jsp")
					}		
			)
	public String register()  
	{
		try {
			userService.register(user);
			return "success";
		} 
		catch (ConstraintViolationException e) {
			String faildetail = "Already Exists User!";
			System.out.print("in register Already Exists User!");
		    ActionContext.getContext().put("faildetail", faildetail);
			return "fail";
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.print("in register fail");
			return "fail";
		}
	}
	
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
	
	@Action(value="findArtist", results={@Result(name="success", location="/jsp/test/shenggetArtist_test.jsp")})
	public String findArtist()
	{
		long id =user.getId();
		Artist artist=userService.getArtist(id);
		ServletActionContext.getRequest().setAttribute("artist", artist);
		return SUCCESS;
	}
	
	@Action(value="getArtistBySort", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")})
	public String getArtistBySort()
	{
		String identification=artist.getIdentification();
		List<Artist> list = userService.getArtistBySort("%"+identification+"%");
		ServletActionContext.getRequest().setAttribute("list", list);
		return SUCCESS;
	}
	
	@Action(value="getArtistByName", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")})
	public String getArtistByName()
	{
		String realName=artist.getRealName();
		List<Artist> list = userService.getArtistByName("%"+realName+"%");
		ServletActionContext.getRequest().setAttribute("list", list);
		return SUCCESS;
	}
	
	@Action(value="submitArtist", results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String submitArtist()
	{
		userService.submitArtist(artist);
		return SUCCESS;
	}
	
	/**
	 * 显示艺术家发布的作品
	 * @author cz
	 * @return
	 */
	@Action(value="showMyCommodity", results={@Result(name="success", location="/jsp/frontside/artist/artistCommodity.jsp")})
	public  String showMyCommodity()
	{
		List<Commodity> myCommodities = userService.showMyCommodity();
		setAttributeByRequest("commodities", myCommodities);
		return SUCCESS;
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
	
	
}
