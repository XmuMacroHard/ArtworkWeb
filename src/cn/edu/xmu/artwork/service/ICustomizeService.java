package cn.edu.xmu.artwork.service;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.User;

public interface ICustomizeService {
	public void addCustomization(CustomizationOrder customization,User user,Commodity commodity);
	public List<CustomizationOrder> showCustomizationsList(long id);
	public List<CustomizationOrder> getCustomizationsByUser(long id);
	public List<CustomizationOrder> getCustomizationsByArtist(long id);
	public boolean accetpCustomization(long id);
}
