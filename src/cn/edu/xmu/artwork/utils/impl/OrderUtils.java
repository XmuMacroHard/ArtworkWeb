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
	public String getordernum(User user)
	{
		SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");//设置日期格式
		String number=df.format(new Date())+String.format("%02d",user.getId()%100);
		Random random=new Random();
		number=number+String.format("%04d",random.nextInt(10000));
		return number;
	}
	
	public String changeaddress(ShippingAddress shippingAddress)
	{
		String addressString="";
		addressString+="收货地址:";
		addressString+=(shippingAddress.getProvince()+shippingAddress.getCity()+shippingAddress.getRegion()+shippingAddress.getDetailedAdress()+"\n");
		addressString+="收货人:";
		addressString+=(shippingAddress.getConsignee()+"\n");
		addressString+="联系方式:";
		addressString+=shippingAddress.getPhone();
		
		return addressString;
	}
}
