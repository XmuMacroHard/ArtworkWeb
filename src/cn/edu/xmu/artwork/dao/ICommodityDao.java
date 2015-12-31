package cn.edu.xmu.artwork.dao;

import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;

import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.CommodityPics;


public interface ICommodityDao 
{
	public  void saveCommidityPic(CommodityPics commodityPics);
	public List<Commodity> getCommodityListByType(String commoType);
	public Commodity getCommodityById(long id);
	public void deleteCommodity(long id);
	public void saveCommodity(Commodity commodity);
	public List<Commodity> getAllByAuthorId(long authorid);
	
	public List<Commodity> getCommodityList();
	public void updateStatus(long id, String status);

	public List<Commodity> getRecommendedCommodities(int num);
	public List<Commodity> getCommodityByOrderId(long id);
}
