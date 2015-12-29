package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;

public interface ICustomizationDao {
	public List<CustomizationOrder> getCustomizationsByUser(long id);
	public CustomizationOrder findById(long id);
	public void save(CustomizationOrder customization);
	public List<CustomizationOrder> getCusOrderByState(String identification, long id, String state);
}
