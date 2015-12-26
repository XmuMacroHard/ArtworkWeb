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

import cn.edu.xmu.artwork.dao.IArtistDao;
import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.dao.impl.HTestDao;
import cn.edu.xmu.artwork.dao.impl.UserDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.Htest;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ICustomizeService;

@Transactional
@Service
public class CustomizeService implements ICustomizeService{
	@Autowired
	private ICustomizationDao customizationDao;
	@Autowired
	private IUserDao userDao;
	@Autowired
	private IArtistDao artistDao;
	
	@Override
	public void addCustomization(long user_id, long artist_id ,Commodity commodity) {

		User user = userDao.findById(user_id);
		Artist artist = artistDao.findById(artist_id);
		CustomizationOrder customizationOrder = new CustomizationOrder();
		
		commodity.setCategory("customization");//对商品进行处理
		commodity.setIsBought(false);
		commodity.setPurchaseOrder(customizationOrder);
		
		customizationOrder.setTotalprice(commodity.getPrice());
		customizationOrder.setLeftprice(commodity.getPrice());
		customizationOrder.setUser(user);
		customizationOrder.setArtist(artist);
		customizationOrder.getCommodity().add(commodity);
		//customization.setOrderid(getordernum(user));	
		customizationOrder.setOrderid("1234");
		customizationOrder.setState("0");
		customizationOrder.setType("customize");
		customizationOrder.setDate(new Date());
		
		customizationDao.save(customizationOrder);
	}

	@Override
	public List<CustomizationOrder> showCustomizationsList(long id) {
	
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CustomizationOrder> getCustomizationsByUser(long id) {
		return customizationDao.getCustomizationsByUser(id);
	}

	
	@Override
	public List<CustomizationOrder> getCustomizationsByArtist(long id) {
		return customizationDao.getCustomizationsByArtist(id);
	}
	
	@Override
	public boolean accetpCustomization(long id) {
			CustomizationOrder customization = customizationDao.findInfoById(id);
			if(null == customization)
				return false;
			else
			{
				customization.setAcceptState("accept");
				return true;	
			}
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
