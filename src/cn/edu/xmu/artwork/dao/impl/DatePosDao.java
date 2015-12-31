package cn.edu.xmu.artwork.dao.impl;

import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IDatePosDao;
import cn.edu.xmu.artwork.entity.DatePos;
@Repository

public class DatePosDao extends GenericDao implements IDatePosDao {

	@Override
	public void save(DatePos datePos) {
		
		getSession().save(datePos);
	}

}
