package com.macrohard.dao.impl;

import org.springframework.stereotype.Repository;

import com.macrohard.entity.Test;

@Repository
public class TestDao extends GenericDao
{
	
	public void save(Test test)
	{
		getSession().save(test);
		System.out.println("in test dao");
	}
}
