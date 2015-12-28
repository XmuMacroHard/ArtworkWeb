package cn.edu.xmu.artwork.constants;

public interface IResultCode 
{
	String ADMIN = "admin";
	String EDITOR = "editor";
	String SUCCESS = "success";
	String ArtistSuccess = "artistsuccess";
	String AdmistratorSuccess = "admistratorsuccess";
	
	String ERROR = "error";	
	String RESULT = "result";
	
	String MESSAGE = "message";
	String LOGIN_ERROR_MESSAGE = "用户名或密码错误";
	String SHOPPINGCART_ERROR_MESSAGE = "该商品已经添入购物车";
	String SHOPPINGCART_SUCCESS_MESSAGE = "该商品成功添入购物车";
}
