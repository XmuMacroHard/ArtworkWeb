package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Commodity;


public interface ICommodityDao 
{
	public List<Commodity> getCommodityListByType(String commoType);
}
