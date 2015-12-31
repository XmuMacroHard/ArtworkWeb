package cn.edu.xmu.artwork.dao;

import java.util.Date;
import java.util.List;

import org.apache.catalina.authenticator.SavedRequest;

import cn.edu.xmu.artwork.entity.DatePos;

public interface IDatePosDao 
{
	public void save(DatePos datePos);
	public List<Date> getRepeatDate(String location, List<Date> dates);
}
