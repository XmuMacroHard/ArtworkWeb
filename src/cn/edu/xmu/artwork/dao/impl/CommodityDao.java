package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.ICommodityDao;
import cn.edu.xmu.artwork.entity.Commodity;

@NamedQueries(
	@NamedQuery(
		name = "getCommoditiesByType",
		query = "from Commodity c where c.type = :commType"
	)
)

@Repository
public class CommodityDao extends GenericDao implements ICommodityDao 
{
	@SuppressWarnings("unchecked")
	public List<Commodity> getCommodityListByType(String commoType)
	{
		Query getCommodities = getSession().getNamedQuery("getCommoditiesByType").setParameter("commType", commoType);
		List<Commodity> commodities = (List<Commodity>)getCommodities.list();
		return commodities;
	}
}
