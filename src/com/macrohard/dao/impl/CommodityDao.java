package com.macrohard.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;
import org.springframework.stereotype.Repository;

import com.macrohard.dao.ICommodityDao;
import com.macrohard.entity.Commodity;

//@NamedQueries(
//	@NamedQuery(
//		name = "",
//		query = ""
//	)
//)

@Repository
public class CommodityDao implements ICommodityDao 
{
	public List<Commodity> getCommodityListByType(String commoType)
	{
		return new ArrayList<Commodity>();
	}
}
