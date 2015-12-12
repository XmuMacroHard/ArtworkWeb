package cn.edu.xmu.artwork.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.dao.impl.TestDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Test;
import cn.edu.xmu.artwork.service.TestService;

import com.opensymphony.xwork2.ActionSupport;

@Scope("prototype")
@ParentPackage("struts-default")
@Namespace(value="/")
public class TestAction extends ActionSupport 
{
	private Test test = new Test();
	
	@Autowired
	private TestService testService;
	
	@Action(value="test", results={@Result(name="success", location="/jsp/success.jsp", type="redirect")})
	public String test() throws Exception 
	{
		System.out.println(test.getAccount() + test.getPassword());
		System.out.println("in text action execute");
		testService.save(test);
		//return "success";
		return IResultCode.SUCCESS;
	}

	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}
	
	
}
