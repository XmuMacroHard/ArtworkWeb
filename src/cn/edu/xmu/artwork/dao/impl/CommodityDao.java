package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.ICommodityDao;
import cn.edu.xmu.artwork.entity.Commodity;


@Repository
public class CommodityDao extends GenericDao implements ICommodityDao 
{
	@SuppressWarnings("unchecked")
	public List<Commodity> getCommodityListByType(String commoType)
	{
		Query getCommodities = getSession().getNamedQuery("Commodity.getAllByType").setParameter("commType", commoType);
		List<Commodity> commodities = (List<Commodity>)getCommodities.list();
		return commodities;
	}
	
	@SuppressWarnings("unchecked")
	public List<Commodity> getAllByAuthorId(long authorid)
	{
		Query getCommodities = getSession().getNamedQuery("Commodity.getByAuthorId").setParameter("authorid", authorid);
		List<Commodity> commodities = (List<Commodity>)getCommodities.list();
		return commodities;		
	}
	
	public Commodity getCommodityById(long id)
	{
		Query getCommunity = getSession().getNamedQuery("Commodity.getById").setParameter("commId", id);
		return (Commodity)getCommunity.uniqueResult();
	}
	
	public void saveCommodity(Commodity commodity)
	{
		getSession().save(commodity);
	}
}
