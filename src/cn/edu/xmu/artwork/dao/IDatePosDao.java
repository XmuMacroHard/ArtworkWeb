package cn.edu.xmu.artwork.dao;

import java.util.Date;
import java.util.List;

public interface IDatePosDao 
{
	public List<Date> getRepeatDate(String location, List<Date> dates);
}
