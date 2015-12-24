package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;

public interface ICustomizationDao {
	public List<CustomizationOrder> getCustomizationsByUser(long id);
	public List<CustomizationOrder> getCustomizationsByArtist(long id);
	public CustomizationOrder findInfoById(long id);
	public void save(CustomizationOrder customization);
}
