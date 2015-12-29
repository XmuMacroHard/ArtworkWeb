package cn.edu.xmu.artwork.utils.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import cn.edu.xmu.artwork.entity.DatePos;
import cn.edu.xmu.artwork.utils.IDateUtils;

@Component
public class DateUtils implements IDateUtils 
{
	public List<Date> getDatesBetweenTwoDate(Date startTime, Date endTime)
	{
		List<Date> dateList = new ArrayList<Date>();
		Calendar begin= Calendar.getInstance();
		Calendar end = Calendar.getInstance();
		begin.setTime(startTime);
		end.setTime(endTime);
		while (begin.compareTo(end) != 0) 
		{
			dateList.add(begin.getTime());
			begin.add(Calendar.DAY_OF_MONTH, 1);
		}		
		dateList.add(end.getTime());
		return dateList;
	}
	
	public Calendar getNextDay(Calendar today)
	{

        int day = today.get(Calendar.DATE);  
        today.set(Calendar.DATE, day + 1);  
        return today;
	}
}
