package cn.edu.xmu.artwork.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IDatePosDao;

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
		List<Date> records = new ArrayList<Date>();
		Query query = getSession().getNamedQuery("DatePos.getRepeatableDatePos");
		query.setParameter("location", location);
		
		for(Date date : dates)
		{
			query.setDate("date", date);
			records = (List<Date>)query.list();
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
		}
		
		return reapeatableDates;
	}
}
