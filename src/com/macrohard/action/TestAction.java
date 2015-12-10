package com.macrohard.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.macrohard.constants.IResultCode;
import com.macrohard.dao.impl.TestDao;
import com.macrohard.entity.Artist;
import com.macrohard.entity.Test;
import com.macrohard.service.TestService;
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
