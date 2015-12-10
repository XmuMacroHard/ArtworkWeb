package cn.edu.xmu.artwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xmu.artwork.dao.ICommodityDao;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.service.ISaleService;

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
