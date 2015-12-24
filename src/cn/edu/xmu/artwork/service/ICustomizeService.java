package cn.edu.xmu.artwork.service;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.Customization;
import cn.edu.xmu.artwork.entity.User;

public interface ICustomizeService {
	public void addCustomization(Customization customization,User user,Commodity commodity);
	public List<Customization> showCustomizationsList(long id);
	public List<Customization> getCustomizationsByUser(long id);
	public List<Customization> getCustomizationsByArtist(long id);
}
