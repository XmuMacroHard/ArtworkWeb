package cn.edu.xmu.artwork.constants;

public interface ITableConstants 
{
	/* datePos table*/
	String INFO_LOCATION_1 = "info_location1";
	String INFO_LOCATION_2 = "info_location2";
	String ADV_LOCATION_1 = "adv_location1";
	
	int INFO_LOCATION_1_NUM = 4;
	int INFO_LOCATION_2_NUM = 4;
	int INFO_ADV_LOCATION_1_NUM = 4;
	
	int RECOMMENDED_ARTIST_NUM = 4;
	int RECOMMENDED_COMMODITY_NUM = 4;
	
	//the enum value of the information
	String INFO_DEFAULT_INFO_STATUS = "default_info";
	String INFO_DEFAULT_ADV_STATUS = "default_adv";
	
	//property
	
	/*user table*/
	String USER_IS_APPROVED_APPROVE = "approve";
	String USER_IS_APPROVED_NOT_APPROVE = "notapprove";
	String USER_IS_APPROVED_PENDING = "pending";
	String USER_IS_BANNED_TRUE = "1";
	String USER_IS_BANNED_FALSE = "0";
	
	/*artist table*/
	String ARTIST_REAL_NAME = "name";
	String ARTIST_ID = "id";
	String ARTIST_PORTRAIT = "portrait";
	String ARTIST_INTRODUCTION = "introduction";
	String ARTIST_SHIPPING_ADDRESS = "shippingAddresses";
	String ARTIST_INFORMATIONS = "informations";
	String ARTIST_SHOPPING_CART = "shoppingCarts";
	String ARTIST_CUSTOMIZATION = "customizations";
	
	/*Commodity*/
	String COMMODITY_IS_BAN = "0";
	String COMMODITY_IS_NOBAN = "1";
}
