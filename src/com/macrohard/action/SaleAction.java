package com.macrohard.action;


import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;





import com.macrohard.constants.IResultCode;
import com.macrohard.entity.Commodity;
import com.macrohard.service.ISaleService;
import com.opensymphony.xwork2.ActionSupport;

@Scope("prototype")
@ParentPackage("struts-default")
@Namespace(value="/")
public class SaleAction extends ActionSupport 
{
	private String commodityType;
	
	@Autowired
	private ISaleService saleService;
	
	String showCommListByType()
	{
		List<Commodity> commodities = saleService.getCommodityListByType(commodityType);
		ServletActionContext.getRequest().setAttribute("commodities", commodities);
		
		return IResultCode.SUCCESS;
	}
}
