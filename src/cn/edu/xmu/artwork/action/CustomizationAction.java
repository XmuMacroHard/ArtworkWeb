package cn.edu.xmu.artwork.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Scope;

import cn.edu.xmu.artwork.entity.Customization;

@Scope("prototype")
@ParentPackage("struts-default")
@Namespace(value="/")
public class CustomizationAction {
	private Customization customization;
	
	@Action(
			value="CustomizationSubmitAction",
			results={
					@Result(name="success", location="/jsp/success.jsp"),
					@Result(name="fail", location="/jsp/fail.jsp")
					}		
			)
	public void Submit()
	{
		//todo  add Customization
	}


	
}
