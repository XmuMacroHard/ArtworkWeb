package cn.edu.xmu.artwork.utils;

import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;

public interface IOrderUtils {
	public String getordernum(User user);
	public String changeaddress(ShippingAddress shippingAddress);
}
