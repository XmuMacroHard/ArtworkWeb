package cn.edu.xmu.artwork.action;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;

import cn.edu.xmu.artwork.entity.*;
import cn.edu.xmu.artwork.service.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用来管理所有后台操作的action，包括用户管理、艺术家管理、商品管理和订单管理
 * @author asus1
 *
 */
@Scope("prototype")//支持多例  
@ParentPackage("json-default")  //表示继承的父包  
@Namespace(value="/") //表示当前Action所在命名空间
public class AdminAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private String result;
	
	@Autowired
	private User user;
	
	@Autowired
	private Information information;
	
	@Autowired
	private List<User> userList;
	
	@Autowired
	private List<Information> infoList;

	@Autowired
	private IAdminService adminService;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Information getInformation() {
		return information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}
	
	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	
	public List<Information> getInfoList() {
		return infoList;
	}

	public void setInfoList(List<Information> infoList) {
		this.infoList = infoList;
	}
	
	public IAdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
	
	/**
	 * 显示所有用户列表
	 * @author asus1
	 * @return 结果
	 */
	@Action(
			value = "ShowAllUserList",
			results = {
					@Result(name="success", location="/jsp/backstage/user_list.jsp")
			}
			)
	public String ShowAllUserList()
	{
		try {
			System.out.println("show userlist");
			userList = adminService.ShowAllUserList();
			ServletActionContext.getRequest().setAttribute("list", userList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	
	/**
	 * 禁用用户操作
	 * @return String
	 * @author asus1
	 * */
	@Action(
			value = "UserBanning",
			results = {
					@Result(name="success", type="json", params={"root", "result"})
			}
			)
	public String UserBanning()
	{
		try {
			JSONObject jsobj = new JSONObject();
			
			System.out.println(user.getEmail());
			adminService.UserBanning(user.getEmail());
			
			jsobj.put("email", user.getEmail());
			jsobj.put("success", "banning success");
			setResult(jsobj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 启用用户操作
	 * @return String
	 * @author asus1
	 */
	@Action(
			value = "UserRelieve",
			results = {
					@Result(name="success", type="json", params={"root", "result"})
			}
			)
	public String UserRelieve()
	{
		try {
			JSONObject jsobj = new JSONObject();
			
			System.out.println(user.getEmail());
			adminService.UserRelieve(user.getEmail());
			
			jsobj.put("email", user.getEmail());
			jsobj.put("success", "relieve success");
			setResult(jsobj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 显示所有资讯列表
	 * @author asus1
	 */
	@Action(
			value = "ShowAllInfoList",
			results = {
					@Result(name="success", location="/jsp/backstage/info_list.jsp")
			}
			)
	public String ShowAllInfoList()
	{
		try {
			infoList = adminService.ShowAllInfoList();
			System.out.println(infoList.get(0).getTitle());
			ServletActionContext.getRequest().setAttribute("infoList", infoList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 退回资讯操作
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "InfoRetreat",
			results = {
					@Result(name="success", type="json", params={"root", "result"})
			}
			)
	public String InfoRetreat()
	{
		try {
			JSONObject jsobj = new JSONObject();
			
			System.out.println(information.getTitle());
			adminService.InfoRetreat(information.getId());
			
			jsobj.put("id", information.getId());
			jsobj.put("success", "banning success");
			setResult(jsobj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 通过资讯操作
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "InfoPass",
			results = {
					@Result(name="success", type="json", params={"root", "result"})
			}
			)
	public String InfoPass()
	{
		try {
			JSONObject jsobj = new JSONObject();
			
			System.out.println(information.getTitle());
			adminService.InfoPass(information.getId());
			
			jsobj.put("id", information.getId());
			jsobj.put("success", "banning success");
			setResult(jsobj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
}
