package cn.edu.xmu.artwork.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
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
@Scope("prototype")  
@ParentPackage("custom-default")    
@Namespace(value="/")
@InterceptorRefs({@InterceptorRef("checkLoginStack")})
public class AdminAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private List<File> file;
	private List<String> fileFileName;
	private List<String> fileContentType;
	private String fileName;
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	private String result;
	
	//@Autowired
	private User user;
	
	//@Autowired
	private Artist artist;
	
	//@Autowired
	private Information information;
	
	//@Autowired
	private List<User> userList;
	
	//@Autowired
	private List<Artist> artistList;
	
	//@Autowired
	private List<Information> infoList;

	private Commodity item;
	
	private List<Commodity> itemList;
	
	public Commodity getItem() {
		return item;
	}

	public void setItem(Commodity item) {
		this.item = item;
	}

	public List<Commodity> getItemList() {
		return itemList;
	}

	public void setItemList(List<Commodity> itemList) {
		this.itemList = itemList;
	}

	@Autowired
	private IAdminService adminService;
	
	@Autowired
	private IFileService fileService;
	
	public IFileService getFileService() {
		return fileService;
	}

	public void setFileService(IFileService fileService) {
		this.fileService = fileService;
	}

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
	
	public Artist getArtist() {
		return artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	public List<Artist> getArtistList() {
		return artistList;
	}

	public void setArtistList(List<Artist> artistList) {
		this.artistList = artistList;
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
			
			adminService.UserBanning(user.getId());
			
			jsobj.put("id", user.getId());
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
			
			adminService.UserRelieve(user.getId());
			
			jsobj.put("id", user.getId());
			jsobj.put("success", "relieve success");
			setResult(jsobj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 查看用户详情
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ShowUserDetails",
			results = {
					@Result(name="success", location="/jsp/backstage/user_detail.jsp")
			}
			)
	public String ShowUserDetails()
	{
		try {
			user = adminService.ShowUserDetails(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletActionContext.getRequest().setAttribute("normaluser", user);
		
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
	
	/**
	 * 查看资讯详情
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ShowInfoDetails",
			results = {
					@Result(name="success", location="/jsp/backstage/info_detail.jsp")
			}
			)
	public String ShowInfoDetails()
	{
		try {
			information = adminService.ShowInfoDetails(information.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletActionContext.getRequest().setAttribute("information", information);
		
		return "success";
	}
	
	/**
	 * 显示所有艺术家列表
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ShowAllArtistList",
			results = {
					@Result(name="success", location="/jsp/backstage/artist_list.jsp")
			}
			)
	public String ShowAllArtistList()
	{
		try {
			artistList = adminService.ShowAllArtistList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletActionContext.getRequest().setAttribute("artistList", artistList);
		
		return "success";
	}
	
	/**
	 * 驳回艺术家认证
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ArtistBanning",
			results = {
					@Result(name="success", type="json", params={"root", "result"})
			}
			)
	public String ArtistBanning()
	{
		try {
			JSONObject jsobj = new JSONObject();
			
			//System.out.println(information.getTitle());
			adminService.ArtistBanning(artist.getId());
			
			jsobj.put("id", artist.getId());
			jsobj.put("success", "banning success");
			setResult(jsobj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 通过艺术家认证
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ArtistRelieve",
			results = {
					@Result(name="success", type="json", params={"root", "result"})
			}
			)
	public String ArtistRelieve()
	{
		try {
			JSONObject jsobj = new JSONObject();
			
			//System.out.println(information.getTitle());
			adminService.ArtistRelieve(artist.getId());
			
			jsobj.put("id", artist.getId());
			jsobj.put("success", "banning success");
			setResult(jsobj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 查看艺术家详情
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ShowArtistDetails",
			results = {
					@Result(name="success", location="/jsp/backstage/artist_detail.jsp")
			}
			)
	public String ShowArtistDetails()
	{
		try {
			artist = adminService.ShowArtistDetails(artist.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletActionContext.getRequest().setAttribute("artist", artist);
		
		return "success";
	}
	
	/**
	 * 获取下载文件流
	 * @author asus1
	 * @return
	 * @throws FileNotFoundException
	 * @throws UnsupportedEncodingException
	 */
	public InputStream getDownloadFile() throws FileNotFoundException, UnsupportedEncodingException {
		
		return fileService.getDownloadFile(fileName);
	}
	
	/**
	 * 文件下载
	 * @author asus1
	 * @return
	 * @throws Exception
	 */
	@Action(
			value = "download",
			results = {
					@Result(name="success", type="stream", params={
							"contentType", "application/txt",
							"contentDisposition", "attachment;filename=\"${fileName}\"",
							"inputName", "downloadFile",
							"bufferSize", "2048"
					})
			}
			)
	public String downloadFile() throws Exception {
        return "success";
    }
	
	/**
	 * 显示所有商品列表
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ShowAllItemList",
			results = {
					@Result(name="success", location="/jsp/backstage/item_list.jsp")
			}
			)
	public String ShowAllItemList()
	{
		try {
			itemList = adminService.ShowAllItemList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletActionContext.getRequest().setAttribute("itemList", itemList);
		
		return "success";
	}
	
	/**
	 * 商品下架
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ItemBanning",
			results = {
					@Result(name="success", type="json", params={"root", "result"})
			}
			)
	public String ItemBanning()
	{
		try {
			JSONObject jsobj = new JSONObject();
			
			adminService.ItemBanning(item.getId());
			
			jsobj.put("id", item.getId());
			jsobj.put("success", "banning success");
			setResult(jsobj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 商品上架
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ItemRelieve",
			results = {
					@Result(name="success", type="json", params={"root", "result"})
			}
			)
	public String ItemRelieve()
	{
		try {
			JSONObject jsobj = new JSONObject();
			
			adminService.ItemRelieve(item.getId());
			
			jsobj.put("id", item.getId());
			jsobj.put("success", "banning success");
			setResult(jsobj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * 查看商品详情
	 * @author asus1
	 * @return
	 */
	@Action(
			value = "ShowItemDetails",
			results = {
					@Result(name="success", location="/jsp/backstage/item_detail.jsp")
			}
			)
	public String ShowItemDetails()
	{
		try {
			item = adminService.ShowItemDetails(item.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletActionContext.getRequest().setAttribute("item", item);
		
		return "success";
	}
}
