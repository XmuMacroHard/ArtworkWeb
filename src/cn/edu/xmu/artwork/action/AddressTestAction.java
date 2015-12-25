package cn.edu.xmu.artwork.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.context.annotation.Scope;

import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 用来测试地址操作，该类后期删除
 * @author asus1
 *
 */
@Scope("prototype")//支持多例  
@ParentPackage("json-default")  //表示继承的父包  
@Namespace(value="/") //表示当前Action所在命名空间
public class AddressTestAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private User user;
	private ShippingAddress address;
	private IUserService userService;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public ShippingAddress getAddress() {
		return address;
	}
	public void setAddress(ShippingAddress address) {
		this.address = address;
	}
	public IUserService getUserService() {
		return userService;
	}
	public void setUserService(IUserService userService) {
		this.userService = userService;
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
			}
			)
	public String ShowAllAddressList()
	{
		//userService.ShowAllAddressList(user.getId());
		List<ShippingAddress> addressList = userService.ShowAllAddressList((long)1);
        for(ShippingAddress sa : addressList)
        {
        	System.out.println(sa.getCity());
        }
		
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
			}
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
			}
			)
	public String AddNewAddress()
	{
		User user = new User();
		user.setId((long)1);
		user.setEmail("adfa@qe.com");
		user.setNickname("看见了");
		user.setBalance(10000f);
		user.setIsBanned("0");
		user.setPassword("123");
		user.setPhone("6876876");
		
		address.setUser(user);
		
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
			}
			)
	public String DeleteAddress()
	{
		userService.DeleteAddress(address.getId());
		
		return "success";
	}
}
