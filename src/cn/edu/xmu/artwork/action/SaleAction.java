package cn.edu.xmu.artwork.action;


import java.io.File;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;








import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IFileService;
import cn.edu.xmu.artwork.service.ISaleService;

import com.opensymphony.xwork2.ActionSupport;

@Scope("prototype")
@ParentPackage("json-default")
@Namespace(value="/")
public class SaleAction extends ActionSupport 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Commodity commodity = new Commodity();
	private User user = new User();
	
	//used to store the json result
	private String result;
	
	//used to deal with uploading the pictures
	private List<File> pictures;
	private List<String> picturesContentType;
	private List<String> picturesFileName;
	
	@Autowired
	private ISaleService saleService;
	
	@Autowired
	private IFileService fileService;
	
	/*
	 * show all commodities by type
	 * */
	@Action(value="showCommodityList", results={@Result(name="success", type="json", params={"root", "result"})})
	public String showCommListByType()
	{
//		System.out.println("in showCommoditiesAction");
//		System.out.println("commodityType" + commodityType);
		List<Commodity> commodities = saleService.getCommodityListByType(commodity.getType());
		//ServletActionContext.getRequest().setAttribute("commodities", commodities);
		JSONArray commoditiesJsonArray = JSONArray.fromObject(commodities);
		result = commoditiesJsonArray.toString();
//		System.out.println("commoditiesJson" + result);
		return IResultCode.SUCCESS;
	}
	
	/*
	 * get the detailed information of the certain community
	 * */
	@Action(value="getDetailedCommunity", results={@Result(name="success", type="json", params={"root", "result"})})
	public String getDetailedComm()
	{
		Commodity comm = saleService.getCommodityById(commodity.getId());
		JSONObject commJO = JSONObject.fromObject(comm);
		result = commJO.toString();
		System.out.println("commodity" + result);
		return IResultCode.SUCCESS;
	}
	
	/*
	 * upload the information of the commodity
	 * */
	@Action(value="uploadCommodity", results={@Result(name="success", type="json", params={"root", "result"})})
	public String uploadCommodity()
	{
		List<String> picPaths = fileService.uploadPicture(pictures, picturesFileName);
		saleService.uploadCommodity(commodity, picPaths);
		
		return IResultCode.SUCCESS;
	}
	
	/*
	 * add the commodity to the shopping cart
	 * */
	@Action(value="addToCart", results={@Result(name="success", type="json", params={"root", "result"})})
	public String AddToCart()
	{
		saleService.addToCart(commodity, user);		
		return IResultCode.SUCCESS;
	}
	
	/*
	 *show the list of shoppingcart 
	 * */
	@Action(value="ShowshoppingCart", results={@Result(name="success", type="json", params={"root", "result"})})
	public String showShoppingcart()
	{
		//need to be tes.
		user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		saleService.getShoppingCart(user.getId());		
		return IResultCode.SUCCESS;
	}
	
	
	
	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<File> getPictures() {
		return pictures;
	}

	public void setPictures(List<File> pictures) {
		this.pictures = pictures;
	}

	public List<String> getPicturesContentType() {
		return picturesContentType;
	}

	public void setPicturesContentType(List<String> picturesContentType) {
		this.picturesContentType = picturesContentType;
	}

	public List<String> getPicturesFileName() {
		return picturesFileName;
	}

	public void setPicturesFileName(List<String> picturesFileName) {
		this.picturesFileName = picturesFileName;
	}


	
}
