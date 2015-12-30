package cn.edu.xmu.artwork.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public interface IDateUtils {
	public List<Date> getDatesBetweenTwoDate(Date startTime, Date endTime);
	public Calendar getNextDay(Calendar today);
}
