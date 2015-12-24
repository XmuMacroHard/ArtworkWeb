package cn.edu.xmu.artwork.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.Customization;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ICustomizeService;

@Transactional
@Service
public class CustomizeService implements ICustomizeService{
	@Autowired
	private ICustomizationDao customizationDao;
	
	@Override
	public void addCustomization(Customization customization,User user,Commodity commodity) {
		commodity.setCategory("customization");//对商品进行处理
		commodity.setIsBought(false);
		commodity.setPurchaseOrder_id(customization);
		
		customization.setTotalprice(commodity.getPrice());
		customization.setUser(user);
		customization.getCommodity().add(commodity);
		customization.setOrderid(getordernum(user));	
		customization.setState("0");
		customization.setType("customize");
		customization.setDate(new Date());
		customizationDao.save(customization);
	}

	@Override
	public List<Customization> showCustomizationsList(long id) {
	
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Customization> getCustomizationsByUser(long id) {
		customizationDao.getCustomizationsByUser(id);
		return null;
	}

	@Override
	public List<Customization> getCustomizationsByArtist(long id) {
		customizationDao.getCustomizationsByArtist(id);
		return null;
	}
	
	public String getordernum(User user)
	{
		SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");//设置日期格式
		String number=df.format(new Date())+String.format("%02d",user.getId()%100);
		Random random=new Random();
		number=number+String.format("%04d",random.nextInt(10000));
		return number;
	}
	
}