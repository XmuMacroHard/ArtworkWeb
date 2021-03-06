package cn.edu.xmu.artwork.utils.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Component;

import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.utils.IOrderUtils;

@Component
public class OrderUtils implements IOrderUtils{
	
	/**
	 * 根据userid生成订单号
	 * 
	 */
	public String getordernum(User user)
	{
		SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");//设置日期格式
		String number=df.format(new Date())+String.format("%02d",user.getId()%100);
		Random random=new Random();
		number=number+String.format("%04d",random.nextInt(10000));
		return number;
	}
	
	/**
	 * 根据收货地址类获取收货地址的string类型
	 */
	public String changeaddress(ShippingAddress shippingAddress)
	{
		String addressString="";
		addressString+=(shippingAddress.getProvince()+shippingAddress.getCity()+shippingAddress.getRegion()+shippingAddress.getDetailedAdress()+"<>");
		System.out.println(addressString);
		addressString+=(shippingAddress.getConsignee()+"<>");
		System.out.println(addressString);
		addressString+=shippingAddress.getPhone();
		System.out.println(addressString);
		return addressString;
	}
}
