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
	
	/*information table*/
	//the enum value of the information
	String INFO_DEFAULT_INFO_STATUS = "default_info";
	String INFO_DEFAULT_ADV_STATUS = "default_adv";
	
	String INFO_STATUS_PENDING = "-1";
	String INFO_STATUS_UN_ACCEPTABLE = "0";
	String INFO_STATUS_ACCEPTABLE = "1";
	String INFO_STATUS = "state";
	
	//property
	
	/*PurchaseOrder table*/
	String PURCHASE_ORDER_SHIPPING_ADDRESS = "shippingAddress";
	String PURCHASE_ORDER_COMMODITY = "commodity";
	String PURCHASE_ORDER_PAYMENTS = "payments";
	String PURCHASE_ORDER_STATUS_PAID = "0";
	String PURCHASE_ORDER_STATUS_DILIVER = "1";
	String PURCHASE_ORDER_STATUS_MAKE_SURE = "2";
	String PURCHASE_ORDER_STATUS_FINISH = "3";
	String PURCHASE_ORDER_STATUS_UN_ACCEPTED = "4";
	String PURCHASE_ORDER_STATUS_REJECT = "-1";
	
	String PURCHASE_ORDER_ARTIST = "artist";
	String PURCHASE_ORDER_USER = "user";
	
	/*user table*/
	String USER_IS_APPROVED_APPROVE = "approved";
	String USER_IS_APPROVED_NOT_APPROVE = "notapproved";
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
	String TYPE_CUSTOMIZATION = "customization";
	
	String COMMODITY_IS_BAN = "0";
	String COMMODITY_IS_NOBAN = "1";
	String COMMODITY_IS_BOUGHT_TRUE = "1";
	String COMMODITY_IS_BOUGHT_FALSE = "0";
}
