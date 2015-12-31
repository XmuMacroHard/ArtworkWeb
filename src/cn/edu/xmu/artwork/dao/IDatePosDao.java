package cn.edu.xmu.artwork.dao;

import java.util.Date;
import java.util.List;

import cn.edu.xmu.artwork.entity.DatePos;

public interface IDatePosDao 
{
	public List<Date> getRepeatDate(String location, List<Date> dates);
	public void save(DatePos datePos);
}
