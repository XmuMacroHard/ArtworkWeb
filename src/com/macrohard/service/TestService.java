package com.macrohard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macrohard.dao.impl.TestDao;
import com.macrohard.entity.Test;

@Service
public class TestService 
{
	@Autowired
	private TestDao testDao;
	
	public void save(Test test)
	{
		System.out.println("in test service");
		testDao.save(test);
	}
}
