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
	private List<User> userList;

	@Autowired
	private IAdminService adminService;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
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
			
			jsobj.put("success", "banning success");
			result = jsobj.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 解除用户禁用操作
	 * @return String
	 * @author asus1
	 */
	public String UserRelieve()
	{
		return "";
	}

	

	
	
	
}
