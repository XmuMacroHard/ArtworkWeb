package com.macrohard.dao.impl;

import com.macrohard.dao.IInformationDao;
import com.macrohard.entity.Information;

public class InformationDao extends GenericDao implements IInformationDao {

	
	
	@Override
	public void save(Information information) {
		
			getSession().save(information);
			closeSession();
	}
	
	

}
