package cn.edu.xmu.artwork.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xmu.artwork.dao.impl.TestDao;
import cn.edu.xmu.artwork.entity.Test;

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
