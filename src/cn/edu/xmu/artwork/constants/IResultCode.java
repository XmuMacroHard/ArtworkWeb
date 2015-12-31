package cn.edu.xmu.artwork.constants;

public interface IResultCode 
{
	String ADMIN = "admin";
	String EDITOR = "editor";
	String SUCCESS = "success";
	String ERROR = "error";	
	String ArtistSuccess = "artistsuccess";
	String AdmistratorSuccess = "admistratorsuccess";
	
	String RESULT = "result";
	String RESULT_DATA = "result_data";
	
	String MESSAGE = "message";
	String LOGIN_ERROR_MESSAGE = "用户名或密码错误";
	String SHOPPINGCART_ERROR_MESSAGE = "该商品已经添入购物车";
	String SHOPPINGCART_SUCCESS_MESSAGE = "该商品成功添入购物车";
	
	String ALTER_PASSWORD_ERROR = "原密码错误";
	String ALTER_PASSWORD_SUCCESS = "修改成功";
	
	String REGISTER_ERROR = "该邮箱已注册";
	String REGISTER_SUCCESS = "注册成功";
}
