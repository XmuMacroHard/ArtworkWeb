package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Customization;
import cn.edu.xmu.artwork.entity.User;

public interface ICustomizationDao {
	public List<Customization> getCustomizationsByUser(User user);
	public List<Customization> getCustomizationsByArtist(Artist artist);
	public void save(Customization customization);
}
