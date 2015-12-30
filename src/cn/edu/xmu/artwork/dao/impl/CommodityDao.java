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
	
	/**
	 * 艺术家删除商品
	 */
	public void deleteCommodity(long id)
	{
		Query query = getSession().getNamedQuery("Commodity.deletepicById")
				.setParameter("id",id);
		query.executeUpdate();
		query = getSession().getNamedQuery("Commodity.deleteById")
				.setParameter("id",id);
		query.executeUpdate();
	}
	
	/**
	 * 获取num个推荐商品，暂时推荐方法为任取num个最新的商品
	 * @param num
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Commodity> getRecommendedCommodities(int num)
	{
		Query recommendedQuery = getSession().getNamedQuery("Commodity.getRecommendedCommodities");
		recommendedQuery.setMaxResults(num);
		return (List<Commodity>)recommendedQuery.list();
	}
	
	public void saveCommodity(Commodity commodity)
	{
		getSession().save(commodity);
	}

	@Override
	public void updateStatus(long id, String status) {
		Query query = getSession().getNamedQuery("Commodity.updateStatus").setParameter("id", id).setParameter("status", status);
		query.executeUpdate();
	}

	@Override
	public List<Commodity> getCommodityList() {
		Query query = getSession().getNamedQuery("Commodity.getAll");
		List<Commodity> itemList = (List<Commodity>)query.list();
		return itemList;
	}
	
	@Override
	public List<Commodity> getCommodityByOrderId(long id) {
		List<Commodity> commodities = null;
		try {
			Query query = getSession().getNamedQuery("Commodity.getByOrderId");
			query.setParameter("id", id);
			commodities = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return commodities;
	}
}
