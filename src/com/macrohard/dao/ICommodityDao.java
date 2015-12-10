package com.macrohard.dao;

import java.util.List;

import com.macrohard.entity.Commodity;


public interface ICommodityDao 
{
	public List<Commodity> getCommodityListByType(String commoType);
}
