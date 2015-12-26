package cn.edu.xmu.artwork.dao.impl;


import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.entity.Htest;

@Repository
public class HTestDao extends GenericDao{
	public void save(Htest htest)
	{
		try {
			getSession().save(htest);
			System.out.println("insert success htest " + htest.getSd());
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	public Htest findById(long id)
	{
		Query query = getSession().getNamedQuery("findById");
		query.setParameter("id", id);
		return (Htest) query.uniqueResult();
	}
}
