package cn.edu.xmu.artwork.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IDatePosDao;
import cn.edu.xmu.artwork.entity.DatePos;

@Repository
public class DatePosDao extends GenericDao implements IDatePosDao
{
	/**
	 *根据板块位置来确定同一时间同一板块位置的资讯数量，获得 
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Date> getRepeatDate(String location, List<Date> dates)
	{
		List<Date> reapeatableDates = new ArrayList<Date>();
		List<DatePos> records = new ArrayList<DatePos>();

		
		for(Date date : dates)
		{
			System.out.println("date before");
			Query query = getSession().getNamedQuery("DatePos.getRepeatableDatePos");
			query.setParameter("location", location);			
			query.setDate("date", date);
			records = (List<DatePos>)query.list();
			if(location.equals(ITableConstants.INFO_LOCATION_1) && records.size() >= ITableConstants.INFO_LOCATION_1_NUM)
			{			
					reapeatableDates.add(date);
			}
			else if(location.equals(ITableConstants.INFO_LOCATION_2) && records.size() >= ITableConstants.INFO_LOCATION_2_NUM)
			{
					reapeatableDates.add(date);
			}
			else if(location.equals(ITableConstants.ADV_LOCATION_1) && records.size() >= ITableConstants.INFO_ADV_LOCATION_1_NUM)
			{
					reapeatableDates.add(date);
			}
			
			System.out.println("date after");
		}
		
		getSession().clear();
		
		return reapeatableDates;
	}
}
