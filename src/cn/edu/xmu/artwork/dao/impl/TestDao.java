package cn.edu.xmu.artwork.dao.impl;

import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.entity.Test;

@Repository
public class TestDao extends GenericDao
{
	
	public void save(Test test)
	{
		getSession().save(test);
		System.out.println("in test dao");
	}
}
