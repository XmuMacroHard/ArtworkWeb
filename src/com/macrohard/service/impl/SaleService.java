package com.macrohard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macrohard.dao.ICommodityDao;
import com.macrohard.entity.Commodity;
import com.macrohard.service.ISaleService;

@Service
public class SaleService implements ISaleService 
{
	@Autowired
	ICommodityDao commodityDao;
	
	public List<Commodity> getCommodityListByType(String commoType)
	{
		return commodityDao.getCommodityListByType(commoType);
	}
}
