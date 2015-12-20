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
	private JSONArray resultJsonArray;
	private JSONObject resultJsonObject;

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
	 * @return success
	 * */
	@Action(value="showCommodityList", results={@Result(name="success", type="json", params={"root", "resultJsonArray"})})
	public String showCommListByType()
	{
		System.out.println(commodity.getType());
		JSONArray commoditiesJsonArray = saleService.getCommodityListByType(commodity.getType());
		setResultJsonArray(commoditiesJsonArray);
		System.out.println(commoditiesJsonArray);
		return IResultCode.SUCCESS;
	}
	
	/*
	 * get the detailed information of the certain community
	 * */
	@Action(value="getDetailedCommodity", results={@Result(name="success", location="/jsp/frontside/sale/detailCommodity.jsp")})
	public String getDetailedComm()
	{
		Commodity comm = saleService.getCommodityById(commodity.getId());
		setAttributeByRequest("commodity", comm);
		
		return IResultCode.SUCCESS;
	}
	
	/*
	 * upload the information of the commodity
	 * */
	@Action(value="uploadCommodity", results={@Result(name="success", location="/jsp/success.jsp")})
	public String uploadCommodity()
	{
		System.out.println("commodity.name" + commodity.getName());
		List<String> picPaths = fileService.uploadPicture(pictures, picturesFileName);
		saleService.uploadCommodity(commodity, picPaths);
		
		return SUCCESS;
	}
	
	/*
	 * add the commodity to the shopping cart
	 * */
	@Action(value="addToCart", results={@Result(name="success", type="json", params={"root", "resultJsonObject"})})
	public String AddToCart()
	{
		saleService.addToCart(commodity, user);
		resultJsonObject.put(IResultCode.RESULT, IResultCode.SUCCESS);
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
	
	/**
	 * 
	 * @param key
	 * @param value
	 */
	private void setAttributeByRequest(String key, Object value)
	{
		ServletActionContext.getRequest().setAttribute(key, value);
	}
	
	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

/*	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}*/

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

	public JSONArray getResultJsonArray() {
		return resultJsonArray;
	}

	public void setResultJsonArray(JSONArray resultJsonArray) {
		this.resultJsonArray = resultJsonArray;
	}

	public JSONObject getResultJsonObject() {
		return resultJsonObject;
	}

	public void setResultJsonObject(JSONObject resultJsonObject) {
		this.resultJsonObject = resultJsonObject;
	}
	
	
	
}
